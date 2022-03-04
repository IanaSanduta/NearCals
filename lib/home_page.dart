import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nearcals/classes/userClass.dart';
import 'package:nearcals/net/userData.dart';
import 'package:nearcals/profile.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Define authentication function

  void authLongOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Home()));
  }

  @override
  Widget build(BuildContext context) {
    pullUserData();
    String? userName = currentUser.getUserName();
    String? userEmail = currentUser.getEmail();
    userName ??= FirebaseAuth.instance.currentUser?.displayName;
    userEmail ??= FirebaseAuth.instance.currentUser?.email;
    print(FirebaseAuth.instance.currentUser?.displayName);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(userName!),
                accountEmail: Text(userEmail!),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.asset(
                      'resources/default_user.png',
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  //image: const DecorationImage(image: AssetImage('resources/drawer.jpg'), fit: BoxFit.cover),
                ),
              ),
              ListTile(
                iconColor: Colors.blue.shade900,
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile()),),
              ),
              ListTile(
                iconColor: Colors.blue.shade900,
                leading: Icon(Icons.map),
                title: Text('Map'),
                onTap: () => print('map'),
              ),
              ListTile(
                iconColor: Colors.blue.shade900,
                leading: Icon(Icons.local_dining),
                title: Text('Calories'),
                onTap: () => print('calories'),
              ),
              ListTile(
                iconColor: Colors.blue.shade900,
                leading: Icon(Icons.favorite),
                title: Text('Favorites'),
                onTap: () => print('favorite'),
              ),
              const Divider(),
              ListTile(
                iconColor: Colors.blue.shade900,
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () => print('Settings'),
              ),
              ListTile(
                iconColor: Colors.blue.shade900,
                leading: Icon(Icons.description),
                title: Text('Guide'),
                onTap: () => print('guide'),
              ),
              const Divider(),
              ListTile(
                iconColor: Colors.blue.shade900,
                leading: Icon(Icons.exit_to_app),
                title: Text('Exit'),
                onTap: authLongOut,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
