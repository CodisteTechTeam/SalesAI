import '/components/summary_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'summery_page_model.dart';
export 'summery_page_model.dart';

class SummeryPageWidget extends StatefulWidget {
  const SummeryPageWidget({
    super.key,
    required this.summaryData,
  });

  final dynamic summaryData;

  @override
  State<SummeryPageWidget> createState() => _SummeryPageWidgetState();
}

class _SummeryPageWidgetState extends State<SummeryPageWidget> {
  late SummeryPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SummeryPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.meetingID = widget.summaryData?.toString();
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Summery',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Text(
                    getJsonField(
                      widget.summaryData,
                      r'''$.meeting_id''',
                    ).toString(),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        wrapWithModel(
                          model: _model.summaryViewModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: SummaryViewWidget(
                            title: 'KeyPoints',
                            subTitle: getJsonField(
                              widget.summaryData,
                              r'''$.summary.KeyPoints''',
                            ).toString(),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.summaryViewModel2,
                          updateCallback: () => safeSetState(() {}),
                          child: SummaryViewWidget(
                            title: 'PersonalInformation',
                            subTitle: getJsonField(
                              widget.summaryData,
                              r'''$.summary.PersonalInformation''',
                            ).toString(),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.summaryViewModel3,
                          updateCallback: () => safeSetState(() {}),
                          child: SummaryViewWidget(
                            title: 'PositiveFeedback',
                            subTitle: getJsonField(
                              widget.summaryData,
                              r'''$.summary.PositiveFeedback''',
                            ).toString(),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.summaryViewModel4,
                          updateCallback: () => safeSetState(() {}),
                          child: SummaryViewWidget(
                            title: 'NegativeFeedback',
                            subTitle: getJsonField(
                              widget.summaryData,
                              r'''$.summary.NegativeFeedback''',
                            ).toString(),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.summaryViewModel5,
                          updateCallback: () => safeSetState(() {}),
                          child: SummaryViewWidget(
                            title: 'ActionableItems',
                            subTitle: getJsonField(
                              widget.summaryData,
                              r'''$.summary.ActionableItems''',
                            ).toString(),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.summaryViewModel6,
                          updateCallback: () => safeSetState(() {}),
                          child: SummaryViewWidget(
                            title: 'OverallSentiment',
                            subTitle: getJsonField(
                              widget.summaryData,
                              r'''$.summary.OverallSentiment''',
                            ).toString(),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.summaryViewModel7,
                          updateCallback: () => safeSetState(() {}),
                          child: SummaryViewWidget(
                            title: 'Review',
                            subTitle: getJsonField(
                              widget.summaryData,
                              r'''$.summary.Review''',
                            ).toString(),
                          ),
                        ),
                      ].divide(const SizedBox(height: 15.0)),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 30.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          'ChatBotPage',
                          queryParameters: {
                            'meetingId': serializeParam(
                              getJsonField(
                                widget.summaryData,
                                r'''$.meeting_id''',
                              ).toString(),
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: 'Let\'s Chat',
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ].divide(const SizedBox(height: 15.0)),
            ),
          ),
        ),
      ),
    );
  }
}
