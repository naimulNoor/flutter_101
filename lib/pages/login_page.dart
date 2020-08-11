import 'package:awsome_app/firebaseHelper/auth_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email,pass;
  String _errorTXT='';
  bool isLogin=true;
  String uid;
  final _formKey=GlobalKey<FormState>();

  void _authenticate()async{
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
    }

    try{
      if(isLogin){
        //login
        uid=await AuthenticaitonHelper.login(email, pass);

      }else{
        //register
        uid=await AuthenticaitonHelper.Register(email, pass);
      }
      if(uid!=null){
        _errorTXT='SucessFull';
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage()));
      }

    }
    catch(error){
      setState(() {
        _errorTXT=error.message;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Enter Email Adress',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if(value.isEmpty){
                            return 'Please Provide an Email Adress';
                          }
                        return null;
                        },
                      onSaved: (value){
                        email=value;

                      },

                    ),
                SizedBox(height: 20,),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Enter password ',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value){
                    if(value.isEmpty){
                      return 'Please Provide an Password';
                    }
                    return null;
                  },
                  onSaved: (value){
                    pass=value;

                  },
                ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      FlatButton(
                        child: Text("Register"),
                        onPressed: (){
                          setState(() {
                            isLogin=false;
                          });
                          _authenticate();
                        },
                      ),
                      RaisedButton(
                        child: Text("Login"),
                        onPressed: (){
                          _authenticate();
                        },
                      )
                    ],),
                    SizedBox(height: 20,),
                    Text(_errorTXT,style: TextStyle(fontSize: 16,color: Colors.red),)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
