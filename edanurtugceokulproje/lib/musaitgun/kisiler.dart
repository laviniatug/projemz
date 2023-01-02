class Kisiler {
  String kisi_id;
  String adsoyad;
  String musaitgun;

  Kisiler({required this.kisi_id,required this.adsoyad,required this.musaitgun});

  factory Kisiler.fromJson(String key,Map<dynamic,dynamic> json){
    //firebase özelinde keyde dynamic olabiliyor
    return Kisiler(
        kisi_id: key,
        adsoyad: json["kisi_ad"] as String,
        musaitgun: json["kisi_tel"] as String
    );
  }
}