class Transfer {
  final double value;
  final int numberAccount;

  const Transfer(this.value, this.numberAccount);

  String toStringValue(){
    return "R\$ $value";
  }

  String toStringAccount(){
    return "Conta: $numberAccount";
  }
}
