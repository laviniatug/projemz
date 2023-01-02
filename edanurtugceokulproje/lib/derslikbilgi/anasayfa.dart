import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edanurtugceokulproje/derslikbilgi/anasayfa_cubit.dart';
import 'package:edanurtugceokulproje/derslikbilgi/kisiler.dart';
import 'package:edanurtugceokulproje/derslikbilgi/kisi_detay_sayfa.dart';
import 'package:edanurtugceokulproje/derslikbilgi/kisi_kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;
  
  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().kisileriYukle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu ?
            TextField(decoration: const InputDecoration(hintText: "Ara"),
              onChanged:(aramaSonucu){
                context.read<AnasayfaCubit>().ara(aramaSonucu);
              } ,)
            : const Text("derslik bilgileri"),
        actions: [
          aramaYapiliyorMu ?
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = false;
            });
            context.read<AnasayfaCubit>().kisileriYukle();
          }, icon:const Icon(Icons.clear)):
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = true;
            });
          }, icon:const Icon(Icons.search)),
        ],
      ),
      body: BlocBuilder<AnasayfaCubit,List<derslikayar>>(
        builder: (context,kisilerListesi){
          if(kisilerListesi.isNotEmpty){
            return ListView.builder(
              itemCount: kisilerListesi.length,//3
              itemBuilder: (context,indeks){//0,1,2
                var kisi = kisilerListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => KisiDetaySayfa(derslikbilgileri: kisi,)))
                        .then((value) { context.read<AnasayfaCubit>().kisileriYukle(); } );
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${kisi.derslik} - ${kisi.kapasite}"),
                        ),
                        const Spacer(),
                        IconButton(onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text("${kisi.derslik} silinsin mi"),
                                action: SnackBarAction(
                                    label: "Evet",
                                    onPressed: (){
                                      context.read<AnasayfaCubit>().sil(kisi.kisi_id);
                                    }
                                ),
                            ),
                          );
                        }, icon: const Icon(Icons.delete_outline_outlined,color: Colors.black54,))
                      ],
                    ),
                  ),
                );
              },
            );
          }else{
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text("Kayıt"),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const KisiKayitSayfa()))
            .then((value) { context.read<AnasayfaCubit>().kisileriYukle(); } );
        },
      ),
    );
  }
}
