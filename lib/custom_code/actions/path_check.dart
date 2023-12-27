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
  String directoryPath1 = '/mnt/media_rw/$deviceId/';
  String directoryPath2 = '/storage/$deviceId/';
  bool pathStatus = false;

  if (!pathStatus) {
    try {
      Directory directory1 = Directory(directoryPath1);

      bool directoryExists1 = await directory1.exists();

      if (directoryExists1) {
        pathStatus = true;
        return {"Status": true, "Path": '/mnt/media_rw'};
      } else {
        pathStatus = false;
        return {"Status": false, "Path": '/mnt/media_rw'};
      }
    } catch (e) {
      pathStatus = false;
    }
  }

  if (!pathStatus) {
    try {
      Directory directory2 = Directory(directoryPath2);

      bool directoryExists2 = await directory2.exists();

      if (directoryExists2) {
        pathStatus = true;
        return {"Status": true, "Path": '/storage'};
      } else {
        pathStatus = false;
        return {"Status": false, "Path": '/storage'};
      }
    } catch (e) {
      pathStatus = false;
      return {"Status": false, "Path": '/storage'};
    }
  }
}
