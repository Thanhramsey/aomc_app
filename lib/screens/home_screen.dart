import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Màn hình chính")),
      drawer: CustomDrawer(),
      body: Center(child: Text("Chào mừng đến với ứng dụng!")),
    );
  }
}
