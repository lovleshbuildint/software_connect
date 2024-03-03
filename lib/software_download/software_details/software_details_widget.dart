import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'software_details_model.dart';
export 'software_details_model.dart';

class SoftwareDetailsWidget extends StatefulWidget {
  const SoftwareDetailsWidget({
    super.key,
    required this.imageBin,
    required this.softwareVersion,
    required this.modelName,
    required this.uodatedOn,
    required this.fileSize,
    required this.description,
    required this.softwareVersionId,
    required this.bankName,
  });

  final String? imageBin;
  final String? softwareVersion;
  final String? modelName;
  final String? uodatedOn;
  final String? fileSize;
  final String? description;
  final String? softwareVersionId;
  final String? bankName;

  @override
  State<SoftwareDetailsWidget> createState() => _SoftwareDetailsWidgetState();
}

class _SoftwareDetailsWidgetState extends State<SoftwareDetailsWidget> {
  late SoftwareDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SoftwareDetailsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().progressBarVisibility = false;
        FFAppState().notConnectedStatus = false;
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: Color(0xFFFAFAFA),
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(22.0, 10.0, 22.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Software Details',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 68.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      90.0, 0.0, 90.0, 0.0),
                                  child: Container(
                                    width: 300.0,
                                    height: 200.0,
                                    child: custom_widgets.NewCustomWidget(
                                      width: 300.0,
                                      height: 200.0,
                                      bin: widget.imageBin,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 20.0, 24.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Software Version',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                              fontSize: 12.0,
                                            ),
                                      ),
                                      Text(
                                        'Model Number',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                              fontSize: 12.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 5.0, 24.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          widget.softwareVersion,
                                          '\"\"',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          widget.modelName,
                                          '\'\'',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 1.0,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 20.0, 24.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Last Updated On',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                              fontSize: 12.0,
                                            ),
                                      ),
                                      Text(
                                        'File Size',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                              fontSize: 12.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 5.0, 24.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        (String var1) {
                                          return var1.split('T').first;
                                        }(widget.uodatedOn!),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          widget.fileSize,
                                          '\"\"',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 20.0, 24.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'What\'s New',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                              fontSize: 12.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                widget.description,
                                                '\'\'',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(80.0, 0.0, 80.0, 86.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          setState(() {
                            FFAppState().percentage = 0.00;
                            FFAppState().progressBarVisibility = false;
                          });
                          _model.pathcheckResponses = await actions.pathCheck(
                            getJsonField(
                              FFAppState().loginResponse,
                              r'''$.deviceId''',
                            ).toString(),
                          );
                          if (getJsonField(
                                _model.pathcheckResponses,
                                r'''$.Status''',
                              ) &&
                              (getJsonField(
                                    FFAppState().loginResponse,
                                    r'''$.deviceId''',
                                  ) !=
                                  null)) {
                            setState(() {
                              _model.connectedStatus = true;
                            });
                            setState(() {
                              FFAppState().softwareDownloadStatus =
                                  'Download Software';
                              FFAppState().notConnectedStatus = false;
                              FFAppState().manualDownloadStatus =
                                  'Download Manual';
                            });
                          } else {
                            setState(() {
                              _model.notConnectStatus = true;
                            });
                            setState(() {
                              FFAppState().notConnectedStatus = true;
                            });
                          }

                          setState(() {});
                        },
                        text: 'Download Software',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 54.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFFFF0026),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 56.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.goNamed('dashboard');
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.asset(
                                    'assets/images/home.png',
                                    width: 16.0,
                                    height: 16.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  'Home',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF838383),
                                        fontSize: 10.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/browser_updated_(1).png',
                                  width: 16.0,
                                  height: 16.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                'Software',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFFF0026),
                                      fontSize: 10.0,
                                    ),
                              ),
                            ],
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('terminalLog');
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.asset(
                                    'assets/images/account_balance.png',
                                    width: 16.0,
                                    height: 16.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  'Terminal',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF838383),
                                        fontSize: 10.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('profile');
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.asset(
                                    'assets/images/user(1).png',
                                    width: 16.0,
                                    height: 16.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  'User',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF838383),
                                        fontSize: 10.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (_model.notConnectStatus! ||
                    _model.connectedStatus ||
                    _model.downloadingSoftwareStatus ||
                    _model.downloadedSoftwareStatus)
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: Color(0x34000000),
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (FFAppState().notConnectedStatus)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 195.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(1.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 15.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            _model.connectedStatus = false;
                                            _model.downloadingSoftwareStatus =
                                                false;
                                            _model.downloadedSoftwareStatus =
                                                false;
                                            _model.notConnectStatus = false;
                                            _model.downloadingManualStatus =
                                                false;
                                            _model.downloadedManualStatus =
                                                false;
                                          });
                                        },
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.black,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 13.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/Group_1000003100.png',
                                            width: 45.0,
                                            height: 45.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 13.0),
                                    child: Text(
                                      'Please Connect Assigned HPY Drive',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        50.0, 0.0, 50.0, 38.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        _model.pathCheckResponse2 =
                                            await actions.pathCheck(
                                          getJsonField(
                                            FFAppState().loginResponse,
                                            r'''$.deviceId''',
                                          ).toString(),
                                        );
                                        if (getJsonField(
                                          _model.pathCheckResponse2,
                                          r'''$.Status''',
                                        )) {
                                          setState(() {
                                            _model.notConnectStatus = false;
                                            _model.connectedStatus = true;
                                          });
                                          setState(() {
                                            FFAppState()
                                                    .softwareDownloadStatus =
                                                'Download Software';
                                            FFAppState().notConnectedStatus =
                                                false;
                                            FFAppState().manualDownloadStatus =
                                                'Download Manual';
                                          });
                                        } else {
                                          setState(() {
                                            _model.notConnectStatus = true;
                                          });
                                          setState(() {
                                            FFAppState().notConnectedStatus =
                                                true;
                                          });
                                        }

                                        setState(() {});
                                      },
                                      text: 'Check Again',
                                      options: FFButtonOptions(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 37.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFFFF0026),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (_model.connectedStatus &&
                            !FFAppState().notConnectedStatus)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 255.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(1.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 15.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            _model.connectedStatus = false;
                                            _model.downloadingSoftwareStatus =
                                                false;
                                            _model.downloadedSoftwareStatus =
                                                false;
                                            _model.notConnectStatus = false;
                                            _model.downloadingManualStatus =
                                                false;
                                            _model.downloadedManualStatus =
                                                false;
                                          });
                                        },
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.black,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 13.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/Group_1000003102.png',
                                            width: 45.0,
                                            height: 45.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 13.0),
                                    child: Text(
                                      'HPY Drive Connected Successful',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        45.0, 0.0, 45.0, 15.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 13.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              _model.downloadManualPathCheckResponse =
                                                  await actions.pathCheck(
                                                getJsonField(
                                                  FFAppState().loginResponse,
                                                  r'''$.deviceId''',
                                                ).toString(),
                                              );
                                              if (getJsonField(
                                                _model
                                                    .downloadManualPathCheckResponse,
                                                r'''$.Status''',
                                              )) {
                                                setState(() {
                                                  _model.downloadingManualStatus =
                                                      true;
                                                });
                                                _model.manualResponse1 =
                                                    await BankModelManualDownloadCall
                                                        .call(
                                                  token: getJsonField(
                                                    FFAppState().loginResponse,
                                                    r'''$.token''',
                                                  ).toString(),
                                                  softwareVersionId:
                                                      widget.softwareVersionId,
                                                );
                                                if (getJsonField(
                                                      (_model.manualResponse1
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.url''',
                                                    ) !=
                                                    null) {
                                                  _model.manualDownloadResponse1 =
                                                      await actions
                                                          .downloadFile(
                                                    'https://softwareconnect.hitachi-payments.com${getJsonField(
                                                      (_model.manualResponse1
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.url''',
                                                    ).toString()}',
                                                    functions.splitUrl(
                                                        'https://softwareconnect.hitachi-payments.com${getJsonField(
                                                      (_model.manualResponse1
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.url''',
                                                    ).toString()}'),
                                                    getJsonField(
                                                      FFAppState()
                                                          .loginResponse,
                                                      r'''$.deviceId''',
                                                    ).toString(),
                                                    getJsonField(
                                                      _model
                                                          .downloadManualPathCheckResponse,
                                                      r'''$.Path''',
                                                    ).toString(),
                                                    widget.bankName,
                                                    widget.modelName,
                                                    false,
                                                    widget.softwareVersionId,
                                                    getJsonField(
                                                      FFAppState()
                                                          .loginResponse,
                                                      r'''$.token''',
                                                    ).toString(),
                                                  );
                                                  if (_model.manualDownloadResponse1 !=
                                                          null &&
                                                      _model.manualDownloadResponse1 !=
                                                          '') {
                                                    setState(() {
                                                      _model.downloadingManualStatus =
                                                          false;
                                                      _model.downloadedManualStatus =
                                                          true;
                                                    });
                                                  }
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Alert'),
                                                        content: Text(
                                                            'No File Found'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                }
                                              } else {
                                                setState(() {
                                                  _model.notConnectStatus =
                                                      true;
                                                  _model.connectedStatus =
                                                      false;
                                                  _model.downloadingSoftwareStatus =
                                                      false;
                                                  _model.downloadedSoftwareStatus =
                                                      false;
                                                  _model.downloadingManualStatus =
                                                      false;
                                                });
                                                setState(() {
                                                  FFAppState()
                                                          .notConnectedStatus =
                                                      true;
                                                });
                                              }

                                              setState(() {});
                                            },
                                            text: FFAppState()
                                                .manualDownloadStatus,
                                            options: FFButtonOptions(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 37.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFFFF0026),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 13.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              _model.downloadSoftwarePathCheckResponse123 =
                                                  await actions.pathCheck(
                                                getJsonField(
                                                  FFAppState().loginResponse,
                                                  r'''$.deviceId''',
                                                ).toString(),
                                              );
                                              if (getJsonField(
                                                _model
                                                    .downloadSoftwarePathCheckResponse123,
                                                r'''$.Status''',
                                              )) {
                                                _model.downloadSoftwareResponse123 =
                                                    await BankModelMultipleSoftwareDownloadCall
                                                        .call(
                                                  token: getJsonField(
                                                    FFAppState().loginResponse,
                                                    r'''$.token''',
                                                  ).toString(),
                                                  softwareVersionId:
                                                      widget.softwareVersionId,
                                                );
                                                if ((_model
                                                        .downloadSoftwareResponse123
                                                        ?.succeeded ??
                                                    true)) {
                                                  setState(() {
                                                    _model.maxIndex =
                                                        BankModelMultipleSoftwareDownloadCall
                                                            .urlList(
                                                      (_model.downloadSoftwareResponse123
                                                              ?.jsonBody ??
                                                          ''),
                                                    )?.length;
                                                    _model.currentIndex = 0;
                                                    _model.downloadingSoftwareStatus =
                                                        true;
                                                    _model.testPath =
                                                        getJsonField(
                                                      _model
                                                          .downloadSoftwarePathCheckResponse123,
                                                      r'''$.Path''',
                                                    ).toString();
                                                  });
                                                  while (_model.currentIndex! <
                                                      _model.maxIndex!) {
                                                    _model.softwareDownloadResponse123 =
                                                        await actions
                                                            .downloadFile(
                                                      'https://softwareconnect.hitachi-payments.com${functions.geturl(BankModelMultipleSoftwareDownloadCall.urlList(
                                                        (_model.downloadSoftwareResponse123
                                                                ?.jsonBody ??
                                                            ''),
                                                      )?[_model.currentIndex!])}',
                                                      functions.splitUrl(
                                                          'https://softwareconnect.hitachi-payments.com${functions.geturl(BankModelMultipleSoftwareDownloadCall.urlList(
                                                        (_model.downloadSoftwareResponse123
                                                                ?.jsonBody ??
                                                            ''),
                                                      )?[_model.currentIndex!])}'),
                                                      getJsonField(
                                                        FFAppState()
                                                            .loginResponse,
                                                        r'''$.deviceId''',
                                                      ).toString(),
                                                      getJsonField(
                                                        _model
                                                            .downloadSoftwarePathCheckResponse123,
                                                        r'''$.Path''',
                                                      ).toString(),
                                                      widget.bankName,
                                                      widget.modelName,
                                                      true,
                                                      widget.softwareVersionId,
                                                      getJsonField(
                                                        FFAppState()
                                                            .loginResponse,
                                                        r'''$.token''',
                                                      ).toString(),
                                                    );
                                                    if (_model.softwareDownloadResponse123 !=
                                                            null &&
                                                        _model.softwareDownloadResponse123 !=
                                                            '') {
                                                      setState(() {
                                                        _model.downloadingSoftwareStatus =
                                                            false;
                                                        _model.downloadedSoftwareStatus =
                                                            true;
                                                      });
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text('Info'),
                                                            content: Text(_model
                                                                .softwareDownloadResponse123!),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                    setState(() {
                                                      _model.currentIndex =
                                                          _model.currentIndex! +
                                                              1;
                                                    });
                                                  }
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Alert'),
                                                        content: Text((_model
                                                                .downloadSoftwareResponse123
                                                                ?.bodyText ??
                                                            '')),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                }
                                              } else {
                                                setState(() {
                                                  _model.notConnectStatus =
                                                      true;
                                                  _model.connectedStatus =
                                                      false;
                                                  _model.downloadingSoftwareStatus =
                                                      false;
                                                  _model.downloadedSoftwareStatus =
                                                      false;
                                                  _model.downloadingManualStatus =
                                                      false;
                                                });
                                                setState(() {
                                                  FFAppState()
                                                          .notConnectedStatus =
                                                      true;
                                                });
                                              }

                                              setState(() {});
                                            },
                                            text: FFAppState()
                                                .softwareDownloadStatus,
                                            options: FFButtonOptions(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 37.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFFFF0026),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        if (FFAppState().progressBarVisibility)
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: LinearPercentIndicator(
                                                percent:
                                                    FFAppState().percentage,
                                                lineHeight: 18.0,
                                                animation: true,
                                                animateFromLastPercent: true,
                                                progressColor:
                                                    Color(0xFF0C9D61),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                                center: Text(
                                                  '${((FFAppState().percentage * 100).toInt()).toString()} %',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 12.0,
                                                      ),
                                                ),
                                                barRadius:
                                                    Radius.circular(100.0),
                                                padding: EdgeInsets.zero,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
