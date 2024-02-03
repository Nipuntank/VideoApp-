import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'app_bar_model.dart';
export 'app_bar_model.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  late AppBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.settings_outlined,
          color: FlutterFlowTheme.of(context).primaryText,
          size: 24.0,
        ),
        Icon(
          Icons.settings_outlined,
          color: FlutterFlowTheme.of(context).primaryText,
          size: 24.0,
        ),
        Icon(
          Icons.settings_outlined,
          color: FlutterFlowTheme.of(context).primaryText,
          size: 24.0,
        ),
        Icon(
          Icons.settings_outlined,
          color: FlutterFlowTheme.of(context).primaryText,
          size: 24.0,
        ),
      ].divide(SizedBox(width: 15.0)),
    );
  }
}
