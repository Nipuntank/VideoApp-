// Importing required libraries and packages
// import 'dart:convert';
// import 'package:flutter/foundation.dart';
import 'package:bclone/global_state.dart';
import 'package:bclone/icomoon_icons.dart';
// import '/futures/futures_widget.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/app_bar_button/app_bar_button_widget.dart';
import '/pages/app_bar_hide/app_bar_hide_widget.dart';
import '/pages/line/line_widget.dart';
import '/pages/line_extra/line_extra_widget.dart';
import '/pages/nav_bar/nav_bar_widget.dart';
// import '/pages/nav_chart/nav_chart_widget.dart';
import '/pages/nav_text/nav_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_page_model.dart';

//unused import
// import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:provider/provider.dart';

export 'home_page_model.dart';

// HomePageWidget is a StatefulWidget
class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;
  String enteredText = '';

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final textController = TextEditingController();

  // Initialization of the state
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  Future<void> _deleteVideos() async {
    final storage = FlutterSecureStorage();
    final String? token = await storage.read(key: 'token');

    final http.Response response = await http.delete(
      Uri.parse('http://${GlobalState.apiIP}:8282/delete_videos'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'token': token}),
    );

    final message = jsonDecode(response.body)['message'];

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }

    // Delete videos folder in native device
    final Directory directory = await getApplicationDocumentsDirectory();
    final String videosDirPath = '${directory.path}/videos';
    final Directory videosDir = Directory(videosDirPath);

    if (await videosDir.exists()) {
      await videosDir.delete(recursive: true);
      print("Videos folder deleted");
    }
  }

  Future<void> _makeVideo() async {
    final storage = FlutterSecureStorage();
    final String? token = await storage.read(key: 'token');
    GlobalState.enteredText = enteredText;

    final http.Response response = await http
        .post(
          Uri.parse('http://${GlobalState.apiIP}:8282/make_videos'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({'token': token, 'message': enteredText}),
        )
        .timeout(const Duration(minutes: 2));

    final message = jsonDecode(response.body)['message'];

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  Future<http.Response> fetchWithRetry(Uri uri,
      {int retries = 3, Map<String, String>? headers}) async {
    try {
      final response = await http
          .get(uri, headers: headers)
          .timeout(const Duration(seconds: 30));
      return response;
    } catch (e) {
      if (retries > 0) {
        await Future.delayed(const Duration(seconds: 2));
        return fetchWithRetry(uri, retries: retries - 1, headers: headers);
      } else {
        rethrow;
      }
    }
  }

  Future<void> _showVideos() async {
    String zipFilePath = '';
    try {
      final storage = FlutterSecureStorage();
      final String? token = await storage.read(key: 'token');
      final uri = Uri.parse('http://${GlobalState.apiIP}:8282/show_video');

      final response = await fetchWithRetry(
        // Removed fetchWithRetry and added http.get with timeout of 1 minute
        // final response = await http.get(
        uri,
        headers: <String, String>{
          'Connection': 'Keep-Alive',
          'Authorization': '$token',
          'Accept-Encoding': 'zip, deflate, br, gzip'
        },
      ).timeout(const Duration(minutes: 1));

      if (response.statusCode == 200) {
        // Store the video count in GlobalState.vidNumber
        final videoCountHeader = response.headers['videocount'];
        final ooc = response.headers['openorders'];
        if (videoCountHeader != null) {
          GlobalState.vidNumber = videoCountHeader;
          GlobalState.openOrdersCount = ooc;
        }

        final Directory directory = await getApplicationDocumentsDirectory();
        zipFilePath = '${directory.path}/videos.zip';
        final File zipFile = File(zipFilePath);

        // Check if the file already exists and delete it if it does
        if (await zipFile.exists()) {
          print("Deleting previous zip file");
          await zipFile.delete();
        }

        await zipFile.writeAsBytes(response.bodyBytes);

        // Verify the file size if the server sends a content-length header
        final contentLength = response.headers['content-length'];
        if (contentLength != null &&
            zipFile.lengthSync().toString() == contentLength) {
          // File is complete
          print('Download complete');
        } else {
          // File might be incomplete or corrupted
          print('Download might be incomplete or file is corrupted');
        }
      } else {
        print('Error downloading file: HTTP status ${response.statusCode}');
      }
    } catch (e) {
      // Handle the exception
      print('Exception occurred: $e');
    }

    if (!mounted) return;

    // Set the values in GlobalState
    GlobalState.zipFilePath = zipFilePath;

    context.go('/futures', extra: {
      'zipFilePath': zipFilePath,
      'enteredText': enteredText,
    });
  }

  // Building the widget
  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.sizeOf(context).height * 0.06),
          child: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Hello World',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 25.0,
                                      ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.white,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 30.0,
                                  fillColor: Colors.white,
                                  icon: Icon(
                                    FFIcons.kcrown,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 18.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                const Icon(
                                  Icomoon.Union,
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                const Icon(
                                  Icomoon.AddSub,
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Icon(
                                  FFIcons.kdot3,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 18.0,
                                ),
                              ],
                            ),
                          ].divide(SizedBox(width: 128.0)),
                        ),
                      ],
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 20.0)),
            ),
            actions: [],
            centerTitle: false,
            toolbarHeight: MediaQuery.sizeOf(context).height * 0.05,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 50.0, 16.0, 16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 50.0, 0.0, 75.0),
                            child: Text(
                              'About Video',
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'BinanceFont',
                                    fontSize: 26.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 20.0),
                            child: TextFormField(
                              controller: textController,
                              onChanged: (val) {
                                setState(() {
                                  enteredText = val;
                                });
                              },
                              decoration: InputDecoration(
                                labelText: 'Enter Text',
                                border: OutlineInputBorder(),
                              ),
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () => _makeVideo(),
                              text: 'Make Video',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 55.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'BinanceFont',
                                      color: Colors.white,
                                      useGoogleFonts: false,
                                    ),
                                elevation: 2.0,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 40.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () => _showVideos(),
                              text: 'Show Videos',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 55.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'BinanceFont',
                                      color: Colors.white,
                                      useGoogleFonts: false,
                                    ),
                                elevation: 2.0,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () => _deleteVideos(),
                              text: 'Delete Videos',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 55.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'BinanceFont',
                                      color: Colors.white,
                                      useGoogleFonts: false,
                                    ),
                                elevation: 2.0,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              wrapWithModel(
                model: _model.appBarButtonModel,
                updateCallback: () => setState(() {}),
                child: AppBarButtonWidget(),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -0.91),
                child: wrapWithModel(
                  model: _model.appBarHideModel,
                  updateCallback: () => setState(() {}),
                  child: AppBarHideWidget(),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.36, -0.94),
                child: wrapWithModel(
                  model: _model.lineModel,
                  updateCallback: () => setState(() {}),
                  child: LineWidget(),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.97),
                child: wrapWithModel(
                  model: _model.navBarModel,
                  updateCallback: () => setState(() {}),
                  child: NavBarWidget(),
                ),
              ),
              // Align(
              //   alignment: AlignmentDirectional(0.0, 0.9),
              //   child: wrapWithModel(
              //     model: _model.navChartModel,
              //     updateCallback: () => setState(() {}),
              //     child: NavChartWidget(),
              //   ),
              // ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navTextModel,
                  updateCallback: () => setState(() {}),
                  child: NavTextWidget(),
                ),
              ),
              // Align(
              //   alignment: AlignmentDirectional(0.76, -0.7),
              //   child: InkWell(
              //     splashColor: Colors.transparent,
              //     focusColor: Colors.transparent,
              //     hoverColor: Colors.transparent,
              //     highlightColor: Colors.transparent,
              //     onTap: () async {
              //       // context.pushNamed('Markets');
              //     },
              //     child: Icon(
              //       Icons.arrow_forward,
              //       color: FlutterFlowTheme.of(context).secondaryText,
              //       size: 24.0,
              //     ),
              //   ),
              // ),
              // Align(
              //   alignment: AlignmentDirectional(-0.36, -0.95),
              //   child: wrapWithModel(
              //     model: _model.lineModel,
              //     updateCallback: () => setState(() {}),
              //     child: LineWidget(),
              //   ),
              // ),
              Opacity(
                opacity: 0.5,
                child: Align(
                  alignment: AlignmentDirectional(0.0, -0.93),
                  child: wrapWithModel(
                    model: _model.lineExtraModel1,
                    updateCallback: () => setState(() {}),
                    child: LineExtraWidget(),
                  ),
                ),
              ),
              Opacity(
                opacity: 0.5,
                child: Align(
                  alignment: AlignmentDirectional(0.0, -0.855),
                  child: wrapWithModel(
                    model: _model.lineExtraModel2,
                    updateCallback: () => setState(() {}),
                    child: LineExtraWidget(),
                  ),
                ),
              ),
              // Opacity(
              //   opacity: 0.3,
              //   child: Align(
              //     alignment: AlignmentDirectional(0.0, 0.85),
              //     child: wrapWithModel(
              //       model: _model.lineExtraModel3,
              //       updateCallback: () => setState(() {}),
              //       child: LineExtraWidget(),
              //     ),
              //   ),
              // ),
              Opacity(
                opacity: 0.3,
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.92),
                  child: wrapWithModel(
                    model: _model.lineExtraModel4,
                    updateCallback: () => setState(() {}),
                    child: LineExtraWidget(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
