import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantes_app/src/models/restaurante_model.dart';
import 'package:restaurantes_app/src/services/restaurante_service.dart';

class ListaRestaurante extends StatelessWidget {

  final List<Restaurantes> restaurantes;

  const ListaRestaurante( this.restaurantes);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.restaurantes.length,
      itemBuilder: (BuildContext context, int index){
        return _Restaurante( restaurantes: this.restaurantes[index], index: index, );
      }
    );
  }
}

class _Restaurante extends StatelessWidget {

  final Restaurantes restaurantes;
  final int index;

  const _Restaurante({ 
    @required this.restaurantes, 
    @required this.index});

  @override
  Widget build(BuildContext context) {
    final restaurante = Provider.of<NewRestaurant>(context);
    return GestureDetector(
      onTap: (){
        // print( restaurantes.name );
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Detalles()));
        restaurante.restaurante = restaurantes;
        Navigator.pushNamed(context, 'detalles');
        
      },
      child: Column(
        children: <Widget>[
          _TarjetaTopBar(restaurantes, index),
          _TarjetaTitulo(restaurantes),
          _TarjetaImagen(restaurantes),
          _TarjetaBody(restaurantes),

          SizedBox( height: 10),
          Divider()
        ],
      ),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {

  final Restaurantes restaurante;
  final int index;

  const _TarjetaTopBar(this.restaurante, this.index);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal:10 ),
      margin: EdgeInsets.only( bottom: 10 ),
      child: Row(
        children: <Widget>[
          Text('${ index + 1 }.', style: TextStyle(color: Colors.black87) ),
          Text('${ restaurante.name }.')
        ],
      )
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {

  final Restaurantes restaurante;

  const _TarjetaTitulo(this.restaurante);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal:15 ),
      child: Text(restaurante.name, style: TextStyle( fontSize: 20, fontWeight: FontWeight.w700 ), )
    );
  }
}

class _TarjetaImagen extends StatelessWidget {

  final Restaurantes restaurante;

  const _TarjetaImagen( this.restaurante);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric( vertical:10 ),
      child: ClipRRect(
        borderRadius: BorderRadius.only( topLeft: Radius.circular(50), bottomRight: Radius.circular(50) ), 
        child: Container(
          child: ( restaurante.logo != null )
            ? FadeInImage(
                placeholder: AssetImage( 'assets/img/giphy.gif' ),
                image: NetworkImage( restaurante.logo ),
              )
            : Image( image: AssetImage( 'assets/img/no-image.png' ) ) 
        ),
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {

  final Restaurantes restaurante;

  const _TarjetaBody(this.restaurante);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text( (restaurante.description != null) ? restaurante.description : '' ),
    );
  }
}