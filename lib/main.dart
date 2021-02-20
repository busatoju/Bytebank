import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(

    home: Scaffold(
      appBar: AppBar(
          title: Text('Transferências')
      ),
        body: ListaTransferencias(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {  },
          child: Icon(Icons.add),
      ),
    ),
));

class ListaTransferencias extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Column(
     children: <Widget>[
       ItemTransferencia(Transferencia(100,27665843)),
       ItemTransferencia(Transferencia(300,27665843)),
       ItemTransferencia(Transferencia(200,27665843)),
     ],
   );
  }

}
class ItemTransferencia extends StatelessWidget {

  final Transferencia _transferencia;

  const ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  const Transferencia(this.valor, this.numeroConta);
}