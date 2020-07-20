
import 'package:flutter/material.dart';

class Health extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health '),
        //backgroundColor: Colors.redAccent,
      ),
             body: Container(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Image(
                          image: AssetImage('assets/Health.png'),
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