import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_docs/API/api_page.dart';
import 'package:flutter_docs/Authentication/account_page.dart';
import 'package:flutter_docs/Form/form_page.dart';
import 'package:flutter_docs/Future-Builder/future_builder_page.dart';
import 'package:flutter_docs/Grid/grid_page.dart';
import 'package:flutter_docs/Home/something_went_wrong_page.dart';
import 'package:flutter_docs/ImagePicker/image_picker.dart';
import 'package:flutter_docs/ListView/list_view_page.dart';
import 'package:flutter_docs/Map/map_page.dart';
import 'package:flutter_docs/PopUp/pop_up_page.dart';
import 'package:flutter_docs/Sqflite/sqflite_page.dart';
import 'package:flutter_docs/Steam-Builder/steam_builder_page.dart';
import 'Home/get_started_page.dart';
import 'Home/my_home_page.dart';
import 'Shared-Preference/shared_preference_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFireBase
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return SomethingWentWrongPage();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
                primaryColor: Colors.pink, colorScheme: ColorScheme.dark()),
            home: MyHomePage(),
            routes: {
              ApiPage.routeName: (_) => ApiPage(),
              MapPage.routeName: (_) => MapPage(),
              FormPage.routeName: (_) => FormPage(),
              GridPage.routeName: (_) => GridPage(),
              PopUpPage.routeName: (_) => PopUpPage(),
              SqflitePage.routeName: (_) => SqflitePage(),
              AccountPage.routeName: (_) => AccountPage(),
              ListViewPage.routeName: (_) => ListViewPage(),
              GetStartedPage.routeName: (_) => GetStartedPage(),
              ImagePickerPage.routeName: (_) => ImagePickerPage(),
              SteamBuilderPage.routeName: (_) => SteamBuilderPage(),
              FutureBuilderPage.routeName: (_) => FutureBuilderPage(),
              SharedPreferencePage.routeName: (_) => SharedPreferencePage()
            },
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
