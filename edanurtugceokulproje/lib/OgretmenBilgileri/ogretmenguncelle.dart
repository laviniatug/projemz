import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ogretmenguncelle extends StatefulWidget {
  final String id;
  ogretmenguncelle({Key? key, required this.id}) : super(key: key);

  @override
  _ogretmenguncelleState createState() => _ogretmenguncelleState();
}

class _ogretmenguncelleState extends State<ogretmenguncelle> {
  final _formKey = GlobalKey<FormState>();

  //öğretmen güncelle
  CollectionReference Ogretmen =
  FirebaseFirestore.instance.collection('ogretmen');

  Future<void> updateUser(id, ogr_unvani, ogr_adi, girdigidersler) {
    return Ogretmen
        .doc(id)
        .update({'Ünvan': ogr_unvani, 'Adi': ogr_adi, 'Girdiği ders': girdigidersler})
        .then((value) => print("öğretmen güncelle"))
        .catchError((error) => print("güncelleme hatası: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("güncelleme ekranı"),
      ),
      body: Form(
          key: _formKey,
          // Getting Specific Data by ID
          child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance
                .collection('öğretmen güncelleme')
                .doc(widget.id)
                .get(),
            builder: (_, snapshot) {
              if (snapshot.hasError) {
                print('Something Went Wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              var data = snapshot.data!.data();
              var ogr_unvani = data!['Ünvanı'];
              var ogr_adi = data['Adı'];
              var girdigidersler = data['Girdiği ders'];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: ogr_unvani,
                        autofocus: false,
                        onChanged: (value) => ogr_unvani = value,
                        decoration: InputDecoration(
                          labelText: 'Ünvanı: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'öğretmen ünvanını giriniz!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: ogr_adi,
                        autofocus: false,
                        onChanged: (value) => ogr_adi = value,
                        decoration: InputDecoration(
                          labelText: 'Adi: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'öğretmen adını giriniz!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: girdigidersler,
                        autofocus: false,
                        onChanged: (value) => girdigidersler = value,

                        decoration: InputDecoration(
                          labelText: 'Girdiği ders: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'girdiği dersi giriniz';
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
                                updateUser(widget.id, ogr_unvani, ogr_adi, girdigidersler);
                                Navigator.pop(context);
                              }
                            },
                            child: Text(
                              'Güncelle',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => {},
                            child: Text(
                              'sıfırla',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueGrey),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          )),
    );
  }
}
