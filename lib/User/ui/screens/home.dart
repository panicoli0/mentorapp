import 'package:afterparty/User/bloc/bloc_user.dart';
import 'package:afterparty/User/ui/screens/profile_header.dart';
import 'package:afterparty/User/ui/screens/profile_tab.dart';
import 'package:afterparty/cupertino_bar.dart';
import 'package:afterparty/global.dart';
import 'package:afterparty/User/ui/widgets/partycontainer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  static String id = 'home';
//  static String id1 = 'profile_tab';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;

  void initState() {
    super.initState();
    getCurrentUser();
  }

  FirebaseUser loggedInUser;

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 15.0,
            ),
//            Center(
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  IconButton(
//                    alignment: Alignment.centerRight,
//                    icon: Icon(Icons.person),
//                    onPressed: () {
////                      Navigator.pushNamed(context, ProfileTab.id);
//                      return BlocProvider<UserBloc>(
//                        bloc: UserBloc(),
//                        child: ProfileTab(),
//                      );
//                    },
//                  ),
//                  Container(
//                    padding: EdgeInsets.all(15.0),
//                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(15.0),
//                      color: Colors.black,
//                    ),
//                    child: Text(
//                      "BOZEN",
//                      style: Theme.of(context)
//                          .textTheme
//                          .title
//                          .apply(fontWeightDelta: 2, color: Colors.white),
//                    ),
//                  ),
//                  IconButton(
//                    alignment: Alignment.centerRight,
//                    icon: Icon(Icons.exit_to_app),
//                    onPressed: () {
//                      _auth.signOut();
//                      Navigator.pop(context);
//                    },
//                  ),
//                ],
//              ),
////            ),

            Divider(),
            Container(
              // This is the Horizontal menu - It could be a separate widget, but it's not.
              margin: EdgeInsets.only(top: 15.0),
              height: 39,
              child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, i) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 90),
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 9.0),
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      decoration: BoxDecoration(
                        color: categories[i]['color'],
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      child: Text(
                        "${categories[i]['name']}",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle
                            .apply(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Party Rooms",
                style:
                    Theme.of(context).textTheme.title.apply(fontWeightDelta: 2),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: partys.length,
                itemBuilder: (ctx, i) {
                  return PartyContainer(index: i);
                },
              ),
            ),
//            Divider(),
          ],
        ),
      ),
    );
  }
}
