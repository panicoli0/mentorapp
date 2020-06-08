import 'package:educational/Courses/ui/screens/search_page.dart';
import 'package:educational/User/ui/screens/home.dart';
import 'package:educational/User/ui/screens/profile_header.dart';
import 'package:educational/User/ui/screens/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'User/bloc/bloc_user.dart';

class CupertinoBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.indigo), title: Text("")),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore, color: Colors.indigo), title: Text("")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.indigo), title: Text("")),
        ]),
        // ignore: missing_return
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) => HomeScreen(),
              );
              break;
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) => SearchCourses(),
              );
              break;
            case 2:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return BlocProvider<UserBloc>(
                    // ignore: missing_return
                    bloc: UserBloc(),
                    child: ProfileHeader(),
                  );
                },
              );
              break;
            // ignore: missing_return
          }
        },
      ),
    );
  }
}
