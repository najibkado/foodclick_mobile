import 'package:flutter/material.dart';
import 'package:foodclick/arguments/home_arguments.dart';
import 'package:foodclick/constants.dart';
import 'package:foodclick/screens/active_donations.dart';
import 'package:foodclick/screens/donate_food.dart';
import 'package:foodclick/screens/history.dart';
import 'package:foodclick/screens/home.dart';
import 'package:foodclick/screens/profile.dart';
import 'package:foodclick/services/local_storage.dart';
import 'package:foodclick/services/services.dart';
import 'package:foodclick/utils.dart';

class DonateHome extends StatefulWidget {
  static const String id = 'donate_home';

  HomeArgument homeArgument;
  DonateHome({@required this.homeArgument});

  @override
  _DonateHomeState createState() => _DonateHomeState();
}

class _DonateHomeState extends State<DonateHome> {
  void _logout() {
    Service.logoutRequest()
        .then((value) => {
              LocalStorage.clearData(),
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Logout'))),
              Navigator.pushNamed(context, MyHomePage.id),
            })
        .catchError((onError) {
      Utils.errorToast('Unable to logout, try again');
    });
  }

  @override
  Widget build(BuildContext context) {
    final home = ModalRoute.of(context).settings.arguments as HomeArgument;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: Container(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
          child: Text(
            'Foodclick',
            style: kTitleTextDecoration.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        leadingWidth: 300.0,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _logout();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        home.home.entity.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35.0,
                          color: kPrimaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Keep on the good work by donating surplus food to the need. Thankyou!',
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
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.fastfood,
                                    size: 50.0,
                                    color: kPrimaryColor,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'All Donations',
                                    style: kTextStyleDecoration,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    home.home.totalDonations.toString(),
                                    style: kTitleTextDecoration,
                                  )
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
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, History.id,
                                  arguments: home);
                            },
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.food_bank,
                                    size: 50.0,
                                    color: kPrimaryColor,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Active Donations',
                                    style: kTextStyleDecoration,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    home.home.activeDonations.toString(),
                                    style: kTitleTextDecoration,
                                  )
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
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, ActiveDonations.id,
                                  arguments: home);
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.account_circle,
                                    size: 50.0,
                                    color: kPrimaryColor,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'View Profile',
                                    style: kTextStyleDecoration,
                                  ),
                                  SizedBox(
                                    height: 10.0,
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
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, Profile.id,
                                  arguments: home);
                            },
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.add_circle,
                                    size: 50.0,
                                    color: kPrimaryColor,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Donate Surplus Food',
                                    style: kTextStyleDecoration,
                                  ),
                                  SizedBox(
                                    height: 10.0,
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
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, DonateFood.id,
                                  arguments: home);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
