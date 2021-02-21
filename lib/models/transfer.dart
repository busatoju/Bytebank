class Transfer {
  final double value;
  final int numberAccount;

  const Transfer(this.value, this.numberAccount);

  @override
  String toString() {
    return 'Transfer{value: $value, numberAccount: $numberAccount}';
  }
}
