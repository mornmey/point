import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart' show Colors;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Init {
  const Init();

  static Future<bool> checkInternet() async {
    if (kIsWeb) return true;
    final network = await InternetAddress.lookup('google.com');
    if (!network.isNotEmpty && !network[0].rawAddress.isNotEmpty) {
      Fluttertoast.showToast(
          msg: "សូមពិនិត្យមើលប្រព័ន្ធអិនធើណេតរបស់អ្នក",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0);
      return false;
    }
    return true;
  }
}

final sharedPreferencesProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());
