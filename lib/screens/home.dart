import 'package:flutter/material.dart';
import 'package:foodclick/screens/listing.dart';
import 'package:foodclick/screens/login.dart';
import 'package:foodclick/services/services.dart';
import 'package:foodclick/widgets/button.dart';

class MyHomePage extends StatelessWidget {
  static const String id = "home";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome,',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Proceed to donate or collect free food',
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
                  PrimaryButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Login.id);
                    },
                    text: 'Donate',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  PrimaryButton(
                    onPressed: () {
                      Service.getActiveListings().then((value) => {
                            Navigator.pushNamed(context, Listing.id,
                                arguments: value),
                          });
                    },
                    text: 'Collect Free Food',
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
