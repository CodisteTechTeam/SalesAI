// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ParsedResultsStruct extends BaseStruct {
  ParsedResultsStruct({
    TextOverlayStruct? textOverlay,
    String? textOrientation,
    int? fileParseExitCode,
    String? parsedText,
    String? errorMessage,
    String? errorDetails,
  })  : _textOverlay = textOverlay,
        _textOrientation = textOrientation,
        _fileParseExitCode = fileParseExitCode,
        _parsedText = parsedText,
        _errorMessage = errorMessage,
        _errorDetails = errorDetails;

  // "TextOverlay" field.
  TextOverlayStruct? _textOverlay;
  TextOverlayStruct get textOverlay => _textOverlay ?? TextOverlayStruct();
  set textOverlay(TextOverlayStruct? val) => _textOverlay = val;

  void updateTextOverlay(Function(TextOverlayStruct) updateFn) {
    updateFn(_textOverlay ??= TextOverlayStruct());
  }

  bool hasTextOverlay() => _textOverlay != null;

  // "TextOrientation" field.
  String? _textOrientation;
  String get textOrientation => _textOrientation ?? '';
  set textOrientation(String? val) => _textOrientation = val;

  bool hasTextOrientation() => _textOrientation != null;

  // "FileParseExitCode" field.
  int? _fileParseExitCode;
  int get fileParseExitCode => _fileParseExitCode ?? 0;
  set fileParseExitCode(int? val) => _fileParseExitCode = val;

  void incrementFileParseExitCode(int amount) =>
      fileParseExitCode = fileParseExitCode + amount;

  bool hasFileParseExitCode() => _fileParseExitCode != null;

  // "ParsedText" field.
  String? _parsedText;
  String get parsedText => _parsedText ?? '';
  set parsedText(String? val) => _parsedText = val;

  bool hasParsedText() => _parsedText != null;

  // "ErrorMessage" field.
  String? _errorMessage;
  String get errorMessage => _errorMessage ?? '';
  set errorMessage(String? val) => _errorMessage = val;

  bool hasErrorMessage() => _errorMessage != null;

  // "ErrorDetails" field.
  String? _errorDetails;
  String get errorDetails => _errorDetails ?? '';
  set errorDetails(String? val) => _errorDetails = val;

  bool hasErrorDetails() => _errorDetails != null;

  static ParsedResultsStruct fromMap(Map<String, dynamic> data) =>
      ParsedResultsStruct(
        textOverlay: TextOverlayStruct.maybeFromMap(data['TextOverlay']),
        textOrientation: data['TextOrientation'] as String?,
        fileParseExitCode: castToType<int>(data['FileParseExitCode']),
        parsedText: data['ParsedText'] as String?,
        errorMessage: data['ErrorMessage'] as String?,
        errorDetails: data['ErrorDetails'] as String?,
      );

  static ParsedResultsStruct? maybeFromMap(dynamic data) => data is Map
      ? ParsedResultsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'TextOverlay': _textOverlay?.toMap(),
        'TextOrientation': _textOrientation,
        'FileParseExitCode': _fileParseExitCode,
        'ParsedText': _parsedText,
        'ErrorMessage': _errorMessage,
        'ErrorDetails': _errorDetails,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'TextOverlay': serializeParam(
          _textOverlay,
          ParamType.DataStruct,
        ),
        'TextOrientation': serializeParam(
          _textOrientation,
          ParamType.String,
        ),
        'FileParseExitCode': serializeParam(
          _fileParseExitCode,
          ParamType.int,
        ),
        'ParsedText': serializeParam(
          _parsedText,
          ParamType.String,
        ),
        'ErrorMessage': serializeParam(
          _errorMessage,
          ParamType.String,
        ),
        'ErrorDetails': serializeParam(
          _errorDetails,
          ParamType.String,
        ),
      }.withoutNulls;

  static ParsedResultsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ParsedResultsStruct(
        textOverlay: deserializeStructParam(
          data['TextOverlay'],
          ParamType.DataStruct,
          false,
          structBuilder: TextOverlayStruct.fromSerializableMap,
        ),
        textOrientation: deserializeParam(
          data['TextOrientation'],
          ParamType.String,
          false,
        ),
        fileParseExitCode: deserializeParam(
          data['FileParseExitCode'],
          ParamType.int,
          false,
        ),
        parsedText: deserializeParam(
          data['ParsedText'],
          ParamType.String,
          false,
        ),
        errorMessage: deserializeParam(
          data['ErrorMessage'],
          ParamType.String,
          false,
        ),
        errorDetails: deserializeParam(
          data['ErrorDetails'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ParsedResultsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ParsedResultsStruct &&
        textOverlay == other.textOverlay &&
        textOrientation == other.textOrientation &&
        fileParseExitCode == other.fileParseExitCode &&
        parsedText == other.parsedText &&
        errorMessage == other.errorMessage &&
        errorDetails == other.errorDetails;
  }

  @override
  int get hashCode => const ListEquality().hash([
        textOverlay,
        textOrientation,
        fileParseExitCode,
        parsedText,
        errorMessage,
        errorDetails
      ]);
}

ParsedResultsStruct createParsedResultsStruct({
  TextOverlayStruct? textOverlay,
  String? textOrientation,
  int? fileParseExitCode,
  String? parsedText,
  String? errorMessage,
  String? errorDetails,
}) =>
    ParsedResultsStruct(
      textOverlay: textOverlay ?? TextOverlayStruct(),
      textOrientation: textOrientation,
      fileParseExitCode: fileParseExitCode,
      parsedText: parsedText,
      errorMessage: errorMessage,
      errorDetails: errorDetails,
    );
