import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../loginsrc.dart';

class HomeOffice extends StatefulWidget {
  const HomeOffice({ Key? key }) : super(key: key);

  @override
  _HomeOfficeState createState() => _HomeOfficeState();
}

class _HomeOfficeState extends State<HomeOffice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( child:ActionChip(
                  label: Text("Logout"),
                  onPressed: () {
                    logout(context);
                  }),
      )
    );
  }
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginSrc()));
  }
}