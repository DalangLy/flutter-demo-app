import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/create_stock_entity.dart';
import '../blocs/create/create_stock_bloc.dart';

class AddStockPage extends StatefulWidget {
  const AddStockPage({Key? key}) : super(key: key);

  @override
  State<AddStockPage> createState() => _AddStockPageState();
}

class _AddStockPageState extends State<AddStockPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _productCode;
  late String _wareCode;
  late int _quantity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Product Code')
                  ),
                  onSaved: (value){
                    if(value == null) return;
                    _productCode = value;
                  },
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'please input product code';
                    }
                    return null;
                  },
                ),
                const Divider(color: Colors.transparent,),
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Ware Code')
                  ),
                  onSaved: (value){
                    if(value == null) return;
                    _wareCode = value;
                  },
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'please input ware code';
                    }
                    return null;
                  },
                ),
                const Divider(color: Colors.transparent,),
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Quantity')
                  ),
                  minLines: 3,
                  maxLength: 10,
                  onSaved: (value){
                    if(value == null) return;
                    _quantity = (value as num).toInt();
                  },
                ),
                const Divider(color: Colors.transparent,),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (){
                      CreateStockEntity createEntity = CreateStockEntity(_productCode, _wareCode, _quantity);
                      BlocProvider.of<CreateStockBloc>(context).createStock(createEntity);
                    },
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
