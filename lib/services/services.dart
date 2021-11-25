import 'dart:convert';
import 'package:foodclick/models/entity.dart';
import 'package:foodclick/models/freefood.dart';
import 'package:foodclick/models/home.dart';
import 'package:foodclick/models/listings.dart';
import 'package:foodclick/models/pListing.dart';
import 'package:foodclick/models/user.dart';
import 'package:foodclick/services/local_storage.dart';
import 'package:http/http.dart' as http;

class Service {
  static const String url = 'https://foodclick.pythonanywhere.com/api/';
  static const String listings = 'listing';
  static const String giveaway = 'giveaway';
  static const String login = 'login';
  static const String logout = 'logout';
  static const String register = 'register';
  static const String entity = 'entities';
  static const String home = 'home';

  static String token = "bfa90d85ce4a5c3fe6c7398e6ea9aca6ac50a629";
  static var headers;
  static String authToken;

  static void _headers() {
    headers = {"Authorization": "Token " + token};
  }

  static void _authHeaders() {
    LocalStorage.getToken().then((value) => {
          authToken = value,
        });

    headers = {"Authorization": "Token " + authToken};
  }

  static Future getActiveListings() async {
    try {
      var requestActiveListingsUrl = Uri.parse(url + listings);
      _headers();
      var response = await http.get(requestActiveListingsUrl, headers: headers);
      if (response.statusCode == 200) {
        return listingsFromJson(response.body);
      } else {
        print(response.statusCode);
        print(response.body);
        throw (response.body);
      }
    } catch (e) {
      throw (e);
    }
  }

  static Future<Home> getHome() async {
    try {
      var getHomeUrl = Uri.parse(url + home);
      _authHeaders();
      var response = await http.get(getHomeUrl, headers: headers);
      if (response.statusCode == 200) {
        return homeFromJson(response.body);
      } else {
        print(response.statusCode);
        print(response.body);
        throw (response.body);
      }
    } catch (e) {
      throw (e);
    }
  }

  static Future postGiveaway(data) async {
    try {
      var requestGiveawayUrl = Uri.parse(url + giveaway);
      _headers();
      data = jsonEncode(data);
      var acceptedBody = jsonDecode(data);
      var response = await http.post(requestGiveawayUrl,
          headers: headers, body: acceptedBody);
      if (response.statusCode == 201) {
        return freefoodFromJson(response.body);
      } else {
        print(response.statusCode);
        print(response.body);
        throw (response.body);
      }
    } catch (e) {
      throw (e);
    }
  }

  static Future postListingRequest(data) async {
    try {
      var postListingRequestUrl = Uri.parse(url + listings);
      _authHeaders();
      data = jsonEncode(data);
      var acceptedBody = jsonDecode(data);
      var response = await http.post(postListingRequestUrl,
          headers: headers, body: acceptedBody);
      if (response.statusCode == 201) {
        return pListingFromJson(response.body);
      } else {
        print(response.statusCode);
        print(response.body);
        throw (response.body);
      }
    } catch (e) {
      throw (e);
    }
  }

  static Future<Entities> entityRegisterRequest(data) async {
    try {
      var entitiesUrl = Uri.parse(url + entity);
      _authHeaders();
      data = jsonEncode(data);
      var acceptedBody = jsonDecode(data);
      var response =
          await http.post(entitiesUrl, body: acceptedBody, headers: headers);
      if (response.statusCode == 201) {
        Entities entity = entitiesFromJson(response.body);
        return entity;
      } else {
        throw ('invalid data');
      }
    } catch (e) {
      print(e.toString());
      throw ('unable to create a new organization');
    }
  }

  static Future<User> registerRequest(data) async {
    try {
      var registerUrl = Uri.parse(url + register);
      data = jsonEncode(data);
      var acceptedBody = jsonDecode(data);
      var response = await http.post(registerUrl, body: acceptedBody);
      if (response.statusCode == 201) {
        User user = userFromJson(response.body);
        return user;
      } else {
        throw ('invalid data');
      }
    } catch (e) {
      print(e.toString());
      throw ('unable to create a new user');
    }
  }

  static Future<User> loginRequest(username, password) async {
    try {
      var loginUrl = Uri.parse(url + login);
      var response = await http
          .post(loginUrl, body: {'username': username, 'password': password});
      print(response.statusCode);
      if (response.statusCode == 201) {
        User user = userFromJson(response.body);
        return user;
      } else {
        throw ('invalid user credentials');
      }
    } catch (e) {
      print(e.toString());
      throw ('invalid user credentials');
    }
  }

  static Future<bool> logoutRequest() async {
    try {
      var logoutUrl = Uri.parse(url + logout);
      _authHeaders();
      var response = await http.get(logoutUrl, headers: headers);
      if (response.statusCode == 401) {
        print('Logged out successfully');
        return true;
      } else {
        throw ('Unable to logout at the moment');
      }
    } catch (e) {
      throw ('Unable to logout at the moment');
    }
  }
}
