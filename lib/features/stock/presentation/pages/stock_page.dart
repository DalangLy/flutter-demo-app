import 'package:demo_app/features/stock/presentation/blocs/delete/delete_stock_bloc.dart';
import 'package:demo_app/features/ware/domain/entities/create_ware_entity.dart';
import 'package:demo_app/features/ware/domain/entities/update_ware_entity.dart';
import 'package:demo_app/features/ware/presentation/blocs/get/get_all_wares_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/create/create_ware_bloc.dart';
import '../blocs/update/update_ware_bloc.dart';

class StockPage extends StatelessWidget {
  const StockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(onPressed: (){
                      CreateWareEntity create = CreateWareEntity(
                          "P-000-006",
                          "Product Test Name 6",
                          "Product Test 6 for demo");
                      BlocProvider.of<CreateWareBloc>(context).create(create);
                    }, child: const Icon(Icons.add),),
                    ElevatedButton(onPressed: (){
                      UpdateWareEntity create = UpdateWareEntity(
                          "",
                          "Product Test Name 6",
                          "Product Test 6 for demo");
                      BlocProvider.of<UpdateWareBloc>(context).update(create);
                    }, child: const Icon(Icons.update),),
                  ],
                ),
                const Divider(),
                BlocBuilder<GetAllWaresBloc, GetAllWaresState>(
                  bloc: BlocProvider.of<GetAllWaresBloc>(context),
                  builder: (context, state) {
                    if(state is GetAllWaresSuccess){
                      return DataTable(
                          columns: const <DataColumn>[
                            DataColumn(label: Text('ID')),
                            DataColumn(label: Text('Code')),
                            DataColumn(label: Text('Name')),
                            DataColumn(label: Text('Description')),
                            DataColumn(label: Text('Actions'))
                          ],
                          rows: state.data.map<DataRow>((e) => DataRow(
                            cells: <DataCell>[
                              DataCell(Text(e.id)),
                              DataCell(Text(e.code)),
                              DataCell(Text(e.name)),
                              DataCell(Text(e.description.toString())),
                              DataCell(
                                Column(
                                  children: [
                                    IconButton(
                                      onPressed: (){
                                        //BlocProvider.of<GetStockByIdBloc>(context).getById(e.id);
                                      },
                                      icon: const Icon(Icons.visibility,),
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
    );
  }
}
