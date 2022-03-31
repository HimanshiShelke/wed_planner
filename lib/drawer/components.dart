import 'package:flutter/material.dart';
import 'package:wed_planner/drawer/addbody.dart';

class AddComponents extends StatefulWidget {
  const AddComponents({Key? key}) : super(key: key);

  @override
  _AddComponentsState createState() => _AddComponentsState();
}

class _AddComponentsState extends State<AddComponents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Vendors'),
      ),
      body: AddBody(),
    );
  }
}
