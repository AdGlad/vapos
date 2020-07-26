
import 'package:flutter/material.dart';
import 'NewsListView.dart';

class Newsfeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Newsfeed Page'),
        //backgroundColor: Colors.redAccent,
      ),
        body: Center(
             child: NewsListView()
              ),
      );
      }
    }

 