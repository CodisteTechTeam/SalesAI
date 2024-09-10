import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class UploadCSVFileCallCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? file,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'UploadCSVFileCall',
      apiUrl: 'https://dbapi.socialfuse.pro/upload-file/',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ChatCallCall {
  static Future<ApiCallResponse> call({
    String? meetingId = 'sales',
    String? usertext = 'get summary of the meeting',
  }) async {
    final ffApiRequestBody = '''
{
  "meeting_id": "$meetingId",
  "usertext": "$usertext"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ChatCall',
      apiUrl: 'http://127.0.0.1:8000/chatbot',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? query(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.query''',
      ));
  static String? answer(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.answer''',
      ));
  static String? imageurl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.image_url''',
      ));
}

class AddMeetingCall {
  static Future<ApiCallResponse> call({
    String? meetingId = '',
    String? meetingDescription = '',
    String? optiontype = '',
    FFUploadedFile? file,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'AddMeeting',
      apiUrl: 'http://127.0.0.1:8000/uploadaudio/',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
      },
      params: {
        'meeting_id': meetingId,
        'meeting_description': meetingDescription,
        'optiontype': optiontype,
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MeetingsListCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'MeetingsList',
      apiUrl: 'http://127.0.0.1:8000/meeting',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? meetingsList(dynamic response) => getJsonField(
        response,
        r'''$.meetings''',
        true,
      ) as List?;
  static String? meetingId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meetings[:].meeting_id''',
      ));
  static String? meetingDescription(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.meetings[:].meeting_description''',
      ));
}

class GetSummeryCall {
  static Future<ApiCallResponse> call({
    String? meetingID = 'sales',
  }) async {
    final ffApiRequestBody = '''
{
  "meeting_id": "$meetingID"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetSummery',
      apiUrl: 'http://127.0.0.1:8000/summary',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic summaryData(dynamic response) => getJsonField(
        response,
        r'''$.summary''',
      );
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
