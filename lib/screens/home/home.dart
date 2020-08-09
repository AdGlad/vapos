
import 'package:vapos/models/vape.dart';
import 'package:vapos/screens/Vapors/user_list.dart';
import 'package:vapos/screens/home/settings_form.dart';
import 'package:vapos/screens/home/vape_list.dart';
import 'package:vapos/services/auth.dart';
import 'package:vapos/services/database.dart';
import 'package:flutter/material.dart';

import 'homebody.dart';

  
class Home extends  StatelessWidget{
  final AuthService _auth = AuthService();
    
@override
Widget build(BuildContext context) {

  void _showSettingsPanel() {
    showModalBottomSheet(context: context, builder: (context) {
      return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
      );
    });
  }

    return  Scaffold(
        backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('Vapos'),
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        actions: <Widget>[
          //FlatButton.icon(
          //  icon: Icon(Icons.contacts), 
          //  label: Text('Users'),
          //  onPressed: () {
          //      Navigator.push(
          //        context,
          //        MaterialPageRoute(builder: (context) => UserList()),
          //      );
          //  },
          //  ),
          FlatButton.icon(
            icon: Icon(Icons.person), 
            label: Text('Log out'),
            onPressed: () async{
              await _auth.signOut();
            },
            ),
          FlatButton.icon(
            icon: Icon(Icons.settings),
            label: Text('Settings'),
            onPressed: () => _showSettingsPanel(),
            )
        ],
      ),
        body: Homebody(),
        //bottomNavigationBar: BottomNavigationBar (
        //currentIndex: 0, 
        //items: [
        //  BottomNavigationBarItem(
        //   icon: Icon(Icons.person),
        //   title: Text('Vapors')
        //    ),
          //BottomNavigationBarItem(
          // icon: Icon(Icons.info),
          // title: Text('News')
          //  ),
        //],
      //),
      );
  }
}