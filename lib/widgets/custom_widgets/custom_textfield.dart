

import 'package:flutter/material.dart';
import 'package:pingolearn/core/manager/color_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final Function(String) onChanged;
  final Function(String?) validator;
  final bool? isPass;
  const CustomTextField({super.key, required this.controller, required this.hint, required this.onChanged, this.isPass, required this.validator});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;
  final border = OutlineInputBorder(
   borderRadius: BorderRadius.circular(2.h),
    borderSide: const BorderSide(
      color: Colors.white
    )
  );

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPass ?? false ? obscureText : false,
        decoration:
         InputDecoration(
             labelText: widget.hint,
            border: border,
        disabledBorder: border,
        enabledBorder: border,
        focusedBorder: border,
        filled: true,
         fillColor: Colors.white,
         suffixIcon: widget.isPass ?? false ? IconButton(
             onPressed: () {
               setState(() {
                 obscureText = !obscureText;
               });
               },
             icon: obscureText ? const Icon(Icons.remove_red_eye) :
         const Icon(Icons.hide_source_outlined)): null) ,

        keyboardType: TextInputType.emailAddress,
        validator: (String? value) {

          return widget.validator(value);
        },
      ),
    );
  }
}
