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
  await Permission.manageExternalStorage.request();
  // Get the directory where the file will be saved
  var status = await Permission.storage.status;
  if (status.isDenied) {
    await Permission.storage.request();
  }
  try {
    // Generate a unique filename using a timestamp
    String directoryPath = 'storage/$deviceId';
    String imagesFolderPath = '$directoryPath/$modelName/$bankName';
    String filePath = '$imagesFolderPath/$extention';

    File file = File(filePath);
    bool fileExists = await file.exists();
    int existingFileSize = fileExists ? await file.length() : 0;
    print(existingFileSize);
    print(fileExists);

    // Create an HttpClient instance
    final client = http.Client();

    // Send the request
    final http.Request request = http.Request('GET', Uri.parse(url!));
    final http.StreamedResponse streamedResponse = await client.send(request);
    if (streamedResponse.statusCode == 200) {
      Directory(imagesFolderPath).createSync(recursive: true);

      // Get the total size of the file
      int totalBytes = streamedResponse.contentLength ?? 0;

      // Keep track of the downloaded bytes
      int downloadedBytes = 0;

      // Write the downloaded file to the local storage
      File file = File(filePath);
      IOSink sink = file.openWrite();
      String downloadstatus = "";
      // Listen for updates during the download
      FFAppState().update(() {
        FFAppState().progressBarVisibility = true;
        FFAppState().softwareDownloadStatus = "Software Downloading...";
      });

      streamedResponse.stream.listen(
        (List<int> chunk) {
          // Write the chunk to the file
          if (Directory(imagesFolderPath).existsSync()) {
            sink.add(chunk);
            // Update the downloaded bytes
            downloadedBytes += chunk.length;
            // Calculate and print the percentage
            double percentage = (downloadedBytes / totalBytes);
            FFAppState().update(() {
              FFAppState().percentage = percentage;
            });
          } else {
            sink.close();
            client.close();
            FFAppState().update(() {
              FFAppState().notConnectedStatus = true;
            });
          }
        },
        onDone: () {
          // Close the file when the download is complete
          sink.close();
          client.close(); // Close the HttpClient
          // Show a message to the user that the file has been downloaded
          print('File downloaded successfully!');
          downloadstatus = 'File downloaded successfully!';
          FFAppState().update(() {
            FFAppState().softwareDownloadStatus = "Software Downloaded";
          });
        },
        onError: (error) {
          // Handle errors during the download
          print('Error downloading file: $error');
          sink.close();
          client.close(); // Close the HttpClient
          file.delete(); // Delete the file in case of an error
          FFAppState().update(() {
            FFAppState().softwareDownloadStatus = '$error';
          });
        },
        cancelOnError: true,
      );
      print(downloadstatus);
      return downloadstatus;
    } else {
      FFAppState().update(() {
        FFAppState().softwareDownloadStatus = "File Can't be downloaded";
      });
      return 'File Can\'t be downloaded';
    }
  } catch (e) {
    try {
      // Generate a unique filename using a timestamp
      String directoryPath = '/mnt/media_rw/$deviceId';
      String imagesFolderPath = '$directoryPath/$modelName/$bankName';
      String filePath = '$imagesFolderPath/$extention';

      File file = File(filePath);
      bool fileExists = await file.exists();
      int existingFileSize = fileExists ? await file.length() : 0;
      print(existingFileSize);
      print(fileExists);

      // Create an HttpClient instance
      final client = http.Client();

      // Send the request
      final http.Request request = http.Request('GET', Uri.parse(url!));
      final http.StreamedResponse streamedResponse = await client.send(request);
      if (streamedResponse.statusCode == 200) {
        // Create the directory if it doesn't exist
        Directory(imagesFolderPath).createSync(recursive: true);

        // Get the total size of the file
        int totalBytes = streamedResponse.contentLength ?? 0;

        // Keep track of the downloaded bytes
        int downloadedBytes = 0;

        // Write the downloaded file to the local storage
        File file = File(filePath);
        IOSink sink = file.openWrite();
        String downloadstatus = "";
        FFAppState().update(() {
          FFAppState().softwareDownloadStatus = "Software Downloading...";
          FFAppState().progressBarVisibility = true;
        });
        // Listen for updates during the download
        streamedResponse.stream.listen(
          (List<int> chunk) {
            // Write the chunk to the file
            if (Directory(imagesFolderPath).existsSync()) {
              sink.add(chunk);
              // Update the downloaded bytes
              downloadedBytes += chunk.length;
              // Calculate and print the percentage
              double percentage = (downloadedBytes / totalBytes);
              FFAppState().update(() {
                FFAppState().percentage = percentage;
              });
            } else {
              sink.close();
              client.close();
              FFAppState().update(() {
                FFAppState().notConnectedStatus = true;
              });
            }
          },
          onDone: () {
            // Close the file when the download is complete
            sink.close();
            client.close(); // Close the HttpClient
            // Show a message to the user that the file has been downloaded
            downloadstatus = 'File downloaded successfully!';
            if (downloadedBytes == totalBytes) {
              FFAppState().update(() {
                FFAppState().softwareDownloadStatus = "Software Downloaded";
              });
            } else {
              FFAppState().update(() {
                FFAppState().softwareDownloadStatus =
                    "File not Downloaded Properly!";
              });
            }
          },
          onError: (error) {
            // Handle errors during the download
            print('Error downloading file: $error');
            sink.close();
            client.close(); // Close the HttpClient
            file.delete(); // Delete the file in case of an error
            FFAppState().update(() {
              FFAppState().softwareDownloadStatus = '$error';
            });
          },
          cancelOnError: true,
        );
        print(downloadstatus);
        return downloadstatus;
      } else {
        FFAppState().update(() {
          FFAppState().softwareDownloadStatus = "File Can't be downloaded";
        });
        return 'File Can\'t be downloaded';
      }
    } catch (e) {
      return '$e';
    }
  }
}
