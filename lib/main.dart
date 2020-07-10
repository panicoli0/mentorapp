import 'package:afterparty/User/bloc/bloc_user.dart';
import 'package:afterparty/User/ui/screens/profile_header.dart';
import 'package:afterparty/User/ui/screens/profile_tab.dart';
import 'package:afterparty/User/ui/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Quicksand',
          primarySwatch: Colors.lightBlue,
        ),
        home: HomeScreen(),
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          SignInScreen.id: (context) => SignInScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          HomeScreen.id: (context) => HomeScreen(),
//          ProfileHeader.id: (context) => ProfileHeader(),
//          ProfileTab.id: (context) => ProfileTab(),
        },
      ),
      bloc: UserBloc(),
    );
  }
}
