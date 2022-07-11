import 'package:demo_app/features/product/domain/entities/product_entity.dart';
import 'package:demo_app/features/product/presentation/blocs/update/update_product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/update_product_entity.dart';

class UpdateProductPage extends StatefulWidget {
  final ProductEntity entity;
  const UpdateProductPage({Key? key, required this.entity}) : super(key: key);

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _name;
  late double _price;
  late String _description;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateProductBloc, UpdateProductState>(
      listener: (context, state) {
        if(state is UpdateProductSuccess){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Updated Success')));

          final FormState? form = _formKey.currentState;
          if(form == null) return;
          form.reset();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Update Product'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                      onSaved: (value) {
                        if (value == null) return;
                        _name = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please input name';
                        }
                        return null;
                      },
                      initialValue: widget.entity.name,
                    ),
                    const Divider(color: Colors.transparent,),
                    TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Price')
                      ),
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        if (value == null) return;
                        _price = double.parse(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please input price';
                        }
                        return null;
                      },
                      initialValue: widget.entity.price.toString(),
                    ),
                    const Divider(color: Colors.transparent,),
                    TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Description')
                      ),
                      minLines: 3,
                      maxLines: 10,
                      onSaved: (value) {
                        if (value == null) return;
                        _description = value;
                      },
                      initialValue: widget.entity.description,
                    ),
                    const Divider(color: Colors.transparent,),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          final FormState? form = _formKey.currentState;
                          if (form == null) return;
                          if (form.validate()) {
                            form.save();

                            UpdateProductEntity entity = UpdateProductEntity(
                                widget.entity.id, _name, _price, _description);
                            BlocProvider.of<UpdateProductBloc>(context).update(entity);
                          }
                        },
                        child: const Text('Save'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
