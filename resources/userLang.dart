import 'package:flutter/material.dart';
import 'package:nearcals/classes/userClass.dart';

Text text(String word) {
  String result = '';
  Map<String, Map<String, String>> langLib = {
    'English': {
      'Home': 'Home',
      'Profile': 'Profile',
      'Map': 'Map',
      'Calories': 'Calories',
      'Favorites': 'Favorites',
      'Settings': 'Settings',
      'Guide': 'Guide'
    },
    'Spanish': {
      'Home': '.',
      'Profile': '.',
      'Map': '.',
      'Calories': '.',
      'Favorites': '.',
      'Settings': '.',
      'Guide': '.'
    },
    //Do Not delet rows below its used as a guide to add more languages.
    'Language': {
      'Home': '.',
      'Profile': '.',
      'Map': '.',
      'Calories': '.',
      'Favorites': '.',
      'Settings': '.',
      'Guide': '.'
    }
  };
  //result = langLib.containsKey(currentUser.getUserLang()).containsValue();
  return Text(result);
}
