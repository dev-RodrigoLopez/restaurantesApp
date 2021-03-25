import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantes_app/src/pages/index_page.dart';
import 'package:restaurantes_app/src/services/restaurante_service.dart';
import 'package:restaurantes_app/src/widgets/boton.dart';
import 'package:restaurantes_app/src/widgets/custom_input.dart';

class Comentar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     final restaurante = Provider.of<NewRestaurant>(context).restaurante;
     final restauranteController = TextEditingController();
     final correoController = TextEditingController();
     final comentarioController = TextEditingController();
     final calificacionController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text( restaurante.name ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: Column(
            children: <Widget>[
              SizedBox( height:20 ),
              Center(child: Text('Agregar un comentario', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
              // CustomInput(
              //   icon: Icons.restaurant,
              //   placeholder: restaurante.name,
              //   textController: restauranteController,
              //   keyboardType: TextInputType.text,
              // ),
              CustomInput(
                icon: Icons.email,
                placeholder: 'ejemplo@gmail.com',
                textController: correoController,
                keyboardType: TextInputType.emailAddress,
              ),
              CustomInput(
                icon: Icons.comment,
                placeholder: 'Ingresa tu comentario',
                textController: comentarioController,
                keyboardType: TextInputType.text,
              ),
              CustomInput(
                icon: Icons.star,
                placeholder: 'Ingresa tu calificacion',
                textController: calificacionController,
                keyboardType: TextInputType.number,
              ),
              Boton(text: 'Agregar Comentario', 
                onPresed: (){
                  bool bandera = true;
                  String mensaje = "";
                  String submensaje = "";
                  if(correoController.text == '')
                  {
                    // print('Correo');
                    bandera = false;
                    submensaje = 'Campos vacios';
                    mensaje += 'El campo Correo no puede ir vacio ';
                  }
                  if(comentarioController.text == '')
                  {
                    bandera = false;
                    submensaje = 'Campos vacios';

                    mensaje += 'El campo Comentario no puede ir vacio ';
                  }
                  if(calificacionController.text == '')
                  {
                    bandera = false;
                    submensaje = 'Campos vacios';
                    mensaje += 'El campo calificacion no puede ir vacio ';
                  }

                  if(bandera){
                    final restaurant = new NewRestaurant();
                    Future<bool> valor = restaurant.insertComentario(
                      restaurante.slug, 
                      correoController.text, 
                      comentarioController.text, 
                      calificacionController.text
                    );

                    final restauranteProv = Provider.of<NewRestaurant>(context, listen: false);
                    if(restauranteProv.cargaExitosa)
                    {
                      restauranteProv.getTopHeadLines();
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ( IndexPage() )));
                      // Navigator.pop(context);
                    }
                  }
                  else{
                    print('$mensaje');
                    _MostrarAlerta(context, mensaje, submensaje);
                  }
                  


                },
          )
            ],          
        ),
      ),
    );
  }

  _MostrarAlerta(BuildContext context, String mensaje, String submensaje){
    showDialog(
      context: context, 
      builder: ( _ ) => AlertDialog(
        title: Text( submensaje ),
        content: Text( mensaje ),
        actions: <Widget>[
          MaterialButton(
            child: Text('OK'),
            elevation: 5,
            textColor: Colors.red[400],
            onPressed: () => Navigator.pop(context),
          )
        ],
      )
    );
  }


}