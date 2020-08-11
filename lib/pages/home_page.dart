import 'package:awsome_app/db/db_helper.dart';
import 'package:awsome_app/firebaseHelper/auth_helper.dart';
import 'package:awsome_app/models/product_model.dart';
import 'package:awsome_app/pages/login_page.dart';
import 'package:awsome_app/pages/new_product_page.dart';
import 'package:awsome_app/pages/shopping_cart.dart';
import 'package:awsome_app/widget/product_itms.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _refresh(){
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Product Category"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
                onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>NewProductPage()
                )).then((_){
                setState(() {

                });
              }

              ),
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ShoppingCart()
              )).then((_){
                setState(() {

                });
              }

              ),
            ),
            PopupMenuButton(
              onSelected: (value){
              if(value==1){
                AuthenticaitonHelper.lgoout().then((value) => {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage())
                )});
              }
            },
            itemBuilder: (context)=>[
              PopupMenuItem(child: Text('My Profile'),value: 0,),
              PopupMenuItem(child: Text('Logout'),value: 1,)
            ]
    )

          ],
      ),
      body: FutureBuilder(
        future: DBSQLITE.getAllProducts(),
        builder: (context,AsyncSnapshot<List<Product>> snapshot){
        if(snapshot.hasData){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: snapshot.data.map((product) => ProductItem(product,_refresh)).toList()),
          );
        }
        else if(snapshot.hasError){
          return Center(child: Text("Failed to Fetch data"),);
        }
        else{
          return Center(child: CircularProgressIndicator(),);
        }
        }
        )
    );
  }
}
