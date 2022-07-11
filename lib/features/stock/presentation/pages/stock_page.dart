import 'package:demo_app/features/stock/domain/entities/transfer_stock_entity.dart';
import 'package:demo_app/features/stock/presentation/blocs/delete/delete_stock_bloc.dart';
import 'package:demo_app/features/stock/presentation/blocs/get/get_all_stocks_bloc.dart';
import 'package:demo_app/features/stock/presentation/blocs/transfer/transfer_product_bloc.dart';
import 'package:demo_app/features/stock/presentation/pages/add_stock_page.dart';
import 'package:demo_app/features/stock/presentation/pages/add_stock_product_page.dart';
import 'package:demo_app/features/stock/presentation/pages/stock_detail_page.dart';
import 'package:demo_app/features/ware/presentation/blocs/get/get_all_wares_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ware/domain/entities/ware_entity.dart';

class StockPage extends StatefulWidget {
  const StockPage({Key? key}) : super(key: key);

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<GetAllStocksBloc>(context).getAllStocks();
    BlocProvider.of<GetAllWaresBloc>(context).getAllWares();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<TransferProductBloc, TransferProductState>(
  listener: (context, state) {
    if(state is TransferProductSuccess){
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Transfer Success')));
    }
  },
  child: Scaffold(
      appBar: AppBar(
        title: const Text('Stock'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddStockPage(),)), child: const Icon(Icons.add),),
                    const VerticalDivider(),
                    ElevatedButton(onPressed: (){
                      BlocProvider.of<GetAllStocksBloc>(context).getAllStocks();
                    }, child: const Icon(Icons.refresh),),
                    const VerticalDivider(),
                    ElevatedButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddStockProductPage(),)), child: const Text('New Product'),),
                  ],
                ),
                const Divider(),
                BlocBuilder<GetAllStocksBloc, GetAllStocksState>(
                  bloc: BlocProvider.of<GetAllStocksBloc>(context),
                  builder: (context, state) {
                    if(state is GetAllStocksSuccess){
                      return DataTable(
                          columns: const <DataColumn>[
                            DataColumn(label: Text('Product Code')),
                            DataColumn(label: Text('Product Name')),
                            DataColumn(label: Text('Product Price')),
                            DataColumn(label: Text('Warehouse')),
                            DataColumn(label: Text('Quantity')),
                            DataColumn(label: Text('Document Date')),
                            DataColumn(label: Text('Posting Date')),
                            DataColumn(label: Text('Actions'))
                          ],
                          rows: state.data.map<DataRow>((e) => DataRow(
                            cells: <DataCell>[
                              DataCell(SizedBox(width: 90, child: Text(e.product.code),),),
                              DataCell(SizedBox(width: 130, child: Text(e.product.name),),),
                              DataCell(SizedBox(width: 100, child: Text('\$ ${e.product.price.toString()}'),),),
                              DataCell(Text(e.ware.name)),
                              DataCell(Text(e.quantity.toString())),
                              DataCell(Text(e.documentDate.toString())),
                              DataCell(Text(e.postingDate.toString())),
                              DataCell(
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => StockDetailPage(entity: e),));
                                      },
                                      icon: const Icon(Icons.visibility,),
                                    ),
                                    IconButton(
                                      onPressed: (){
                                        _showTransferDialog(e.productId, e.wareId);
                                      },
                                      icon: const Icon(Icons.transfer_within_a_station,),
                                    ),
                                    IconButton(
                                      onPressed: (){
                                        BlocProvider.of<DeleteStockBloc>(context).delete(e.id);
                                      },
                                      icon: const Icon(Icons.delete, color: Colors.red,),
                                    ),
                                  ],
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
    ),
);
  }

  Future<void> _showTransferDialog(String productId, String sourceWarehouseId) async {
    final GlobalKey<FormState> transferFormKey = GlobalKey<FormState>();
    String selectedTargetWarehouse = '';
    int quantity = 1;
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Transfer Product'),
          content: SingleChildScrollView(
            child: Form(
              key: transferFormKey,
              child: ListBody(
                children: <Widget>[
                  BlocBuilder<GetAllWaresBloc, GetAllWaresState>(
                    builder: (context, state) {
                      if (state is GetAllWaresSuccess) {
                        return DropdownButtonFormField<WareEntity>(
                          value: state.data[0],
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('Target Warehouse'),
                          ),
                          onChanged: (newValue) {
                            if (newValue == null) return;
                            selectedTargetWarehouse = newValue.code;
                          },
                          items: state.data.map<DropdownMenuItem<WareEntity>>((e) {
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
                    initialValue: '1',
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'please input quantity';
                      }
                      return null;
                    },
                    onSaved: (value){
                      if(value == null) return;
                      quantity = int.parse(value);
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Transfer'),
              onPressed: () {
                final FormState? form = transferFormKey.currentState;
                if(form == null) return;
                if(form.validate()){
                  form.save();

                  TransferStockEntity entity = TransferStockEntity(productId, quantity, sourceWarehouseId, selectedTargetWarehouse);
                  BlocProvider.of<TransferProductBloc>(context).transferProduct(entity);
                  
                }
              },
            ),
          ],
        );
      },
    );
  }
}
