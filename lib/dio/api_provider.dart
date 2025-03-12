import 'package:dio/dio.dart';
import 'package:messenger_app/models/product_model.dart';

class ApiProvider{
  final String baseUrl = "https://dummyjson.com";

  ProductsModel? productsModel;

  Future<ProductsModel?> getProducts() async{
    try{
      Response response = await Dio().get("$baseUrl/products");
      print(response.data.toString());
      productsModel = ProductsModel.fromJson(response.data);
      print(productsModel?.products[0].title);
      return productsModel;
    }catch(e){
      print(e.toString());
    }
  }
}