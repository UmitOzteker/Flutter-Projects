import 'package:e_ticaret/home.dart';
import 'package:e_ticaret/login.dart';
import 'package:e_ticaret/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'auth_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        if (snapshot.hasData){
          return LoginPage(ShowRegisterPage: () {},);
        }else {
          return AuthPage();
        }
      }
      ,),
    );
  }
}