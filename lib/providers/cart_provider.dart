import 'package:awsome_app/models/product_model.dart';
import 'package:flutter/foundation.dart';

class CartProvider extends ChangeNotifier{
  List<Product>_cartItems=[];

  //getter method
  List<Product> get cartItems=>_cartItems;

  void addToCart(Product product){
    _cartItems.add(product);
    notifyListeners();
  }
  void removeToCart(Product product){
    _cartItems.remove(product);
    notifyListeners();
  }
  void removeAllCart(){
    _cartItems.clear();
    notifyListeners();
  }

  int get  cartList=> _cartItems.length;

  double get totoalPice{
        var total=0.0;
        _cartItems.forEach((product){
          total+=product.price;
        });
        return total;
  }
}