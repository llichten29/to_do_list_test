import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

List<ToDoListRecord> orderBy(
  List<ToDoListRecord> toDoList,
  bool orderByName,
  bool descending,
) {
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
  if (descending) return toDoList.reversed.toList();

  return toDoList;
}
