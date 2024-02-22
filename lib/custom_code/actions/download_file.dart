// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

Future<String?> downloadFile(
    String? url,
    String? extention,
    String? deviceId,
    String? path,
    String? bankName,
    String? modelName,
    bool software,
    String? softwareVersionId,
    String token) async {
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
    Directory(imagesFolderPath).createSync(recursive: true);

    File existingFile = File(filePath);
    bool fileExists = existingFile.existsSync();
    int existingBytes = fileExists ? existingFile.lengthSync() : 0;

    // Create an HttpClient instance
    final client = http.Client();
    print(fileExists);
    print("fileExists");

    // If file exists, set the Range header to resume download
    if (fileExists) {
      final http.Request request = http.Request('GET', Uri.parse(url!))
        ..headers['Range'] = 'bytes=$existingBytes-';
      final http.StreamedResponse streamedResponse = await client.send(request);

      int totalBytes = (streamedResponse.contentLength ?? 0) + existingBytes;

      if (totalBytes == existingBytes) {
        FFAppState().update(() {
          if (software) {
            FFAppState().softwareDownloadStatus = "File Already Exists";
          } else {
            FFAppState().manualDownloadStatus = "File Already Exists";
          }
        });
        return 'File Already Exists';
      } else {
        if (streamedResponse.statusCode == 206) {
          int downloadedBytes = existingBytes;

          IOSink sink = existingFile.openWrite(mode: FileMode.append);
          String downloadstatus = "";
          FFAppState().update(() {
            if (software) {
              FFAppState().softwareDownloadStatus =
                  "Software Download Resumed...";
            } else {
              FFAppState().manualDownloadStatus = "Manual Download Resumed...";
            }
            FFAppState().progressBarVisibility = true;
            FFAppState().percentage = existingBytes / totalBytes;
          });

          // Adjust the progress bar based on existing bytes
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
                  if (software) {
                    FFAppState().softwareDownloadStatus = "Software Downloaded";
                  } else {
                    FFAppState().manualDownloadStatus = "Manual Downloaded";
                  }
                });
              } else {
                FFAppState().update(() {
                  if (software) {
                    FFAppState().softwareDownloadStatus =
                        "File not Downloaded Properly!";
                  } else {
                    FFAppState().manualDownloadStatus =
                        "File not Downloaded Properly!";
                  }
                });
              }
            },
            onError: (error) {
              // Handle errors during the download
              print('Error downloading file: $error');
              sink.close();
              client.close(); // Close the HttpClient
              // file.delete(); // Delete the file in case of an error
              FFAppState().update(() {
                if (software) {
                  FFAppState().softwareDownloadStatus = '$error';
                } else {
                  FFAppState().manualDownloadStatus = '$error';
                }
              });
            },
            cancelOnError: true,
          );
        } else {
          FFAppState().update(() {
            if (software) {
              FFAppState().softwareDownloadStatus = "File Can't be downloaded";
            } else {
              FFAppState().manualDownloadStatus = "File Can't be downloaded";
            }
          });
          return 'File Can\'t be downloaded';
        }
      }
    } else {
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
          if (software) {
            FFAppState().softwareDownloadStatus = "Software Downloading...";
          } else {
            FFAppState().manualDownloadStatus = "Manual Downloading...";
          }
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
                if (software) {
                  FFAppState().softwareDownloadStatus = "Software Downloaded";
                } else {
                  FFAppState().manualDownloadStatus = "Manual Downloaded";
                }
              });
            } else {
              FFAppState().update(() {
                if (software) {
                  FFAppState().softwareDownloadStatus =
                      "File not Downloaded Properly!";
                } else {
                  FFAppState().manualDownloadStatus =
                      "File not Downloaded Properly!";
                }
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
              if (software) {
                FFAppState().softwareDownloadStatus = '$error';
              } else {
                FFAppState().manualDownloadStatus = '$error';
              }
            });
          },
          cancelOnError: true,
        );
      } else if (streamedResponse.statusCode == 404) {
        final response = await http.post(
          Uri.parse(
              'https://softwareconnect.hitachi-payments.com/api/SoftwareVersion/DownloadSoftware'),
          headers: {
            'Authorization': token,
            'Content-Type':
                'application/json', // Replace with the actual value of your token variable
          },
          body: jsonEncode({
            'softwareVersionId': softwareVersionId,
          }), // Replace with the actual value
        );

        if (response.statusCode == 200) {
          File createFile = File('/$filePath');
          createFile.createSync();

          // Convert binary data to file and save it
          List<int> fileBytes = response.bodyBytes;

          File file = File(filePath);

          await file.writeAsBytes(fileBytes);

          // Now you have saved the file to the specified path

          FFAppState().update(() {
            // Update your app state as needed
            if (software) {
              FFAppState().softwareDownloadStatus = "Software Downloaded";
            } else {
              FFAppState().manualDownloadStatus = "Manual Downloaded";
            }
            FFAppState().progressBarVisibility = true;
            FFAppState().percentage = 1.0;
          });
        } else {
          // Handle the error response if needed
          print('POST request failed with status code: ${response.statusCode}');
          FFAppState().update(() {
            if (software) {
              FFAppState().softwareDownloadStatus =
                  "Error downloading software";
            } else {
              FFAppState().manualDownloadStatus = "Error downloading file";
            }
          });
        }
      } else {
        FFAppState().update(() {
          if (software) {
            FFAppState().softwareDownloadStatus = "File Can't be downloaded";
          } else {
            FFAppState().manualDownloadStatus = "File Can't be downloaded";
          }
        });
        return 'File Can\'t be downloaded';
      }
    }
  } catch (e) {
    try {
      // Generate a unique filename using a timestamp
      String directoryPath = '/mnt/media_rw/$deviceId';
      String imagesFolderPath = '$directoryPath/$modelName/$bankName';
      String filePath = '$imagesFolderPath/$extention';
      Directory(imagesFolderPath).createSync(recursive: true);

      File existingFile = File(filePath);
      bool fileExists = existingFile.existsSync();
      int existingBytes = fileExists ? existingFile.lengthSync() : 0;

      // Create an HttpClient instance
      final client = http.Client();

      // If file exists, set the Range header to resume download
      if (fileExists) {
        final http.Request request = http.Request('GET', Uri.parse(url!))
          ..headers['Range'] = 'bytes=$existingBytes-';
        final http.StreamedResponse streamedResponse =
            await client.send(request);

        int totalBytes = (streamedResponse.contentLength ?? 0) + existingBytes;

        if (totalBytes == existingBytes) {
          FFAppState().update(() {
            if (software) {
              FFAppState().softwareDownloadStatus = "File Already Exists";
            } else {
              FFAppState().manualDownloadStatus = "File Already Exists";
            }
          });
          return 'File Already Exists';
        } else {
          if (streamedResponse.statusCode == 206) {
            int downloadedBytes = existingBytes;

            IOSink sink = existingFile.openWrite(mode: FileMode.append);
            String downloadstatus = "";
            FFAppState().update(() {
              if (software) {
                FFAppState().softwareDownloadStatus =
                    "Software Download Resumed...";
              } else {
                FFAppState().manualDownloadStatus =
                    "Manual Download Resumed...";
              }
              FFAppState().progressBarVisibility = true;
              FFAppState().percentage = existingBytes / totalBytes;
            });

            // Adjust the progress bar based on existing bytes
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
                    if (software) {
                      FFAppState().softwareDownloadStatus =
                          "Software Downloaded";
                    } else {
                      FFAppState().manualDownloadStatus = "Manual Downloaded";
                    }
                  });
                } else {
                  FFAppState().update(() {
                    if (software) {
                      FFAppState().softwareDownloadStatus =
                          "File not Downloaded Properly!";
                    } else {
                      FFAppState().manualDownloadStatus =
                          "File not Downloaded Properly!";
                    }
                  });
                }
              },
              onError: (error) {
                // Handle errors during the download
                print('Error downloading file: $error');
                sink.close();
                client.close(); // Close the HttpClient
                // file.delete(); // Delete the file in case of an error
                FFAppState().update(() {
                  if (software) {
                    FFAppState().softwareDownloadStatus = '$error';
                  } else {
                    FFAppState().manualDownloadStatus = '$error';
                  }
                });
              },
              cancelOnError: true,
            );
          } else {
            FFAppState().update(() {
              if (software) {
                FFAppState().softwareDownloadStatus =
                    "File Can't be downloaded";
              } else {
                FFAppState().manualDownloadStatus = "File Can't be downloaded";
              }
            });
            return 'File Can\'t be downloaded';
          }
        }
      } else {
        // Send the request
        final http.Request request = http.Request('GET', Uri.parse(url!));
        final http.StreamedResponse streamedResponse =
            await client.send(request);

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
            if (software) {
              FFAppState().softwareDownloadStatus = "Software Downloading...";
            } else {
              FFAppState().manualDownloadStatus = "Manual Downloading...";
            }
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
                  if (software) {
                    FFAppState().softwareDownloadStatus = "Software Downloaded";
                  } else {
                    FFAppState().manualDownloadStatus = "Manual Downloaded";
                  }
                });
              } else {
                FFAppState().update(() {
                  if (software) {
                    FFAppState().softwareDownloadStatus =
                        "File not Downloaded Properly!";
                  } else {
                    FFAppState().manualDownloadStatus =
                        "File not Downloaded Properly!";
                  }
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
                if (software) {
                  FFAppState().softwareDownloadStatus = '$error';
                } else {
                  FFAppState().manualDownloadStatus = '$error';
                }
              });
            },
            cancelOnError: true,
          );
        } else if (streamedResponse.statusCode == 404) {
          final response = await http.post(
            Uri.parse(
                'https://softwareconnect.hitachi-payments.com/api/SoftwareVersion/DownloadSoftware'),
            headers: {
              'Authorization': token,
              'Content-Type':
                  'application/json', // Replace with the actual value of your token variable
            },
            body: jsonEncode({
              'softwareVersionId': softwareVersionId,
            }), // Replace with the actual value
          );

          if (response.statusCode == 200) {
            File createFile = File(filePath);
            createFile.createSync();

            // Convert binary data to file and save it
            List<int> fileBytes = response.bodyBytes;

            File file = File(filePath);

            await file.writeAsBytes(fileBytes);

            // Now you have saved the file to the specified path

            FFAppState().update(() {
              // Update your app state as needed
              if (software) {
                FFAppState().softwareDownloadStatus = "Software Downloaded";
              } else {
                FFAppState().manualDownloadStatus = "Manual Downloaded";
              }
              FFAppState().progressBarVisibility = true;
              FFAppState().percentage = 1.0;
            });
          } else {
            // Handle the error response if needed
            print(
                'POST request failed with status code: ${response.statusCode}');
            FFAppState().update(() {
              if (software) {
                FFAppState().softwareDownloadStatus =
                    "Error downloading software";
              } else {
                FFAppState().manualDownloadStatus = "Error downloading file";
              }
            });
          }
        } else {
          FFAppState().update(() {
            if (software) {
              FFAppState().softwareDownloadStatus = "File Can't be downloaded";
            } else {
              FFAppState().manualDownloadStatus = "File Can't be downloaded";
            }
          });
          return 'File Can\'t be downloaded';
        }
      }
    } catch (e) {
      return '$e';
    }
  }
}
