import 'package:flutter/material.dart';
import 'package:pingolearn/core/model/products_model.dart';
import '../../repository/main_repo.dart';



class HomeNotifier extends ChangeNotifier {
 MainRepo repo = MainRepo();

  bool isLoading = false;
  ProductsModel _productsModel = ProductsModel();
 ProductsModel get products => _productsModel;

  Future<void> getProducts() async {
    isLoading  = true;
    notifyListeners();

    final data = await repo.getProducts();
    if (data != null) {
      _productsModel = data;
    }
    isLoading  = false;
    notifyListeners();
  }
}
