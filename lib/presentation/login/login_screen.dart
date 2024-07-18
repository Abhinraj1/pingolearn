import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pingolearn/core/manager/color_manager.dart';
import 'package:pingolearn/core/manager/font_manager.dart';
import 'package:pingolearn/widgets/custom_widgets/custom_button.dart';
import 'package:pingolearn/widgets/custom_widgets/logo.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/providers/user/user_provider.dart';
import '../../utils/email_validator.dart';
import '../../widgets/custom_widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userNotifier = Provider.of<UserNotifier>(context);

    return Scaffold(
      backgroundColor: brandWhite,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Logo(),
              SizedBox(
                height: 15.h,
              ),
              CustomTextField(
                controller: _emailController,
                hint: "Enter Email",
                onChanged: (p0) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  return validateEmail(value);
                },
                isPass: false,
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextField(
                controller: _passwordController,
                hint: "Enter Password",
                onChanged: (p0) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }

                  return null;
                },
                isPass: true,
              ),
              const Spacer(),
              CustomButton(
                  onTap: () {
                    final isValid = _formKey.currentState!.validate();
                    isValid
                        ? userNotifier.login(
                            email: _emailController.text,
                            password: _passwordController.text)
                        : null;
                  },
                  title:"Login"),
              TextButton(
                  onPressed: () {
                    Get.toNamed("/signup");
                  },
                  child:  RichText(
                    text: TextSpan(
                      style: richTextFont,
                      text: "New Here? ",
                    children: [
                      TextSpan(
                          style: richTextFont.copyWith(
                            color: brandLiteBlue,
                            fontWeight: FontWeight.w800
                          ),
                        text: "Signup"
                      )
                    ]
                  ),)),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
