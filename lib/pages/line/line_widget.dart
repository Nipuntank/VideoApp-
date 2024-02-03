import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'line_model.dart';
export 'line_model.dart';

class LineWidget extends StatefulWidget {
  const LineWidget({Key? key}) : super(key: key);

  @override
  _LineWidgetState createState() => _LineWidgetState();
}

class _LineWidgetState extends State<LineWidget> {
  late LineModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LineModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 15.0,
          child: Divider(
            height: 20.0,
            thickness: 2.0,
            indent: 0.0,
            color: FlutterFlowTheme.of(context).warning,
          ),
        ),
      ],
    );
  }
}
