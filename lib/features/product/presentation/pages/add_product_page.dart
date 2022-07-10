import 'package:demo_app/features/product/domain/entities/create_product_entity.dart';
import 'package:demo_app/features/product/presentation/blocs/create/create_product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _name;
  late double _price;
  late String _description;
  late String _code;
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
                    label: Text('Name')
                  ),
                  onSaved: (value){
                    if(value == null) return;
                    _name = value;
                  },
                ),
                const Divider(color: Colors.transparent,),
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Price')
                  ),
                  keyboardType: TextInputType.number,
                  onSaved: (value){
                    if(value == null) return;
                    _price = (value as num).toDouble();
                  },
                ),
                const Divider(color: Colors.transparent,),
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Code')
                  ),
                  onSaved: (value){
                    if(value == null) return;
                    _code = value;
                  },
                ),
                const Divider(color: Colors.transparent,),
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Description')
                  ),
                  minLines: 3,
                  maxLength: 10,
                  onSaved: (value){
                    if(value == null) return;
                    _description = value;
                  },
                ),
                const Divider(color: Colors.transparent,),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (){
                      CreateProductEntity createEntity = CreateProductEntity(_code, _name, _price, _description);
                      BlocProvider.of<CreateProductBloc>(context).create(createEntity);
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
