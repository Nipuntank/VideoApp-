import '/flutter_flow/flutter_flow_util.dart';
import '/pages/app_bar_button/app_bar_button_widget.dart';
import '/pages/app_bar_hide/app_bar_hide_widget.dart';
import '/pages/line/line_widget.dart';
import '/pages/line_extra/line_extra_widget.dart';
import '/pages/nav_bar/nav_bar_widget.dart';
import '/pages/nav_chart/nav_chart_widget.dart';
import '/pages/nav_text/nav_text_widget.dart';
import 'markets_widget.dart' show MarketsWidget;
import 'package:flutter/material.dart';


// unused imports
// import 'package:flutter/services.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import '/flutter_flow/flutter_flow_icon_button.dart';
// import '/flutter_flow/flutter_flow_video_player.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

class MarketsModel extends FlutterFlowModel<MarketsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AppBarButton component.
  late AppBarButtonModel appBarButtonModel;
  // Model for AppBarHide component.
  late AppBarHideModel appBarHideModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Model for NavChart component.
  late NavChartModel navChartModel;
  // Model for NavText component.
  late NavTextModel navTextModel;
  // Model for line component.
  late LineModel lineModel;
  // Model for LineExtra component.
  late LineExtraModel lineExtraModel1;
  // Model for LineExtra component.
  late LineExtraModel lineExtraModel2;
  // Model for LineExtra component.
  late LineExtraModel lineExtraModel3;
  // Model for LineExtra component.
  late LineExtraModel lineExtraModel4;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appBarButtonModel = createModel(context, () => AppBarButtonModel());
    appBarHideModel = createModel(context, () => AppBarHideModel());
    navBarModel = createModel(context, () => NavBarModel());
    navChartModel = createModel(context, () => NavChartModel());
    navTextModel = createModel(context, () => NavTextModel());
    lineModel = createModel(context, () => LineModel());
    lineExtraModel1 = createModel(context, () => LineExtraModel());
    lineExtraModel2 = createModel(context, () => LineExtraModel());
    lineExtraModel3 = createModel(context, () => LineExtraModel());
    lineExtraModel4 = createModel(context, () => LineExtraModel());
  }

  void dispose() {
    unfocusNode.dispose();
    appBarButtonModel.dispose();
    appBarHideModel.dispose();
    navBarModel.dispose();
    navChartModel.dispose();
    navTextModel.dispose();
    lineModel.dispose();
    lineExtraModel1.dispose();
    lineExtraModel2.dispose();
    lineExtraModel3.dispose();
    lineExtraModel4.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
