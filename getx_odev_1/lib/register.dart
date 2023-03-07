import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_odev_1/login.dart';

import 'auth.dart';

class RegisterPage extends StatefulWidget {
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController =TextEditingController();
   final TextEditingController _emailController =TextEditingController();
    final TextEditingController _passwordController =TextEditingController();
     final TextEditingController _sirNameController =TextEditingController();
      AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Ad'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen Adınızı Giriniz';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Soyad'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen Soyadınızı Giriniz';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen Mailinizi giriniz';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Şifre'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen Şifrenizi Giriniz';
                  }
                  return null;
                },
                onSaved: (value) => _password = value!,
                obscureText: true,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                 
                },
                child: Text('Giriş Yap'),
              ),
              ElevatedButton(onPressed: (){
                _authService.createPerson(_nameController.text, _emailController.text, _passwordController.text,_sirNameController.text).then((value){
                 return Get.to(LoginPage());
                });
              }, child: Text("Kayıt Ol"))
            ],
          ),
        ),
      ),
    );
  }
}