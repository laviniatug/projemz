import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edanurtugceokulproje/derslikbilgi/kisiler.dart';
import 'package:edanurtugceokulproje/dersbilgileri/kisilerdao_repository.dart';

class AnasayfaCubit extends Cubit<List<derslikayar>>{
  AnasayfaCubit():super(<derslikayar>[]);

  var krepo = KisilerDaoRepository();
  var derslikbilgi = FirebaseDatabase.instance.ref().child('kisiler');

  Future<void> kisileriYukle() async {
    derslikbilgi.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;

      if (gelenDegerler != null){
        var liste = <derslikayar>[];

        gelenDegerler.forEach((key,nesne){
          var kisi = derslikayar.fromJson(key, nesne);
          liste.add(kisi);
        });

        emit(liste);
      }
    });
  }

  Future<void> ara(String aramaKelimesi) async {
    derslikbilgi.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;

      if (gelenDegerler != null){
        var liste = <derslikayar>[];

        gelenDegerler.forEach((key,nesne){
          var kisi = derslikayar.fromJson(key, nesne);
          if (kisi.derslik.toLowerCase().contains(aramaKelimesi.toLowerCase())){
            liste.add(kisi);
          }
        });

        emit(liste);
      }
    });
  }

  Future<void> sil(String kisi_id) async {
    derslikbilgi.child(kisi_id).remove();
  }
}