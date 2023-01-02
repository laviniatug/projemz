import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edanurtugceokulproje/derslikbilgi/anasayfa_cubit.dart';
import 'package:edanurtugceokulproje/derslikbilgi/kisi_detay_cubit.dart';
import 'package:edanurtugceokulproje/derslikbilgi/kisi_kayit_cubit.dart';
import 'package:edanurtugceokulproje/derslikbilgi/anasayfa.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const derslikbilgi());
}

class derslikbilgi extends StatelessWidget {
  const derslikbilgi({Key? key}) : super(key: key);

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
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Anasayfa(),
      ),
    );
  }
}

