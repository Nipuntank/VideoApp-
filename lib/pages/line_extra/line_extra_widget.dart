import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'line_extra_model.dart';
export 'line_extra_model.dart';

class LineExtraWidget extends StatefulWidget {
  const LineExtraWidget({Key? key}) : super(key: key);

  @override
  _LineExtraWidgetState createState() => _LineExtraWidgetState();
}

class _LineExtraWidgetState extends State<LineExtraWidget> {
  late LineExtraModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LineExtraModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          thickness: 0.5,
          color: Color(0xFF7E7E7E),
        ),
      ],
    );
  }
}
