import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List addedproduct = [];
  get selectedproductprice {
    num lastprice = 0;
    for (int i = 0; i < addedproduct.length; i++) {
      lastprice += addedproduct[i]["qty"] * addedproduct[i]["price"];
    }
    notifyListeners();
    return lastprice;
  }

  counterplus({required Map product}) {
    product['qty']++;
    notifyListeners();
  }

  countermin({required Map product}) {
    if (product["qty"] > 1) {
      product['qty']--;
      notifyListeners();
    }
  }

  addToCart({required Map product}) {
    addedproduct.add(product);
    notifyListeners();
  }

  removeCart({required product}) {
    addedproduct.remove(product);
    notifyListeners();
  }
}