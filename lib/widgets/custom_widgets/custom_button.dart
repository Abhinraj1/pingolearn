import 'package:flutter/material.dart';
import 'package:pingolearn/core/manager/color_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/manager/font_manager.dart';

class CustomButton extends StatelessWidget {
  final Function() onTap;
  final String title;
  const CustomButton({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
     color: brandLiteBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.h)
        ),
        onPressed: () {
          onTap();
        },
        child:  SizedBox(
          height: 6.h,
            width: 55.w,
            child: Center(child: Text(title,style: buttonFont,)))
    );
  }
}
