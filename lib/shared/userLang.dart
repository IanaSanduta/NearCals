// ignore_for_file: file_names

import 'package:nearcals/classes/userClass.dart';

final List langList = ['English', 'Español', 'Japanese'];
String text(String word) {
  String result = '';
  final Map<String, Map<String, String>> langLib = {
    // English
    langList[0]: {
      'Home': 'Home',
      'Profile': 'Profile',
      'Map': 'Map',
      'Calories': 'Calories',
      'Favorites': 'Favorites',
      'Settings': 'Settings',
      'Guide': 'Guide',
      'Logout': 'Logout',
      'Email': 'Email',
      'Username': 'Username',
      'Daily Calories': 'Daily Calories',
      'Save': 'Save',
      'Foodie Map': 'Foodie Map',
      'Sign Up': 'Sign Up',
      'Login': 'Login',
      'Language': 'Language',
      'General': 'General',
      'GENERAL': 'GENERAL',
      'Apply': 'Apply',
      'Update Successful': 'Update Successful',
      'Apply Settings': 'Apply Settings',
      'Total Calories today': 'Total Calories today'
    },

    // Spanish / Español
    // I used Google Translate for this:
    // Someone who actually knows Spanish should proabably fill this out :^)
    langList[1]: {
      'Home': 'Hogar',
      'Profile': '.',
      'Map': '.',
      'Calories': '.',
      'Favorites': '.',
      'Settings': 'Configuración',
      'Guide': '.',
      'Logout': '.',
      'Email': '.',
      'Username': '.',
      'Daily Calories': '.',
      'Save': '.',
      'Foodie Map': '.',
      'Sign Up': '.',
      'Login': '.',
      'Language': 'Idioma',
      'General': '.',
      'GENERAL': '.',
      'Apply': 'Aplicar',
      'Update Successful': 'Actualización correcta',
      'Apply Settings': '.',
      'Total Calories today': '.'
    },

    langList[2]: {
      'Home': '.',
      'Profile': '.',
      'Map': '.',
      'Calories': '.',
      'Favorites': '.',
      'Settings': '.',
      'Guide': '.',
      'Logout': '.',
      'Email': '.',
      'Username': '.',
      'Daily Calories': '.',
      'Save': '.',
      'Foodie Map': '.',
      'Sign Up': '.',
      'Login': '.',
      'Language': '.',
      'General': '.',
      'GENERAL': '.',
      'Apply': '.',
      'Update Successful': '.',
      'Apply Settings': '.',
      'Total Calories today': '.'
    },

    // Do Not delete rows below its used as a guide to add more languages.
    /*
    langList[.]: {
      'Home': '.',
      'Profile': '.',
      'Map': '.',
      'Calories': '.',
      'Favorites': '.',
      'Settings': '.',
      'Guide': '.',
      'Logout': '.',
      'Email': '.',
      'Username': '.',
      'Daily Calories':'.',
      'Save':'.',
      'Foodie Map': '.',
      'Sign Up':'.',
      'Login': '.',
      'Language':'.',
      'General':'.',
      'GENERAL':'.',
      'Apply':'.',
      'Update Successful':'.',
      'Apply Settings': '.',
      'Total Calories today': '.'
    },*/
  };
  try {
    Map<String, String>? languageLibrary = langLib[currentUser.getUserLang()];
    result = languageLibrary![word] as String;
    if (result == '.' || result == null) {
      result = 'Word is not in Library';
    }
  } catch (e) {
    //this will probably never run
    result = 'Language not in Library';
  }
  return result;
}
