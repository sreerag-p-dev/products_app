import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:productsapp/models/product_list_response/product_details/product_details.dart';
import 'package:productsapp/models/product_list_response/product_list_response.dart';

class ApiServices {
  Future<ProductListResponse?> fetchProductList() async {
    String url = "https://dummyjson.com/products";
    ProductListResponse? data;
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        debugPrint(response.body);
        data = ProductListResponse.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      debugPrint("Api call failed : $e");
    }
    return data;
  }

  Future<ProductDetails?> fetchProductDetails(String productId) async {
    String baseUrl = "https://dummyjson.com/products";
    ProductDetails? data;
    try {
      final response = await http.get(Uri.parse("$baseUrl/$productId"));
      if (response.statusCode == 200) {
        debugPrint(response.body);
        data = ProductDetails.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      debugPrint("Api call failed : $e");
    }
    return data;
  }
}
