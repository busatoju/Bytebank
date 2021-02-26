import 'package:flutter/material.dart';

class Balance extends ChangeNotifier{

  double value;

  Balance(this.value);

  void add(double value){
    this.value += value;

    notifyListeners();
  }

  void withdraw(double value){
    this.value -= value;

    notifyListeners();

  }

  @override
  String toString() {
    return 'R\$ $value';
  }
}