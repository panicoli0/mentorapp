import 'package:educational/User/ui/screens/profile_header.dart';
import 'package:educational/cupertino_bar.dart';
import 'package:flutter/material.dart';
import 'package:educational/User/ui/screens/home.dart';
//import 'package:platzi_trips_app/Place/ui/screens/home_trips.dart';
//import 'package:platzi_trips_app/Place/ui/screens/search_trips.dart';
//import 'package:platzi_trips_app/User/ui/screens/profile_trips.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProfilePage();
  }
}

class _ProfilePage extends State<ProfilePage> {
  int indexTap = 0;
  final List<Widget> widgetsChildren = [
    HomeScreen(),
//    SearchTrips(),  / ACA VA EL SEARCH
    ProfileHeader()
  ];

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Colors.white, primaryColor: Colors.purple),
        child: BottomNavigationBar(
            onTap: onTapTapped,
            currentIndex: indexTap,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), title: Text("")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text("")),
            ]),
      ),
    );
  }
}
