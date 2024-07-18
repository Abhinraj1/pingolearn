import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pingolearn/core/manager/color_manager.dart';
import 'package:pingolearn/core/manager/font_manager.dart';
import 'package:pingolearn/widgets/custom_widgets/custom_button.dart';
import 'package:pingolearn/widgets/custom_widgets/logo.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../core/providers/user/user_provider.dart';
import '../../utils/email_validator.dart';
import '../../widgets/custom_widgets/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
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
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Logo(),
              SizedBox(
                height: 10.h,
              ),
              CustomTextField(
                controller: _nameController,
                hint: "Enter Name",
                onChanged: (p0) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
                isPass: false,
              ),
              SizedBox(
                height: 2.h,
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
                  if(value.trim().length <6){
                    return "Password should be at least 6 characters";
                  }

                  return null;
                },
                isPass: true,
              ),
              const Spacer(),
              Center(
                child: CustomButton(
                    onTap: () async {
                      final isValid = _formKey.currentState!.validate();
                      isValid
                          ? await userNotifier.signUp(
                              email: _emailController.text,
                              password: _passwordController.text,
                              name: _nameController.text)
                          : null;
                    },
                    title: "Signup"),
              ),
              TextButton(
                  onPressed: () {
                    Get.toNamed("/");
                  },
                  child: RichText(
                    text: TextSpan(
                        style: richTextFont,
                        text: "Already have an account? ",
                        children: [
                          TextSpan(
                              style: richTextFont.copyWith(
                                  color: brandLiteBlue,
                                  fontWeight: FontWeight.w800),
                              text: "Login")
                        ]),
                  )),
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
