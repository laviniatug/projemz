import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edanurtugceokulproje/subebilgisi/kisi_kayit_cubit.dart';

class KisiKayitSayfa extends StatefulWidget {
  const KisiKayitSayfa({Key? key}) : super(key: key);

  @override
  State<KisiKayitSayfa> createState() => _KisiKayitSayfaState();
}

class _KisiKayitSayfaState extends State<KisiKayitSayfa> {
  var tfsube = TextEditingController();
  var tfbaslangic = TextEditingController();
  var tfbitis = TextEditingController();
  var tfsure = TextEditingController();
  var tfteneffussaat = TextEditingController();
  var tfogle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("şube bilgisi "),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfsube,
                decoration: const InputDecoration(
                  hintText: "şube",
                ),
              ),
              TextField(
                controller: tfbaslangic,
                decoration: const InputDecoration(
                  hintText: "ders başlangıç saati",
                ),
              ),
              TextField(
                controller: tfbitis,
                decoration: const InputDecoration(
                  hintText: "ders bitiş saati",
                ),
              ),
              TextField(
                controller: tfsure,
                decoration: const InputDecoration(
                  hintText: "ders süresi",
                ),
              ),
              TextField(
                controller: tfteneffussaat,
                decoration: const InputDecoration(
                  hintText: "teneffüs saati",
                ),
              ),
              TextField(
                controller: tfogle,
                decoration: const InputDecoration(
                  hintText: "öğle tatili ",
                ),
              ),

              ElevatedButton(onPressed: (){
                context.read<KisiKayitCubit>().kayit(tfsube.text,tfbaslangic.text,tfbitis.text,tfsure.text,tfteneffussaat.text,tfogle.text);
              }, child: const Text("KAYDET")),
            ],
          ),
        ),
      ),
    );
  }
}
