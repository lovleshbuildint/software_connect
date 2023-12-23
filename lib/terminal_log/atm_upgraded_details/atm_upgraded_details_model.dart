import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'atm_upgraded_details_widget.dart' show AtmUpgradedDetailsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AtmUpgradedDetailsModel
    extends FlutterFlowModel<AtmUpgradedDetailsWidget> {
  ///  Local state fields for this component.

  bool visibility = false;

  String location = '';

  String atmId1 = '';

  ///  State fields for stateful widgets in this component.

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for atmIdDD1 widget.
  String? atmIdDD1Value;
  FormFieldController<String>? atmIdDD1ValueController;
  // State field(s) for atmOther1 widget.
  FocusNode? atmOther1FocusNode;
  TextEditingController? atmOther1Controller;
  String? Function(BuildContext, String?)? atmOther1ControllerValidator;
  // State field(s) for Lcation1 widget.
  FocusNode? lcation1FocusNode;
  TextEditingController? lcation1Controller;
  String? Function(BuildContext, String?)? lcation1ControllerValidator;
  // State field(s) for Version1 widget.
  FocusNode? version1FocusNode;
  TextEditingController? version1Controller;
  String? Function(BuildContext, String?)? version1ControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for atmid2 widget.
  FocusNode? atmid2FocusNode;
  TextEditingController? atmid2Controller;
  String? Function(BuildContext, String?)? atmid2ControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (Create Terminal Log)] action in Button widget.
  ApiCallResponse? terminalLog;
  // Stores action output result for [Backend Call - API (Create Terminal Log)] action in Button widget.
  ApiCallResponse? terminalLog1;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    atmOther1FocusNode?.dispose();
    atmOther1Controller?.dispose();

    lcation1FocusNode?.dispose();
    lcation1Controller?.dispose();

    version1FocusNode?.dispose();
    version1Controller?.dispose();

    textFieldFocusNode?.dispose();
    textController4?.dispose();

    atmid2FocusNode?.dispose();
    atmid2Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonValue => radioButtonValueController?.value;
}
