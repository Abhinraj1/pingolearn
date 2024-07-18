

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pingolearn/presentation/home/home_screen.dart';
import 'package:pingolearn/presentation/sign_up/sign_up_screen.dart';

import '../../presentation/login/login_screen.dart';

List<GetPage> appRoutes(){

  return [
    GetPage(name: "/", page: () => LoginScreen(),),
    GetPage(name: "/signup", page: () => SignUpScreen(),),
    GetPage(name: "/home", page: () => HomeScreen(),),
  ];
}