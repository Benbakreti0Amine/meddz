import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_tech_mastering_api_with_flutter/screens/auth/ResetPassword.dart';
import 'package:happy_tech_mastering_api_with_flutter/screens/auth/forget_password.dart';
import 'package:happy_tech_mastering_api_with_flutter/screens/auth/register_screen.dart';
import 'package:happy_tech_mastering_api_with_flutter/static/theme.dart';

import 'cache/cachehelper.dart';
import 'core/api/dio_consumer.dart';
import 'cubits/cubit/user_cubit.dart';
import 'screens/auth/sign_in_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(
    BlocProvider(
      create: (context) => UserCubit(DioConsumer(dio: Dio())),
      child: const MyApp(),
    ),
  );
}
//
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: ResetPasswordScreen(),
    );
  }
}
