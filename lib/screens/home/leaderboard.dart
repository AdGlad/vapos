
import 'package:flutter/material.dart';

class Leaderboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard Page'),
        //backgroundColor: Colors.redAccent,
      ),
             body: Container(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Image(
                          image: AssetImage('assets/Leaderboard.png'),
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