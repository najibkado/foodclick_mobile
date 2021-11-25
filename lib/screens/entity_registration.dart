import 'package:flutter/material.dart';
import 'package:foodclick/arguments/user_arguments.dart';
import 'package:foodclick/constants.dart';
import 'package:foodclick/screens/donate_home.dart';
import 'package:foodclick/services/services.dart';
import 'package:foodclick/utils.dart';
import 'package:foodclick/widgets/button.dart';

class EntityRegister extends StatelessWidget {
  static const String id = "entity_register";
  UserArgument argument;

  EntityRegister({@required this.argument});

  String name;
  String desc;
  String address;
  String phone;

  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();

  void _clear() {
    _nameController.clear();
    _descController.clear();
    _addressController.clear();
    _phoneController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context).settings.arguments as UserArgument;
    return Scaffold(
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
                  'Your Organization',
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
                  onChanged: (value) {
                    name = value;
                  },
                  controller: _nameController,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Organization name'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  onChanged: (value) {
                    desc = value;
                  },
                  controller: _descController,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Organization description'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  onChanged: (value) {
                    address = value;
                  },
                  controller: _addressController,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Organization address'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  onChanged: (value) {
                    phone = value;
                  },
                  controller: _phoneController,
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'Contact phone'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                PrimaryButton(
                  onPressed: () {
                    if (name.length > 4 &&
                        desc.length > 4 &&
                        address.length > 4 &&
                        phone.length > 6) {
                      var data = {
                        "user": user.user.userId.toString(),
                        "name": name,
                        "desc": desc,
                        "pickup_address": address,
                        "phone": phone
                      };

                      Service.entityRegisterRequest(data).then((value) => {
                            _clear(),
                            Navigator.pushNamed(context, DonateHome.id),
                          });
                    } else {
                      Utils.errorToast('Fields can\'t be empty');
                      _clear();
                    }
                  },
                  text: 'Submit',
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Submitting and registering with us means you accept our Terms and Conditions of Services',
                  style: kTextStyleDecoration,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
