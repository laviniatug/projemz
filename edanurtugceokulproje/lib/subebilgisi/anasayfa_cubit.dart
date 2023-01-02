import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edanurtugceokulproje/subebilgisi/kisiler.dart';
import 'package:edanurtugceokulproje/subebilgisi/kisilerdao_repository.dart';

class AnasayfaCubit extends Cubit<List<sube>>{
  AnasayfaCubit():super(<sube>[]);

  var krepo = KisilerDaoRepository();
  var subebilgi = FirebaseDatabase.instance.ref().child('sube');

  Future<void> kisileriYukle() async {
    subebilgi.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;

      if (gelenDegerler != null){
        var liste = <sube>[];

        gelenDegerler.forEach((key,nesne){
          var kisi = sube.fromJson(key, nesne);
          liste.add(kisi);
        });

        emit(liste);
      }
    });
  }

  Future<void> ara(String aramaKelimesi) async {
    subebilgi.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;

      if (gelenDegerler != null){
        var liste = <sube>[];

        gelenDegerler.forEach((key,nesne){
          var kisi = sube.fromJson(key, nesne);
          if (kisi.subead.toLowerCase().contains(aramaKelimesi.toLowerCase())){
            liste.add(kisi);
          }

        });


        emit(liste);
      }
    });
  }

  Future<void> sil(String kisi_id) async {
    subebilgi.child(kisi_id).remove();
  }
}