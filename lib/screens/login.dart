import 'package:flutter/material.dart';
import 'package:foodclick/arguments/home_arguments.dart';
import 'package:foodclick/constants.dart';
import 'package:foodclick/models/user.dart';
import 'package:foodclick/screens/donate_home.dart';
import 'package:foodclick/screens/register.dart';
import 'package:foodclick/services/local_storage.dart';
import 'package:foodclick/services/services.dart';
import 'package:foodclick/utils.dart';
import 'package:foodclick/widgets/button.dart';

class Login extends StatefulWidget {
  static const String id = "login";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _username;
  String _password;

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _clear() {
    _usernameController.clear();
    _passwordController.clear();
  }

  // @override
  // void initState() {
  //   LocalStorage.isLoggedIn().then((value) => {
  //         if (value == true)
  //           {
  //             Navigator.pushNamed(context, DonateHome.id),
  //           }
  //       });
  //   super.initState();
  // }

  void _login(username, password) async {
    Service.loginRequest(username, password)
        .then(
      (User user) => {
        LocalStorage.storeUser(user),
        Service.getHome().then(
          (value) => {
            Navigator.pushNamed(context, DonateHome.id,
                arguments: HomeArgument(value)),
          },
        ),
      },
    )
        .catchError((onError) {
      _clear();
      Utils.errorToast("Invalid user credentials");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    'Welcome back,',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Login to donate food',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      _username = value;
                    },
                    controller: _usernameController,
                    decoration:
                        kTextFieldDecoration.copyWith(hintText: 'username'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    obscureText: true,
                    controller: _passwordController,
                    onChanged: (value) {
                      _password = value;
                    },
                    decoration:
                        kTextFieldDecoration.copyWith(hintText: 'Password'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  PrimaryButton(
                    onPressed: () {
                      if (_username?.isEmpty ?? true) {
                        Utils.errorToast("Please enter your valid credentials");
                      } else if (_password?.isEmpty ?? true) {
                        Utils.errorToast("Please enter your valid credentials");
                      } else if (_username.length < 4 || _password.length < 4) {
                        Utils.errorToast("Please enter your valid credentials");
                      } else {
                        _login(_username, _password);
                      }
                    },
                    text: 'Login',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Register.id);
                    },
                    child: Text(
                      'Register Instead',
                      style:
                          kTextStyleDecoration.copyWith(color: kPrimaryColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
