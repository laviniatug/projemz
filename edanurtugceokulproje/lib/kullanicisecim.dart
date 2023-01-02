import 'package:edanurtugceokulproje/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:edanurtugceokulproje/pages/login2.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Tutorial';

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: secimyeri(),

    );
  }
}

class secimyeri extends StatelessWidget {
  const secimyeri({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Kullanıcı Kontrol Paneli'),
          ),
          body: Center(child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child: TextButton(
                child: Text('Yetkili Kullanıcı(Super User)'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );

                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: TextButton(
                child: Text('Standart Kullanıcı (Standart User)'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  LoginPage2(),
                    ),
                  );
                },
              ),
            ),
          ]))),
    );
  }
}

