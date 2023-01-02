import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edanurtugceokulproje/dersbilgileri/kisilerdao_repository.dart';

class KisiDetayCubit extends Cubit<void> {
  KisiDetayCubit():super(0);

  var krepo = KisilerDaoRepository();

  Future<void> guncelle(String kisi_id, String derslikler, String kapasite) async {
    await krepo.kisiGuncelle(kisi_id, derslikler, kapasite);
  }
}