import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/home.dart';

import 'addNote.dart';

void main() => runApp(Myapp());


class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SQFLITE Tutorial',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Home(),
    );
  }
}