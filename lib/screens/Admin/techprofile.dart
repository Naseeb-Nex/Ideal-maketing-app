import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';

class Techprofilesrc extends StatefulWidget {
  String? name;
  String? img;
  String? uid;
  String? username;
  Techprofilesrc({Key? key, this.name, this.img, this.uid, this.username})
      : super(key: key);

  @override
  _TechprofilesrcState createState() => _TechprofilesrcState();
}

class _TechprofilesrcState extends State<Techprofilesrc> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bluebg,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: bluebg,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: s.height * 0.25,
              width: s.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                color: white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: s.height * 0.13,
                    height: s.height * 0.13,
                    child: const CircleAvatar(
                      backgroundColor: bluebg,
                      backgroundImage:
                          AssetImage("assets/icons/avataricon.png"),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${widget.name}",
                    style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "#Technician",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xffdddde3),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: [
                      const Text(
                        "10",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: white),
                      ),
                      const Text(
                        "Completed",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 15,
                            color: white),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        "10",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: white),
                      ),
                      const Text(
                        "Pending",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 15,
                            color: white),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        "10",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: white),
                      ),
                      const Text(
                        "Processing",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 15,
                            color: white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              width: s.width,
              color: white,
              height: 200,
            )

          ],
        ),
      ),
    );
  }
}
