import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edanurtugceokulproje/subebilgisi/kisilerdao_repository.dart';

class KisiKayitCubit extends Cubit<void> {
  KisiKayitCubit():super(0);

  var krepo = KisilerDaoRepository();

  Future<void> kayit(String subead, String dersbaslangic, String dersbitis, String derssuresi,String telefussaat, String ogletatili) async {
    await krepo.kisiKayit(subead, dersbaslangic,dersbitis,derssuresi,telefussaat,ogletatili);
  }
}