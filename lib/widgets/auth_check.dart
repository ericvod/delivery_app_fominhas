import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app_fominhas/screens/store/home_store_screen.dart';
import 'package:delivery_app_fominhas/screens/user/home_screen.dart';
import 'package:delivery_app_fominhas/screens/welcome_screen.dart';
import 'package:delivery_app_fominhas/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  late FirebaseFirestore db = FirebaseFirestore.instance;
  late AuthService auth = Provider.of<AuthService>(context);
  late int tipoConta = 0;

  lerDados() async {
    if (auth.usuario != null) {
      final snapshot = await db
          .collection('usuarios/${auth.usuario!.uid}/dados')
          .doc(auth.usuario!.uid)
          .get();

      setState(() {
        tipoConta = snapshot.data()!['tipoConta'];
      });
    }
    if (tipoConta == 1) {
      return;
    } else {
      tipoConta = 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    lerDados();

    if (auth.isLoading) {
      return loading();
    } else if (auth.usuario == null) {
      return const WelcomeScreen();
    } else {
      if (tipoConta == 1) {
        return const HomeScreen();
      } else {
        return const HomeStoreScreen();
      }
    }
  }

  loading() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
