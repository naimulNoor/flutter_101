import 'dart:io';

import 'package:awsome_app/db/db_helper.dart';
import 'package:awsome_app/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final int id;

  ProductDetails(this.id);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: FutureBuilder(
      future: DBSQLITE.getProductsbyId(widget.id),
      builder: (context,AsyncSnapshot<Product> snapshot){
          if(snapshot.hasData){
              return Center(child: Image.file( File(snapshot.data.imagePath),width: double.infinity,height: 300,fit: BoxFit.cover,));
          }
          else if(snapshot.hasError){
            return Center();
          }
          else{
           return CircularProgressIndicator();
          }
      },
    ),
    );
  }
}
