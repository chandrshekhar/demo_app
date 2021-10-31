import 'package:demo_app/provider_state.dart';
import 'package:demo_app/Screens/home_page.dart';
import 'package:demo_app/Screens/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderLogin extends StatefulWidget {
  const ProviderLogin({Key? key}) : super(key: key);

  @override
  _ProviderLoginState createState() => _ProviderLoginState();
}

class _ProviderLoginState extends State<ProviderLogin> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.red,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: TextFormField(
                      controller: email,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email is Required";
                        }
                        if (!value.contains("@")) {
                          return "Please Enter Valid Email";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.blue)),
                        isDense: true, // Added this
                        contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      ),
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: TextFormField(
                      obscureText: true,
                      controller: pass,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Password";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: const TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.blue)),
                        isDense: true, // Added this
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 20, 10, 10),
                      ),
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Forgot Password ? Reset Now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        _Login(email.text, pass.text, context);
                      }
                      _Login(email.text, pass.text, context);
                    },
                    child: const Text("Login"),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  // ignore: prefer_const_constructors
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProviderRegistration()));
            },
            child: RichText(
                // ignore: prefer_const_constructors
                text: TextSpan(
              text: 'New User?',
              style: TextStyle(fontSize: 15.0, color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: ' Register Now',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color(0XFF4321F5)),
                ),
              ],
            ))));
  }

  void _Login(String email, String password, BuildContext context) async {
    ProviderState _providerState =
        Provider.of<ProviderState>(context, listen: false);
    try {
      if (await _providerState.LoginUser(email, password)) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    } catch (e) {
      print(e);
    }
  }
}
