import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantes_app/src/models/restaurante_model.dart';
import 'package:restaurantes_app/src/services/restaurante_service.dart';
import 'package:restaurantes_app/src/widgets/lista_restaurantes.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final newsRestaurant = Provider.of<NewRestaurant>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Restaurante App'),
        centerTitle: true,
      ),
      // body: ListaRestaurante( newsRestaurant.headline ),
      body: (newsRestaurant.headline.length == 0)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListaRestaurante(newsRestaurant.headline),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
