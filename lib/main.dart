import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(

    home: Scaffold(
      appBar: AppBar(
          title: Text('Transferências')
      ),
        body: Column(
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('R\$ 100.00'),
                subtitle: Text('27665843'),
              )
            ),
            Card(
                child: ListTile(
                  leading: Icon(Icons.monetization_on),
                  title: Text('R\$ 200.00'),
                  subtitle: Text('27665843'),
                )
            ),
          ],
        ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
      ),
    ),
));
