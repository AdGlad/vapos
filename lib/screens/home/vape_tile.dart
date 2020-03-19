import 'package:flutter/material.dart';
import 'package:vapos/models/vape.dart';

class VapeTile extends StatelessWidget {
  final Vape vape;
  VapeTile({this.vape});

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.blue[vape.strength],
            backgroundImage: AssetImage('assets/atomizer.png'),
            ),
            title: Text(vape.name),
            subtitle: Text('Started on ${vape.startdate}.'),
            ),
            )
      );
  }
}
