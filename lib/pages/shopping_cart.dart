import 'package:awsome_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Container(
      child: Column(
        children: [
          Expanded(
            child: Consumer<CartProvider>(
              builder: (context,provider,child)=>
              ListView.builder(
                  itemBuilder: (context,index)=>ListTile(
                    title: Text(provider.cartItems[index].name),
                    trailing: Chip(
                      backgroundColor: Colors.blueAccent,
                      label: Text('TK.${provider.cartItems[index].price}'),
                    ),
                  ),
              itemCount: provider.cartItems.length,),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            color: Colors.blueAccent,
            child: Consumer<CartProvider>(
              builder: (context,provider,child)=>Text('Total Price=${provider.totoalPice}.TK'),
            ),
          )
        ],
      ),
      ),
    );
  }
}
