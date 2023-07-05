// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<ToDoListRecord>> orderByAction(
  List<ToDoListRecord> toDoList,
  bool orderByName,
) async {
  if (orderByName) {
    toDoList.sort((a, b) => a.toDoName.compareTo(b.toDoName));
  } else {
    toDoList.sort((a, b) {
      final aDate = a.toDoDate;
      final bDate = b.toDoDate;

      if (aDate == null && bDate == null) {
        return 0;
      } else if (aDate == null) {
        return 1;
      } else if (bDate == null) {
        return -1;
      } else {
        return aDate.compareTo(bDate);
      }
    });
  }

  return toDoList;
}
