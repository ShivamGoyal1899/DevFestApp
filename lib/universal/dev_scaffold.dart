import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';

import '../config/config_bloc.dart';
import '../config/config_event.dart';

class DevScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget tabBar;

  const DevScaffold(
      {Key key, @required this.body, @required this.title, this.tabBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      color: ConfigBloc().darkMode ? Colors.grey[800] : Colors.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            centerTitle: true,
            bottom: tabBar != null ? tabBar : null,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  ConfigBloc().darkMode
                      ? FontAwesomeIcons.lightbulb
                      : FontAwesomeIcons.solidLightbulb,
                  size: 18.0,
                ),
                onPressed: () {
                  ConfigBloc().dispatch(DarkModeEvent(!ConfigBloc().darkMode));
                },
              ),
              IconButton(
                onPressed: () =>
                    Share.share("Download & Share with your friends."),
                icon: Icon(
                  Icons.share,
                  size: 20.0,
                ),
              )
            ],
          ),
          body: body,
        ),
      ),
    );
  }
}
