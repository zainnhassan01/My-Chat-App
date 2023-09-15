import 'package:flutter/material.dart';
import 'package:mychatproject/data%20models/usermodel.dart';

class ProviderClass extends ChangeNotifier{
  bool _loading = false;
  bool get loading => _loading;
  void setLoading(bool value){
    _loading = value;
    notifyListeners();
  }
  List<UserModel> _searchList = [];
  List<UserModel> get searchList => _searchList;
  void setsearchList(List<UserModel> list){
    _searchList = list;
    print(_searchList);
    notifyListeners();
  }
  //Strings for updating user edit profile information
  String _name = "";
  String get name => _name;
  void setName (String value){
    _name = value;
    notifyListeners();
  }
  String _about = "";
  String get about => _about;
  void setAbout (String value){
    _about = value;
    notifyListeners();
  }
  UserModel? _personalUser; 
  UserModel? get personalUser => _personalUser;
  void setPersonalUser(UserModel user){
    _personalUser = user;
    notifyListeners();
  }
}