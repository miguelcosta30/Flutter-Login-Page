import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_page/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_login_page/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_page/screens/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LongPageState();
  }
}

class _LongPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _validateEmail = false, _validatePassword = false;

  @override
  void initState() {
    super.initState();
  }

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log In"),
        backgroundColor: const Color(0xFF52B788),
      ),
      body: BlocBuilder<LoginBloc, LoginBlocState>(
        builder: (context, state) {
          return ListView(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 62),
                child: Column(
                  children: <Widget>[
                    form(
                        "Email",
                        const Icon(
                          Icons.email,
                          color: Color(0xFF52B788),
                        ),
                        context,
                        _validateEmail,
                        _emailController,
                        "email"),
                    form(
                        "Password",
                        const Icon(
                          Icons.vpn_key,
                          color: Color(0xFF52B788),
                        ),
                        context,
                        _validatePassword,
                        _passwordController,
                        "password"),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: 16, right: 32),
                        child: Text(
                          'Forgot Password ?',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          _emailController.text.isEmpty ||
                                  (checkEmail(_emailController.text) == null)
                              ? _validateEmail = true
                              : _validateEmail = false;
                          _passwordController.text.isEmpty ||
                                  _passwordController.text.length < 5
                              ? _validatePassword = true
                              : _validatePassword = false;
                        });

                        if (!_validateEmail && !_validatePassword) {
                          BlocProvider.of<LoginBloc>(context).add(
                              LoginBlocEventStarted(
                                  email: _emailController.text.toString(),
                                  password:
                                      _passwordController.text.toString()));
                        }
                      },
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF52B788),
                                Color(0xFF52B788),
                              ],
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Center(
                          child: Text(
                            'Login'.toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: EdgeInsets.only(top: 16, right: 32),
                            child: Center(
                              child: Text(
                                'Dont have a account?',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()),
                            );
                          },
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Center(
                              child: Text(
                                'Sign up now',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.green[300]),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
