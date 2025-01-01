import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class BarokAPICall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'BarokAPI',
      apiUrl: 'https://publink.alsohaz.hu/api/pub',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Basic YWRtaW46YWRtaW4=',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? barNev(dynamic response) => (getJsonField(
        response,
        r'''$[:].pubName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? googleRatingAvg(dynamic response) => (getJsonField(
        response,
        r'''$[:].googleRatingAvg''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class EsemenyekAPICall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'EsemenyekAPI',
      apiUrl: 'https://publink.alsohaz.hu/api/event',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Basic YWRtaW46YWRtaW4=',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SignUpCall {
  static Future<ApiCallResponse> call({
    String? userName = '',
    String? userType = '',
    String? email = '',
    String? password = '',
    String? role = '',
    String? status = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Sign Up',
      apiUrl: 'https://publink.alsohaz.hu/api/user',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Basic YWRtaW46YWRtaW4=',
      },
      params: {
        'userName': userName,
        'userType': userType,
        'email': email,
        'password': password,
        'role': role,
        'status': status,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
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

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
