import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edanurtugceokulproje/derslikbilgi/kisi_detay_cubit.dart';
import 'package:edanurtugceokulproje/derslikbilgi/kisiler.dart';

class KisiDetaySayfa extends StatefulWidget {
  derslikayar derslikbilgileri;
  KisiDetaySayfa({required this.derslikbilgileri});

  @override
  State<KisiDetaySayfa> createState() => _KisiDetaySayfaState();
}

class _KisiDetaySayfaState extends State<KisiDetaySayfa> {
  var tfderslik = TextEditingController();
  var tfkapasite = TextEditingController();

  @override
  void initState() {
    super.initState();
    var derslikbilgi = widget.derslikbilgileri;
    tfderslik.text = derslikbilgi.derslik;
    tfkapasite.text = derslikbilgi.kapasite;
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
                controller: tfderslik,
                decoration: const InputDecoration(
                  hintText: "derslik",
                ),
              ),
              TextField(
                controller: tfkapasite,
                decoration: const InputDecoration(
                  hintText: "kapasite",
                ),
              ),
              ElevatedButton(onPressed: (){
                context.read<KisiDetayCubit>().guncelle(widget.derslikbilgileri.kisi_id, tfderslik.text, tfkapasite.text);
              }, child: const Text("GÜNCELLE")),
            ],
          ),
        ),
      ),
    );
  }
}
