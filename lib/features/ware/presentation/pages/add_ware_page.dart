import 'package:demo_app/features/ware/domain/entities/create_ware_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/create/create_ware_bloc.dart';

class AddWarePage extends StatefulWidget {
  const AddWarePage({Key? key}) : super(key: key);

  @override
  State<AddWarePage> createState() => _AddWarePageState();
}

class _AddWarePageState extends State<AddWarePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _name;
  late String _description;
  late String _code;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateWareBloc, CreateWareState>(
      listener: (context, state) {
        if(state is CreateWareSuccess){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Created Success')));

          final FormState? form = _formKey.currentState;
          if(form == null) return;
          form.reset();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Warehouse'),
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

                            CreateWareEntity createEntity = CreateWareEntity(
                                _name, _description, _code);
                            BlocProvider.of<CreateWareBloc>(context).create(
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
