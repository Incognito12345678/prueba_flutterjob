import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:prueba_flutter_job/providers/appbarcontroller.dart';
import 'dart:convert';

import '../models/cripto.dart';
import '../pages/information.dart';

class Peticion extends StatefulWidget {
  const Peticion({super.key});

  @override
  State<Peticion> createState() => _PeticionState();
}

class _PeticionState extends State<Peticion> {
  Future<List<Crypto>> fetchData() async {
    const url = 'https://api.coinlore.net/api/tickers/';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      /* En esta línea, estamos utilizando la función jsonDecode() 
      para analizar el cuerpo de la respuesta HTTP y convertirlo en
       un objeto de Dart. La respuesta HTTP contiene una cadena de
        datos en formato JSON, que se puede analizar y convertir en 
        un objeto de Dart utilizando la función jsonDecode(). 
        El resultado es un mapa que contiene una clave llamada data que 
        tiene como valor una lista de objetos.*/
      final List<dynamic> data = jsonDecode(response.body)['data'];

      /*devuelve un objeto que puede contener diferentes tipos de datos 
     en el campo data, por lo que se utiliza dynamic para permitir 
     que la lista pueda contener cualquier tipo de objeto. Luego,
      estos objetos se transforman en una lista de objetos Crypto 
      utilizando el método fromJson() de la clase Crypto.*/
      return data.map((dynamic item) => Crypto.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load coins');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Crypto>>(
        //muestra una lista de criptomonedas utilizando un FutureBuilder y se utiliza para construir el widget a partir de un Future que devuelve una lista de objetos Crypto.
        future: fetchData(),
        builder: (context, snapshot) {
          //snapshot es un objeto que contiene los datos devueltos por el Future.
          if (snapshot.hasData) {
            return ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final coin = snapshot.data![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        //envio datos a la pagina de informacion(toda la informacion de la api)
                        //por medio de la variable recibirdatos
                        builder: (context) => Informacion(
                          recibirdatos: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(coin.name),
                    subtitle: Text('${coin.symbol} - ${coin.priceUsd}'),
                    trailing: Text('\$${coin.percentChange24h}'),
                    //trailing: Text('\$${coin.price.toStringAsFixed(2)}'),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
