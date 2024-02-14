import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
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
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_loginResponse') != null) {
        try {
          _loginResponse = jsonDecode(
              await secureStorage.getString('ff_loginResponse') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _userId = await secureStorage.getString('ff_userId') ?? _userId;
    });
    await _safeInitAsync(() async {
      _searchValue =
          await secureStorage.getString('ff_searchValue') ?? _searchValue;
    });
    await _safeInitAsync(() async {
      _percentage =
          await secureStorage.getDouble('ff_percentage') ?? _percentage;
    });
    await _safeInitAsync(() async {
      _progressBarVisibility =
          await secureStorage.getBool('ff_progressBarVisibility') ??
              _progressBarVisibility;
    });
    await _safeInitAsync(() async {
      _softwareDownloadStatus =
          await secureStorage.getString('ff_softwareDownloadStatus') ??
              _softwareDownloadStatus;
    });
    await _safeInitAsync(() async {
      _notConnectedStatus =
          await secureStorage.getBool('ff_notConnectedStatus') ??
              _notConnectedStatus;
    });
    await _safeInitAsync(() async {
      _manualDownloadStatus =
          await secureStorage.getString('ff_manualDownloadStatus') ??
              _manualDownloadStatus;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  dynamic _loginResponse;
  dynamic get loginResponse => _loginResponse;
  set loginResponse(dynamic _value) {
    _loginResponse = _value;
    secureStorage.setString('ff_loginResponse', jsonEncode(_value));
  }

  void deleteLoginResponse() {
    secureStorage.delete(key: 'ff_loginResponse');
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
    secureStorage.setString('ff_userId', _value);
  }

  void deleteUserId() {
    secureStorage.delete(key: 'ff_userId');
  }

  String _searchValue = '';
  String get searchValue => _searchValue;
  set searchValue(String _value) {
    _searchValue = _value;
    secureStorage.setString('ff_searchValue', _value);
  }

  void deleteSearchValue() {
    secureStorage.delete(key: 'ff_searchValue');
  }

  double _percentage = 0.0;
  double get percentage => _percentage;
  set percentage(double _value) {
    _percentage = _value;
    secureStorage.setDouble('ff_percentage', _value);
  }

  void deletePercentage() {
    secureStorage.delete(key: 'ff_percentage');
  }

  bool _progressBarVisibility = false;
  bool get progressBarVisibility => _progressBarVisibility;
  set progressBarVisibility(bool _value) {
    _progressBarVisibility = _value;
    secureStorage.setBool('ff_progressBarVisibility', _value);
  }

  void deleteProgressBarVisibility() {
    secureStorage.delete(key: 'ff_progressBarVisibility');
  }

  String _softwareDownloadStatus = '';
  String get softwareDownloadStatus => _softwareDownloadStatus;
  set softwareDownloadStatus(String _value) {
    _softwareDownloadStatus = _value;
    secureStorage.setString('ff_softwareDownloadStatus', _value);
  }

  void deleteSoftwareDownloadStatus() {
    secureStorage.delete(key: 'ff_softwareDownloadStatus');
  }

  bool _notConnectedStatus = false;
  bool get notConnectedStatus => _notConnectedStatus;
  set notConnectedStatus(bool _value) {
    _notConnectedStatus = _value;
    secureStorage.setBool('ff_notConnectedStatus', _value);
  }

  void deleteNotConnectedStatus() {
    secureStorage.delete(key: 'ff_notConnectedStatus');
  }

  String _manualDownloadStatus = '';
  String get manualDownloadStatus => _manualDownloadStatus;
  set manualDownloadStatus(String _value) {
    _manualDownloadStatus = _value;
    secureStorage.setString('ff_manualDownloadStatus', _value);
  }

  void deleteManualDownloadStatus() {
    secureStorage.delete(key: 'ff_manualDownloadStatus');
  }
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
