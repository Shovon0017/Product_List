import 'dart:convert';
import 'dart:developer';


import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:product_list/product%20list/product_list.dart';

class ProductListService {
  static Future<List<Products>> productListService() async {
    try {
      Response response = await http.get(Uri.parse(
          "https://cit-ecommerce-codecanyon.bandhantrade.com/api/app/v1/products"));
      log("Response: ${response.statusCode}");
      if (response.statusCode == 200) {
        var decodeData = jsonDecode(response.body);
        product_list data =product_list.fromJson(decodeData);
        log(
            "===================");
        log("${data.products?.length}");
        // if(data.products != null){
        //   return data.products!;
        // }
        return data.products ?? [];
      }
    } catch (e) {
      log("Error: $e");
    }

    return [];
  }
}