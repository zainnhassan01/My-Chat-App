import 'package:flutter/material.dart';

class ProviderClass extends ChangeNotifier{
  bool _loading = false;
  bool get loading => _loading;
  void setLoading(bool value){
    _loading = value;
    notifyListeners();
  }
}