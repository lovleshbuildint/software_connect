import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

dynamic sortingVerion(dynamic maibData) {
  if (maibData is Map<String, dynamic>) {
    // Check if maibData is a Map
    List<dynamic> softwareVersions = maibData['listSoftwareVersions'];

    // Sort the list based on createdDate in descending order
    softwareVersions.sort((a, b) => DateTime.parse(b['createdDate'])
        .compareTo(DateTime.parse(a['createdDate'])));

    return softwareVersions;
  } else {
    // Handle the case when maibData is not a Map
    return null; // or some other appropriate value or behavior
  }
}

String? splitUrl(String? url) {
  // split string with /
  if (url != null) {
    List<String> parts = url.split('/');
    List<String> extention = parts.last.split('.');
    return parts.last;
  } else {
    return null;
  }
}

dynamic filter(
  dynamic mainData,
  String? searchValue,
) {
  if (searchValue == null || searchValue.isEmpty) {
    return mainData['bankLists'];
  }

  List<dynamic> filteredData = [];

  for (dynamic data in mainData['bankLists']) {
    if (data['bankName'].contains(searchValue)) {
      filteredData.add(data);
    }
  }

  return filteredData;
}

String? geturl(dynamic jsonObject) {
  return jsonObject["url"];
}
