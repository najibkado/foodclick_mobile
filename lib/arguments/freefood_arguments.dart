import 'package:foodclick/models/freefood.dart';
import 'package:foodclick/models/listings.dart';

class FreefoodArguments {
  String nin;
  Listings listings;
  Freefood freefood;
  FreefoodArguments(this.nin, this.listings, this.freefood);
}
