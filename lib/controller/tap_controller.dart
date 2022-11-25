import 'dart:convert';

import 'package:get/get.dart';

import '../model/brand_model.dart';
import '../service/api_service.dart';

class TapController extends GetxController{


  var productList =<Brand> [];
  var isLoading = true;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async{
    try{
      isLoading = true;
      var response = await ApiService.fetchProducts("http://10.0.2.2:8000/api/brand.json");
      if(response.body != null){
        productList.assignAll(brandFromJson(response.body));
      }
    }finally{
      isLoading = false;
    }
    update();
  }

  void deleteBrand(int id) async {
   await ApiService.deleteProduct("http://10.0.2.2:8000/api/brand/$id");
   onInit();
  }

  Future<void> updateBrand(int id, String body) async {
    await ApiService.updateBrand("http://10.0.2.2:8000/api/brand/$id", body);
    onInit();
  }

  Future<void> save(String brand) async {
    await ApiService.save("http://10.0.2.2:8000/api/brand/", brand);
    onInit();
  }

}