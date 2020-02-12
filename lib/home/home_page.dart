import 'package:flutter/material.dart';

import '../universal/dev_scaffold.dart';
import 'index.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    var _homeBloc = HomeBloc();

    return DevScaffold(
      title: "Home",
      body: HomeScreen(
        homeBloc: _homeBloc,
      ),
    );
  }
}
