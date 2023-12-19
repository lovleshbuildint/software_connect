// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

class NewCustomWidget extends StatefulWidget {
  const NewCustomWidget({
    Key? key,
    this.width,
    this.height,
    this.bin,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? bin;

  @override
  _NewCustomWidgetState createState() => _NewCustomWidgetState();
}

class _NewCustomWidgetState extends State<NewCustomWidget> {
  @override
  Widget build(BuildContext context) {
    String base64String = widget.bin ?? "";

    // Convert the Base64 string to bytes
    List<int> bytes = base64Decode(base64String);

    // Create an Image widget using the memory constructor
    Image image = Image.memory(Uint8List.fromList(bytes));

    return Container(child: image);
  }
}
