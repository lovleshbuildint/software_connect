import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LoginCall {
  static Future<ApiCallResponse> call({
    String? userName = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userName": "${userName}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl:
          'https://workbenchuat.hitachi-payments.com:82/api/Login/MobileLogin',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DasboardCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Dasboard',
      apiUrl:
          'https://workbenchuat.hitachi-payments.com:82/api/Mobile/GetDashboardData',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class BankListCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Bank List',
      apiUrl:
          'https://workbenchuat.hitachi-payments.com:82/api/Mobile/GetBankList',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class BankModelListCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? bankId = '',
  }) async {
    final ffApiRequestBody = '''
{"bankId": "${bankId}"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Bank Model List',
      apiUrl:
          'https://workbenchuat.hitachi-payments.com:82/api/Mobile/GetBankModelList',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class BankATMListCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? bankId = '',
  }) async {
    final ffApiRequestBody = '''
{"status":""}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Bank ATM List',
      apiUrl:
          'https://workbenchuat.hitachi-payments.com:82/api/Mobile/GetAtmList',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class BankModelSoftwareListCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? bankId = '',
    String? modelId = '',
  }) async {
    final ffApiRequestBody = '''
{"bankId": "${bankId}",
"modelId": "${modelId}"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Bank Model Software List',
      apiUrl:
          'https://workbenchuat.hitachi-payments.com:82/api/Mobile/GetSoftwareVersionListByModel',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class BankModelSoftwareDownloadCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? softwareVersionId = '',
  }) async {
    final ffApiRequestBody = '''
{"softwareVersionId": "${softwareVersionId}"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Bank Model Software Download',
      apiUrl:
          'https://workbenchuat.hitachi-payments.com:82/api/Mobile/DownloadSoftwareByUrl',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class BankModelMultipleSoftwareDownloadCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? softwareVersionId = '',
  }) async {
    final ffApiRequestBody = '''
{"softwareVersionId": "${softwareVersionId}"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Bank Model Multiple Software Download',
      apiUrl:
          'https://workbenchuat.hitachi-payments.com:82/api/Mobile/DownloadSoftwareListByUrl',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? urlList(dynamic response) => getJsonField(
        response,
        r'''$.urlList''',
        true,
      ) as List?;
}

class BankModelManualDownloadCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? softwareVersionId = '',
  }) async {
    final ffApiRequestBody = '''
{"softwareVersionId": "${softwareVersionId}"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Bank Model Manual Download',
      apiUrl:
          'https://workbenchuat.hitachi-payments.com:82/api/SoftwareVersion/DownloadManaulByUrl',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SoftwareSyncCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? softwareVersionId = '',
    String? syncBy = '',
    String? syncDate = '',
  }) async {
    final ffApiRequestBody = '''
{
  "softwareVersionId": "${softwareVersionId}",
  "syncId": "${softwareVersionId}",
  "syncBy": "${syncBy}",
  "syncDate": "${syncDate}",
  "userName": "${syncBy}",
  "status": "Active"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Software Sync',
      apiUrl:
          'https://workbenchuat.hitachi-payments.com:82/api/Mobile/CreateDownlodStatus',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateTerminalLogCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    FFUploadedFile? logUploadFile,
    String? bankId = '',
    String? modelId = '',
    String? atmId = '',
    String? createdBy = '',
    String? createdDate = '',
    String? modifiedDate = '',
    String? comments = '',
    String? siteLocation = '',
    String? ticketNo = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Create Terminal Log',
      apiUrl:
          'https://workbenchuat.hitachi-payments.com:82/api/Mobile/CreateTerminalLog',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${token}',
      },
      params: {
        'LogUploadFile': logUploadFile,
        'BankId': bankId,
        'ModelId': modelId,
        'AtmId': atmId,
        'LogFilePath':
            "C:\\\\inetpub\\\\wwwroot\\\\API_Publish\\\\wwwRoot\\\\UploadedDocuments\\\\BankSoftware\\\\TerminalLog\\\\",
        'CreatedBy': createdBy,
        'CreatedDate': createdDate,
        'ModifiedDate': modifiedDate,
        'Status': "Active",
        'Comments': comments,
        'SiteLocation': siteLocation,
        'TicketNo': ticketNo,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
