import 'package:flutter/material.dart';

class StockDetailPage extends StatelessWidget {
  const StockDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Stock Detail Page'),
        ),
      ),
    );
  }
}
