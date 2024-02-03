import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  onPressed() {
    print("Clicked ");
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(
              "assets/images/loginImg.png",
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20.0),
            const Text(
              "Welcome to the Catalog App",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(26.0),
                child: Column(
                  children: [
                    TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter username... ",
                            labelText: "Username")),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter Password... ",
                          labelText: "Password"),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: onPressed,
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white),
                      child: Text("Login"),
                    ),
                  ],
                ))
          ],
        ));
  }
}
