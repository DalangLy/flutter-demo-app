import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () async{
              final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
              final SharedPreferences prefs = await _prefs;
              final token = prefs.getString('accessToken');
              final Response response = await Dio().get(
                'https://96.9.67.188:4434/api/Products',
                options: Options(
                  headers: {
                    'Authorization': 'Bearer $token'
                  }
                )
              );
              print(response.statusCode);
            },
              child: Text('Get Product')),
        ),
      ),
    );
  }
}
