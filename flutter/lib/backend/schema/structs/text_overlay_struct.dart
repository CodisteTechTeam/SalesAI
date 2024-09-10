// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TextOverlayStruct extends BaseStruct {
  TextOverlayStruct({
    List<String>? lines,
    bool? hasOverlay,
    String? message,
  })  : _lines = lines,
        _hasOverlay = hasOverlay,
        _message = message;

  // "Lines" field.
  List<String>? _lines;
  List<String> get lines => _lines ?? const [];
  set lines(List<String>? val) => _lines = val;

  void updateLines(Function(List<String>) updateFn) {
    updateFn(_lines ??= []);
  }

  bool hasLines() => _lines != null;

  // "HasOverlay" field.
  bool? _hasOverlay;
  bool get hasOverlay => _hasOverlay ?? false;
  set hasOverlay(bool? val) => _hasOverlay = val;

  bool hasHasOverlay() => _hasOverlay != null;

  // "Message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  static TextOverlayStruct fromMap(Map<String, dynamic> data) =>
      TextOverlayStruct(
        lines: getDataList(data['Lines']),
        hasOverlay: data['HasOverlay'] as bool?,
        message: data['Message'] as String?,
      );

  static TextOverlayStruct? maybeFromMap(dynamic data) => data is Map
      ? TextOverlayStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Lines': _lines,
        'HasOverlay': _hasOverlay,
        'Message': _message,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Lines': serializeParam(
          _lines,
          ParamType.String,
          isList: true,
        ),
        'HasOverlay': serializeParam(
          _hasOverlay,
          ParamType.bool,
        ),
        'Message': serializeParam(
          _message,
          ParamType.String,
        ),
      }.withoutNulls;

  static TextOverlayStruct fromSerializableMap(Map<String, dynamic> data) =>
      TextOverlayStruct(
        lines: deserializeParam<String>(
          data['Lines'],
          ParamType.String,
          true,
        ),
        hasOverlay: deserializeParam(
          data['HasOverlay'],
          ParamType.bool,
          false,
        ),
        message: deserializeParam(
          data['Message'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TextOverlayStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TextOverlayStruct &&
        listEquality.equals(lines, other.lines) &&
        hasOverlay == other.hasOverlay &&
        message == other.message;
  }

  @override
  int get hashCode => const ListEquality().hash([lines, hasOverlay, message]);
}

TextOverlayStruct createTextOverlayStruct({
  bool? hasOverlay,
  String? message,
}) =>
    TextOverlayStruct(
      hasOverlay: hasOverlay,
      message: message,
    );
