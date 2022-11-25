import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;

import '../model/brand_model.dart';

class ApiService{

  static var client = http.Client();

  static Future<http.Response> fetchProducts(String uri) async{
    var response = await client.get(Uri.parse(uri));
    if(response.statusCode == 200){
      return response;
    }else{
      throw Exception("Not Found");
    }
  }

  static Future<void> deleteProduct(String uri) async{
    await client.delete(Uri.parse(uri));
  }

  static Future<void> updateBrand(String uri, String body) async{
    await client.put(Uri.parse(uri),headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }, body: body);
  }

  static Future<void> save(String uri,String body)async {
    await client.post(Uri.parse(uri), headers:<String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }, body: body);
  }

  static Future<http.Response> findById(String uri) async {
   var response = await client.get(Uri.parse(uri));
   if(response.statusCode == 200){
     return response;
   }else{
     throw Exception("Not Found");
   }
  }

}