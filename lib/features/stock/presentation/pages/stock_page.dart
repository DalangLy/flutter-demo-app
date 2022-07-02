import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/get/get_all_stocks_bloc.dart';

class StockPage extends StatelessWidget {
  const StockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock'),
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: (){
              BlocProvider.of<GetAllStocksBloc>(context).getAllStocks();
            },
            child: const Text('Get All Stocks'),
          ),
        ),
      ),
    );
  }
}
