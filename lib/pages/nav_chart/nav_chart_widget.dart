import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'nav_chart_model.dart';
export 'nav_chart_model.dart';
import 'package:bclone/global_state.dart';

class NavChartWidget extends StatefulWidget {
  const NavChartWidget({Key? key}) : super(key: key);

  @override
  _NavChartWidgetState createState() => _NavChartWidgetState();
}

class _NavChartWidgetState extends State<NavChartWidget> {
  late NavChartModel _model;
  String currencyPair =
      GlobalState.extractCurrencyPair(GlobalState.enteredText!);

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavChartModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
            child: Text(
              '$currencyPair Perpetual Chart',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'BinanceFont',
                    fontSize: 13.0,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10.0, 0),
            child: Icon(
              Icons.arrow_drop_up,
              color: Color(0xC269767F),
              size: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
