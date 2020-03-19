import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vapos/models/vape.dart';
import 'package:vapos/screens/home/vape_tile.dart';

class VapeList extends StatefulWidget {
  @override
  _VapeListState createState() => _VapeListState();
}

class _VapeListState extends State<VapeList> {
  @override
  Widget build(BuildContext context) {

    final vapes = Provider.of<List<Vape>>(context) ?? [];
    //print(vapes.documents);
    vapes.forEach((vape) { 
      print(vape.name);
     print(vape.sex);
     print(vape.dob);
     print(vape.strength);
     print(vape.startdate);
     print(vape.frequency);
    });
    
    return ListView.builder(
      itemCount: vapes.length,
      itemBuilder: (context,index){
        return VapeTile(vape: vapes[index]);
      },
      
    );
  }
}
