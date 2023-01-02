class sube {
  String kisi_id;
  String subead;
  String dersbaslangic;
  String dersbitis;
  String derssuresi;
  String teneffussaat;
  String ogletatili;



  sube({required this.kisi_id,required this.subead,required this.dersbaslangic,
    required this.dersbitis,required this.derssuresi,required this.teneffussaat,required this.ogletatili});

  factory sube.fromJson(String key,Map<dynamic,dynamic> json){
    //firebase özelinde keyde dynamic olabiliyor
    return sube(
        kisi_id: key,
        subead: json["subead"] as String,
        dersbaslangic: json["dersbaslangic"] as String,
        dersbitis: json["dersbitis"] as String,
        derssuresi: json["derssuresi"] as String,
       teneffussaat: json["teneffussaat"] as String,
        ogletatili: json["oglettatili"] as String

    );
  }
}