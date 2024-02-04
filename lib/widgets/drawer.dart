import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  final imgURL =
      "https://th.bing.com/th/id/OIP.z4NBDi6zXvJ_uYs7z3BGHgAAAA?w=400&h=384&rs=1&pid=ImgDetMain";

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: Color.fromARGB(255, 121, 248, 200),
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                currentAccountPicture:
                    CircleAvatar(backgroundImage: NetworkImage(imgURL)),
                accountName: Text("Sahil Pillania"),
                accountEmail: Text(
                  "sahilpillania@gmail.com",
                ),
                margin: EdgeInsets.zero),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.home, color: Colors.white),
            title: Text(
              "Home",
              style: TextStyle(color: Colors.white),
              textScaleFactor: 1.3,
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.profile_circled, color: Colors.white),
            title: Text(
              "Profile",
              style: TextStyle(color: Colors.white),
              textScaleFactor: 1.3,
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.mail, color: Colors.white),
            title: Text(
              "Email",
              style: TextStyle(color: Colors.white),
              textScaleFactor: 1.3,
            ),
          )
        ],
      ),
    ));
  }
}
