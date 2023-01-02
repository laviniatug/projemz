import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edanurtugceokulproje/dersbilgileri/kisilerdao_repository.dart';

class KisiKayitCubit extends Cubit<void> {
  KisiKayitCubit():super(0);

  var krepo = KisilerDaoRepository();

  Future<void> kayit(String derslik, String kapasite) async {
    await krepo.kisiKayit(derslik, kapasite);
  }
}