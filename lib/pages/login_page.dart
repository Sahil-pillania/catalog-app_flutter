import "package:catalog_app/utils/routes.dart";
import "package:flutter/material.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
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
              Text(
                "Welcome to the Catalog App $name ",
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
                          onChanged: (value) {
                            name = value.toString();
                            setState(() {});
                          },
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
                        height: 30.0,
                      ),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                      //   },
                      //   style: TextButton.styleFrom(
                      //     backgroundColor: Colors.blue,
                      //     foregroundColor: Colors.white,
                      //     minimumSize: const Size(150, 45),
                      //   ),
                      //   child: const Text("Login"),
                      // ),
                      InkWell(
                        hoverColor: Colors.green,
                        onTap: () async {
                          changeButton = true;
                          setState(() {});
                          await Future.delayed(Duration(seconds: 2));
                          Navigator.pushNamed(context, MyRoutes.homeRoute);
                        },
                        child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            width: changeButton ? 90 : 140,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: changeButton
                                  ? BorderRadius.circular(14)
                                  : BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: changeButton
                                  ? const Icon(Icons.done, color: Colors.white)
                                  : const Text("Login",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                            )),
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}
