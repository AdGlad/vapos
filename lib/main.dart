import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vapos/models/user.dart';
import 'package:vapos/screens/wapper.dart';
import 'package:vapos/services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Wrapper(),
      ),
    );
  }
}
