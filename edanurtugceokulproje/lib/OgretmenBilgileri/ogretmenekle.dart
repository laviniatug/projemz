import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class ogretmenekle extends StatefulWidget {
  ogretmenekle({Key? key}) : super(key: key);

  @override
  _ogretmenekleState createState() => _ogretmenekleState();
}

class _ogretmenekleState extends State<ogretmenekle> {
  final _formKey = GlobalKey<FormState>();  //GlobalKey : Tüm uygulama boyunca benzersiz olan bir anahtar.

  var ogr_unvan = "";
  var ogr_ad = "";
  var girdigidersler = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final unvankontrol = TextEditingController();
  final  adkontrol= TextEditingController();
  final derskontrol = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    unvankontrol.dispose();
    adkontrol.dispose();
    derskontrol.dispose();
    super.dispose();
  }

  clearText() {
   unvankontrol.clear();
    adkontrol.clear();
    derskontrol.clear();
  }

  // Adding Student
  CollectionReference Ogretmen =
  FirebaseFirestore.instance.collection('ögretmen');

  Future<void> ekle() {
    return Ogretmen
        .add({'Ünvan': ogr_unvan, 'Adi': ogr_ad, 'Girdigi dersler': girdigidersler})
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("öğretmen ekle"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Ünvan: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: unvankontrol,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ünvan bilgisini girin';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Adi: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: adkontrol,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'lütfen adınızı giriniz';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,

                  decoration: InputDecoration(
                    labelText: 'Girdigi ders: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: derskontrol,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'dersinizi giriniz';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            ogr_unvan= unvankontrol.text;
                            ogr_ad = adkontrol.text;
                            girdigidersler = derskontrol.text;
                            ekle();
                            clearText();
                          });
                        }
                      },
                      child: Text(
                        'Kaydet',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {clearText()},
                      child: Text(
                        'Sıfırla',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
