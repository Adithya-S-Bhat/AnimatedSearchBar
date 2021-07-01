import 'package:challenge/circleIcon.dart';
import 'package:challenge/search.dart';
import 'package:challenge/searchButton.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Coding Challenge',
        theme: ThemeData(
          fontFamily: 'ISOCPEUR',
        ),
      initialRoute: '/',
      routes: {
        '/': (context) => Scaffold(backgroundColor: Colors.black,body:Center(child:SearchButton())),
        '/searchBar': (context) => Scaffold(backgroundColor: Colors.black,body:Center(child:Search())),
        //add so on
      },
    );
  }
}

