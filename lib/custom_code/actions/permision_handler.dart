// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:permission_handler/permission_handler.dart';

Future permisionHandler() async {
  // Add your function code here!
  await Permission.manageExternalStorage.request();
  var status = await Permission.storage.status;
  if (status.isDenied) {
    await Permission.storage.request();
  }
}
