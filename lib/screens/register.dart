import 'package:flutter/material.dart';
import 'package:foodclick/arguments/user_arguments.dart';
import 'package:foodclick/constants.dart';
import 'package:foodclick/screens/entity_registration.dart';
import 'package:foodclick/screens/login.dart';
import 'package:foodclick/services/local_storage.dart';
import 'package:foodclick/services/services.dart';
import 'package:foodclick/utils.dart';
import 'package:foodclick/widgets/button.dart';

class Register extends StatelessWidget {
  static const String id = "register";

  String name;
  String email;
  String password;
  String username;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();

  void _clear() {
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _usernameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get Started',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
              ],
            ),
            Column(
              children: [
                TextField(
                  decoration: kTextFieldDecoration.copyWith(hintText: 'name'),
                  onChanged: (value) {
                    name = value;
                  },
                  controller: _nameController,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  decoration: kTextFieldDecoration.copyWith(hintText: 'email'),
                  onChanged: (value) {
                    email = value;
                  },
                  controller: _emailController,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'username'),
                  onChanged: (value) {
                    username = value;
                  },
                  controller: _usernameController,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'Password'),
                  onChanged: (value) {
                    password = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                PrimaryButton(
                  onPressed: () {
                    if (username.length >= 4 &&
                        name.length >= 4 &&
                        email.length >= 4 &&
                        password.length >= 4) {
                      var data = {
                        "username": username,
                        "first_name": name,
                        "last_name": name,
                        "password": password,
                        "email": email
                      };
                      Service.registerRequest(data)
                          .then((value) => {
                                print(value.toJson()),
                                LocalStorage.storeUser(value),
                                _clear(),
                                Navigator.pushNamed(context, EntityRegister.id,
                                    arguments: UserArgument(value)),
                              })
                          .onError((error, stackTrace) => {
                                _clear(),
                                Utils.errorToast(error.toString()),
                              });
                    } else {
                      _clear();
                      Utils.errorToast('Fields can not bbe empty');
                    }
                  },
                  text: 'Register',
                ),
                SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Login.id);
                  },
                  child: Text(
                    'Login Instead',
                    style: kTextStyleDecoration.copyWith(color: kPrimaryColor),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
