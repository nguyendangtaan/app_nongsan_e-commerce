
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center (child: Text ("Categories", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white) )),
    );
  }
}
