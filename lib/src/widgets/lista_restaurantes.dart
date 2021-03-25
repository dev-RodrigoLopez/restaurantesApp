import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantes_app/src/models/restaurante_model.dart';
import 'package:restaurantes_app/src/services/restaurante_service.dart';

class ListaRestaurante extends StatelessWidget {
  final List<Restaurantes> restaurantes;

  const ListaRestaurante(this.restaurantes);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.restaurantes.length,
        itemBuilder: (BuildContext context, int index) {
          return _Restaurante(
            restaurantes: this.restaurantes[index],
            index: index,
          );
        });
  }
}

class _Restaurante extends StatelessWidget {
  final Restaurantes restaurantes;
  final int index;

  const _Restaurante({@required this.restaurantes, @required this.index});

  @override
  Widget build(BuildContext context) {
    final restaurante = Provider.of<NewRestaurant>(context);
    return GestureDetector(
      onTap: () {
        // print( restaurantes.name );
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Detalles()));
        restaurante.restaurante = restaurantes;
        Navigator.pushNamed(context, 'detalles');
      },
      child: Column(children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          height: 130,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              _Logo(restaurantes),
              _Descripcion(restaurantes),
            ],
          ),
        ),
        Divider(
          color: Colors.red[500],
        ),
      ]),
    );
  }
}

class _Descripcion extends StatelessWidget {
  final Restaurantes restaurante;

  const _Descripcion(this.restaurante);

  @override
  Widget build(BuildContext context) {
    final tamano = MediaQuery.of(context).size;

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: tamano.width * 0.6,
            // color: Colors.blue,
            child: Center(
                child: Text(restaurante.name.trim(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
          ),
          Flexible(
            child: Container(
              // color: Colors.yellow,
              width: tamano.width * 0.68,
              height: tamano.height * 0.1,
              child: Center(
                  child: Text(restaurante.description.trim(),
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.black54))),
            ),
          ),
          _Estrellas(restaurante),
        ],
      ),
    );
  }
}

class _Estrellas extends StatelessWidget {
  final Restaurantes restaurante;

  const _Estrellas(this.restaurante);

  @override
  Widget build(BuildContext context) {
    final tamano = MediaQuery.of(context).size;
    if (restaurante.rating == null) restaurante.rating = 0;
    int valor = restaurante.rating.toInt();

    return Container(
      // color: Colors.red,
      width: tamano.width * .5,
      height: tamano.height * .04,
      child: Center(
        child: Row(children: <Widget>[
          Icon(
            Icons.star,
            color: (valor >= 1) ? Colors.yellow : Colors.white,
            // color: Colors.white,
          ),
          Icon(
            Icons.star,
            color: (valor >= 2) ? Colors.yellow : Colors.white,
            // color: Colors.white,
          ),
          Icon(
            Icons.star,
            color: (valor >= 3) ? Colors.yellow : Colors.white,
            // color: Colors.white,
          ),
          Icon(
            Icons.star,
            color: (valor >= 4) ? Colors.yellow : Colors.white,
            // color: Colors.white,
          ),
          Icon(
            Icons.star,
            color: (valor >= 5) ? Colors.yellow : Colors.white,
            // color: Colors.white,
          ),
        ]),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  final Restaurantes restaurante;

  const _Logo(this.restaurante);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      // color: Colors.blue,
      child: FadeInImage(
        fit: BoxFit.cover,
        placeholder: AssetImage('assets/img/giphy.gif'),
        image: (restaurante.logo != null)
        ? NetworkImage(restaurante.logo)
        : AssetImage('assets/img/no-image.png'),
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
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          children: <Widget>[
            Text('${index + 1}.', style: TextStyle(color: Colors.black87)),
            Text('${restaurante.name}.')
          ],
        ));
  }
}

class _TarjetaTitulo extends StatelessWidget {
  final Restaurantes restaurante;

  const _TarjetaTitulo(this.restaurante);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          restaurante.name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ));
  }
}

class _TarjetaImagen extends StatelessWidget {
  final Restaurantes restaurante;

  const _TarjetaImagen(this.restaurante);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
            child: (restaurante.logo != null)
                ? FadeInImage(
                    placeholder: AssetImage('assets/img/giphy.gif'),
                    image: NetworkImage(restaurante.logo),
                  )
                : Image(image: AssetImage('assets/img/no-image.png'))),
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
      child: Text(
          (restaurante.description != null) ? restaurante.description : ''),
    );
  }
}
