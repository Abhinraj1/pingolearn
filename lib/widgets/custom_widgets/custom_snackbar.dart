

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pingolearn/core/manager/color_manager.dart';

customSnackBar(String msg){
  Get.snackbar(
    "Note",
    msg
  );
}

errorSnackBar({String? error}){
  Get.snackbar(
      "Error",
      error ??
      "Something went wrong please try after sometime",
    backgroundColor: brandDarkBlue,
    colorText: Colors.white
  );
}