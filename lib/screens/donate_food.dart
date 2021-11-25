import 'package:flutter/material.dart';
import 'package:foodclick/arguments/home_arguments.dart';
import 'package:foodclick/constants.dart';
import 'package:foodclick/screens/donate_home.dart';
import 'package:foodclick/services/services.dart';
import 'package:foodclick/utils.dart';
import 'package:foodclick/widgets/button.dart';

class DonateFood extends StatefulWidget {
  static const String id = "donate_food";

  final HomeArgument homeArgument;

  DonateFood({@required this.homeArgument});

  @override
  _DonateFoodState createState() => _DonateFoodState();
}

class _DonateFoodState extends State<DonateFood> {
  String name;
  String desc;
  String quantity;

  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _quantityController = TextEditingController();

  void _clear() {
    _nameController.clear();
    _descController.clear();
    _quantityController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final profile = ModalRoute.of(context).settings.arguments as HomeArgument;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Add Donation'),
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
                  'Donate Surplus Food',
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
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'Food Name'),
                  onChanged: (value) {
                    name = value;
                  },
                  controller: _nameController,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Food Description'),
                  onChanged: (value) {
                    desc = value;
                  },
                  controller: _descController,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'quantity'),
                  onChanged: (value) {
                    quantity = value;
                  },
                  controller: _quantityController,
                ),
                SizedBox(
                  height: 20.0,
                ),
                PrimaryButton(
                  onPressed: () {
                    if (quantity.length >= 1 &&
                        name.length >= 2 &&
                        desc.length >= 4) {
                      var data = {
                        "entity": profile.home.entity.id.toString(),
                        "desc": desc,
                        "name": name,
                        "pickup_address": profile.home.entity.pickupAddress,
                        "url":
                            'https://media.istockphoto.com/photos/cardboard-box-filled-with-nonperishable-foods-on-wooden-table-high-picture-id1283712032?b=1&k=20&m=1283712032&s=170667a&w=0&h=u554erAvIkLQ_UIYH9mLaqcOpFYytkwCA8cmVA5ovTU=',
                        "quantity": quantity,
                        "is_active": true.toString()
                      };
                      Service.postListingRequest(data)
                          .then((value) => {
                                _clear(),
                                Navigator.pushNamed(context, DonateHome.id,
                                    arguments: profile),
                              })
                          .onError((error, stackTrace) => {
                                _clear(),
                                Utils.errorToast(error.toString()),
                              });
                    } else {
                      _clear();
                      Utils.errorToast('Fields can not be empty');
                    }
                  },
                  text: 'Donate',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
