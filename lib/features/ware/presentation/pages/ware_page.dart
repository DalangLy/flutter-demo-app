import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/get/get_all_wares_bloc.dart';

class WarePage extends StatelessWidget {
  const WarePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ware'),
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: (){
              BlocProvider.of<GetAllWaresBloc>(context).getAllWares();
            },
            child: const Text('Get Ware'),
          ),
        ),
      ),
    );
  }
}
