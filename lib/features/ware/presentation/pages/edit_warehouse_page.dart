import 'package:demo_app/features/ware/domain/entities/ware_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/update_ware_entity.dart';
import '../blocs/update/update_ware_bloc.dart';

class EditWarehousePage extends StatefulWidget {
  final WareEntity entity;
  const EditWarehousePage({Key? key, required this.entity}) : super(key: key);

  @override
  State<EditWarehousePage> createState() => _EditWarehousePageState();
}

class _EditWarehousePageState extends State<EditWarehousePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _name;
  late String _description;
  late String _code;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateWareBloc, UpdateWareState>(
      listener: (context, state) {
        if(state is UpdateWareSuccess){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Update Success')));

          final FormState? form = _formKey.currentState;
          if(form == null) return;
          form.reset();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Update Warehouse'),
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
                      initialValue: widget.entity.code,
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

                            UpdateWareEntity entity = UpdateWareEntity(
                                widget.entity.id, _name, _description);
                            BlocProvider.of<UpdateWareBloc>(context).update(
                                entity);
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
