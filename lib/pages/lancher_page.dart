import 'package:awsome_app/firebaseHelper/auth_helper.dart';
import 'package:awsome_app/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class LauncherPage extends StatefulWidget {
  @override
  _LauncherPageState createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {

  @override
  void initState() {
    //checkAuth
    AuthenticaitonHelper.user.then((value){
      value==null ?
      Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context)=>LoginPage()))
          :
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context)=>HomePage()
      ));
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(

        ),
      ),
    );
  }
}
