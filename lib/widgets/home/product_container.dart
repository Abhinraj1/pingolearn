import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/manager/font_manager.dart';
import '../../core/model/products_model.dart';
import '../../services/firebase_remote_config.dart';
import '../../utils/calculate_discount_amount.dart';

class ProductContainer extends StatelessWidget {
  final Products product;
  const ProductContainer({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    FirebaseRemoteConfigService remoteConfigService = FirebaseRemoteConfigService();
    String? image;
    if(product.images != null){
       image = product.thumbnail;
    }
    final String name = product.title ?? "Product Name";
    final String desc = product.description ?? "Product description";
    final double price = product.price ?? 0;
    final double discountPercentage = product.discountPercentage.toDouble() ?? 0;
    final String discount = discountAmount(discountPercent: discountPercentage,totalPrice: price);
    return Container(
      alignment: Alignment.center,
      // height: 20.h,
      padding: EdgeInsets.all(1.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 17.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.withOpacity(0.3),
              image:image != null ?
              DecorationImage(
                  image: NetworkImage(image)): null
            ),
          ),
          SizedBox(
            height: 0.5.h,
          ),
          Text(name,style: productTitleFont,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,),
          SizedBox(
            height: 0.5.h,
          ),
          Text(desc,style: productDecFont,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,),
          SizedBox(
            height: 1.h,
          ),
          Wrap(
            runAlignment: WrapAlignment.center,
            children: [
              Text("₹ ${price.ceil()}",style: productDiscountFont,),
              FutureBuilder(
                future: remoteConfigService.fetchRemoteConfig(),
                builder: (context,data) {
                  if(data.data ?? true){
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Text("₹ ${discount}",style: productPriceFont,),
                    );
                  }else{
                    return SizedBox(
                      width: 2.w,
                    );
                  }
                }
              ),
              Text("$discountPercentage % off",style: productDiscountPercentFont,),
            ],
          )
        ],
      ),
    );
  }
}
