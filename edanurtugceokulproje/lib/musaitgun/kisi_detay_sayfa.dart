import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edanurtugceokulproje/musaitgun/kisi_detay_cubit.dart';
import 'package:edanurtugceokulproje/musaitgun/kisiler.dart';

class KisiDetaySayfa extends StatefulWidget {
  Kisiler kisi;
  KisiDetaySayfa({required this.kisi});

  @override
  State<KisiDetaySayfa> createState() => _KisiDetaySayfaState();
}

class _KisiDetaySayfaState extends State<KisiDetaySayfa> {
  var tfadsoyad = TextEditingController();
  var tfmusaitgunler = TextEditingController();

  @override
  void initState() {
    super.initState();
    var kisi = widget.kisi;
    tfadsoyad.text = kisi.adsoyad;
    tfmusaitgunler.text = kisi.musaitgun;
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
                controller: tfadsoyad,
                decoration: const InputDecoration(
                  hintText: "Öğretmen Adı",
                ),
              ),
              TextField(
                controller: tfmusaitgunler,
                decoration: const InputDecoration(
                  hintText: "Müsait Günler",
                ),
              ),
              ElevatedButton(onPressed: (){
                context.read<KisiDetayCubit>().guncelle(widget.kisi.kisi_id, tfadsoyad.text, tfmusaitgunler.text);
              }, child: const Text("GÜNCELLE")),
            ],
          ),
        ),
      ),
    );
  }
}
