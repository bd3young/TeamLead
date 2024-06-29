import 'package:flutter/material.dart';
import 'package:teamlead/models/officer.dart';

class Officers extends StatelessWidget {
  final Officer officer;

  Officers({required this.officer});

  @override
  Widget build( BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 200,
        color: Colors.green,
        child: Center (
          child: Text(
            officer.firstName + officer.lastName,
            style: TextStyle(fontSize: 40),
          )),
        ),
      );
  }
}