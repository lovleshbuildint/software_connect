// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

Future<String?> downloadFileCopy(String? url) async {
  try {
    await Permission.manageExternalStorage.request();
    // Get the directory where the file will be saved
    var status = await Permission.storage.status;
    if (status.isDenied) {
      await Permission.storage.request();
    }
    Directory? directory = await getExternalStorageDirectory();
    // Generate a unique filename using a timestamp
    String directoryPath = '$url';

    // Create the directory if it doesn't exist
    Directory(directoryPath).createSync(recursive: true);
    return 'File Downloaded';
  } catch (e) {
    return '$e';
  }

  // Create an HttpClient instance
}
