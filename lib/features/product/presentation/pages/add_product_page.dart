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
    return BlocListener<CreateProductBloc, CreateProductState>(
      listener: (context, state) {
        if(state is CreateProductSuccess){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Created')));

            final FormState? form = _formKey.currentState;
            if(form == null) return;
            form.reset();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Product'),
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
                      initialValue: 'Product 8',
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
                      initialValue: '10000',
                    ),
                    const Divider(color: Colors.transparent,),
                    TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Code')
                      ),
                      onSaved: (value) {
                        if (value == null) return;
                        _code = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please input code';
                        }
                        return null;
                      },
                      initialValue: 'P-000-008',
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
                      initialValue: 'No Description',
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

                            CreateProductEntity createEntity = CreateProductEntity(
                                _code, _name, _price, _description);
                            BlocProvider.of<CreateProductBloc>(context).create(
                                createEntity);
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
