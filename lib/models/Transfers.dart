import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

class Transfers extends ChangeNotifier{
  final List<Transfer> _transfers = [];

  List<Transfer> get transfers => _transfers;

  add(Transfer newTransfer){
    transfers.add(newTransfer);

    notifyListeners();
  }
}