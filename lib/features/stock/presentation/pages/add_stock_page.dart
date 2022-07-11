import 'package:demo_app/features/product/domain/entities/product_entity.dart';
import 'package:demo_app/features/ware/domain/entities/ware_entity.dart';
import 'package:demo_app/features/ware/presentation/blocs/get/get_all_wares_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../product/presentation/blocs/get/get_all_products_bloc.dart';
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
  void initState() {
    super.initState();

    BlocProvider.of<GetAllProductsBloc>(context).getAllProducts();
    BlocProvider.of<GetAllWaresBloc>(context).getAllWares();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateStockBloc, CreateStockState>(
      listener: (context, state) {
          if(state is CreateStockSuccess){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Add Stock Success')));
          }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Stock'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    BlocBuilder<GetAllProductsBloc, GetAllProductsState>(
                      builder: (context, state) {
                        if (state is GetAllProductsSuccess) {
                          //return Text(state.data.length.toString());
                          return DropdownButtonFormField<ProductEntity>(
                            value: state.data[0],
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Product'),
                            ),
                            onChanged: (newValue) {
                              if (newValue == null) return;
                              _productCode = newValue.code;
                            },
                            items: state.data
                                .map<DropdownMenuItem<ProductEntity>>((e) {
                              return DropdownMenuItem<ProductEntity>(
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
                    BlocBuilder<GetAllWaresBloc, GetAllWaresState>(
                      builder: (context, state) {
                        if (state is GetAllWaresSuccess) {
                          //return Text(state.data.length.toString());
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

                            CreateStockEntity createEntity = CreateStockEntity(
                                _productCode, _wareCode, _quantity);
                            BlocProvider.of<CreateStockBloc>(context)
                                .createStock(
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
