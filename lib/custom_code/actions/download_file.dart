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

Future<String?> downloadFile(String? url, String? extention, String? deviceId,
    String? path, String? bankName, String? modelName) async {
  try {
    await Permission.manageExternalStorage.request();
    // Get the directory where the file will be saved
    var status = await Permission.storage.status;
    if (status.isDenied) {
      await Permission.storage.request();
    }
    Directory? directory = await getExternalStorageDirectory();
    // Generate a unique filename using a timestamp
    String directoryPath = 'storage/$deviceId';
    String imagesFolderPath = '$directoryPath/$modelName/$bankName';
    String filePath = '$imagesFolderPath/$extention';

// Create the directory if it doesn't exist
    Directory(imagesFolderPath).createSync(recursive: true);

    // Create an HttpClient instance
    final client = http.Client();

    // Send the request
    final http.Request request = http.Request('GET', Uri.parse(url!));
    final http.StreamedResponse streamedResponse = await client.send(request);

    // Get the total size of the file
    int totalBytes = streamedResponse.contentLength ?? 0;

    // Keep track of the downloaded bytes
    int downloadedBytes = 0;

    // Write the downloaded file to the local storage
    File file = File(filePath);
    IOSink sink = file.openWrite();
    String downloadstatus = "";
    // Listen for updates during the download
    streamedResponse.stream.listen(
      (List<int> chunk) {
        // Write the chunk to the file
        sink.add(chunk);
        // Update the downloaded bytes
        downloadedBytes += chunk.length;
        // Calculate and print the percentage
        double percentage = (downloadedBytes / totalBytes) * 100;
        // print('Downloading: ${percentage.toStringAsFixed(2)}%');
      },
      onDone: () {
        // Close the file when the download is complete
        sink.close();
        client.close(); // Close the HttpClient
        // Show a message to the user that the file has been downloaded
        print('File downloaded successfully!');
        downloadstatus = 'File downloaded successfully!';
      },
      onError: (error) {
        // Handle errors during the download
        print('Error downloading file: $error');
        sink.close();
        client.close(); // Close the HttpClient
        file.delete(); // Delete the file in case of an error
      },
      cancelOnError: true,
    );
    print(downloadstatus);
    return 'File Downloaded';
  } catch (e) {
    return '$e';
  }
}
