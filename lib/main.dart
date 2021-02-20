import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class ListaTransferencias extends StatelessWidget{ //Lista de transferências utilizando herdando um widget estatico
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar( //Barra azul na parte superior
         title: Text('Transferências') //Titulo da appbar
     ),
     body: Column( //Colunas de Transferências
       children: <Widget>[
         ItemTransferencia(Transferencia(100,27665843)),
         ItemTransferencia(Transferencia(300,27665843)),
         ItemTransferencia(Transferencia(200,27665843)),
       ],
     ),
     floatingActionButton: FloatingActionButton( //Botão de adicionar mais uma tranferência
       onPressed: () {  },
       child: Icon(Icons.add), // Tipo do botão, no caso o sinal de '+'
     ),
   );
  }

}
class ItemTransferencia extends StatelessWidget { // Item transferência Criado para melhorar a legibilidade do código e reaproveitamento

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

class Transferencia { //Transferência criada para melhorar legibilidade e reaproveitar código
  final double valor;
  final int numeroConta;

  const Transferencia(this.valor, this.numeroConta);
}
class FormularioTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Transferir')),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.account_balance),
                labelText: 'Número da conta',
                  hintText: '00000000',

              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: TextStyle(
                fontSize: 24.0
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: '0.00',
              ),
                keyboardType: TextInputType.number,

            ),
          ),
          RaisedButton(
            child: Text('Confirmar'),
          ),
        ],
      ),
       );

  }
}
class BytebankApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
        body: FormularioTransferencia(),
        ),
    );
  }
}
