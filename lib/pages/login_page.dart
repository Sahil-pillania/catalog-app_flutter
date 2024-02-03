import "package:catalog_app/utils/routes.dart";
import "package:flutter/material.dart";

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30.0),
              Image.asset(
                "assets/images/loginImg.png",
                fit: BoxFit.cover,
                height: 250,
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Welcome to the Catalog App",
                style: TextStyle(
                  fontSize: 22,
                  fontStyle: FontStyle.italic,
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
                        onPressed: () {
                          Navigator.pushNamed(context, MyRoutes.homeRoute);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(150, 45),
                        ),
                        child: const Text("Login"),
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}
