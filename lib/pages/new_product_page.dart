import 'dart:io';

import 'package:awsome_app/db/db_helper.dart';
import 'package:awsome_app/models/product_model.dart';
import 'package:awsome_app/utils/products_cat.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class NewProductPage extends StatefulWidget {
  @override
  _NewProductPageState createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
  Product product=Product();
  String category='Electronics';
  String date="No Date Select Yet";
  String imgPath=null;
  final formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("New Product"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formkey,
            child: ListView(
              children: <Widget>[
                SizedBox(height: 20,),
                TextFormField(
                    decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Product Name : '
                    ),
                      validator: (value){
                        if(value.isEmpty){
                          return 'this field must not be empty';
                        }
                        if(value.length<6){
                          return 'must be in 6 word';
                        }
                        return null;
                      },
                        onSaved: (value){
                          product.name=value;
                        },

                  ),
                SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Product Price : '
                  ),
                  validator: (value){
                    if(value.isEmpty){
                      return 'this field must not be empty';
                    }
                    if(double.parse(value) <= 0.0){
                      return 'use right ammount';
                    }
                    return null;
                  },
                  onSaved: (value){
                    product.price=double.parse(value);
                  },

                ),
                SizedBox(height: 20,),
                Text("Select Product Category"),
                SizedBox(height: 10,),
                //droup menu
                DropdownButton(
                    value: category,
                    underline: Container(
                      color: Colors.blueAccent,
                    ),
                    items: categoryList.map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                      )).toList(),
                    onChanged:(value){
                      setState(() {
                        category=value;
                      });
                        product.category=category;
                    },
                ),
                SizedBox(height: 20,),
                Row(
                  children: <Widget>[
                    FlatButton(
                      color: Colors.blueAccent,
                      child: Text("Select a Date"),
                      onPressed: _pickDate,
                    ),
                    Text(date,style: TextStyle(fontSize: 16),)
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2,color:Colors.grey),
                      ),
                      child: imgPath == null ? Text("NO Image Set") : Image.file(File(imgPath)),
                    ),
                    FlatButton.icon(onPressed: _takeGalleryPicture_withoutThen, icon:Icon(Icons.camera), label: Text("Take a Photo"))
                  ],
                ),

                SizedBox(height: 20,),
                MaterialButton(
                  shape: StadiumBorder(side: BorderSide.none),
                  onPressed: _saveProduct,
                  color: Colors.blueAccent,
                  child: Text("Save Product",style: TextStyle(color: Colors.white),),
                )

              ],
            ),
          ),
        ),
    );
  }

  void _pickDate() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate:  DateTime.now()).then((dateTime){
          setState(() {
            date= DateFormat('dd/MM/yyyy').format(dateTime);
          });
          product.date=date;

      });
  }
  void _takePicture() {
      ImagePicker().getImage(source: ImageSource.camera).then((value) {
        print(value.path);
        setState(() {
          imgPath=value.path;
        });
      });
  }
  void _takeGalleryPicture() {
    ImagePicker().getImage(source: ImageSource.gallery,maxWidth: 100.0,maxHeight: 100.0).then((value) {
      print(value.path);
      setState(() {
        imgPath=value.path;
      });
      product.imagePath=imgPath;
    });
  }

  void _takeGalleryPicture_withoutThen() async {
    PickedFile pickedFile=await ImagePicker().getImage(source: ImageSource.gallery,maxWidth: 100.0,maxHeight: 100.0);
    setState(() {
      imgPath=pickedFile.path;
    });
    product.imagePath=imgPath;


  }

  void _saveProduct() {
    if(formkey.currentState.validate()){
        formkey.currentState.save();
          print(product);
          if(date==null){
            return;
          }
          if(imgPath==null){
            return;
          }
          DBSQLITE.productlist.add(product);
          Navigator.pop(context);
    }
  }
}
