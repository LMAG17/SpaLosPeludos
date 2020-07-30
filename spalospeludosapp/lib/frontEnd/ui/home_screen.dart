import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spalospeludosapp/backend/bloc/agended_dates_bloc/agended_dates_bloc.dart';
import 'package:spalospeludosapp/backend/bloc/complete_dates_bloc/complete_dates_bloc.dart';
import 'package:spalospeludosapp/backend/bloc/user_form_bloc/bloc.dart';
import 'package:spalospeludosapp/backend/bloc/user_form_bloc/userform_bloc.dart';
import 'package:spalospeludosapp/backend/repository/agended_dates_repository.dart';
import 'package:spalospeludosapp/backend/repository/completed_dates_repository.dart';
import 'package:spalospeludosapp/backend/repository/form_repository.dart';
import 'package:spalospeludosapp/frontEnd/pages/agended_dates_page.dart';
import 'package:spalospeludosapp/frontEnd/pages/client_form_page.dart';
import 'package:spalospeludosapp/frontEnd/pages/completed_dates_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    PageController _pagina = PageController(
      initialPage: 0,
    );
    GlobalKey _bottomNavigationKey = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        title: Text("Spa Los Peludos"),
      ),
      body: PageView(
        onPageChanged: (v) {
          final CurvedNavigationBarState navBarState =
              _bottomNavigationKey.currentState;
          navBarState.setPage(v);
        },
        controller: _pagina,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 40, left: 20, right: 20),
            child: BlocProvider<UserFormBloc>(
              create: (BuildContext context) =>
                  UserFormBloc(userFormRepository: UserFormRepository())
                    ..add(LoadUserForm()),
              child: ClientFormsPage(),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 40, left: 20, right: 20),
            child: BlocProvider<AgendedDatesBloc>(
              create: (BuildContext context) => AgendedDatesBloc(
                  agendedDatesRepository: AgendedDatesRepository())
                ..add(LoadAgendedDates()),
              child: AgendedDatesPage(),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 40, left: 20, right: 20),
            child: BlocProvider<CompletedDatesBloc>(
              create: (BuildContext context) => CompletedDatesBloc(
                  completeDatesRepository: CompletedDatesRepository())
                ..add(LoadCompletedDates()),
              child: CompletedDatesPage(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        backgroundColor: Theme.of(context).primaryColor,
        items: <Widget>[
          Icon(
            Icons.room_service,
            size: 30,
          ),
          Icon(
            Icons.perm_contact_calendar,
            size: 30,
          ),
          Icon(
            Icons.check_box,
            size: 30,
          ),
        ],
        onTap: (index) {
          _pagina.jumpToPage(index);
        },
      ),
    );
  }
}
