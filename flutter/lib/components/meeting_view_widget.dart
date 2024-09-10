import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'meeting_view_model.dart';
export 'meeting_view_model.dart';

class MeetingViewWidget extends StatefulWidget {
  const MeetingViewWidget({
    super.key,
    required this.meetingId,
    this.meetingDescription,
  });

  final String? meetingId;
  final String? meetingDescription;

  @override
  State<MeetingViewWidget> createState() => _MeetingViewWidgetState();
}

class _MeetingViewWidgetState extends State<MeetingViewWidget> {
  late MeetingViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeetingViewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          _model.getSummeryResponse = await GetSummeryCall.call(
            meetingID: widget.meetingId,
          );

          if ((_model.getSummeryResponse?.succeeded ?? true)) {
            context.goNamed(
              'SummeryPage',
              queryParameters: {
                'summaryData': serializeParam(
                  (_model.getSummeryResponse?.jsonBody ?? ''),
                  ParamType.JSON,
                ),
              }.withoutNulls,
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Please wait! Summery under progress ',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: const Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).secondary,
              ),
            );
          }

          safeSetState(() {});
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.meetingId!,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Text(
              widget.meetingDescription!,
              maxLines: 3,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                  ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 0.5,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondary,
                ),
              ),
            ),
          ].divide(const SizedBox(height: 4.0)),
        ),
      ),
    );
  }
}
