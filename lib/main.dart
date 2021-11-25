import 'package:flutter/material.dart';
import 'package:foodclick/screens/active_donations.dart';
import 'package:foodclick/screens/donate_food.dart';
import 'package:foodclick/screens/donate_home.dart';
import 'package:foodclick/screens/entity_registration.dart';
import 'package:foodclick/screens/freefood.dart';
import 'package:foodclick/screens/giveaway.dart';
import 'package:foodclick/screens/history.dart';
import 'package:foodclick/screens/home.dart';
import 'package:foodclick/screens/listing.dart';
import 'package:foodclick/screens/login.dart';
import 'package:foodclick/screens/profile.dart';
import 'package:foodclick/screens/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      onGenerateRoute: (settings) {
        if (settings.name == Listing.id) {
          final args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) => Listing(listings: args),
          );
        } else if (settings.name == Giveaway.id) {
          final args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) => Giveaway(listings: args),
          );
        } else if (settings.name == FreeFood.id) {
          final args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) => FreeFood(freefood: args),
          );
        } else if (settings.name == EntityRegister.id) {
          final args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) => EntityRegister(argument: args),
          );
        } else if (settings.name == DonateHome.id) {
          final args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) => DonateHome(homeArgument: args),
          );
        } else if (settings.name == DonateFood.id) {
          final args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) => DonateFood(homeArgument: args),
          );
        } else if (settings.name == Profile.id) {
          final args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) => Profile(homeArgument: args),
          );
        } else if (settings.name == ActiveDonations.id) {
          final args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) => ActiveDonations(homeArgument: args),
          );
        } else if (settings.name == History.id) {
          final args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) => History(homeArgument: args),
          );
        }
      },
      initialRoute: MyHomePage.id,
      routes: {
        MyHomePage.id: (context) => MyHomePage(),
        Login.id: (context) => Login(),
        Listing.id: (context) => Listing(),
        Giveaway.id: (context) => Giveaway(),
        FreeFood.id: (context) => FreeFood(),
        Register.id: (context) => Register(),
        EntityRegister.id: (context) => EntityRegister(),
        DonateHome.id: (context) => DonateHome(),
        DonateFood.id: (context) => DonateFood(),
        Profile.id: (context) => Profile(),
        ActiveDonations.id: (context) => ActiveDonations(),
        History.id: (context) => History(),
      },
    );
  }
}
