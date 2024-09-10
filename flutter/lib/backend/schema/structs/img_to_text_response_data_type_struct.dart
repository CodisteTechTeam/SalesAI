// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImgToTextResponseDataTypeStruct extends BaseStruct {
  ImgToTextResponseDataTypeStruct({
    List<ParsedResultsStruct>? parsedResults,
    int? oCRExitCode,
    bool? isErroredOnProcessing,
    String? processingTimeInMilliseconds,
    String? searchablePDFURL,
  })  : _parsedResults = parsedResults,
        _oCRExitCode = oCRExitCode,
        _isErroredOnProcessing = isErroredOnProcessing,
        _processingTimeInMilliseconds = processingTimeInMilliseconds,
        _searchablePDFURL = searchablePDFURL;

  // "ParsedResults" field.
  List<ParsedResultsStruct>? _parsedResults;
  List<ParsedResultsStruct> get parsedResults => _parsedResults ?? const [];
  set parsedResults(List<ParsedResultsStruct>? val) => _parsedResults = val;

  void updateParsedResults(Function(List<ParsedResultsStruct>) updateFn) {
    updateFn(_parsedResults ??= []);
  }

  bool hasParsedResults() => _parsedResults != null;

  // "OCRExitCode" field.
  int? _oCRExitCode;
  int get oCRExitCode => _oCRExitCode ?? 0;
  set oCRExitCode(int? val) => _oCRExitCode = val;

  void incrementOCRExitCode(int amount) => oCRExitCode = oCRExitCode + amount;

  bool hasOCRExitCode() => _oCRExitCode != null;

  // "IsErroredOnProcessing" field.
  bool? _isErroredOnProcessing;
  bool get isErroredOnProcessing => _isErroredOnProcessing ?? false;
  set isErroredOnProcessing(bool? val) => _isErroredOnProcessing = val;

  bool hasIsErroredOnProcessing() => _isErroredOnProcessing != null;

  // "ProcessingTimeInMilliseconds" field.
  String? _processingTimeInMilliseconds;
  String get processingTimeInMilliseconds =>
      _processingTimeInMilliseconds ?? '';
  set processingTimeInMilliseconds(String? val) =>
      _processingTimeInMilliseconds = val;

  bool hasProcessingTimeInMilliseconds() =>
      _processingTimeInMilliseconds != null;

  // "SearchablePDFURL" field.
  String? _searchablePDFURL;
  String get searchablePDFURL => _searchablePDFURL ?? '';
  set searchablePDFURL(String? val) => _searchablePDFURL = val;

  bool hasSearchablePDFURL() => _searchablePDFURL != null;

  static ImgToTextResponseDataTypeStruct fromMap(Map<String, dynamic> data) =>
      ImgToTextResponseDataTypeStruct(
        parsedResults: getStructList(
          data['ParsedResults'],
          ParsedResultsStruct.fromMap,
        ),
        oCRExitCode: castToType<int>(data['OCRExitCode']),
        isErroredOnProcessing: data['IsErroredOnProcessing'] as bool?,
        processingTimeInMilliseconds:
            data['ProcessingTimeInMilliseconds'] as String?,
        searchablePDFURL: data['SearchablePDFURL'] as String?,
      );

  static ImgToTextResponseDataTypeStruct? maybeFromMap(dynamic data) => data
          is Map
      ? ImgToTextResponseDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ParsedResults': _parsedResults?.map((e) => e.toMap()).toList(),
        'OCRExitCode': _oCRExitCode,
        'IsErroredOnProcessing': _isErroredOnProcessing,
        'ProcessingTimeInMilliseconds': _processingTimeInMilliseconds,
        'SearchablePDFURL': _searchablePDFURL,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ParsedResults': serializeParam(
          _parsedResults,
          ParamType.DataStruct,
          isList: true,
        ),
        'OCRExitCode': serializeParam(
          _oCRExitCode,
          ParamType.int,
        ),
        'IsErroredOnProcessing': serializeParam(
          _isErroredOnProcessing,
          ParamType.bool,
        ),
        'ProcessingTimeInMilliseconds': serializeParam(
          _processingTimeInMilliseconds,
          ParamType.String,
        ),
        'SearchablePDFURL': serializeParam(
          _searchablePDFURL,
          ParamType.String,
        ),
      }.withoutNulls;

  static ImgToTextResponseDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ImgToTextResponseDataTypeStruct(
        parsedResults: deserializeStructParam<ParsedResultsStruct>(
          data['ParsedResults'],
          ParamType.DataStruct,
          true,
          structBuilder: ParsedResultsStruct.fromSerializableMap,
        ),
        oCRExitCode: deserializeParam(
          data['OCRExitCode'],
          ParamType.int,
          false,
        ),
        isErroredOnProcessing: deserializeParam(
          data['IsErroredOnProcessing'],
          ParamType.bool,
          false,
        ),
        processingTimeInMilliseconds: deserializeParam(
          data['ProcessingTimeInMilliseconds'],
          ParamType.String,
          false,
        ),
        searchablePDFURL: deserializeParam(
          data['SearchablePDFURL'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ImgToTextResponseDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ImgToTextResponseDataTypeStruct &&
        listEquality.equals(parsedResults, other.parsedResults) &&
        oCRExitCode == other.oCRExitCode &&
        isErroredOnProcessing == other.isErroredOnProcessing &&
        processingTimeInMilliseconds == other.processingTimeInMilliseconds &&
        searchablePDFURL == other.searchablePDFURL;
  }

  @override
  int get hashCode => const ListEquality().hash([
        parsedResults,
        oCRExitCode,
        isErroredOnProcessing,
        processingTimeInMilliseconds,
        searchablePDFURL
      ]);
}

ImgToTextResponseDataTypeStruct createImgToTextResponseDataTypeStruct({
  int? oCRExitCode,
  bool? isErroredOnProcessing,
  String? processingTimeInMilliseconds,
  String? searchablePDFURL,
}) =>
    ImgToTextResponseDataTypeStruct(
      oCRExitCode: oCRExitCode,
      isErroredOnProcessing: isErroredOnProcessing,
      processingTimeInMilliseconds: processingTimeInMilliseconds,
      searchablePDFURL: searchablePDFURL,
    );
