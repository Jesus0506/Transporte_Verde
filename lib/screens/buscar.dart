import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BuscarBike extends StatefulWidget {
  const BuscarBike({Key? key}) : super(key: key);

  @override
  State<BuscarBike> createState() => _BuscarBikeState();
}

class _BuscarBikeState extends State<BuscarBike> {
  GoogleMapController? _googleMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: GoogleMap(
              onMapCreated: (controller) {
                setState(() {
                  _googleMapController = controller;
                });
              },
              // Configura aquí las opciones del mapa según tus necesidades
              initialCameraPosition: CameraPosition(
                target: LatLng(37.7749, -122.4194), // Coordenadas de ejemplo (San Francisco)
                zoom: 12.0,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(10.0),
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      onPressed: () {
                        // Coloca aquí la lógica para escanear el QR de la bicicleta
                        // Puedes abrir una nueva pantalla, mostrar un diálogo, etc.
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.qr_code),
                          SizedBox(width: 10),
                          Text('Escanear QR de la bicicleta'),
                        ],
                      ),
                    ),
                  ),
                  /* Expanded(
                    flex: 1,
                    child: QrImage(
                      data: 'Datos del QR', // Coloca aquí los datos relevantes
                      version: QrVersions.auto,
                      size: 60.0,
                    ),
                  ), */
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BuscarBike(),
  ));
}
