import 'package:awsome_app/db/db_helper.dart';
import 'package:awsome_app/pages/new_product_page.dart';
import 'package:awsome_app/widget/product_itms.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Product Category"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(
                builder: (context)=>NewProductPage())
              ).then((_) => (){
                setState(() {

                });
              }
              ),
            )
          ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
            crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: DBSQLITE.productlist.map((product) => ProductItem(product)).toList()),
      ),
    );
  }
}
