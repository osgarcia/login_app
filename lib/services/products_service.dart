import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:med_app/models/product.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  // ignore: unused_field
  final String _baseUrl =
      'https://flutter-med-768cd-default-rtdb.firebaseio.com';

  final List<Product> products = [];
  bool isLoading = true;

  ProductsService() {
    loadProducts();
  }

  Future<List<Product>> loadProducts() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(resp.body);

    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      products.add(tempProduct);
    });

    //isLoading = false;
    notifyListeners();

    return products;
  }
}
