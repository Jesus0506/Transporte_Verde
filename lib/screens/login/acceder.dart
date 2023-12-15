import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:transporte_verde/config.dart';
import 'package:transporte_verde/helpers/alert.dart';

class Acceder extends StatefulWidget {
  const Acceder({super.key});

  @override
  State<Acceder> createState() => _AccederState();
}

class _AccederState extends State<Acceder> {
  var correoMask = MaskTextInputFormatter(
      mask: '###########', filter: {"#": RegExp(r'[0-9]')});
  final txtClabeWeb = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isVisible = true;
  final txtcorreo = TextEditingController();

  String correo = '';
  String claveWeb = '';
  String mensaje = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => {Navigator.pushNamed(context, 'inicio')},
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Container(
            height: 780,
            width: 400,
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text('"TRANPORTE VERDE"',
                      style: GoogleFonts.aclonica(
                          textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Color.fromRGBO(0, 41, 107, 1),
                      ))),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Center(
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: InterfaceColor.greenFont,
                            image: const DecorationImage(
                                scale: 1.3,
                                image: AssetImage('images/logo.jpg'))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SizedBox(
                      child: TextFormField(
                        //inputFormatters: [correoMask],
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 25, horizontal: 20),
                            hintText: '',
                            labelText: 'Correo electronico'),
                        controller: txtcorreo,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Porfavor ingrese su correo electrónico';
                          } else if (!RegExp(
                                  r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                              .hasMatch(value)) {
                            return 'Por favor ingrese un correo electrónico válido'; // Cambio aquí
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    obscureText: _isVisible,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(0, 0, 0, 0.884),
                          ),
                          borderRadius: BorderRadius.circular(5.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(0, 0, 0, 0.884),
                          ),
                          borderRadius: BorderRadius.circular(5.5),
                        ), // Outline Input Border
                        labelText: "Clave Web",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                          icon: _isVisible
                              ? const Icon(
                                  Icons.visibility_off,
                                  color: Color.fromARGB(255, 117, 117, 117),
                                )
                              : const Icon(
                                  Icons.visibility,
                                  color: Colors.grey,
                                ),
                        ),
                        labelStyle: GoogleFonts.urbanist(
                          textStyle: const TextStyle(
                            color: Color.fromRGBO(131, 145, 161, 1),
                          ),
                        ),
                        filled: true,
                        fillColor: Color.fromRGBO(247, 248, 249, 1)),
                    controller: txtClabeWeb,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor Ingrese su Clave Web';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 360,
                    height: 60,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.5), // Color de la sombra
                          spreadRadius: 0, // Radio de difusión de la sombra
                          blurRadius: 2, // Radio de desenfoque de la sombra
                          offset: Offset(0,
                              3), // Desplazamiento de la sombra (eje x, eje y)
                        ),
                      ],
                      borderRadius:
                          BorderRadius.circular(10.0), // Redondear los bordes
                    ),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          correo = txtcorreo.text;
                          claveWeb = txtClabeWeb.text;

                          print(correo + ' ' + claveWeb);

                          if (correo == "jixuxch@gmail.com" &&
                              claveWeb == "987123437") {
                            Navigator.pushReplacementNamed(
                                context, 'principal');
                          } else if(correo!= "jixuxch@gmail.com" || claveWeb != "987123437"){
                            displayCustomAlert(context: context, icon: Icons.sentiment_dissatisfied_outlined, message: 'Usuario o contraseña incorrecto', color: Colors.red);
                          }
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            InterfaceColor.greenFont),
                      ),
                      child: const Text('Acceder',
                          style: TextStyle(color: Colors.white, fontSize: 30)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '¿No tienes tu Clave Web? ',
                        style: GoogleFonts.urbanist(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(106, 112, 124, 1),
                              fontSize: 20),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          height: 35,
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              'Registrarse',
                              style: GoogleFonts.urbanist(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(0, 41, 107, 1),
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, 'registro');
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    child: Container(
                      height: 35,
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          'Olvide mi contraseña',
                          style: GoogleFonts.urbanist(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(0, 41, 107, 1),
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, 'validar_correo');
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
