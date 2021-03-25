import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantes_app/src/models/comentarios_model.dart';
import 'package:restaurantes_app/src/models/restaurante_model.dart';
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
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.access_time ),
        onPressed: (){
          final comentarios = new Comentario();
          comentarios.comments = 'Comentario 3';
          comentarios.email = 'test3@test.com';
          comentarios.rating = '2';
          comentarios.restaurant = '33132e88-fbbf-4b3e-9667-6f3bbdbfd013';
          // comentarios.created = null;
          // comentarios.slug = null;
          final restaurante = new NewRestaurant();
          restaurante.insertComentario(comentarios);
        },
      ),
    );
  }
}