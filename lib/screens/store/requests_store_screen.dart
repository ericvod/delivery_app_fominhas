import 'package:flutter/material.dart';

class RequestsStoreScreen extends StatefulWidget {
  const RequestsStoreScreen({Key? key}) : super(key: key);

  @override
  State<RequestsStoreScreen> createState() => _RequestsStoreScreenState();
}

class _RequestsStoreScreenState extends State<RequestsStoreScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.receipt,
        ),
      ),
    );
  }
}
