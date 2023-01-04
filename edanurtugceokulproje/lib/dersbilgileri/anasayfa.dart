import 'package:flutter/material.dart';
import 'package:edanurtugceokulproje/dersbilgileri/ders_ekleme.dart';
import 'package:edanurtugceokulproje/dersbilgileri/derslisteleme.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('ders bilgisi ekranı'),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddStudentPage(),   //yönlendirici
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

