import 'package:demo_app/features/product/domain/entities/create_product_entity.dart';
import 'package:demo_app/features/product/presentation/blocs/create/create_product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/get/get_all_products_bloc.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  @override
  initState(){
    super.initState();

    BlocProvider.of<GetAllProductsBloc>(context).getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(onPressed: (){
                      CreateProductEntity create = CreateProductEntity(
                          "P-000-006",
                          "Product Test Name 6",
                          11,
                          "Product Test 6 for demo");
                      BlocProvider.of<CreateProductBloc>(context).create(create);
                    }, child: const Icon(Icons.add),),
                  ],
                ),
                const Divider(),
                BlocBuilder<GetAllProductsBloc, GetAllProductsState>(
                  bloc: BlocProvider.of<GetAllProductsBloc>(context),
                  builder: (context, state) {
                    if(state is GetAllProductsSuccess){
                      return DataTable(
                          columns: const <DataColumn>[
                            DataColumn(label: Text('ID')),
                            DataColumn(label: Text('Code')),
                            DataColumn(label: Text('Name')),
                            DataColumn(label: Text('Price')),
                            DataColumn(label: Text('Description')),
                            DataColumn(label: Text('Actions'))
                          ],
                          rows: state.data.map<DataRow>((e) => DataRow(
                            cells: <DataCell>[
                              DataCell(Text(e.id)),
                              DataCell(Text(e.code)),
                              DataCell(Text(e.name)),
                              DataCell(Text(e.price.toString())),
                              DataCell(Text(e.description.toString())),
                              DataCell(
                                IconButton(
                                  onPressed: (){},
                                  icon: const Icon(Icons.delete, color: Colors.red,),
                                ),
                              ),
                            ],
                          ),
                        ).toList()
                      );
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
