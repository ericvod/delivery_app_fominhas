import 'package:delivery_app_fominhas/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF78F4B5),
      body: SingleChildScrollView(
        child: Container(
          // decoration: BoxDecoration(
          //   border: Border.all(
          //     color: Colors.blueAccent,
          //     width: 3,
          //   ),
          //   borderRadius: const BorderRadius.all(
          //     Radius.circular(20),
          //   ),
          // ),
          margin: const EdgeInsets.fromLTRB(40, 100, 40, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: Text(
                  'Bem vindo',
                  style: GoogleFonts.alike(
                    textStyle: Theme.of(context).textTheme.displayMedium,
                    fontSize: 50,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 100.0),
                width: 200.0,
                height: 200.0,
                child: const Image(image: AssetImage("images/Logo.png")),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                height: 50,
                width: double.infinity,
                child: const CustomButtom(
                    text: 'Cadastre-se', route: 'registrationOption'),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 30),
                height: 50,
                width: double.infinity,
                child: const CustomButtom(text: 'Entrar', route: 'login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
