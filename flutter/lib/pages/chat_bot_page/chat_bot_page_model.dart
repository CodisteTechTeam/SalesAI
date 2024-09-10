import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_bot_page_widget.dart' show ChatBotPageWidget;
import 'package:flutter/material.dart';

class ChatBotPageModel extends FlutterFlowModel<ChatBotPageWidget> {
  ///  Local state fields for this page.

  String? fileName;

  List<dynamic> chatData = [];
  void addToChatData(dynamic item) => chatData.add(item);
  void removeFromChatData(dynamic item) => chatData.remove(item);
  void removeAtIndexFromChatData(int index) => chatData.removeAt(index);
  void insertAtIndexInChatData(int index, dynamic item) =>
      chatData.insert(index, item);
  void updateChatDataAtIndex(int index, Function(dynamic) updateFn) =>
      chatData[index] = updateFn(chatData[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (ChatCall)] action in Button widget.
  ApiCallResponse? chatAPIResponse;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    listViewController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
