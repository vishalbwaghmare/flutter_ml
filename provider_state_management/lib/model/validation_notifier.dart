import 'package:flutter/material.dart';

class ValidationNotifier extends ChangeNotifier{
  bool _isValid = false;
  String _validationMessage = '';
  Color _iconColor = Colors.blueGrey;
  bool get isValid => _isValid;
  String get validationMessage => _validationMessage;
  Color get iconColor => _iconColor;


  void checkForValidation(String value){
    if(value.contains("@")){
      _isValidCheck();
    }else {
      _isNotValid();
    }
  }

  _isValidCheck(){
    _isValid = true;
    _validationMessage = "Entered email address is valid";
    _iconColor = Colors.green;
    notifyListeners();
  }

  _isNotValid(){
    _isValid = false;
    _validationMessage = "Entered email address is not valid";
    _iconColor = Colors.red;
    notifyListeners();
  }
}