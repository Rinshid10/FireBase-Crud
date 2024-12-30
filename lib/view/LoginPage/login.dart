import 'package:flutter/material.dart';
import 'package:one/view/Register/register.dart';
import 'package:one/view_model/userprovider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Consumer<Userprovider>(
          builder: (context, value, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 30,
            children: [
              TextField(
                controller: value.loginEmail,
                decoration: InputDecoration(
                    hintText: 'Email', border: OutlineInputBorder()),
              ),
              TextField(
                controller: value.loginpassword,
                decoration: InputDecoration(
                    hintText: 'Password', border: OutlineInputBorder()),
              ),
              ElevatedButton(
                  onPressed: () {
                    value.login();
                  },
                  child: Text('Login')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => signUp()));
                  },
                  child: Text('go to signUP')),
            ],
          ),
        ),
      ),
    );
  }
}
