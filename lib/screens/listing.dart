import 'package:flutter/material.dart';
import 'package:foodclick/constants.dart';
import 'package:foodclick/models/listings.dart';
import 'package:foodclick/screens/giveaway.dart';

class Listing extends StatefulWidget {
  static const String id = "listing";
  Listings listings;
  Listing({@required this.listings});
  @override
  _ListingState createState() => _ListingState();
}

class _ListingState extends State<Listing> {
  @override
  Widget build(BuildContext context) {
    final activeListings = ModalRoute.of(context).settings.arguments as List;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text('Available Free Food'),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: activeListings != null
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: activeListings.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Giveaway.id,
                            arguments: activeListings[index]);
                      },
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        height: 90.0,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Container(
                              width: 100.0,
                              child: Image.network(activeListings[index].url),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(activeListings[index].name,
                                    style: kTitleTextDecoration),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(activeListings[index].desc,
                                    style: kTextStyleDecoration),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                    activeListings[index].quantity +
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
      ),
    );
  }
}
