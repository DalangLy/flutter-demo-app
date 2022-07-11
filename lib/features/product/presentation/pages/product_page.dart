import 'package:demo_app/features/product/presentation/blocs/delete/delete_product_bloc.dart';
import 'package:demo_app/features/product/presentation/pages/add_product_page.dart';
import 'package:demo_app/features/product/presentation/pages/product_detail_page.dart';
import 'package:demo_app/features/product/presentation/pages/update_product_page.dart';
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
  initState() {
    super.initState();

    BlocProvider.of<GetAllProductsBloc>(context).getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteProductBloc, DeleteProductState>(
      listener: (context, state) {
        if (state is DeleteProductSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Delete Success')));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Product'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AddProductPage(),
                          ),
                        ),
                        child: const Icon(Icons.add),
                      ),
                      const VerticalDivider(
                        color: Colors.transparent,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<GetAllProductsBloc>(context)
                              .getAllProducts();
                        },
                        child: const Icon(Icons.refresh),
                      ),
                    ],
                  ),
                  const Divider(),
                  BlocBuilder<GetAllProductsBloc, GetAllProductsState>(
                    bloc: BlocProvider.of<GetAllProductsBloc>(context),
                    builder: (context, state) {
                      if (state is GetAllProductsSuccess) {
                        return SizedBox(
                          width: double.infinity,
                          child: DataTable(
                              columns: const <DataColumn>[
                                DataColumn(label: Text('Code')),
                                DataColumn(label: Text('Name')),
                                DataColumn(label: Text('Price')),
                                DataColumn(label: Text('Actions',))
                              ],
                              rows: state.data
                                  .map<DataRow>(
                                    (e) => DataRow(
                                      cells: <DataCell>[
                                        DataCell(Tooltip(
                                          message: e.code,
                                          child: SizedBox(width: 50, child: Text(e.code, style: const TextStyle(overflow: TextOverflow.ellipsis),),),),),
                                        DataCell(Tooltip(
                                          message: e.name,
                                          child: SizedBox(width: 150, child: Text(e.name, style: const TextStyle(overflow: TextOverflow.ellipsis),),),),),
                                        DataCell(Tooltip(
                                          message: e.price.toString(),
                                          child: SizedBox(width: 80, child: Text(e.price.toString(), style: const TextStyle(overflow: TextOverflow.ellipsis),),),),),
                                        DataCell(
                                          Row(
                                            children: [
                                              Tooltip(
                                                message: 'View',
                                                child: IconButton(
                                                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailPage(entity: e),)),
                                                  icon: const Icon(
                                                    Icons.visibility,
                                                  ),
                                                ),
                                              ),
                                              Tooltip(
                                                message: 'Edit',
                                                child: IconButton(
                                                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdateProductPage(entity: e),)),
                                                  icon: const Icon(
                                                    Icons.edit,
                                                  ),
                                                ),
                                              ),
                                              Tooltip(
                                                message: 'Delete',
                                                child: IconButton(
                                                  onPressed: () {
                                                    BlocProvider.of<DeleteProductBloc>(context).delete(e.id);
                                                  },
                                                  icon: const Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList()),
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
      ),
    );
  }
}
