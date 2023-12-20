import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'software_details_widget.dart' show SoftwareDetailsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SoftwareDetailsModel extends FlutterFlowModel<SoftwareDetailsWidget> {
  ///  Local state fields for this page.

  bool progressBar = false;

  bool? notConnectStatus = false;

  bool connectedStatus = false;

  bool downloadingSoftwareStatus = false;

  bool downloadedSoftwareStatus = false;

  bool downloadingManualStatus = false;

  bool downloadedManualStatus = false;

  int? maxIndex;

  int? currentIndex;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - pathCheck] action in Button widget.
  dynamic? pathcheckResponses;
  // Stores action output result for [Custom Action - pathCheck] action in Button widget.
  dynamic? pathCheckResponse2;
  // Stores action output result for [Custom Action - pathCheck] action in Button widget.
  dynamic? downloadManualPathCheckResponse;
  // Stores action output result for [Backend Call - API (Bank Model Manual Download)] action in Button widget.
  ApiCallResponse? manualResponse1;
  // Stores action output result for [Custom Action - downloadFile] action in Button widget.
  String? manualDownloadResponse1;
  // Stores action output result for [Custom Action - pathCheck] action in Button widget.
  dynamic? downloadSoftwarePathCheckResponse123;
  // Stores action output result for [Backend Call - API (Bank Model Multiple Software Download)] action in Button widget.
  ApiCallResponse? downloadSoftwareResponse123;
  // Stores action output result for [Custom Action - downloadFile] action in Button widget.
  String? softwareDownloadResponse123;
  // Stores action output result for [Backend Call - API (Software Sync)] action in Button widget.
  ApiCallResponse? softwareSyncResponse123;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
