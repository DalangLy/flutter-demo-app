import 'package:demo_app/features/ware/presentation/pages/add_ware_page.dart';
import 'package:demo_app/features/ware/presentation/pages/edit_warehouse_page.dart';
import 'package:demo_app/features/ware/presentation/pages/ware_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/delete/delete_ware_bloc.dart';
import '../blocs/get/get_all_wares_bloc.dart';

class WarePage extends StatefulWidget {
  const WarePage({Key? key}) : super(key: key);

  @override
  State<WarePage> createState() => _WarePageState();
}

class _WarePageState extends State<WarePage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<GetAllWaresBloc>(context).getAllWares();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteWareBloc, DeleteWareState>(
      listener: (context, state) {
        if (state is DeleteWareSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Deleted Success')));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Warehouse'),
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
                        onPressed: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AddWarePage(),
                        )),
                        child: const Icon(Icons.add),
                      ),
                      const VerticalDivider(color: Colors.transparent,),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<GetAllWaresBloc>(context)
                              .getAllWares();
                        },
                        child: const Icon(Icons.refresh),
                      ),
                    ],
                  ),
                  const Divider(),
                  BlocBuilder<GetAllWaresBloc, GetAllWaresState>(
                    bloc: BlocProvider.of<GetAllWaresBloc>(context),
                    builder: (context, state) {
                      if (state is GetAllWaresSuccess) {
                        return SizedBox(
                          width: double.infinity,
                          child: DataTable(
                              columns: const <DataColumn>[
                                DataColumn(label: Text('Code')),
                                DataColumn(label: Text('Name')),
                                DataColumn(label: Text('Description')),
                                DataColumn(label: Text('Actions'))
                              ],
                              rows: state.data
                                  .map<DataRow>(
                                    (e) => DataRow(
                                      cells: <DataCell>[
                                        DataCell(Text(e.code)),
                                        DataCell(Text(e.name)),
                                        DataCell(Text(e.description.toString())),
                                        DataCell(
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => WareDetailPage(entity: e),));
                                                },
                                                icon: const Icon(
                                                  Icons.visibility,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditWarehousePage(entity: e,),)),
                                                icon: const Icon(
                                                  Icons.edit,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  BlocProvider.of<DeleteWareBloc>(
                                                          context)
                                                      .delete(e.id);
                                                },
                                                icon: const Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
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
