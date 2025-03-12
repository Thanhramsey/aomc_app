import 'package:flutter/material.dart';

class SyncProvider extends ChangeNotifier {
  Map<String, dynamic>? data;

  void updateData(Map<String, dynamic> newData) {
    data = newData;
    notifyListeners();
  }
}