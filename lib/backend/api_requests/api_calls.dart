import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start bars Group Code

class BarsGroup {
  static String getBaseUrl() => 'https://publink.alsohaz.hu/api/';
  static Map<String, String> headers = {
    'Authorization': 'Basic YWRtaW46YWRtaW4=',
  };
  static BarsCall barsCall = BarsCall();
}

class BarsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = BarsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'bars',
      apiUrl: '${baseUrl}pub',
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

/// End bars Group Code

class BarokAPICall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'BarokAPI',
      apiUrl: 'https://publink.alsohaz.hu/api/pub',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjgiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJsZXZpMTFAcHVibGluay5odSIsImV4cCI6MTczNjIxOTUwNiwiaXNzIjoiQWxzb2hhei5odSBLZnQiLCJhdWQiOiJQdWJsaW5rIHVzZXJzIn0.EPD1LEuEtYNo5CRQl3nXcfU09IjhzHFH0AT7p0rQCg4',
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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjgiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJsZXZpMTFAcHVibGluay5odSIsImV4cCI6MTczNjIxOTUwNiwiaXNzIjoiQWxzb2hhei5odSBLZnQiLCJhdWQiOiJQdWJsaW5rIHVzZXJzIn0.EPD1LEuEtYNo5CRQl3nXcfU09IjhzHFH0AT7p0rQCg4',
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
    String? userType = 'normal',
    String? email = '',
    String? password = '',
    String? role = 'user',
    String? status = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Sign Up',
      apiUrl: 'https://publink.alsohaz.hu/api/user',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjgiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJsZXZpMTFAcHVibGluay5odSIsImV4cCI6MTczNjIxOTUwNiwiaXNzIjoiQWxzb2hhei5odSBLZnQiLCJhdWQiOiJQdWJsaW5rIHVzZXJzIn0.EPD1LEuEtYNo5CRQl3nXcfU09IjhzHFH0AT7p0rQCg4',
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

class NewsAPICall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'NewsAPI',
      apiUrl: 'https://publink.alsohaz.hu/api/news',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjgiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJsZXZpMTFAcHVibGluay5odSIsImV4cCI6MTczNjIxOTUwNiwiaXNzIjoiQWxzb2hhei5odSBLZnQiLCJhdWQiOiJQdWJsaW5rIHVzZXJzIn0.EPD1LEuEtYNo5CRQl3nXcfU09IjhzHFH0AT7p0rQCg4',
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

  static List<String>? image(dynamic response) => (getJsonField(
        response,
        r'''$[:].coverImage''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ImagesAPICall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'ImagesAPI',
      apiUrl: 'https://publink.alsohaz.hu/api/pictures',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjgiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJsZXZpMTFAcHVibGluay5odSIsImV4cCI6MTczNjIxOTUwNiwiaXNzIjoiQWxzb2hhei5odSBLZnQiLCJhdWQiOiJQdWJsaW5rIHVzZXJzIn0.EPD1LEuEtYNo5CRQl3nXcfU09IjhzHFH0AT7p0rQCg4',
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

  static List<String>? image(dynamic response) => (getJsonField(
        response,
        r'''$[:].picFileName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
