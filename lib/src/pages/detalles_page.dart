import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantes_app/src/services/restaurante_service.dart';

class Detalles extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final restaurante = Provider.of<NewRestaurant>(context).restaurante;
    return Scaffold(
      appBar: AppBar(
        title: Text( restaurante.name ),
      ),
      body: ListView.builder(
        itemCount: restaurante.reviews.length,
        itemBuilder: ( BuildContext context, int index ){
          return Container(
            child: Center( 
              child: Text('${ restaurante.reviews[index].comments }') 
            ) ,
          );
        },
      ),
    );
  }
}