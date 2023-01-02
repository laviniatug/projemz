import 'package:flutter/material.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Tutorial';

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: ogretim_gorevlileri(),

    );
  }
}


class ogretim_gorevlileri  extends StatelessWidget {
  const ogretim_gorevlileri({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
          appBar: AppBar(
            title: Text('Öğretim Görevlileri'),
          ),
          body: ListView(children: <Widget>[
            Center(
                child: Text(
                  'Öğretim Görevlileri Listesi',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            DataTable(
              columns: [
                DataColumn(label: Text('Öğretim Görevlisi:')),
                DataColumn(label: Text('Unvanı:')),


              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Edanur Bindebir')),
                  DataCell(Text('Profesör')),


                ]),
                DataRow(cells: [
                  DataCell(Text('Uğur Bilgen')),
                  DataCell(Text('Dr. Ögretim Görevlisi')),

                ]),
                DataRow(cells: [
                  DataCell(Text('Murat Albayrak')),
                  DataCell(Text('Öğretim Görevlisi ')),

                ]),
                DataRow(cells: [
                  DataCell(Text('Engin Uçar ')),
                  DataCell(Text('Araştırma Görevlisi')),

                ]),
                DataRow(cells: [
                  DataCell(Text('Mehmet Kayadağ')),
                  DataCell(Text('Doçent ')),

                ]),


                DataRow(cells: [
                  DataCell(Text('Levent Karakuz ')),
                  DataCell(Text('Dr. Öğretim Görevlisi')),

                ]),
                DataRow(cells: [
                  DataCell(Text('Engin Uçar ')),
                  DataCell(Text('Dr. Öğretim Görevlisi')),

                ]),
                DataRow(cells: [
                  DataCell(Text('Levent Kayadağ ')),
                  DataCell(Text('Dr. Öğretim Görevlisi')),

                ]),
                DataRow(cells: [
                  DataCell(Text('Selçuk Demirdağ ')),
                  DataCell(Text('Araştırma Görevlisi')),

                ]),
                DataRow(cells: [
                  DataCell(Text('Ayfer Temiz ')),
                  DataCell(Text('Dr. Öğretim Görevlisi')),

                ]),
                DataRow(cells: [
                  DataCell(Text('Açelya  Aydoğdu ')),
                  DataCell(Text('Dr. Öğretim Görevlisi')),

                ]),
                DataRow(cells: [
                  DataCell(Text('Burak Kayadağ ')),
                  DataCell(Text('Dr. Öğretim Görevlisi')),

                ]),


              ],
            ),
          ])),
    );
  }
}
