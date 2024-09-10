import '/components/summary_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'summery_page_widget.dart' show SummeryPageWidget;
import 'package:flutter/material.dart';

class SummeryPageModel extends FlutterFlowModel<SummeryPageWidget> {
  ///  Local state fields for this page.

  String? meetingID;

  List<dynamic> chatData = [];
  void addToChatData(dynamic item) => chatData.add(item);
  void removeFromChatData(dynamic item) => chatData.remove(item);
  void removeAtIndexFromChatData(int index) => chatData.removeAt(index);
  void insertAtIndexInChatData(int index, dynamic item) =>
      chatData.insert(index, item);
  void updateChatDataAtIndex(int index, Function(dynamic) updateFn) =>
      chatData[index] = updateFn(chatData[index]);

  ///  State fields for stateful widgets in this page.

  // Model for SummaryView component.
  late SummaryViewModel summaryViewModel1;
  // Model for SummaryView component.
  late SummaryViewModel summaryViewModel2;
  // Model for SummaryView component.
  late SummaryViewModel summaryViewModel3;
  // Model for SummaryView component.
  late SummaryViewModel summaryViewModel4;
  // Model for SummaryView component.
  late SummaryViewModel summaryViewModel5;
  // Model for SummaryView component.
  late SummaryViewModel summaryViewModel6;
  // Model for SummaryView component.
  late SummaryViewModel summaryViewModel7;

  @override
  void initState(BuildContext context) {
    summaryViewModel1 = createModel(context, () => SummaryViewModel());
    summaryViewModel2 = createModel(context, () => SummaryViewModel());
    summaryViewModel3 = createModel(context, () => SummaryViewModel());
    summaryViewModel4 = createModel(context, () => SummaryViewModel());
    summaryViewModel5 = createModel(context, () => SummaryViewModel());
    summaryViewModel6 = createModel(context, () => SummaryViewModel());
    summaryViewModel7 = createModel(context, () => SummaryViewModel());
  }

  @override
  void dispose() {
    summaryViewModel1.dispose();
    summaryViewModel2.dispose();
    summaryViewModel3.dispose();
    summaryViewModel4.dispose();
    summaryViewModel5.dispose();
    summaryViewModel6.dispose();
    summaryViewModel7.dispose();
  }
}
