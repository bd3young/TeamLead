import 'package:flutter/material.dart';

final String tableOfficers = 'officers';

class OfficerFields {
  static final String id = '_id';
  static final String breakNumber = 'breakNumber';
  static final String firstName = 'firstName';
  static final String lastName = 'lastName';
  static final String rdoOne = 'rdoOne';
  static final String rdoTwo = 'rdoTwo';
  static final String rdoThree = 'rdoThree';
  static final String sex = 'sex';
  static final String rank = 'rank';
  static final String shift = 'shift';
  static final String notes = 'notes';
  static final String shiftBegin = 'shiftBegin';
  static final String shiftEnd = 'shiftEnd';
  static final String fullTime = 'fullTime';
  static final String breakOne = 'breakOne';
  static final String breakTwo = 'breakTwo';
  static final String lunch = 'lunch';
  static final String admin = 'admin';
  static final String lv = 'lv';
  static final String ehs = 'ehs';
}

class Officer {
  final int? id;
  final int breakNumber;  
  final String firstName;
  final String lastName;
  final String rdoOne;
  final String rdoTwo;
  final String rdoThree;
  final String sex;
  final String rank;
  final String shift;  
  final String notes;  
  final TimeOfDay shiftBegin;
  final TimeOfDay shiftEnd;
  final bool fullTime;
  final bool breakOne;
  final bool breakTwo;
  final bool lunch;
  final bool admin;
  final bool lv;
  final bool ehs;

  const Officer({
    this.id,
    required this.breakNumber,
    required this.firstName,
    required this.lastName,
    required this.rdoOne,
    required this.rdoTwo,
    required this.rdoThree,
    required this.sex,
    required this.rank,
    required this.shift,
    required this.notes,
    required this.shiftBegin,
    required this.shiftEnd,
    required this.fullTime,
    required this.breakOne,
    required this.breakTwo,
    required this.lunch,
    required this.admin,
    required this.lv, 
    required this.ehs,
  });

  Officer copy({
    int? id,
    int? breakNumber, 
    String? firstName,
    String? lastName,
    String? rdoOne,
    String? rdoTwo,
    String? rdoThree,
    String? sex,
    String? rank,
    String? shift,  
    String? notes,  
    TimeOfDay? shiftBegin,
    TimeOfDay? shiftEnd,
    bool? fullTime,
    bool? breakOne,
    bool? breakTwo,
    bool? lunch,
    bool? admin,
    bool? lv,
    bool? ehs,
  }) =>
    Officer(
      id: id ?? this.id,
      breakNumber: breakNumber ?? this.breakNumber,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      rdoOne: rdoOne ?? this.rdoOne,
      rdoTwo:  rdoTwo ?? this.rdoTwo,
      rdoThree: rdoThree ?? this.rdoThree,
      sex: sex ?? this.sex,
      rank: rank ?? this.rank,
      shift: shift ?? this.shift,
      notes: notes ?? this.notes,
      shiftBegin: shiftBegin ?? this.shiftBegin,
      shiftEnd: shiftEnd ?? this.shiftEnd,
      fullTime: fullTime ?? this.fullTime,
      breakOne: breakOne ?? this.breakOne,
      breakTwo: breakTwo ?? this.breakTwo,
      lunch: lunch ?? this.lunch,
      admin: admin ?? this.admin,
      lv: lv ?? this.lv,
      ehs: ehs ?? this.ehs,

    );

  Map<String, Object?> toJson() => {
    OfficerFields.id: id,
    OfficerFields.breakNumber: breakNumber,
    OfficerFields.firstName: firstName,
    OfficerFields.lastName: lastName,
    OfficerFields.rdoOne: rdoOne,
    OfficerFields.rdoTwo: rdoTwo,
    OfficerFields.rdoThree: rdoThree,
    OfficerFields.sex: sex,
    OfficerFields.rank: rank,
    OfficerFields.shift: shift,
    OfficerFields.notes: notes,
    OfficerFields.shiftBegin: shiftBegin.toString(),
    OfficerFields.shiftEnd: shiftEnd.toString(),
    OfficerFields.fullTime: fullTime ? 1 :0,
    OfficerFields.breakOne: breakOne ? 1 :0,
    OfficerFields.breakTwo: breakTwo ? 1 :0,
    OfficerFields.lunch: lunch ? 1 :0,
    OfficerFields.admin: admin ? 1 :0,
    OfficerFields.lv: lv ? 1 :0,
    OfficerFields.ehs: ehs ? 1 :0, 

  };

}