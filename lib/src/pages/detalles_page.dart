import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantes_app/src/models/comentarios_model.dart';
import 'package:restaurantes_app/src/models/restaurante_model.dart';
import 'package:restaurantes_app/src/services/restaurante_service.dart';

class Detalles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tamano = MediaQuery.of(context).size;
    final restaurante = Provider.of<NewRestaurant>(context).restaurante;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(restaurante.name),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: restaurante.reviews.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              // height: 100,
              width: double.infinity,
              child:
                  // Center(child: Text('${restaurante.reviews[index].comments}')),
                  Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Text(
                      restaurante.reviews[index].comments,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        // color: Colors.red,
                        // height: 40,
                        width: tamano.width * 0.60,
                        child: Text(
                          restaurante.reviews[index].email,
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      SizedBox(
                        width: tamano.width * 0.05,
                      ),
                      Container(
                        // color: Colors.red,
                        height: 40,
                        width: tamano.width * 0.20,
                        child: Row(
                          children: [
                            SizedBox(
                              width: tamano.width * 0.10,
                            ),
                            Text(
                              restaurante.reviews[index].rating.toString(),
                              style: TextStyle(fontSize: 12),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 22,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.access_time),
        onPressed: () {
          final comentarios = new Comentario();
          final restaurante = new NewRestaurant();
          // comentarios.comments = "Comentario 3";
          // comentarios.email = "test3@test.com";
          // comentarios.rating = "2";
          // comentarios.restaurant = "33132e88-fbbf-4b3e-9667-6f3bbdbfd013";
          // comentarios.created = null;
          // comentarios.slug = null;
          restaurante.insertComentario(comentarios);
        },
      ),
    );
  }
}
