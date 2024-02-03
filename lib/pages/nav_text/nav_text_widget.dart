import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'nav_text_model.dart';
export 'nav_text_model.dart';

class NavTextWidget extends StatefulWidget {
  const NavTextWidget({Key? key}) : super(key: key);

  @override
  _NavTextWidgetState createState() => _NavTextWidgetState();
}

class _NavTextWidgetState extends State<NavTextWidget> {
  late NavTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavTextModel());
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
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Home',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'BinanceFont',
                    fontSize: 10.0,
                    useGoogleFonts: false,
                  ),
            ),
            Text(
              'Markets',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'BinanceFont',
                    fontSize: 10.0,
                    useGoogleFonts: false,
                  ),
            ),
            Text(
              'Trades',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'BinanceFont',
                    fontSize: 10.0,
                    useGoogleFonts: false,
                  ),
            ),
            Text(
              'Futures',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'BinanceFont',
                    fontSize: 10.0,
                    useGoogleFonts: false,
                  ),
            ),
            Text(
              'Wallets',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'BinanceFont',
                    fontSize: 10.0,
                    useGoogleFonts: false,
                  ),
            ),
          ].divide(SizedBox(width: 9.0)),
        ),
      ),
    );
  }
}
