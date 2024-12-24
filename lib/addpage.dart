import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:one/homepage.dart';
import 'package:one/provider.dart';
import 'package:provider/provider.dart';

class addPage extends StatelessWidget {
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController subtitleCtrl = TextEditingController();
  addPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<StudentProvider>(
          builder: (context, textfeild, child) => Column(
            spacing: 20,
            children: [
              TextFormField(
                controller: textfeild.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "feild is empty";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "title", border: OutlineInputBorder()),
              ),
              TextFormField(
                controller: textfeild.age,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "feild is empty";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: 'subtitle', border: OutlineInputBorder()),
              ),
              Consumer<StudentProvider>(builder: (context, firestore, child) {
                return ElevatedButton(
                    onPressed: () {
                      firestore.adddata();

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Homepage()));
                    },
                    child: Text("submit"));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
