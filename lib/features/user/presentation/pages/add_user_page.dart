import 'package:demo_app/features/user/domain/entities/create_user_entity.dart';
import 'package:demo_app/features/user/presentation/blocs/create/create_user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({Key? key}) : super(key: key);

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _name;
  late String _password;
  late List<String> roles = [
    'User'
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateUserBloc, CreateUserState>(
      listener: (context, state) {
        if(state is CreateUserSuccess){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Created')));

          final FormState? form = _formKey.currentState;
          if(form == null) return;
          form.reset();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add User'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
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
                            label: Text('Password')
                        ),
                        obscureText: true,
                        onSaved: (value) {
                          if (value == null) return;
                          _password = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please input password';
                          }
                          return null;
                        },
                      ),
                      const Divider(color: Colors.transparent,),
                      CheckboxListTile(
                          title: const Text('User'),
                          value: true, onChanged: (value){
                            if(value == null) return;
                            if(value){
                              if(roles.contains('User')) return;
                              roles.add('User');
                            }
                            else{
                              roles.remove('User');
                            }
                          }
                      ),
                      const Divider(color: Colors.transparent,),
                      CheckboxListTile(
                          title: const Text('Admin'),
                          value: false, onChanged: (value){
                            if(value == null) return;
                            if(value){
                              roles.add('Admin');
                            }
                            else{
                              roles.remove('Admin');
                            }
                          }
                      ),
                      const Divider(color: Colors.transparent,),
                      CheckboxListTile(
                        title: const Text('Super Admin'),
                        value: false, onChanged: (value){
                          if(value == null) return;
                          if(value){
                            roles.add('SuperAdmin');
                          }
                          else{
                            roles.remove('SuperAdmin');
                          }
                        }
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

                              CreateUserEntity createEntity = CreateUserEntity(
                                  _name, _password,
                                roles,
                              );
                              BlocProvider.of<CreateUserBloc>(context).create(
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
      ),
    );
  }
}