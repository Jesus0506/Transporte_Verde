import 'package:flutter/material.dart';

import '../../config.dart';

class AccReg extends StatefulWidget {
  const AccReg({super.key});

  @override
  State<AccReg> createState() => _AccRegState();
}

class _AccRegState extends State<AccReg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Align(
          alignment: Alignment.center,
          // ignore: sized_box_for_whitespace
          child: Container(
            
            width: 420,
            height: 850,
            child: Column(
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                      //borderRadius: BorderRadius.circular(10),
                      //color: InterfaceColor.greenFont,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('images/fondou.jpg'))),
                  height: 700,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      width: 190,
                      height: 60,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.5), // Color de la sombra
                            spreadRadius: 0, // Radio de difusión de la sombra
                            blurRadius: 2, // Radio de desenfoque de la sombra
                            offset: const Offset(0,
                                5), // Desplazamiento de la sombra (eje x, eje y)
                          ),
                        ],
                        borderRadius:
                            BorderRadius.circular(10.0), // Redondear los bordes
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'acceder');
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.black),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Redondear los bordes
                            ),
                          ),
                        ),
                        child: const Text('Acceder',
                            style:
                                TextStyle(color: Colors.white, fontSize: 30)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'registro');
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 10.0),
                        height: 60,
                        width: 190,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.5), // Color de la sombra
                                spreadRadius:
                                    0, // Radio de difusión de la sombra
                                blurRadius:
                                    2, // Radio de desenfoque de la sombra
                                offset: const Offset(0,
                                    3), // Desplazamiento de la sombra (eje x, eje y)
                              ),
                            ],
                            border: Border.all(
                                color: Colors.black, width: 3),
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.white),
                        child: const Center(
                            child: Text(
                          'Registrese',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
