// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';

Future<bool> checkRoot() async {
  bool isRooted;
  try {
    isRooted = await FlutterJailbreakDetection.jailbroken;
  } catch (e) {
    isRooted = false;
  }
  ;

  return isRooted;
}
