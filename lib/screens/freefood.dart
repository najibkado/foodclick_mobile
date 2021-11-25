import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:foodclick/arguments/freefood_arguments.dart';
import 'package:foodclick/constants.dart';
import 'package:foodclick/screens/home.dart';
import 'package:foodclick/widgets/button.dart';

class FreeFood extends StatelessWidget {
  static const String id = "freefood";

  FreefoodArguments freefood;
  FreeFood({@required this.freefood});

  @override
  Widget build(BuildContext context) {
    final activeGiveaway =
        ModalRoute.of(context).settings.arguments as FreefoodArguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  child: Image.network(
                    activeGiveaway.listings.url,
                    fit: BoxFit.fill,
                  ),
                ),
                flex: 1,
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Free Food By',
                    style: kTextStyleDecoration,
                  ),
                  Text(
                    activeGiveaway.listings.entity.name,
                    style: kTitleTextDecoration,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Food',
                    style: kTextStyleDecoration,
                  ),
                  Text(
                    activeGiveaway.listings.name,
                    style: kTitleTextDecoration,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Pick up address',
                    style: kTextStyleDecoration,
                  ),
                  Text(
                    activeGiveaway.listings.entity.pickupAddress,
                    style: kTitleTextDecoration,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Pick up contact',
                    style: kTextStyleDecoration,
                  ),
                  Text(
                    activeGiveaway.listings.entity.phone,
                    style: kTitleTextDecoration,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Divider(),
                  Text(
                    'My NIN',
                    style: kTextStyleDecoration,
                  ),
                  Text(
                    activeGiveaway.nin,
                    style: kTitleTextDecoration,
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  PrimaryButton(
                    text: 'Done',
                    onPressed: () {
                      Navigator.pushNamed(context, MyHomePage.id);
                    },
                  )
                ],
              ),
            ),
            flex: 3,
          ),
        ],
      ),
    );
  }
}
