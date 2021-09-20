import 'package:flutter/material.dart';
import 'package:flutter_docs/API/api_page.dart';
import 'package:flutter_docs/Authentication/account_page.dart';
import 'package:flutter_docs/Form/form_page.dart';
import 'package:flutter_docs/Future-Builder/future_builder_page.dart';
import 'package:flutter_docs/Grid/grid_page.dart';
import 'package:flutter_docs/Home/get_started_page.dart';
import 'package:flutter_docs/Home/model/page.model.dart';
import 'package:flutter_docs/ImagePicker/image_picker.dart';
import 'package:flutter_docs/ListView/list_view_page.dart';
import 'package:flutter_docs/Map/map_page.dart';
import 'package:flutter_docs/PopUp/pop_up_page.dart';
import 'package:flutter_docs/ProviderSection/provider_page.dart';
import 'package:flutter_docs/Shared-Preference/shared_preference_page.dart';
import 'package:flutter_docs/Sqflite/sqflite_page.dart';
import 'package:flutter_docs/Steam-Builder/steam_builder_page.dart';

List<Section> sections = [
  Section(name: "Get Started", color: Color(0xff94ffd8), routeName: GetStartedPage.routeName),
  Section(name: "API", color: Color(0xffe196ff), routeName: ApiPage.routeName),
  Section(name: "Form", color: Color(0xff94ffd8), routeName: FormPage.routeName),
  Section(name: "ListView", color: Color(0xff94ffd8), routeName: ListViewPage.routeName),
  Section(name: "Pop Up", color: Color(0xff9874f2), routeName: PopUpPage.routeName),
  Section(name: "Grid", color: Color(0xffe196ff), routeName: GridPage.routeName),
  Section(
      name: "Authentication", color: Color(0xff6b6b6b), routeName: AccountPage.routeName),
  Section(name: "Map", color: Color(0xff9dff94), routeName: MapPage.routeName),
  Section(name: "Provider", color: Color(0xff538ee0), routeName: ProviderPage.routeName),
  Section(name: "Sqflite", color: Color(0xff94ffd8), routeName: SqflitePage.routeName),
  Section(
      name: "ImagePicker", color: Color(0xff6b6b6b), routeName: ImagePickerPage.routeName),
  Section(
      name: "FutureBuilder",
      color: Color(0xfff2938d),
      routeName: FutureBuilderPage.routeName),
  Section(
      name: "SteamBuilder", color: Color(0xff9874f2), routeName: SteamBuilderPage.routeName),
  Section(
      name: "SharedPreference", color: Color(0xff9874f2), routeName: SharedPreferencePage.routeName),
];
