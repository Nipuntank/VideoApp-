import 'dart:io';
// import 'dart:convert';
import 'dart:math';
import 'dart:async';
import 'package:bclone/icomoon_icons.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:bclone/global_state.dart';
import 'package:video_player/video_player.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '/pages/app_bar_button/app_bar_button_widget.dart';
import '/pages/app_bar_hide/app_bar_hide_widget.dart';
import '/pages/line/line_widget.dart';
import '/pages/line_extra/line_extra_widget.dart';
import '/pages/nav_bar/nav_bar_widget.dart';
import '/pages/nav_chart/nav_chart_widget.dart';
import '/pages/nav_text/nav_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

// import 'package:bclone/flutter-icons-e46b6542/cust_icons_icons.dart';

import 'futures_model.dart';
export 'futures_model.dart';

class FuturesWidget extends StatefulWidget {
  FuturesWidget({Key? key}) : super(key: key);

  final String? zipFilePath = GlobalState.zipFilePath;
  final String? enteredText = GlobalState.enteredText;

  @override
  _FuturesWidgetState createState() => _FuturesWidgetState();
}

class ChangePercent extends StatefulWidget {
  const ChangePercent({Key? key}) : super(key: key);

  @override
  State<ChangePercent> createState() => _ChangePercentState();
}

class _ChangePercentState extends State<ChangePercent> {
  late double randomValue;

  @override
  void initState() {
    super.initState();
    // Initialize with a default value
    randomValue = 0.0;

    // Start a timer to update the random value every second
    Timer.periodic(Duration(seconds: 1), (timer) {
      updateRandomValue();
    });
  }

  void updateRandomValue() {
    setState(() {
      randomValue = generateRandomValue();
    });
  }

  double generateRandomValue() {
    return 1.0 +
        (Random().nextDouble() * 3.0); // Random initial value between 1 and 4
  }

  @override
  Widget build(BuildContext context) {
    // Return an empty container or add specific widgets as needed
    return Column(
      children: [
        Text(
          '+' + randomValue.toStringAsFixed(2) + '%',
          style: const TextStyle(
              color: Color.fromARGB(255, 7, 149, 11),
              fontSize: 12,
              fontWeight: FontWeight.w700,
              fontFamily: 'Readex Pro'),
        ),
      ],
    );
  }
}

