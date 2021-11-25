import 'package:flutter/material.dart';
import 'package:foodclick/arguments/freefood_arguments.dart';
import 'package:foodclick/constants.dart';
import 'package:foodclick/models/listings.dart';
import 'package:foodclick/screens/freefood.dart';
import 'package:foodclick/services/services.dart';
import 'package:foodclick/utils.dart';
import 'package:foodclick/widgets/button.dart';

class Giveaway extends StatelessWidget {
  static const String id = "giveaway";

  Listings listings;
  Giveaway({@required this.listings});
  String nin;

  @override
  Widget build(BuildContext context) {
    final activeListing = ModalRoute.of(context).settings.arguments as Listings;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        padding: EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Please submit your nin to continue',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 20.0,
                ),
              ),
            ),
            Column(
              children: [
                TextField(
                  decoration: kTextFieldDecoration.copyWith(hintText: "NIN"),
                  onChanged: (value) {
                    nin = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                PrimaryButton(
                  onPressed: () {
                    if (nin == null || nin.length < 11) {
                      Utils.errorToast("Invalid NIN");
                    } else {
                      var data = {
                        "nin": nin,
                        "listing": activeListing.id.toString()
                      };
                      Service.postGiveaway(data).then(
                        (value) => {
                          Navigator.pushNamed(
                            context,
                            FreeFood.id,
                            arguments:
                                FreefoodArguments(nin, activeListing, value),
                          ),
                        },
                      );
                    }
                  },
                  text: 'Collect Free Food',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
