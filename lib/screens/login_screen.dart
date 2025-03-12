import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'sync_popup.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  void _handleLogin() {
    String username = _userController.text;
    String password = _passController.text;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Vui lòng nhập đầy đủ thông tin")),
      );
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );

    print("Đăng nhập với: $username - $password");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text('Login'),
        actions: [
          IconButton(
            icon: Icon(Icons.sync),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => SyncPopup(),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 2,
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Đăng Nhập",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _userController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "Username",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _passController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _handleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
