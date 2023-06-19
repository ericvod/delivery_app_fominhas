import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app_fominhas/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();

  late FirebaseFirestore db;
  late AuthService auth;
  late DocumentReference<Map<String, dynamic>> userRef;

  @override
  void initState() {
    super.initState();
    db = FirebaseFirestore.instance;
    auth = context.read<AuthService>();
    userRef = db
        .collection('usuarios/${auth.usuario!.uid}/dados')
        .doc(auth.usuario!.uid);
    lerDados();
  }

  void lerDados() async {
    final snapshot = await userRef.get();
    if (snapshot.exists) {
      final data = snapshot.data();
      nomeController.text = data?['nome'] ?? '';
      telefoneController.text = data?['telefone'] ?? '';
      enderecoController.text = data?['endereco'] ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Dados'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
              ),
            ),
            TextField(
              controller: telefoneController,
              decoration: const InputDecoration(
                labelText: 'Telefone',
              ),
            ),
            TextField(
              controller: enderecoController,
              decoration: const InputDecoration(
                labelText: 'Endereço',
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              height: 70,
              width: 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  salvarDados();
                },
                child: const Text(
                  'Salvar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void salvarDados() async {
    final Map<String, dynamic> dados = {
      'nome': nomeController.text,
      'telefone': telefoneController.text,
      'endereco': enderecoController.text,
    };
    await userRef.update(dados);
    if (!mounted) return;
    Navigator.pop(context, true);
  }
}
