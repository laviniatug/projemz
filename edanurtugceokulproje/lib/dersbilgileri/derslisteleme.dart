import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:edanurtugceokulproje/dersbilgileri/ders_guncelleme.dart';

class ListStudentPage extends StatefulWidget {
  const ListStudentPage({Key? key}) : super(key: key);

  @override
   _ListStudentPageState createState() => _ListStudentPageState();
}

class _ListStudentPageState extends State<ListStudentPage> {
  final Stream<QuerySnapshot> studentsStream =
  FirebaseFirestore.instance.collection('students').snapshots();

  // For Deleting User
  CollectionReference students =
  FirebaseFirestore.instance.collection('students');
  Future<void> deleteUser(id) {
    // print("User Deleted $id");
    return students
        .doc(id)
        .delete()
        .then((value) => print('ders'))
        .catchError((error) => print('Failed to Delete user: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: studentsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {

              print('Something went Wrong');

          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final List storedocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storedocs.add(a);
            a['id'] = document.id;
          }).toList();

          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Table(
                border: TableBorder.all(),
                columnWidths: const <int, TableColumnWidth>{
                  1: FixedColumnWidth(60),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          color: Colors.greenAccent,
                          child: const Center(
                            child: Text(
                              'kod ',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          color: Colors.greenAccent,
                          child: const Center(
                            child: Text(
                              'ders adı ',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          color: Colors.greenAccent,
                          child: const Center(
                            child: Text(
                              'ders saati ',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          color: Colors.greenAccent,
                          child: const Center(
                            child: Text(
                              'Action',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  for (var i = 0; i < storedocs.length; i++) ...[
                    TableRow(
                      children: [
                        TableCell(
                          child: Center(
                              child: Text(storedocs[i]['kod'],
                                  style: const TextStyle(fontSize: 18.0))),
                        ),
                        TableCell(
                          child: Center(
                              child: Text(storedocs[i]['ders adı'],
                                  style: const TextStyle(fontSize: 18.0))),
                        ),
                        TableCell(
                          child: Center(
                              child: Text(storedocs[i]['ders saati'],
                                  style: const TextStyle(fontSize: 18.0))),
                        ),
                        TableCell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UpdateStudentPage(
                                          id: storedocs[i]['id']),
                                    ),
                                  )
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.orange,
                                ),
                              ),
                              IconButton(
                                onPressed: () =>
                                {deleteUser(storedocs[i]['id'])},
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          );
        });
  }
}
