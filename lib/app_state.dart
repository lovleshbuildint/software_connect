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
      _atmIdList = prefs.getStringList('ff_atmIdList') ?? _atmIdList;
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

  List<String> _atmIdList = [];
  List<String> get atmIdList => _atmIdList;
  set atmIdList(List<String> _value) {
    _atmIdList = _value;
    prefs.setStringList('ff_atmIdList', _value);
  }

  void addToAtmIdList(String _value) {
    _atmIdList.add(_value);
    prefs.setStringList('ff_atmIdList', _atmIdList);
  }

  void removeFromAtmIdList(String _value) {
    _atmIdList.remove(_value);
    prefs.setStringList('ff_atmIdList', _atmIdList);
  }

  void removeAtIndexFromAtmIdList(int _index) {
    _atmIdList.removeAt(_index);
    prefs.setStringList('ff_atmIdList', _atmIdList);
  }

  void updateAtmIdListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _atmIdList[_index] = updateFn(_atmIdList[_index]);
    prefs.setStringList('ff_atmIdList', _atmIdList);
  }

  void insertAtIndexInAtmIdList(int _index, String _value) {
    _atmIdList.insert(_index, _value);
    prefs.setStringList('ff_atmIdList', _atmIdList);
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
