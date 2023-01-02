import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edanurtugceokulproje/musaitgun/kisi_kayit_cubit.dart';

class KisiKayitSayfa extends StatefulWidget {
  const KisiKayitSayfa({Key? key}) : super(key: key);

  @override
  State<KisiKayitSayfa> createState() => _KisiKayitSayfaState();
}

class _KisiKayitSayfaState extends State<KisiKayitSayfa> {
  var tfadsoyad = TextEditingController();
  var tfmusaitgun = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kişi Kayıt"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfadsoyad,
                decoration: const InputDecoration(
                  hintText: "Öğretmen Adı",
                ),
              ),
              TextField(
                controller: tfmusaitgun,
                decoration: const InputDecoration(
                  hintText: "Müsait Günler",
                ),
              ),
              ElevatedButton(onPressed: (){
                context.read<KisiKayitCubit>().kayit(tfadsoyad.text, tfmusaitgun.text);
              }, child: const Text("KAYDET")),
            ],
          ),
        ),
      ),
    );
  }
}
