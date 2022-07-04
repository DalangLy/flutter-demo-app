import 'package:demo_app/features/login/domain/entities/login.dart';
import 'package:demo_app/features/login/presentation/blocs/login/login_bloc.dart';
import 'package:demo_app/features/product/presentation/pages/product_page.dart';
import 'package:demo_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _username;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if(state is LoginSuccess){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage(),));
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'LOGIN',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const Divider(),
                    TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Username')),
                      initialValue: 'administrator',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please input some username';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        if (value == null || value.isEmpty) return;
                        _username = value;
                      },
                    ),
                    const Divider(),
                    TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Password')),
                      obscureText: true,
                      initialValue: '@dm1n',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please input some password';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        if (value == null || value.isEmpty) return;
                        _password = value;
                      },
                    ),
                    const Divider(),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          final FormState? form = _formKey.currentState;
                          if (form == null) return;
                          if (form.validate()) {
                            form.save();
                            //login
                            BlocProvider.of<LoginBloc>(context)
                                .login(Login(_username, _password));
                          }
                        },
                        child: const Text('LOGIN'),
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
