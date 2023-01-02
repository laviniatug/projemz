import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edanurtugceokulproje/subebilgisi/kisilerdao_repository.dart';

class KisiDetayCubit extends Cubit<void> {
  KisiDetayCubit():super(0);

  var krepo = KisilerDaoRepository();

  Future<void> guncelle(kisi_id ,String subead, String dersbaslangic,String dersbitis, String derssuresi, String teneffussaat, String ogletatili ) async {
    await krepo.kisiGuncelle(kisi_id, subead,  dersbaslangic, dersbitis, derssuresi, teneffussaat,  ogletatili );
  }
}