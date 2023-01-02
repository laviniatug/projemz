import 'package:edanurtugceokulproje/dersbilgileri/derslisteleme.dart';
import 'package:edanurtugceokulproje/dersbilgileri/derslisteleme.dart';
import 'package:edanurtugceokulproje/OgretmenBilgileri/ogretmenekle.dart';
import 'package:flutter/material.dart';


class HomePage2 extends StatefulWidget {
  HomePage2({Key? key}) : super(key: key);

  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('öğretmen ekranı'),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ogretmenekle(),   //ogretmen bilgilerine ulaşır
                  ),
                )
              },
              child: Text('Ekle', style: TextStyle(fontSize: 20.0)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
            )
          ],
        ),
      ),
      body: ListStudentPage(),
    );
  }
}
