
import 'package:flutter/material.dart';

class Newsfeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Newsfeed Page'),
        //backgroundColor: Colors.redAccent,
      ),
             body: Container(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Image(
                          image: AssetImage('assets/News.png'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }