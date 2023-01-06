import 'dart:ffi';

import 'package:demoapp/second_screen.dart';
import 'package:demoapp/watsapp_Calls.dart';
import 'package:demoapp/watsapp_Status.dart';
import 'package:demoapp/watsapp_camera.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
        primaryColor: new Color(0xff075e54),
        accentColor: new Color(0xff25d366)),
    home: Myapp(),
  ));
}

class Myapp extends StatefulWidget {
  const Myapp({Key key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 4, vsync: this, initialIndex: 1)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('watsapp'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
          ),
          IconButton(icon: Icon(Icons.more_vert, color: Colors.white)),
        ],
        bottom: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: 'chat',
            ),
            Tab(
              text: 'status',
            ),
            Tab(
              text: 'calls',
            )
          ],
        ),
      ),
      body: new TabBarView(
        controller: _controller,
        children: <Widget>[
          Container(
            color: Colors.red,
          ),
          new secondscreen(),
          new watsappstatus(),
          new watsappcalls(),
        ],
      ),
      floatingActionButton: _controller.index == 1
          ? FloatingActionButton(
              child: Icon(
                Icons.camera,
                color: Colors.white,
              ),
            )
          : FloatingActionButton(
              child: Icon(Icons.message, color: Colors.white),
            ),
    );
  }
}
