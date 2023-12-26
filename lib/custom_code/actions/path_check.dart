// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';

Future<dynamic> pathCheck(String? deviceId) async {
  // Add your function code here!
  String directoryPath1 = '/mnt/media_rw/$deviceId/Images/';
  String directoryPath2 = '/storage/$deviceId/Images/';

  try {
    // Create a File instance with the specified path
    Directory directory1 = Directory(directoryPath1);
    Directory directory2 = Directory(directoryPath2);

    // Check if the first directory exists
    bool directoryExists1 = await directory1.exists();

    if (directoryExists1) {
      print({"Status": true, "Path": '/mnt/media_rw'});
      return {"Status": true, "Path": '/mnt/media_rw'};
    } else {
      // Check if the second directory exists
      bool directoryExists2 = await directory2.exists();

      print({"Status": directoryExists2, "Path": '/storage'});
      return {"Status": directoryExists2, "Path": '/storage'};
    }
  } catch (e) {
    // Handle any potential errors, such as permission issues, etc.
    print('Error checking file existence: $e');
    return {"Status": false, "Path": '$e'};
  }
}
