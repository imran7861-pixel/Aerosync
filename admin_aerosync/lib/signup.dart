import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:admin_aerosync/api.dart';
import 'package:admin_aerosync/login.dart';
import 'package:admin_aerosync/styles.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

TextEditingController emailcontroller = TextEditingController();

TextEditingController passwordcontroller = TextEditingController();

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.bgColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          leading: Image.asset('assets/images/logo.png', color: Colors.white),
          title: Text(
            "Signup",
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
                  decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email_outlined)),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.password_outlined))),
                SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Styles.primaryColor),
                          onPressed: () async {
                            String apiurl = 'api/v1/signup';
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
                                  builder: (context) => LoginPage()));
                            } else {
                              QuickAlert.show(
                                  context: context, type: QuickAlertType.error);
                              print(SocketException('ERRRRRRRRRR'));
                            }
                          },
                          child: Text(
                            'Signup',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account'),
                    TextButton(
                        onPressed: () async {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginPage()));
                        },
                        child: Text('Login')),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
