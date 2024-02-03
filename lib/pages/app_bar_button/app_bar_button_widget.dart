import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'app_bar_button_model.dart';
import 'package:bclone/global_state.dart';

export 'app_bar_button_model.dart';

class AppBarButtonWidget extends StatefulWidget {
  const AppBarButtonWidget({Key? key}) : super(key: key);

  @override
  _AppBarButtonWidgetState createState() => _AppBarButtonWidgetState();
}

class _AppBarButtonWidgetState extends State<AppBarButtonWidget> {
  late AppBarButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppBarButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Opacity(
                  opacity: 0.6,
                  child: Text(
                    'Open Orders (${GlobalState.openOrdersCount})',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'BinanceFont',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Text(
                  'Positions (${GlobalState.vidNumber})',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'BinanceFont',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                ),
                Opacity(
                  opacity: 0.6,
                  child: Text(
                    'Futures Grid',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'BinanceFont',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ].divide(SizedBox(width: 10.0)),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.compare_arrows_sharp,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 16.0,
                    ),
                    Icon(
                      Icons.file_open,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 16.0,
                    ),
                  ].divide(SizedBox(width: 10.0)),
                ),
              ),
            ],
          ),
        ].divide(SizedBox(width: 0.0)),
      ),
    );
  }
}
