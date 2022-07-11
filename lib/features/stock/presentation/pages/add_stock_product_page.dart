import 'package:demo_app/features/stock/domain/entities/create_for_product_entity.dart';
import 'package:demo_app/features/stock/presentation/blocs/create_for_product/create_for_product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../ware/domain/entities/ware_entity.dart';
import '../../../ware/presentation/blocs/get/get_all_wares_bloc.dart';

class AddStockProductPage extends StatefulWidget {
  const AddStockProductPage({Key? key}) : super(key: key);

  @override
  State<AddStockProductPage> createState() => _AddStockProductPageState();
}

class _AddStockProductPageState extends State<AddStockProductPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _productCode;
  late String _productName;
  late double _productPrice;
  late String _productDescription;
  late String _wareCode;
  late int _quantity;

  @override
  void initState() {
    super.initState();

    BlocProvider.of<GetAllWaresBloc>(context).getAllWares();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateForProductBloc, CreateForProductState>(
      listener: (context, state) {
        if(state is CreateForProductSuccess){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Add Product to Stock Success')));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Stock Product'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
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
                        _productName = value;
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
                        _productPrice = double.parse(value);
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
                        _productCode = value;
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
                        _productDescription = value;
                      },
                      initialValue: 'No Description',
                    ),
                    const Divider(color: Colors.transparent,),
                    BlocBuilder<GetAllWaresBloc, GetAllWaresState>(
                      builder: (context, state) {
                        if (state is GetAllWaresSuccess) {
                          _wareCode = state.data[0].code;
                          return DropdownButtonFormField<WareEntity>(
                            value: state.data[0],
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Warehouse'),
                            ),
                            onChanged: (newValue) {
                              if (newValue == null) return;
                              _wareCode = newValue.code;
                            },
                            items: state.data
                                .map<DropdownMenuItem<WareEntity>>((e) {
                              return DropdownMenuItem<WareEntity>(
                                value: e,
                                child: Text(e.name),
                              );
                            }).toList(),
                          );
                        }
                        return const Text('Loading...');
                      },
                    ),
                    const Divider(color: Colors.transparent,),
                    TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Quantity')
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'please input quantity';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        if (value == null) return;
                        _quantity = int.parse(value);
                      },
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

                            CreateForProductEntity createEntity = CreateForProductEntity(_productCode, _productName, _productPrice, _productDescription, _wareCode, _quantity);
                            BlocProvider.of<CreateForProductBloc>(context)
                                .createForProduct(
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