class _FuturesWidgetState extends State<FuturesWidget> {
  late FuturesModel _model;
  List<String> videoPaths = [];
  late List<VideoPlayerController> _controllers = [];
  late Timer timer;
  late double randomValue;
  var chg;
  String currencyPair =
      GlobalState.extractCurrencyPair(GlobalState.enteredText!);

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FuturesModel());
    // _requestPermissions();
    _extractVideos().then((paths) {
      setState(() {
        videoPaths = paths;
        _initializeVideoPlayers();
      });
    });
  }

  Future<void> _initializeVideoPlayers() async {
    for (var path in videoPaths) {
      final controller = VideoPlayerController.file(
        File(path),
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
      );
      await controller.initialize();
      if (controller.value.isInitialized) {
        controller.setLooping(true); // Enable looping
        // controller.play(); // Autoplay the video
      }
      _controllers.add(controller);
    }

    _startAllVideos();
    setState(() {});
  }

  void _startAllVideos() {
    for (var controller in _controllers) {
      if (controller.value.isInitialized) {
        controller.setLooping(true); // Enable looping
        controller.play(); // Start playing the video
      }
    }
  }

  // Future<void> _requestPermissions() async {
  //   Map<Permission, PermissionStatus> statuses = await [
  //     Permission.storage,
  //   ].request();
  //   print(statuses[Permission.storage]);
  // }

  Future<List<String>> extractZipFile(
      String zipFilePath, String destinationDirPath) async {
    final zipFile = File(zipFilePath);
    final destinationDir = Directory(destinationDirPath);

    if (!await destinationDir.exists()) {
      await destinationDir.create(recursive: true);
    }

    await ZipFile.extractToDirectory(
        zipFile: zipFile, destinationDir: destinationDir);

    List<String> videoPaths = destinationDir
        .listSync()
        .where((item) => item.path.endsWith('.mp4'))
        .map((item) => item.path.replaceFirst('flutter_assets/', ''))
        .toList();
    return videoPaths;
  }

  Future<List<String>> _extractVideos() async {
    List<String> paths = [];
    final Directory directory = await getApplicationDocumentsDirectory();
    final String destinationDirPath = '${directory.path}/videos';

    // Print the zip file path for debugging purposes
    print('Zip file path: ${widget.zipFilePath}');

    if (widget.zipFilePath != null) {
      // Check if the zip file exists before trying to extract
      final zipFile = File(widget.zipFilePath!);
      if (await zipFile.exists()) {
        paths = await extractZipFile(widget.zipFilePath!, destinationDirPath);
        print("\n\n\n\n\n\n\n\n");
        print("Vidddd: $paths");
      } else {
        print('Zip file does not exist at the path: ${widget.zipFilePath}');
      }
    } else {
      // Handle the case when zipFilePath is null, e.g., show an error message
      print('Zip file path is null');
    }
    return paths;
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topWidgetsHeight = MediaQuery.of(context).size.height *
        0.065; // Example height, adjust as needed

    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.06),
          child: AppBar(
            backgroundColor: Colors.white,
            scrolledUnderElevation: 0,
            automaticallyImplyLeading: false,
            title: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: [
                                Text(
                                  currencyPair,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 25.0,
                                      ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                      color:
                                          Color.fromARGB(255, 239, 238, 238)),
                                  child: Text(
                                    'Perp',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 13,
                                        ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 25,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const Icon(
                                  Icomoon.Union,
                                  size: 16,
                                ),
                                const SizedBox(width: 18.0),
                                const Icon(
                                  Icomoon.AddSub,
                                  size: 16,
                                ),
                                SizedBox(width: 18.0),
                                Icon(
                                  FFIcons.kdot3,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 20.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: ChangePercent(),
                ),
              ],
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: topWidgetsHeight),
                      child: ListView.builder(
                        itemCount: _controllers.length,
                        itemBuilder: (context, index) {
                          final controller = _controllers[index];
                          return controller.value.isInitialized
                              ? AspectRatio(
                                  aspectRatio: controller.value.aspectRatio,
                                  child: VideoPlayer(controller),
                                )
                              : const SizedBox(
                                  height: 100, // Placeholder height
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                );
                        },
                      ),
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
                      alignment: AlignmentDirectional(-0.36, -0.935),
                      child: wrapWithModel(
                        model: _model.lineModel,
                        updateCallback: () => setState(() {}),
                        child: LineWidget(),
                      ),
                    ),
                    Opacity(
                      opacity: 0.5,
                      child: Align(
                        alignment: AlignmentDirectional(0.0, -0.85),
                        child: wrapWithModel(
                          model: _model.lineExtraModel2,
                          updateCallback: () => setState(() {}),
                          child: LineExtraWidget(),
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.5,
                      child: Align(
                        alignment: AlignmentDirectional(0.0, -0.925),
                        child: wrapWithModel(
                          model: _model.lineExtraModel3,
                          updateCallback: () => setState(() {}),
                          child: LineExtraWidget(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Opacity(
              //   opacity: 0.5,
              //   child: Align(
              //     alignment: AlignmentDirectional(0.0, -0.8),
              //     child: wrapWithModel(
              //       model: _model.lineExtraModel2,
              //       updateCallback: () => setState(() {}),
              //       child: LineExtraWidget(),
              //     ),
              //   ),
              // ),
              // Fixed widgets at the bottom

              // Opacity(
              //   opacity: 0.3,
              //   child: Padding(
              //     padding: EdgeInsetsDirectional.only(bottom: 0),
              //     child: wrapWithModel(
              //       model: _model.lineExtraModel4,
              //       updateCallback: () => setState(() {}),
              //       child: LineExtraWidget(),
              //     ),
              //   ),
              // ),
              //

              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0.5),
                child: wrapWithModel(
                  model: _model.navChartModel,
                  updateCallback: () => setState(() {}),
                  child: NavChartWidget(),
                ),
              ),
              // Align(
              //   alignment: AlignmentDirectional(0, 1),
              //   child: wrapWithModel(
              //     model: _model.lineExtraModel4,
              //     updateCallback: () => setState(() {}),
              //     child: LineExtraWidget(),
              //   ),
              // ),

              wrapWithModel(
                model: _model.navBarModel,
                updateCallback: () => setState(() {}),
                child: NavBarWidget(),
              ),

              wrapWithModel(
                model: _model.navTextModel,
                updateCallback: () => setState(() {}),
                child: NavTextWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
