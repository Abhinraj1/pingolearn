import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/manager/font_manager.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Align(
        alignment:  Alignment.centerLeft,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 4.w,vertical: 2.h),
          child: Text("e-Shop",style: logoFont,),
        ));
  }
}
