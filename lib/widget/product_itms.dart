import 'dart:io';

import 'package:awsome_app/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  final Product product;
  ProductItem(this.product);


  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,

        child: Column(
          children: <Widget>[
            Image.file(File(widget.product.imagePath),height: 200,width: 200,fit: BoxFit.cover,),
            Text(widget.product.name,style: TextStyle(fontSize: 16),),
            Text(widget.product.category,style: TextStyle(fontSize: 16),),
            Text("${widget.product.price}",style: TextStyle(fontSize: 16),)

          ],
        ),
    );
  }
}
