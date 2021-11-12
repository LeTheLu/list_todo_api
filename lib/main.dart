import 'dart:async';
import 'package:flutter/material.dart';
import 'package:list_todo_api/router.dart';
import 'package:connectivity/connectivity.dart';
import 'package:list_todo_api/sever.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
  late StreamSubscription subscription;

  bool checkInternet = false;

  @override
  void initState() {
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      switch (result) {
        case ConnectivityResult.none : {
          setState(() {
            checkInternet = false;
          });
          break;
        }
        case ConnectivityResult.wifi : {
          setState(() {
            checkInternet = true;
          });
          break;
        }
        case ConnectivityResult.mobile : {
          setState(() {
            checkInternet = true;
          });
          break;
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return CheckInternet(
      checkInternet: checkInternet,
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RouteName.home,
          onGenerateRoute: Routes.generate,
      ),
    );
  }
}
