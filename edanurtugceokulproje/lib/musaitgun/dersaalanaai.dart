import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edanurtugceokulproje/musaitgun/anasayfa_cubit.dart';
import 'package:edanurtugceokulproje/musaitgun/kisi_detay_cubit.dart';
import 'package:edanurtugceokulproje/musaitgun/kisi_kayit_cubit.dart';
import 'package:edanurtugceokulproje/musaitgun/anasayfa.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const musaitdurum());
}

class musaitdurum extends StatelessWidget {
  const musaitdurum({Key? key}) : super(key: key);

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

