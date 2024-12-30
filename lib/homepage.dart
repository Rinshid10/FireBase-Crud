import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:one/addpage.dart';
import 'package:one/provider.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Consumer<StudentProvider>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.list.length,
          itemBuilder: (context, index) {
            final data = value.list[index];

            return ListTile(
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                ],
              ),
              title: Text(data.age ?? 'No title'),
            );
          },
        ),
      ),
    );
  }
}
