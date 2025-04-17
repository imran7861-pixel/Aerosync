import 'dart:io';
import 'package:admin_aerosync/api.dart';
import 'package:admin_aerosync/sample.dart';
import 'package:admin_aerosync/signup.dart';
import 'package:admin_aerosync/styles.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController emailcontroller = TextEditingController();

TextEditingController passwordcontroller = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.bgColor,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          leading: Image.asset('assets/images/logo.png', color: Colors.white),
          title: const Text(
            "Login",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          backgroundColor: Styles.primaryColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 200,
                  height: 200,
                ),
                TextFormField(
                  controller: emailcontroller,
                  decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email_outlined)),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                    controller: passwordcontroller,
                    decoration: const InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.password_outlined))),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Styles.primaryColor),
                          onPressed: () async {
                            String apiurl = 'api/v1/signin';
                            Map data = {
                              "email": emailcontroller.text,
                              "password": passwordcontroller.text,
                            };
                            dynamic response = await usercheck(data, apiurl);
                            print(response.statusCode.toString());
                            if (response.statusCode == 200) {
                              dynamic data = response.body;

                              if (!mounted) return;
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Sample()));
                            } else {
                              QuickAlert.show(
                                  context: context, type: QuickAlertType.error);
                              print(const SocketException('ERRRRRRRRRR'));
                            }
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Did\'nt have an account'),
                    TextButton(
                        onPressed: () async {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUp()));
                        },
                        child: const Text('Signup')),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
