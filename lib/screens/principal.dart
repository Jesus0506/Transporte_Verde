import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:transporte_verde/config.dart';
import 'package:transporte_verde/screens/menu.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  bool _isExpanded = false;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    /* final contrib = Provider.of<IngresarProvider>(context);

    final predioProvider = Provider.of<PredioProvider>(context);
    final List<dynamic> datos = predioProvider.datos;

    final String codigo = contrib.contribProvider; */
    return Scaffold(
      key: _scaffoldKey,
      drawer: myMenu(),
      body: Container(
        color: const Color.fromARGB(155, 209, 207, 207),
//        color: Colors.red,
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                //color: Colors.amber,
                width: 400,
                height: 700,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.black,
                          size: 35,
                        ),
                        onPressed: () =>
                            _scaffoldKey.currentState?.openDrawer(),
                      ),
                    ),
                    const Title(),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.pushReplacementNamed(
                            context, 'buscar_bicicleta');
                      },
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(243, 134, 216, 67),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 67,
                              width: 67,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage('images/logo.jpg'),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            Expanded(
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: const Text(
                                  'ENCONTRAR MI TRANSPORTE',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'pasarela_pagos');
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors
                              .blue, // Cambia el color según tus preferencias
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: const Text(
                            'Agregar Método de Pago',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          mini: Paint.enableDithering,
          child: const Icon(
            Icons.person,
            size: 35,
          )),
      bottomSheet: _isExpanded ? buildBottomSheet() : null,
    );
  }

  Widget buildBottomSheet() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate:
                SliverChildBuilderDelegate(childCount: 3, (context, index) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromRGBO(227, 227, 222, 1),
                  Color.fromARGB(255, 224, 223, 216),
                  Color.fromARGB(255, 244, 244, 224),
                  Color.fromARGB(255, 224, 223, 216),
                  Color.fromARGB(255, 227, 227, 222),
                ])),
                child: Column(
                  children: [
                    Container(
                      color: Colors.blueAccent,
                      height: 55,
                      width: MediaQuery.of(context).size.width * 1,
                      child: const Center(
                        child: Text(
                          'PERFIL',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          Text('Código de Usuario',
                              style: GoogleFonts.urbanist(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                  color: Color.fromRGBO(0, 41, 107, 1),
                                ),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('C-3075',
                              style: GoogleFonts.aclonica(
                                  fontSize: 26, fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 20,
                          ),
                          Text('Apellidos y Nombres/Razón Social',
                              style: GoogleFonts.urbanist(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Color.fromRGBO(0, 41, 107, 1),
                                ),
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 40,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Text('Cabrera',
                                      style: GoogleFonts.urbanist(
                                        textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 26,
                                        ),
                                      )),
                                  Text('Huari',
                                      style: GoogleFonts.urbanist(
                                        textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 26,
                                        ),
                                      )),
                                  Text('Jesus Alberto',
                                      style: GoogleFonts.urbanist(
                                        textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 26,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  //final UserProfileResponse userProfile;
  const Title({
    Key? key, //required this.userProfile
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Bienvenido !',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: InterfaceColor.colorb),
              ),
              Container(
                height: 20,
              ),
              Container(
                width: 200,
                child: const Text(
                  '¿Que deseas hacer?',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
