class derslikayar {
  String kisi_id;
  String derslik;
  String kapasite;

  derslikayar({required this.kisi_id,required this.derslik,required this.kapasite});

  factory derslikayar.fromJson(String key,Map<dynamic,dynamic> json){
    //firebase özelinde keyde dynamic olabiliyor
    return derslikayar(
        kisi_id: key,
        derslik: json["derslik"] as String,
        kapasite: json["kapasite"] as String
    );
  }
}