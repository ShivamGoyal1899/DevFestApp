import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../agenda/agenda_page.dart';
import '../config/config_bloc.dart';
import '../config/config_state.dart';
import '../home/home_page.dart';
import '../speakers/speaker_page.dart';
import '../sponsors/sponsor_page.dart';
import '../team/team_page.dart';
import '../utils/devfest.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  ConfigBloc configBloc;

  @override
  void initState() {
    super.initState();
    setupApp();
  }

  setupApp() {
    configBloc = ConfigBloc();
    configBloc.darkMode = Devfest.prefs.getBool(Devfest.darkModePref) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => configBloc,
      child: BlocBuilder<ConfigBloc, ConfigState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Google Devfest',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                fontFamily: Devfest.google_sans_family,
                primarySwatch: Colors.red,
                primaryColor: configBloc.darkMode ? Colors.black : Colors.white,
                disabledColor: Colors.grey,
                cardColor: configBloc.darkMode ? Colors.black : Colors.white,
                canvasColor:
                    configBloc.darkMode ? Colors.black : Colors.grey[50],
                brightness:
                    configBloc.darkMode ? Brightness.dark : Brightness.light,
                buttonTheme: Theme.of(context).buttonTheme.copyWith(
                    colorScheme: configBloc.darkMode
                        ? ColorScheme.dark()
                        : ColorScheme.light()),
                appBarTheme: AppBarTheme(
                  elevation: 0.0,
                )),
            home: HomePage(),
            routes: {
              HomePage.routeName: (context) => HomePage(),
              AgendaPage.routeName: (context) => AgendaPage(),
              SpeakersPage.routeName: (context) => SpeakersPage(),
              TeamPage.routeName: (context) => TeamPage(),
              SponsorPage.routeName: (context) => SponsorPage(),
            },
          );
        },
      ),
    );
  }
}
