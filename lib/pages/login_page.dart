import "package:flutter/material.dart";

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          child: const Center(
        child: Text(
          "Login Page",
          style: TextStyle(
            fontSize: 41,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
          
        ),
      )),
    );
  }
}
