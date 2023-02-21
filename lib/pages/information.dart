import 'package:flutter/material.dart';

import '../models/cripto.dart';
import '../widgets/degradado.dart';

class Informacion extends StatefulWidget {
  //recibo datos en una variable de tipo Crypto

  final Crypto? recibirdatos;

  //la informacion que recibo la guardo en la variable recibirdatos
  const Informacion({this.recibirdatos});

  @override
  State<Informacion> createState() => _InformacionState();
}

class _InformacionState extends State<Informacion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //quiero un card con un texto
      body: ListView(
        children: [
          Stack(
            children: [
              Image.asset(
                'images/moneda.jpg',
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
              ),
              const Degradado(),
              Container(
                width: double.infinity,
                height: 900,
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 8,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 250),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: ListView(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.recibirdatos!.nameid,
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.recibirdatos!.id,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.recibirdatos!.percentChange1h,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.recibirdatos!.priceBtc,
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.recibirdatos!.percentChange7d,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.recibirdatos!.marketCapUsd,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.recibirdatos!.csupply,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.recibirdatos!.volume24.toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.recibirdatos!.volume24a.toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.recibirdatos!.tsupply.toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.recibirdatos!.msupply.toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
