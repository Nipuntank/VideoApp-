import 'package:bclone/icomoon_icons.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({Key? key}) : super(key: key);

  @override
  _NavBarWidgetState createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late NavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 0.0,
            borderWidth: 0.0,
            buttonSize: 30.0,
            fillColor: Colors.white,
            icon: Icon(
              Icons.home,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 18.0,
            ),
            onPressed: () async {
              context.pushNamed('HomePage');
            },
          ),
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 0.0,
            borderWidth: 0.0,
            buttonSize: 30.0,
            fillColor: Colors.white,
            icon: Icon(
              Icons.bar_chart,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 18.0,
            ),
          ),
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 0.0,
            borderWidth: 0.0,
            buttonSize: 30.0,
            fillColor: Colors.white,
            icon: FaIcon(
              FontAwesomeIcons.coins,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 18.0,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          GestureDetector(
            child: const Icon(
              Icomoon.Subtract,
              size: 18,
            ),
            onTap: () async {
              context.pushNamed('Futures');
            },
          ),
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 0.0,
            borderWidth: 0.0,
            buttonSize: 30.0,
            fillColor: Colors.white,
            icon: Icon(
              Icons.account_balance_wallet_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 18.0,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
        ].divide(SizedBox(width: 10)),
      ),
    );
  }
}
