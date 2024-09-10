import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  List<dynamic> meetingData = [];
  void addToMeetingData(dynamic item) => meetingData.add(item);
  void removeFromMeetingData(dynamic item) => meetingData.remove(item);
  void removeAtIndexFromMeetingData(int index) => meetingData.removeAt(index);
  void insertAtIndexInMeetingData(int index, dynamic item) =>
      meetingData.insert(index, item);
  void updateMeetingDataAtIndex(int index, Function(dynamic) updateFn) =>
      meetingData[index] = updateFn(meetingData[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (MeetingsList)] action in HomePage widget.
  ApiCallResponse? getMeetingResponse;
  // Stores action output result for [Backend Call - API (MeetingsList)] action in ListView widget.
  ApiCallResponse? getAllMeetingResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
