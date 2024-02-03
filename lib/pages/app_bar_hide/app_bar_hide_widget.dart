import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'app_bar_hide_model.dart';
export 'app_bar_hide_model.dart';

class AppBarHideWidget extends StatefulWidget {
  const AppBarHideWidget({Key? key}) : super(key: key);

  @override
  _AppBarHideWidgetState createState() => _AppBarHideWidgetState();
}

class _AppBarHideWidgetState extends State<AppBarHideWidget> {
  late AppBarHideModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppBarHideModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Theme(
                data: ThemeData(
                  checkboxTheme: CheckboxThemeData(
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  unselectedWidgetColor: Color(0xFFB5C0C8),
                ),
                child: Checkbox(
                  value: _model.checkboxValue ??= false,
                  onChanged: (newValue) async {
                    setState(() => _model.checkboxValue = newValue!);
                  },
                  activeColor: FlutterFlowTheme.of(context).primary,
                  checkColor: FlutterFlowTheme.of(context).info,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                child: Text(
                  'Hide Others Pairs',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'BinanceFont',
                        fontSize: 11.0,
                        useGoogleFonts: false,
                      ),
                ),
              ),
            ].divide(SizedBox(width: 5.0)),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Opacity(
                opacity: 0.8,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 2.0, 10.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Close All',
                    options: FFButtonOptions(
                      height: 18.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFFD5D5D5),
                      textStyle:
                          FlutterFlowTheme.of(context).bodySmall.override(
                                fontFamily: 'BinanceFont',
                                fontSize: 4.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: false,
                              ),
                      elevation: 0.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
