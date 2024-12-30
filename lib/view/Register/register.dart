import 'package:flutter/material.dart';
import 'package:one/view/LoginPage/login.dart';
import 'package:one/view_model/userprovider.dart';
import 'package:provider/provider.dart';

class signUp extends StatelessWidget {
  const signUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('signUp'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Consumer<Userprovider>(
          builder: (context, value, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 30,
            children: [
              TextField(
                controller: value.registerEmail,
                decoration: InputDecoration(
                    hintText: 'Email', border: OutlineInputBorder()),
              ),
              TextField(
                controller: value.registerpassword,
                decoration: InputDecoration(
                    hintText: 'Password', border: OutlineInputBorder()),
              ),
              ElevatedButton(
                  onPressed: () {
                    value.register();
                  },
                  child: Text('signUp')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text('go to Login')),
            ],
          ),
        ),
      ),
    );
  }
}
