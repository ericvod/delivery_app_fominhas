import 'package:flutter/material.dart';

class StoreRegistrationScreen extends StatefulWidget {
  const StoreRegistrationScreen({Key? key}) : super(key: key);

  @override
  StoreRegistrationScreenState createState() => StoreRegistrationScreenState();
}

class StoreRegistrationScreenState extends State<StoreRegistrationScreen> {
  final TextEditingController storeNameController = TextEditingController();
  final TextEditingController itemController = TextEditingController();
  List<String> catalogItems = [];

  void addItem() {
    setState(() {
      catalogItems.add(itemController.text);
      itemController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Loja'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: storeNameController,
              decoration: const InputDecoration(
                labelText: 'Descrição do Item',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: itemController,
              decoration: const InputDecoration(
                labelText: 'Novo Item do Catálogo',
              ),
            ),
            ElevatedButton(
              onPressed: addItem,
              child: const Text('Adicionar Item'),
            ),
            const SizedBox(height: 20),
            Text(
              'Catálogo de Itens:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: catalogItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(catalogItems[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
