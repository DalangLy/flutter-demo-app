import 'dart:io';
import 'package:demo_app/features/login/data/data_sources/login_remote_data_source.dart';
import 'package:demo_app/features/login/data/repositories/login_repository.dart';
import 'package:demo_app/features/login/domain/use_cases/login_use_case.dart';
import 'package:demo_app/features/login/presentation/blocs/login/login_bloc.dart';
import 'package:demo_app/features/login/presentation/pages/login_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());

  //(development only) to allow using localhost uri for api
  HttpOverrides.global = MyHttpOverrides();
}

//******************* Development Only **********************
class MyHttpOverrides extends HttpOverrides {
  //to allow using localhost uri for api (development only)
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host,
          int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginBloc(LoginUseCase(LoginRepository(LoginRemoteDataSource(Dio())))),)
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const LoginPage(),
        ),
    );
  }
}
