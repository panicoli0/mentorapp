import 'package:afterparty/User/model/user.dart';
import 'package:afterparty/User/ui/widgets/button_bar.dart';
import 'package:afterparty/User/ui/widgets/gradient_back.dart';
import 'package:afterparty/User/ui/widgets/profile_background.dart';
import 'package:afterparty/User/ui/widgets/user_info.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:afterparty/User/bloc/bloc_user.dart';

class ProfileHeader extends StatelessWidget {
  UserBloc userBloc;
  User user;
  static String id = 'profile_header';

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: userBloc.streamFirebase,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.active:
          case ConnectionState.done:
            return showProfileData(snapshot);
        }
      },
    );
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      print("No logueado");
      return Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(children: <Widget>[
          CircularProgressIndicator(),
          Text('No se pudo cargar, hace login'),
        ]),
      );
    } else {
      print("Logueado");
      print(snapshot.data);
      user = User(
        name: snapshot.data.displayName,
        email: snapshot.data.email,
        photoURL: snapshot.data.photoUrl,
      );
      final title = Text(
        'Profile',
        style: TextStyle(
            fontFamily: 'Lato',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0),
      );
      return Stack(
        children: <Widget>[
          GradientBack(
            height: 300.0,
          ),
          Container(
            margin: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 50.0,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[title],
                ),
                ButtonsBar(),
                UserInfo(user),
              ],
            ),
          ),
        ],
      );
    }
  }
}
