import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app_fominhas/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late FirebaseFirestore db;
  late AuthService auth;
  late String nome = '';
  late String telefone = '';
  late String endereco = '';

  lerDados() async {
    if (auth.usuario != null) {
      final snapshot = await db
          .collection('usuarios/${auth.usuario!.uid}/dados')
          .doc(auth.usuario!.uid)
          .get();
      setState(() {
        nome = snapshot.data()!['nome'];
        telefone = snapshot.data()!['telefone'];
        endereco = snapshot.data()!['endereco'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    db = FirebaseFirestore.instance;
    auth = context.read<AuthService>();
    lerDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'Nome: \n$nome',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'Telefone: \n$telefone',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Text(
                      'Endereço: \n$endereco',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: OutlinedButton(
                onPressed: () async {
                  final result =
                      await Navigator.pushNamed(context, '/editProfile');
                  if (result == true) {
                    lerDados();
                  }
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blue,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Editar Dados',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: OutlinedButton(
                onPressed: () => context.read<AuthService>().logout(),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Sair da conta',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
