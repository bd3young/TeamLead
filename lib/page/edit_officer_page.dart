import 'package:flutter/material.dart';
import 'package:teamlead/db/officer_database.dart';
import 'package:teamlead/models/officer.dart';

class AddEditOfficerPage extends StatefulWidget {
  final Officer? officer;

  const AddEditOfficerPage({
    Key? key,
    this.officer,
  }) : super (key: key);
  @override
  State<AddEditOfficerPage> createState() => _AddEditOfficerPageState();
}

class _AddEditOfficerPageState extends State<AddEditOfficerPage> {
  final _formKey = GlobalKey<FormState>();
  late String firstName;
  late String lastName;
  late String rdoOne;
  late String rdoTwo;
  late String rdoThree;
  late String sex;
  late String rank;
  late String shift;  
  late TimeOfDay shiftBegin;
  late TimeOfDay shiftEnd;
  late bool fullTime;
  late bool admin;

  @override
  void initState() {
    super.initState();

    firstName = widget.officer?.firstName ?? '';
    lastName = widget.officer?.lastName ?? '';
    rdoOne = widget.officer?.rdoOne  ?? '';
    rdoTwo = widget.officer?.rdoTwo  ?? '';
    rdoThree = widget.officer?.rdoThree  ?? '';
    sex = widget.officer?.sex  ?? '';
    rank = widget.officer?.rank  ?? '';
    shift = widget.officer?.shift  ?? '';
    shiftBegin = widget.officer?.shiftBegin  ?? TimeOfDay(hour: 12, minute: 00);
    shiftEnd = widget.officer?.shiftEnd  ?? TimeOfDay(hour: 12, minute: 00);
    fullTime = widget.officer?.fullTime ?? true;
    admin = widget.officer?.admin ?? false;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [buildButton()],
        ),
        body: Form(
          key: _formKey,
          child: OfficerFormWidget(
            firstName: firstName,
            lastName: lastName,
            rdoOne: rdoOne,
            rdoTwo: rdoTwo,
            rdoThree: rdoThree,
            sex: sex,
            rank: rank,
            shift: shift,
            shiftBegin: shiftBegin,
            shiftEnd: shiftEnd,
            fullTime: fullTime,
            admin: admin,
            onChangedFirstName: (firstName) => setState(() => this.firstName = firstName),
            onChangedLastName: (lastName) => setState(() => this.lastName = lastName),
            onChangedRdoOne: (rdoOne) => setState(() => this.rdoOne = rdoOne),
            onChangedRdoTwo: (rdoTwo) => setState(() => this.rdoTwo = rdoTwo),
            onChangedRdoThree: (rdoThree) => setState(() => this.rdoThree = rdoThree),
            onChangedSex: (sex) => setState(() => this.sex = sex),
            onChangedRank: (rank) => setState(() => this.rank = rank),
            onChangedShift: (shift) => setState(() => this.shift = shift),
            onChangedShiftBegin: (shiftBegin) => setState(() => this.shiftBegin = shiftBegin),
            onChangedShiftEnd: (shiftEnd) => setState(() => this.shiftEnd = shiftEnd),
            onChangedFullTime: (fullTime) => setState(() => this.fullTime = fullTime),
            onChangedAdmin: (admin) => setState(() => this.admin = admin),
          ),
        ),
      );

  Widget buildButton() {
    final isFormValid = firstName.isNotEmpty 
    && lastName.isNotEmpty 
    && rdoOne.isNotEmpty 
    && rdoTwo.isNotEmpty 
    && sex.isNotEmpty 
    && rank.isNotEmpty 
    && shift.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: isFormValid ? null : Colors.grey.shade700,
        ),
        onPressed: addOrUpdateOfficer,
        child: const Text('Save'),
      ),
    );
  }

  void addOrUpdateOfficer() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.officer != null;

      if (isUpdating) {
        await updateOfficer();
      } else {
        await addOfficer();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateOfficer() async {
    final officer = widget.officer!.copy(
      firstName: firstName,
      lastName: lastName,
      rdoOne: rdoOne,
      rdoTwo: rdoTwo,
      rdoThree: rdoThree,
      sex: sex,
      rank: rank,
      shift: shift,
      shiftBegin: shiftBegin,
      shiftEnd: shiftEnd,
      fullTime: fullTime,
      admin: admin,
    );

    await OfficersDatabase.instance.update(officer);
  }

  Future addOfficer() async {
    final officer = Officer(
      breakNumber: 0,
      firstName: firstName,
      lastName: lastName,
      rdoOne: rdoOne,
      rdoTwo: rdoTwo,
      rdoThree: rdoThree,
      sex: sex,
      rank: rank,
      shift: shift,
      notes: '',
      shiftBegin: shiftBegin,
      shiftEnd: shiftEnd,
      fullTime: fullTime,
      breakOne: false,
      breakTwo: false,
      lunch: false,
      admin: admin,
      lv: false,
      ehs: false,
    );

    await OfficersDatabase.instance.create(officer);
  }
}