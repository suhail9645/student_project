import 'package:flutter/material.dart';

final _nameControllor = TextEditingController();

final _ageControllor = TextEditingController();

final _qualificationControllor = TextEditingController();

final _domainControllor = TextEditingController();

final _phoneControllor = TextEditingController();

List<TextEditingController> controllerList = [
  _nameControllor,
  _ageControllor,
  _qualificationControllor,
  _domainControllor,
  _phoneControllor
];
List<String> listLabel = ['Name', 'Age', 'Qualification', 'Domain', 'Number'];
List<TextInputType> listInputTipe = [
  TextInputType.name,
  TextInputType.number,
  TextInputType.name,
  TextInputType.name,
  TextInputType.number
];
