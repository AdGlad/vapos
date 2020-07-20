import 'package:provider/provider.dart';
import 'package:vapos/models/user.dart';
import 'package:vapos/services/database.dart';
import 'package:vapos/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vapos/shared/loading.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';


class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}


class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<int> frequency = [0, 5, 10, 15, 20, 25];
  final List<int> strengths = [100, 200, 300, 400, 500, 600, 700, 800, 900];

  String _currentName;
  String _currentSex; 
  String _currentDob;
  int _currentStrength;
  String _currentWhyquit;
  int _currentDailyspend;
  String _currentStartdate;
  int _currentFrequency;

  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context);


    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          UserData userData = snapshot.data;
          return Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget> [
                        Text(
                          'Update your vapping settings.',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          initialValue: userData.name,
                          decoration: InputDecoration(
                               labelText: 'Enter your username'
                              ),
                          validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                          onChanged: (val) => setState(() => _currentName = val),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          initialValue: userData.whyquit,
                          decoration: InputDecoration(
                               labelText: 'Why do you want to quit?'
                              ),
                          validator: (val) => val.isEmpty ? 'Why do you want to quit?' : null,
                          onChanged: (val) => setState(() => _currentWhyquit = val),
                        ),
                        SizedBox(height: 10.0),
                        DropdownButtonFormField(
                            value: _currentFrequency ?? userData.frequency,
                            decoration: InputDecoration(
                                labelText: 'How many time do you vape each day?'
                               ),
                            items: frequency.map((feq) {
                              return DropdownMenuItem(
                                value: feq,
                                child: Text('$feq times'),
                              );
                            }).toList(),
                            onChanged: (val) => setState(() => _currentFrequency = val ),
                          ),
                        SizedBox(height: 10.0),
                        Text(
                          'Nicotine level',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Slider(
                          label: 'Strength of nicotine in your product? ',
                          value: (_currentStrength ?? userData.strength).toDouble(),
                          activeColor: Colors.blue[_currentStrength ?? userData.strength],
                          inactiveColor: Colors.blue[_currentStrength ?? userData.strength],
                          min: 100.0,
                          max: 900.0,
                          divisions: 8,
                          onChanged: (val) => setState(() => _currentStrength = val.round()),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Daily Spend',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Slider(
                          label: 'How much do you spend each day on vaping? ',
                          value: (_currentDailyspend ?? userData.dailyspend).toDouble(),
                          activeColor: Colors.blue[_currentDailyspend ?? userData.dailyspend],
                          inactiveColor: Colors.blue[_currentDailyspend ?? userData.dailyspend],
                          min: 0.0,
                          max: 100.0,
                          divisions: 20,
                          onChanged: (val) => setState(() => _currentDailyspend = val.round()),
                        ),
                        SizedBox(height: 10.0),
                        RaisedButton(
                          color: Colors.pink[400],
                          child: Text(
                            'Update',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            if(_formKey.currentState.validate()){
                              await DatabaseService(uid: user.uid).updateUserData(
                                _currentName ?? snapshot.data.name, 
                                _currentSex ?? snapshot.data.sex, 
                                _currentDob ?? snapshot.data.dob,     
                                _currentStrength ?? snapshot.data.strength, 
                                _currentWhyquit ?? snapshot.data.whyquit, 
                                _currentDailyspend ?? snapshot.data.dailyspend,                                 
                                _currentStartdate ?? snapshot.data.startdate, 
                                _currentFrequency ?? snapshot.data.frequency

                              );
                              Navigator.pop(context);
                              print(_currentName);
                              print( _currentSex);
                              print(_currentDob);
                              print(_currentStrength);
                              print(_currentWhyquit);
                              print(_currentDailyspend);
                              print(_currentStartdate);
                              print(_currentFrequency);
                                              }
                  }
                ),
              ],
            ),
          );
        } else {
          return Loading();
        }
      }
    );
  }
}