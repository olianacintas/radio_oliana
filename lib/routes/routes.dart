import 'package:flutter/material.dart';
import 'package:radio_oliana/screens/radio_favoritos_screen.dart';
import 'package:radio_oliana/screens/radio_list_screen.dart';

class AppRoutes {
  static const mainScreen = 'radio_screen';
  static const favoritesScreen = 'radio_screen';

  static Map<String, Widget Function(BuildContext)> routes = {
    'radio_screen': (BuildContext context) => const RadioListScreen(),
    'favorites_screen': (BuildContext context) => const RadioFavoritesScreen(),
  };
}
