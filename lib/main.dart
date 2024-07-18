import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pingolearn/core/manager/color_manager.dart';
import 'package:pingolearn/core/manager/route_manager.dart';
import 'package:pingolearn/presentation/home/home_screen.dart';
import 'package:pingolearn/presentation/sign_up/sign_up_screen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'core/providers/home/home_provider.dart';
import 'core/providers/user/user_provider.dart';
import 'core/repository/main_repo.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: firebaseOptions(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MainRepo mainRepo = MainRepo();
    return MultiProvider(
     providers: [
       ChangeNotifierProvider(
         create: (_) => HomeNotifier(),
       ),
       ChangeNotifierProvider(
         create: (_) => UserNotifier(),
       ),
     ],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return GetMaterialApp(
            title: 'E-Shop',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: brandLiteBlue),
              useMaterial3: true,
            ),
            initialRoute: "/",
            getPages: appRoutes(),
            // home:HomeScreen()
          );
        }
      ),
    );
  }
}
