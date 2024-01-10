import 'dart:convert';

import 'package:fair/fair.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestListViewIndexDelegate extends FairDelegate {
  @override
  Map<String, Function> bindFunction() {
    var func = super.bindFunction();
    func.addAll({
      'issueTaskCount': get_issueTasksLength,
    });
    return func;
  }

  @override
  Map<String, PropertyValue> bindValue() {
    var value = super.bindValue();
    value.addAll({'issueTasks': () => _issueTasks});
    return value;
  }

  List _issueTasks = ['1', '2'];

  int get_issueTasksLength() {
    return _issueTasks.length;
  }
}
