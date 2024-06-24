import 'package:flutter/material.dart';
import 'package:teamlead/db/officer_database.dart';
import 'package:teamlead/models/officer.dart';
import 'package:teamlead/page/officer_detail_page.dart';

class OfficersPage extends StatefulWidget {
  @override 
  _OfficersPageState createState() => _OfficersPageState();
}

class _OfficersPageState extends State<OfficersPage> {
  late List<Officer> officers;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshOfficers();
  }

  @override  
  void dispose() {
    OfficersDatabase.instance.close();

    super.dispose();
  }

  Future refreshOfficers() async {
    setState(() => isLoading = true);

    this.officers = await OfficersDatabase.instance.readAllOfficers();

    setState(() => isLoading = false);
  }

  @override  
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(
        'Officers',
        style: TextStyle(fontSize: 24),
      ),
      actions: [Icon(Icons.search)],
    ),
    body: Center(
      child: isLoading 
        ? CircularProgressIndicator() 
        : officers.isEmpty
          ? Text('No Officers',
            style: TextStyle(color: Colors.white,)
            )
          :buildOfficers()
    ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.black,
      child: Icon(Icons.add),
      onPressed: () async {
        await Navigator.of(context).push(MaterialPageRoute(builder: context) => AddEdit)
      }
      ),
  )
}