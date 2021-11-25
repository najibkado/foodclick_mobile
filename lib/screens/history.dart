import 'package:flutter/material.dart';
import 'package:foodclick/arguments/home_arguments.dart';
import 'package:foodclick/constants.dart';

class History extends StatefulWidget {
  static const String id = "history";

  HomeArgument homeArgument;

  History({@required this.homeArgument});

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    final home = ModalRoute.of(context).settings.arguments as HomeArgument;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Donation History'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: home.home.giveaway != null
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: home.home.giveaway.length,
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
                            child: Image.network(
                                "https://www.seekpng.com/png/detail/117-1179653_donate-icon-life-value-icon.png"),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(home.home.giveaway[index].nin,
                                  style: kTitleTextDecoration),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(home.home.giveaway[index].date.toString(),
                                  style: kTextStyleDecoration),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(" Thank you received",
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
                    'No recorded history',
                    style: kTitleTextDecoration,
                  ),
                ),
              ),
      ),
    );
  }
}
