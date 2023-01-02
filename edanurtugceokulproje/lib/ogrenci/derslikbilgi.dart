import 'package:flutter/material.dart';


void main() => runApp(const derslikbilgiekran());


class derslikbilgiekran extends StatelessWidget {
  const derslikbilgiekran({Key? key}) : super(key: key);

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
            title: Text('Ders Bilgieri'),
          ),
          body: ListView(children: <Widget>[
            Center(
                child: Text(
                  'Ders programı',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            DataTable(
              columns: [
                DataColumn(label: Text('Ders Adı')),
                DataColumn(label: Text('Ders Günü ve Saati')),
                DataColumn(label: Text('Ders Kodu')),


              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Mobil Programlama')),
                  DataCell(Text('Pazartesi 16:00-18:00')),
                  DataCell(Text(' 435625')),

                ]),
                DataRow(cells: [
                  DataCell(Text('Görsel Programlama')),
                  DataCell(Text('Pazartesi 18:30-21:30')),
                  DataCell(Text('365289')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Veri Tabanı Yönetimi')),
                  DataCell(Text('Salı 14:30-15:40 ')),
                  DataCell(Text('785412')),

                ]),
                DataRow(cells: [
                  DataCell(Text('Bilgi Güvenliği ')),
                  DataCell(Text('Salı 16:20-18:20')),
                  DataCell(Text(' 698521')),

                ]),
                DataRow(cells: [
                  DataCell(Text('Tasarım ve Modelleme')),
                  DataCell(Text('Çarşamba 17:20-18:40 ')),
                  DataCell(Text(' 365398')),

                ]),


                DataRow(cells: [
                  DataCell(Text('İşletim Sistemleri ')),
                  DataCell(Text('Perşembe 15:50-17:20')),
                  DataCell(Text(' 853957')),

                ]),
                DataRow(cells: [
                  DataCell(Text('Sistem Analizi Tasarımı ')),
                  DataCell(Text('Perşembe 17:40-19:00')),
                  DataCell(Text('719562')),

                ]),
                DataRow(cells: [
                  DataCell(Text('Veri Yapıları ')),
                  DataCell(Text('Salı 19:00-20:10')),
                  DataCell(Text('981736')),

                ]),
                DataRow(cells: [
                  DataCell(Text('Matematik')),
                  DataCell(Text('Pazartesi 14:40-15:50')),
                  DataCell(Text('847962')),

                ]),
                DataRow(cells: [
                  DataCell(Text('Web Tasarım ')),
                  DataCell(Text('Cuma 15:50-17:20')),
                  DataCell(Text('258934')),

                ]),
                DataRow(cells: [
                  DataCell(Text('Girişimcilik ')),
                  DataCell(Text('Cuma 14:40-15:30')),
                  DataCell(Text('769485')),

                ]),
                DataRow(cells: [
                  DataCell(Text('Bilgisayar Ağları ')),
                  DataCell(Text('Çarşamba 16:00-17:00')),
                  DataCell(Text('769485')),

                ]),
              ],
            ),
          ])),
    );
  }
}