import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_loginResponse')) {
        try {
          _loginResponse =
              jsonDecode(prefs.getString('ff_loginResponse') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _userId = prefs.getString('ff_userId') ?? _userId;
    });
    _safeInit(() {
      _searchValue = prefs.getString('ff_searchValue') ?? _searchValue;
    });
    _safeInit(() {
      _percentage = prefs.getDouble('ff_percentage') ?? _percentage;
    });
    _safeInit(() {
      _progressBarVisibility =
          prefs.getBool('ff_progressBarVisibility') ?? _progressBarVisibility;
    });
    _safeInit(() {
      _softwareDownloadStatus = prefs.getString('ff_softwareDownloadStatus') ??
          _softwareDownloadStatus;
    });
    _safeInit(() {
      _notConnectedStatus =
          prefs.getBool('ff_notConnectedStatus') ?? _notConnectedStatus;
    });
    _safeInit(() {
      _manualDownloadStatus =
          prefs.getString('ff_manualDownloadStatus') ?? _manualDownloadStatus;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  dynamic _loginResponse;
  dynamic get loginResponse => _loginResponse;
  set loginResponse(dynamic _value) {
    _loginResponse = _value;
    prefs.setString('ff_loginResponse', jsonEncode(_value));
  }

  List<String> _EmptyList = [];
  List<String> get EmptyList => _EmptyList;
  set EmptyList(List<String> _value) {
    _EmptyList = _value;
  }

  void addToEmptyList(String _value) {
    _EmptyList.add(_value);
  }

  void removeFromEmptyList(String _value) {
    _EmptyList.remove(_value);
  }

  void removeAtIndexFromEmptyList(int _index) {
    _EmptyList.removeAt(_index);
  }

  void updateEmptyListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _EmptyList[_index] = updateFn(_EmptyList[_index]);
  }

  void insertAtIndexInEmptyList(int _index, String _value) {
    _EmptyList.insert(_index, _value);
  }

  String _userId = '';
  String get userId => _userId;
  set userId(String _value) {
    _userId = _value;
    prefs.setString('ff_userId', _value);
  }

  String _searchValue = '';
  String get searchValue => _searchValue;
  set searchValue(String _value) {
    _searchValue = _value;
    prefs.setString('ff_searchValue', _value);
  }

  double _percentage = 0.0;
  double get percentage => _percentage;
  set percentage(double _value) {
    _percentage = _value;
    prefs.setDouble('ff_percentage', _value);
  }

  bool _progressBarVisibility = false;
  bool get progressBarVisibility => _progressBarVisibility;
  set progressBarVisibility(bool _value) {
    _progressBarVisibility = _value;
    prefs.setBool('ff_progressBarVisibility', _value);
  }

  String _softwareDownloadStatus = '';
  String get softwareDownloadStatus => _softwareDownloadStatus;
  set softwareDownloadStatus(String _value) {
    _softwareDownloadStatus = _value;
    prefs.setString('ff_softwareDownloadStatus', _value);
  }

  bool _notConnectedStatus = false;
  bool get notConnectedStatus => _notConnectedStatus;
  set notConnectedStatus(bool _value) {
    _notConnectedStatus = _value;
    prefs.setBool('ff_notConnectedStatus', _value);
  }

  String _manualDownloadStatus = '';
  String get manualDownloadStatus => _manualDownloadStatus;
  set manualDownloadStatus(String _value) {
    _manualDownloadStatus = _value;
    prefs.setString('ff_manualDownloadStatus', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
