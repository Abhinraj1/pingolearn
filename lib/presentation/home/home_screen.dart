import 'package:flutter/material.dart';
import 'package:pingolearn/core/manager/color_manager.dart';
import 'package:pingolearn/core/model/products_model.dart';
import 'package:pingolearn/widgets/home/product_container.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/manager/font_manager.dart';
import '../../core/providers/home/home_provider.dart';
import '../../services/firebase_remote_config.dart';
import '../../widgets/custom_widgets/custom_snackbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => Provider.of<HomeNotifier>(context, listen: false).getProducts());
  }
  @override
  Widget build(BuildContext context) {
    final homeNotifier = Provider.of<HomeNotifier>(context);
    return Scaffold(
        backgroundColor: brandWhite,
        appBar: AppBar(
          backgroundColor: brandLiteBlue,
          title: Text(
            "e-Shope",
            style: appTitleFont,
          ),
        ),
        body: Consumer<HomeNotifier>(
          builder: (context,value,child) {
              ProductsModel model = ProductsModel();
            int length = 0;
            if (value.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

              model = value.products;
              length = model.products?.length ?? 0;
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1.25 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: length,
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                itemBuilder: (BuildContext ctx, index) {
                  return ProductContainer(
                    product: model.products![index],
                  );
                });;
          }
        ));
  }

}
