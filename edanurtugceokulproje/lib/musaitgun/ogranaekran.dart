
import 'package:flutter/material.dart';
import 'package:edanurtugceokulproje/musaitgun/anasayfa_cubit.dart';
import 'package:edanurtugceokulproje/musaitgun/kisi_detay_cubit.dart';
import 'package:edanurtugceokulproje/musaitgun/kisi_kayit_cubit.dart';
import 'package:edanurtugceokulproje/musaitgun/anasayfa.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppp extends StatelessWidget {
  const MyAppp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => KisiKayitCubit()),
        BlocProvider(create: (context) => KisiDetayCubit()),
        BlocProvider(create: (context) => AnasayfaCubit()),
      ],
      child: MaterialApp(
        title: 'öğretmen ekranı',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Anasayfa(),
      ),
    );
  }
}
