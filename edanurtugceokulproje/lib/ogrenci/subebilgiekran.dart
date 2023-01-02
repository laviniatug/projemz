import 'package:flutter/material.dart';


void main() => runApp(const subebilgisi());


class subebilgisi extends StatelessWidget {
  const subebilgisi({Key? key}) : super(key: key);

  static const String _title = 'Flutter Tutorial';

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: ders_bilgileri(),

    );
  }
}


class ders_bilgileri  extends StatelessWidget {
  const ders_bilgileri({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
          appBar: AppBar(
            title: Text('şube bilgisi'),
          ),
          body: ListView(children: <Widget>[
            Center(
                child: Text(
                  'şube bilgisi',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            DataTable(
              columns: [
                DataColumn(label: Text('şube')),
                DataColumn(label: Text('ders başlangıç')),
                DataColumn(label: Text('ders bitiş')),
                DataColumn(label: Text('ders süresi')),
                DataColumn(label: Text('teneffus saati')),
                DataColumn(label: Text('öğle arası')),

              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('1a')),
                  DataCell(Text(' 10.00')),
                  DataCell(Text(' 12.30')),
                  DataCell(Text('40 dk')),
                  DataCell(Text('10 dk')),
                  DataCell(Text(' 1 saat')),

                ]),

                DataRow(cells: [
                  DataCell(Text('1b')),
                  DataCell(Text('12.30')),
                  DataCell(Text('15.30')),
                  DataCell(Text('40')),
                  DataCell(Text('10')),
                  DataCell(Text(' 1')),
                ]),
                DataRow(cells: [
                  DataCell(Text('2a')),
                  DataCell(Text('10.00')),
                  DataCell(Text('12.00')),
                  DataCell(Text('40 dk')),
                  DataCell(Text('10 dk')),
                  DataCell(Text(' 1 saat')),

                ]),

                DataRow(cells: [
                  DataCell(Text('2b ')),
                  DataCell(Text('10.00')),
                  DataCell(Text('12.00')),
                  DataCell(Text('40dk')),
                  DataCell(Text('10dk')),
                  DataCell(Text(' 1saat')),

                ]),
              ],
            ),
          ])),
    );
  }
}