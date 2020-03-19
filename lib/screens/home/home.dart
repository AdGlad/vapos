
import 'package:vapos/models/vape.dart';
import 'package:vapos/screens/home/settings_form.dart';
import 'package:vapos/screens/home/vape_list.dart';
import 'package:vapos/services/auth.dart';
import 'package:vapos/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

  
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

    return  StreamProvider<List<Vape>>.value(
          value: DatabaseService().vapes,
          child: Scaffold(
        backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('Vapos'),
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        actions: <Widget>[
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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/vbackground.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: VapeList()
        ),
      ),
    );
  }
}