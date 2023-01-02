import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edanurtugceokulproje/subebilgisi/kisi_detay_cubit.dart';
import 'package:edanurtugceokulproje/subebilgisi/kisiler.dart';

class KisiDetaySayfa extends StatefulWidget {
  sube bilgi;
  KisiDetaySayfa({required this.bilgi});

  @override
  State<KisiDetaySayfa> createState() => _KisiDetaySayfaState();
}

class _KisiDetaySayfaState extends State<KisiDetaySayfa> {
  var tfsube = TextEditingController();
  var tfbaslangic = TextEditingController();
  var tfbitis = TextEditingController();
  var tfsure = TextEditingController();
  var teneffussaati = TextEditingController();
  var tfogle = TextEditingController();

  @override
  void initState() {
    super.initState();
    var bilgi = widget.bilgi;
    tfsube.text = bilgi.subead;
    tfbaslangic.text = bilgi.dersbaslangic;
    tfbitis.text = bilgi.dersbitis;
    tfsure.text = bilgi.derssuresi;
    teneffussaati.text = bilgi.teneffussaat;
    tfogle.text = bilgi.ogletatili;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kişi Detay"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfsube,
                decoration: const InputDecoration(
                  hintText: "şube ",
                ),
              ),
              TextField(
                controller: tfbaslangic,
                decoration: const InputDecoration(
                  hintText: "başlangıç saati",
                ),
              ),
              TextField(
                controller: tfbitis,
                decoration: const InputDecoration(
                  hintText: "bitiş saati",
                ),
              ),
              TextField(
                controller: tfsure,
                decoration: const InputDecoration(
                  hintText: "ders süresi",
                ),
              ),
              TextField(
                controller: teneffussaati,
                decoration: const InputDecoration(
                  hintText: "teneffus saati",
                ),
              ),
              TextField(
                controller: tfogle,
                decoration: const InputDecoration(
                  hintText: "ogle arası ",
                ),
              ),
              ElevatedButton(onPressed: (){
                context.read<KisiDetayCubit>().guncelle(widget.bilgi.kisi_id, tfsube.text, tfbaslangic.text, tfbitis.text,tfsure.text,teneffussaati.text,tfogle.text);
              }, child: const Text("GÜNCELLE")),
            ],
          ),
        ),
      ),
    );
  }
}
