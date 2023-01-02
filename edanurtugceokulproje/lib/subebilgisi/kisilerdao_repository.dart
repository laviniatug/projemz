import 'package:firebase_database/firebase_database.dart';


class KisilerDaoRepository {// dao: Database Access Object
  var subebilgi = FirebaseDatabase.instance.ref().child('sube');



  Future<void> kisiKayit(String subead, String dersbaslangic, String dersbitis, String derssuresi, String teneffussaat, String ogletatili) async {
    var yeniKisi = Map<String,dynamic>();
    yeniKisi["kisi_id"] = "";
    yeniKisi["subead"] = subead;
    yeniKisi["dersbaslangic"] = dersbaslangic;
    yeniKisi["dersbitis"] = dersbitis;
    yeniKisi["derssuresi"] = derssuresi;
    yeniKisi["teneffussaat"] = teneffussaat;
    yeniKisi["ogletatili"] = ogletatili;



    subebilgi.push().set(yeniKisi);
  }

  Future<void> kisiGuncelle( String kisi_id,String subead,  String dersbaslangic, String dersbitis, String derssuresi, String teneffussaat, String ogletatili) async {
    var guncellenenKisi = Map<String,dynamic>();
    guncellenenKisi["kisi_id"] = "";
    guncellenenKisi["subead"] = subead;
    guncellenenKisi["dersbaslangic"] = dersbaslangic;
    guncellenenKisi["dersbitis"] = dersbitis;
    guncellenenKisi["derssuresi"] = derssuresi;
    guncellenenKisi["teneffusaat"] = teneffussaat;
    guncellenenKisi["ogletatili"] = ogletatili;



    subebilgi.child(kisi_id).update(guncellenenKisi);
  }

  Future<void> kisiSil(String kisi_id) async {
    print("Kişi sil : $kisi_id");
  }
}