import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
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
import 'markets_model.dart';

// unused imports
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';

export 'markets_model.dart';

class MarketsWidget extends StatefulWidget {
  const MarketsWidget({Key? key}) : super(key: key);

  @override
  _MarketsWidgetState createState() => _MarketsWidgetState();
}

class _MarketsWidgetState extends State<MarketsWidget> {
  late MarketsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MarketsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

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
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.sizeOf(context).height * 0.06),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            title: Column(
              mainAxisSize: MainAxisSize.max,
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
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 30.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    icon: Icon(
                                      FFIcons.kcrown,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 20.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 30.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    icon: Icon(
                                      FFIcons.kcrown,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 20.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 30.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    icon: FaIcon(
                                      FontAwesomeIcons.plus,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 16.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                  Icon(
                                    FFIcons.kdot3,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 20.0,
                                  ),
                                ].divide(SizedBox(width: 3.0)),
                              ),
                            ),
                          ].divide(SizedBox(width: 102.0)),
                        ),
                      ],
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 10.0)),
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
                  ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 0.0, 0.0),
                        child: FlutterFlowVideoPlayer(
                          path:
                              'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
                          videoType: VideoType.network,
                          autoPlay: false,
                          looping: false,
                          showControls: false,
                          allowFullScreen: false,
                          allowPlaybackSpeedMenu: false,
                          lazyLoad: false,
                          pauseOnNavigate: false,
                        ),
                      ),
                      FlutterFlowVideoPlayer(
                        path:
                            'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
                        videoType: VideoType.network,
                        autoPlay: false,
                        looping: false,
                        showControls: false,
                        allowFullScreen: false,
                        allowPlaybackSpeedMenu: false,
                        lazyLoad: false,
                      ),
                      FlutterFlowVideoPlayer(
                        path:
                            'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
                        videoType: VideoType.network,
                        autoPlay: false,
                        looping: false,
                        showControls: false,
                        allowFullScreen: false,
                        allowPlaybackSpeedMenu: false,
                        lazyLoad: false,
                      ),
                      FlutterFlowVideoPlayer(
                        path:
                            'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
                        videoType: VideoType.network,
                        autoPlay: false,
                        looping: false,
                        showControls: false,
                        allowFullScreen: false,
                        allowPlaybackSpeedMenu: false,
                        lazyLoad: false,
                      ),
                      FlutterFlowVideoPlayer(
                        path:
                            'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
                        videoType: VideoType.network,
                        autoPlay: false,
                        looping: false,
                        showControls: false,
                        allowFullScreen: false,
                        allowPlaybackSpeedMenu: false,
                        lazyLoad: false,
                      ),
                      FlutterFlowVideoPlayer(
                        path:
                            'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
                        videoType: VideoType.network,
                        autoPlay: false,
                        looping: false,
                        showControls: false,
                        allowFullScreen: false,
                        allowPlaybackSpeedMenu: false,
                        lazyLoad: false,
                      ),
                    ],
                  ),
                ],
              ),
              wrapWithModel(
                model: _model.appBarButtonModel,
                updateCallback: () => setState(() {}),
                child: AppBarButtonWidget(),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -0.9),
                child: wrapWithModel(
                  model: _model.appBarHideModel,
                  updateCallback: () => setState(() {}),
                  child: AppBarHideWidget(),
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
              Align(
                alignment: AlignmentDirectional(0.0, 0.9),
                child: wrapWithModel(
                  model: _model.navChartModel,
                  updateCallback: () => setState(() {}),
                  child: NavChartWidget(),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navTextModel,
                  updateCallback: () => setState(() {}),
                  child: NavTextWidget(),
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
              Opacity(
                opacity: 0.5,
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.85),
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
                  alignment: AlignmentDirectional(0.0, -0.83),
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
                  alignment: AlignmentDirectional(0.0, -0.93),
                  child: wrapWithModel(
                    model: _model.lineExtraModel3,
                    updateCallback: () => setState(() {}),
                    child: LineExtraWidget(),
                  ),
                ),
              ),
              Opacity(
                opacity: 0.5,
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
