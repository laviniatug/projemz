import 'package:flutter/material.dart';


void main() => runApp(const My());


class My extends StatelessWidget {
  const My({Key? key}) : super(key: key);

  static const String _title = 'Flutter Tutorial';

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: musaitbilgisi(),

    );
  }
}


class musaitbilgisi  extends StatelessWidget {
  const musaitbilgisi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,


      home: Scaffold(
          appBar: AppBar(
            title: Text('öğretmenlerin müsait günleri'),
          ),
          body: ListView(children: <Widget>[
            Center(
                child: Text(
                  'müsait günleri',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            DataTable(
              columns: [
                DataColumn(label: Text('öğretmen adı')),
                DataColumn(label: Text('müsait olduğu gün')),




              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('edanur temel')),
                  DataCell(Text('pazartesi-salı-cuma')),


                ]),
                DataRow(cells: [
                  DataCell(Text('tuğçe tunç')),
                  DataCell(Text('çarşamba-cuma')),

                ]),
                DataRow(cells: [
                  DataCell(Text('umut bindebir')),
                  DataCell(Text('pazartessalı-carsamba-cuma')),


                ]),
                DataRow(cells: [
                  DataCell(Text('musa akyol ')),
                  DataCell(Text('salı-çarşaba-perşembe')),



                ]),

              ],
            ),
          ])),
    );
  }
}