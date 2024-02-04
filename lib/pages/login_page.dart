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

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      changeButton = true;
      setState(() {});
      await Future.delayed(Duration(seconds: 2));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                              labelText: "Username"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Username cannot be empty";
                            } else {
                              return null;
                            }
                          },
                        ),

                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Enter Password... ",
                              labelText: "Password"),
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            } else if (value.length < 6) {
                              return "Password must be at least 6 characters";
                            } else {
                              return null;
                            }
                          },
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
                        Material(
                          // decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: changeButton
                              ? BorderRadius.circular(34)
                              : BorderRadius.circular(8),
                          // ),
                          child: InkWell(
                            splashColor: Colors.orange,
                            hoverColor: Colors.green,
                            onTap: () {
                              moveToHome(context);
                            },
                            child: AnimatedContainer(
                                duration: const Duration(seconds: 1),
                                width: changeButton ? 48 : 140,
                                height: 45,
                                child: Center(
                                  child: changeButton
                                      ? const Icon(Icons.done,
                                          color: Colors.white)
                                      : const Text("Login",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                )),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
