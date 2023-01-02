import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edanurtugceokulproje/derslikbilgi/kisi_kayit_cubit.dart';

class KisiKayitSayfa extends StatefulWidget {
  const KisiKayitSayfa({Key? key}) : super(key: key);

  @override
  State<KisiKayitSayfa> createState() => _KisiKayitSayfaState();
}

class _KisiKayitSayfaState extends State<KisiKayitSayfa> {
  var tfderslik = TextEditingController();
  var tfkapasite = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("derslik bilgi"),
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
                context.read<KisiKayitCubit>().kayit(tfderslik.text, tfkapasite.text);
              }, child: const Text("KAYDET")),
            ],
          ),
        ),
      ),
    );
  }
}
