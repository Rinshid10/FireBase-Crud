import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:one/addpage.dart';
import 'package:one/provider.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference data = FirebaseFirestore.instance.collection('oneset');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => addPage()));
          }),
      appBar: AppBar(
        title: Text("Firebase"),
      ),
      body: StreamBuilder(
        stream: data.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.data?.docs.isEmpty == true) {
            return Center(child: Text("No data available"));
          }

          return Consumer<StudentProvider>(
            builder: (context, value, child) => ListView.builder(
              itemCount: snapshot.data?.docs.length ?? 0,
              itemBuilder: (context, index) {
                final data = snapshot.data?.docs[index];
                final docId = data?.id;
                return ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                    ],
                  ),
                  title: Text(data?['age'] ?? 'No title'),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
