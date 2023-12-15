import 'package:flutter/material.dart';
import 'package:transporte_verde/screens/buscar.dart';
import 'package:transporte_verde/screens/login/acceder.dart';
import 'package:transporte_verde/screens/login/acceder_registrar.dart';
import 'package:transporte_verde/screens/login/registro.dart';
import 'package:transporte_verde/screens/login/splash_art.dart';
import 'package:transporte_verde/screens/pasarela_pago.dart';
import 'package:transporte_verde/screens/principal.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return WillPopScope(
      onWillPop: () async {
        // Deshabilitar el botón de "regresar"
        return false;
      },
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Transporte verdes',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'splash',
      routes: {
        'splash' : (_) => const SplashScreen(),
        'inicio' : (_) => const AccReg(),
        'acceder' : (_) => const Acceder(),
        'principal' : (_) => const Principal(),
        'registro': (_) => const Registro(),
        'pasarela_pagos': (_) => pasarelaPago(),
        'buscar_bicicleta': (_) => const BuscarBike(),
        /*'predios' : (_) => const Predios(),
        'select_arbitrios': (_) => const SelectArbitrios(),
        'arbitrios_limpieza' :(_) => const ArbitriosLimpieza(),
        'limpieza_detalles' :(_) => const LimpiezaDetalles(),
        'arbitrios_seguridad' :(_) => const ArbitriosSeguridad(),
        'seguridad_detalles' :(_) => const SeguridadDetalles(),
        'viviendas' : (_) => const Viviendas(),
        'validar_dni':(_) => const ValidarDni(),
        'validar_cambio_password':(_) => const ValidarCambio() */
      },
    ),
    );

  }
}