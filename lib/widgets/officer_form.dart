import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teamlead/page/shifts_page.dart';
import 'package:teamlead/db/officer_database.dart';

class OfficerFormWidget extends StatelessWidget {
  final String? firstName;
  final String? lastName;
  final String? rdoOne;
  final String? rdoTwo;
  final String? rdoThree;
  final String? sex;
  final String? rank;
  final String? shift;
  final TimeOfDay? shiftBegin;
  final TimeOfDay? shiftEnd;
  final bool? fullTime;
  final bool? admin;
  final ValueChanged<String> onChangedFirstName;
  final ValueChanged<String> onChangedLastName;
  final ValueChanged<String> onChangedRdoOne;
  final ValueChanged<String> onChangedRdoTwo;
  final ValueChanged<String> onChangedRdoThree;
  final ValueChanged<String> onChangedSex;
  final ValueChanged<String> onChangedRank;
  final ValueChanged<String> onChangedShift;
  final ValueChanged<TimeOfDay> onChangedShiftBegin;
  final ValueChanged<TimeOfDay> onChangedShiftEnd;
  final ValueChanged<bool> onChangedFullTime;
  final ValueChanged<bool> onChangedAdmin;

  const OfficerFormWidget({
    Key? key,
    this.firstName = '',
    this.lastName = '',
    this.rdoOne = '',
    this.rdoTwo = '',
    this.rdoThree = '',
    this.sex = '',
    this.rank = '',
    this.shift = '',
    this.shiftBegin = const TimeOfDay(hour: 12, minute: 00),
    this.shiftEnd = const TimeOfDay(hour: 12, minute: 00),
    this.fullTime = true,
    this.admin = false,
    required this.onChangedFirstName,
    required this.onChangedLastName,
    required this.onChangedRdoOne,
    required this.onChangedRdoTwo,
    required this.onChangedRdoThree,
    required this.onChangedSex,
    required this.onChangedRank,
    required this.onChangedShift,
    required this.onChangedShiftBegin,
    required this.onChangedShiftEnd,
    required this.onChangedFullTime,
    required this.onChangedAdmin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Row(
              //   children: [
              //     Checkbox(
              //       value: isImportant ?? false,
              //       onChanged: onChangedImportant,
              //     ),
              //     Expanded(
              //       child: Slider(
              //         value: (number ?? 0).toDouble(),
              //         min: 0,
              //         max: 5,
              //         divisions: 5,
              //         onChanged: (number) => onChangedNumber(number.toInt()),
              //       ),
              //     )
              //   ],
              // ),
              buildFirstName(),
              const SizedBox(height: 8),
              buildLastName(),
              const SizedBox(height: 8),
              buildRdoOne(),
              const SizedBox(height: 8),
              buildRdoTwo(),
              const SizedBox(height: 8),
              buildRdoThree(),
              const SizedBox(height: 8),
              buildSex(),
              const SizedBox(height: 8),
              buildRank(),
              const SizedBox(height: 8),
              buildShift(),
              const SizedBox(height: 8),
              Checkbox(
                value: fullTime ?? true,
                onChanged: onChangedFullTime,
              ),
              const SizedBox(height: 8),
              Checkbox(
                value: admin ?? false,
                onChanged: onChangedAdmin,
              ),
            ],
          ),
        ),
      );

  Widget buildFirstName() => TextFormField(
        maxLines: 1,
        initialValue: firstName,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'First Name',
          hintStyle: TextStyle(color: Colors.black),
        ),
        validator: (firstName) =>
            firstName != null && firstName.isEmpty ? 'The First Name cannot be empty' : null,
        onChanged: onChangedFirstName,
      );

  Widget buildLastName() => TextFormField(
        maxLines: 1,
        initialValue: lastName,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Last Name',
          hintStyle: TextStyle(color: Colors.black),
        ),
        validator: (lastName) =>
            lastName != null && lastName.isEmpty ? 'The Last Name cannot be empty' : null,
        onChanged: onChangedLastName,
      );
  Widget buildRdoOne() => TextFormField(
        maxLines: 1,
        initialValue: rdoOne,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'First Day Off',
          hintStyle: TextStyle(color: Colors.black),
        ),
        validator: (rdoOne) =>
            rdoOne != null && rdoOne.isEmpty ? 'The regular day off cannot be empty' : null,
        onChanged: onChangedRdoOne,
      );
  Widget buildRdoTwo() => TextFormField(
        maxLines: 1,
        initialValue: rdoTwo,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Second Day Off',
          hintStyle: TextStyle(color: Colors.black),
        ),
        validator: (rdoTwo) =>
            rdoTwo != null && rdoTwo.isEmpty ? 'The regular day off cannot be empty' : null,
        onChanged: onChangedRdoTwo,
      );
  Widget buildRdoThree() => TextFormField(
        maxLines: 1,
        initialValue: rdoThree,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Second Day Off',
          hintStyle: TextStyle(color: Colors.black),
        ),
        validator: (rdoThree) =>
            rdoThree != null && rdoThree.isEmpty ? 'The regular day off cannot be empty' : null,
        onChanged: onChangedRdoThree,
      );
  Widget buildSex() => TextFormField(
        maxLines: 1,
        initialValue: sex,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Gender',
          hintStyle: TextStyle(color: Colors.black),
        ),
        validator: (sex) =>
            sex != null && sex.isEmpty ? 'Gender cannot be empty' : null,
        onChanged: onChangedSex,
      );
  Widget buildRank() => TextFormField(
        maxLines: 1,
        initialValue: rank,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Rank',
          hintStyle: TextStyle(color: Colors.black),
        ),
        validator: (rank) =>
            rank != null && rank.isEmpty ? 'Rank cannot be empty' : null,
        onChanged: onChangedRank,
      );
  Widget buildShift() => TextFormField(
        maxLines: 1,
        initialValue: shift,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Gender',
          hintStyle: TextStyle(color: Colors.black),
        ),
        validator: (shift) =>
            shift != null && shift.isEmpty ? 'Shift cannot be empty' : null,
        onChanged: onChangedShift,
      );
  
  // Widget buildShiftBegins(BuildContext context) {
  //       return Center(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             Text("Shift Begins"),
  //             ElevatedButton(
  //               onPressed: () async {
  //                 await showTimePicker(
  //                   context: context, 
  //                   initialTime: TimeOfDay.now(),
  //                   initialEntryMode: TimePickerEntryMode.dial,
  //                   ).then((value) {
  //                     setState(() {
  //                       onChangedShiftBegin = value!;
  //                     }); 
  //                   });
  //               }, 
  //               child: Text("${shiftBegin.hour}:${shiftBegin.minute}"),)
  //           ],
  //         )
  //       )
  //     };
  Widget buildShiftBegin(BuildContext context) => TextFormField(
        maxLines: 1,
        initialValue: shiftBegin.toString(),
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Gender',
          hintStyle: TextStyle(color: Colors.black),
        ),
      );
  Widget buildShiftEnd(BuildContext context) => TextFormField(
        maxLines: 1,
        initialValue: shiftEnd.toString(),
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Gender',
          hintStyle: TextStyle(color: Colors.black),
        ),
      );

      
}