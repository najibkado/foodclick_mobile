import 'package:flutter/material.dart';
import 'package:foodclick/arguments/home_arguments.dart';
import 'package:foodclick/constants.dart';

class ActiveDonations extends StatefulWidget {
  static const String id = "active_donations";

  HomeArgument homeArgument;

  ActiveDonations({@required this.homeArgument});

  @override
  _ActiveDonationsState createState() => _ActiveDonationsState();
}

class _ActiveDonationsState extends State<ActiveDonations> {
  @override
  Widget build(BuildContext context) {
    final home = ModalRoute.of(context).settings.arguments as HomeArgument;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Active Donations'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: home.home.listings != null
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: home.home.listings.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, Giveaway.id,
                      //     arguments: activeListings[index]);
                    },
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      height: 90.0,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Container(
                            width: 100.0,
                            child: Image.network(home.home.listings[index].url),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(home.home.listings[index].name,
                                  style: kTitleTextDecoration),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(home.home.listings[index].desc,
                                  style: kTextStyleDecoration),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                  home.home.listings[index].quantity +
                                      " packages left",
                                  style: kTextStyleDecoration),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : Container(
                child: Center(
                  child: Text(
                    'Refresh please',
                    style: kTitleTextDecoration,
                  ),
                ),
              ),
      ),
    );
  }
}
