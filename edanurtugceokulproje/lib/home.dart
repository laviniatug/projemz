import 'package:edanurtugceokulproje/service/auth_service.dart';
import 'package:flutter/material.dart';

class HomePagee extends StatefulWidget {
  @override
  _HomePageeState createState() => _HomePageeState();
}

class _HomePageeState extends State<HomePagee> {
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /*   Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddStatusPage()));*/
        },
        child: Icon(Icons.add),
      ),
      drawer: Drawer(    //MENU
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("edanur temel"),
              accountEmail: Text("Edanur temel"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/beyaz.png"),
              ),
            ),
            ListTile(
              title: Text('Anasayfa'),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Profilim'),
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(Icons.person),
            ),
            Divider(),
            ListTile(
              title: Text('Çıkış yap'),
              onTap: () {
                _authService.signOut();
                Navigator.pop(context);
              },
              leading: Icon(Icons.remove_circle),
            ),
          ],
        ),
      ),
      // body: StatusListPage()
    );
  }
}
