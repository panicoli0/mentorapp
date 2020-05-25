import 'package:educational/User/bloc/bloc_user.dart';
import 'package:educational/User/model/user.dart';
import 'package:educational/User/ui/screens/details.dart';
import 'package:educational/User/ui/screens/profile_header.dart';
import 'package:educational/User/ui/widgets/gradient_back.dart';
import 'package:educational/User/ui/widgets/profile_background.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ProfileTab extends StatelessWidget {
  static String id = 'profile_tab';
//  UserBloc userBloc;
//  User user;

  @override
  Widget build(BuildContext context) {
//    userBloc = BlocProvider.of<UserBloc>(context);
    // TODO: implement build
    /*return Container(
      color: Colors.indigo,
    );*/
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            ProfileHeader(),
//          ProfilePlacesList() ACA VA LA LISTA DE CURSOS Agregados por ese usuario
          ],
        ),
      ],
    );
  }
}
