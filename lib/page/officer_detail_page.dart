import 'package:flutter/material.dart';
import 'package:teamlead/db/officer_database.dart';
import 'package:teamlead/models/officer.dart';
import 'package:teamlead/page/edit_officer_page.dart';

class OfficerDetailPage extends StatefulWidget {
  final int officerId;

  const OfficerDetailPage({
    Key? key,
    required this.officerId,
  }) : super(key: key);

  @override
  _OfficerDetailPageState createState() => _OfficerDetailPageState();
}

class _OfficerDetailPageState extends State<OfficerDetailPage> {
  late Officer officer;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshOfficer();
  }

  Future refreshOfficer() async {
    setState(() => isLoading = true);

    officer = await OfficersDatabase.instance.readOfficer(widget.officerId);

    setState(() => isLoading = false );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      actions: [editButton(), deleteButton()],
      ),
      body: isLoading
        ? Center(child: CircularProgressIndicator())
        : Padding(
          padding: EdgeInsets.all(12),
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 8),
            children: [
              Text(
                officer.firstName + '' + officer.lastName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8,)
            ],
          ),
          )
  );

  Widget editButton() => IconButton(
    icon: Icon(Icons.edit_outlined),
    onPressed: () async {
      if(isLoading) return;

      await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AddEditOfficerPage(officer: officer),
      ));
      refreshOfficer();
    });

  Widget deleteButton() => IconButton(
    icon: Icon(Icons.delete),
    onPressed: () async {
      await OfficersDatabase.instance.delete(widget.officerId);

      Navigator.of(context).pop();
    }, 
    );
}