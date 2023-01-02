
import 'package:edanurtugceokulproje/ogrenci/derslikbilgi.dart';
import 'package:edanurtugceokulproje/ogrenci/musaitgunbilgi.dart';
import 'package:flutter/material.dart';
import 'package:edanurtugceokulproje/dersbilgileri/anasayfa.dart';
import 'package:edanurtugceokulproje/ogretim_gorevlileri.dart';
import 'package:edanurtugceokulproje/OgretmenBilgileri/anasayfa.dart';
import 'package:edanurtugceokulproje/musaitgun/dersaalanaai.dart';
import 'package:edanurtugceokulproje/subebilgisi/ilkekran';
import 'package:edanurtugceokulproje/derslikbilgi/ekran.dart';
import 'package:edanurtugceokulproje/ogrenci/subebilgiekran.dart';



void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Tutorial';

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      debugShowCheckedModeBanner:false,
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
            title: const Text('Yetkili Kontrol Paneli'),
          ),
          body: Center(child: Column(children: <Widget>[
           Container(
              margin: const EdgeInsets.all(20),
              child: TextButton(
                child: const Text('müsait bilgisi'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>musaitdurum(),
                    ),
                  );

                },
              ),
            ),

            Container(
              margin: const EdgeInsets.all(20),
              child: TextButton(
                child:  const Text('Ders Ekranı'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>HomePage(),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: TextButton(
                child:  const Text('derslik bilgisi'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>derslikbilgi(),
                    ),
                  );
                },
              ),
            ),

            Container(
              margin: const EdgeInsets.all(20),
              child: TextButton(
                child:  const Text('Ögretmen ekranı'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>HomePage2(),
                    ),
                  );
                },
              ),
            ),
           Container(
              margin: const EdgeInsets.all(20),
              child: TextButton(
                child:  const Text('şube bilgisi'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>const subebilgi(),
                    ),
                  );
                },
              ),
            ),

          ]))),
    );
  }
}



class ogrenciekrani extends StatelessWidget {
  const ogrenciekrani({Key? key}) : super(key: key);

  static const String _title = 'Flutter Tutorial';

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: secimyeri(),

    );
  }
}
//öğrenci sayfasına gidiş
class ogrencisayfasinagit extends StatelessWidget {
  const ogrencisayfasinagit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Kullanıcı Kontrol Paneli'),
          ),
          body: Center(child: Column(children: <Widget>[
          /*  Container(
              margin: const EdgeInsets.all(20),
              child: TextButton(
                child: const Text('Ögretmen (Yetkili Kullanıcı)'),
                onPressed: () {/*
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                     builder: (context) => LoginPage(),
                    ),
                  );

                },
              ),
            ),*/

           */
            Container(
              margin: const EdgeInsets.all(20),
              child: TextButton(
                child: const Text('Öğretmmenler'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ogretim_gorevlileri (),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: TextButton(
                child: const Text('ders programı'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const derslikbilgiekran (),
                    ),
                  );
                },
              ),
            ),

            Container(
              margin: const EdgeInsets.all(20),
              child: TextButton(
                child: const Text('müsait günler'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const musaitbilgisi(),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: TextButton(
                child: const Text('şube bilgisi'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const subebilgisi(),
                    ),
                  );
                },
              ),
            ),

          ]))),
    );
  }
}
