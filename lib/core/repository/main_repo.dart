
import 'dart:convert';

import 'package:http/http.dart';
import 'package:pingolearn/core/model/products_model.dart';
import 'package:pingolearn/widgets/custom_widgets/custom_snackbar.dart';

class MainRepo{


  Future<ProductsModel?> getProducts()async{
    const String endPoint = "https://dummyjson.com/products";
    try{
      final response = await get(Uri.parse(endPoint));
      final jsonData = jsonDecode(response.body);
      return ProductsModel.fromJson(jsonData);
    }catch(e){

      errorSnackBar();

    }
    return null;
  }
}