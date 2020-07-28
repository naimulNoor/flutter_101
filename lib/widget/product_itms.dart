import 'dart:io';

import 'package:awsome_app/db/db_helper.dart';
import 'package:awsome_app/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  final Product product;
  final Function _callback;
  ProductItem(this.product,this._callback);


  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.redAccent,
        child: Icon(Icons.delete),
      ),
      confirmDismiss: (direction){
        return showDialog(context:context,
        builder: (context)=>AlertDialog(
          content: Text("Are Your Sure You Want To Delete"),
          title: Text(" Want To Delete"),
          actions: <Widget>[
            FlatButton(
              child: Icon(Icons.cancel),
              onPressed: ()=>Navigator.of(context).pop(false),
            ),
            RaisedButton(
              child: Icon(Icons.delete) ,
              onPressed: ()=>Navigator.of(context).pop(true),
            )
          ],
        ));
      },
      onDismissed: (direction){
        DBSQLITE.deleteProduct(widget.product.id).then((value) => widget._callback());

      },
      child: Card(
          elevation: 5,
          child: Column(
            children: <Widget>[
              Image.file(File(widget.product.imagePath),height: 200,width: 200,fit: BoxFit.cover,),
              Text(widget.product.name,style: TextStyle(fontSize: 16),),
              Text(widget.product.category,style: TextStyle(fontSize: 16),),
              Text("${widget.product.price}",style: TextStyle(fontSize: 16),)

            ],
          ),
      ),
    );
  }
}
