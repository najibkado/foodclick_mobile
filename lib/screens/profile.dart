import 'package:flutter/material.dart';
import 'package:foodclick/arguments/home_arguments.dart';
import 'package:foodclick/constants.dart';

class Profile extends StatefulWidget {
  static const String id = "profile";

  HomeArgument homeArgument;

  Profile({@required this.homeArgument});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final profile = ModalRoute.of(context).settings.arguments as HomeArgument;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('My Profile'),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: kPrimaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      profile.home.entity.name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Address',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: kPrimaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      profile.home.entity.pickupAddress,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Contact',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: kPrimaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      profile.home.entity.phone,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Organization Description',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: kPrimaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      profile.home.entity.desc,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Registration Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: kPrimaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      profile.home.entity.date.toIso8601String(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: kActiveColor,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
