import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restaurantes_app/src/models/comentarios_model.dart';
import 'package:restaurantes_app/src/models/restaurante_model.dart';

final _URL = 'https://tellurium.behuns.com/api';

class NewRestaurant with ChangeNotifier{

  List<Restaurantes> headline = [];
  Restaurantes _restaurant;

  Restaurantes get restaurante => this._restaurant;

  set restaurante( Restaurantes value){
    this._restaurant = value;
    notifyListeners();
  }

  NewRestaurant(){

    this.getTopHeadLines();

  }

  getTopHeadLines() async {
    print('Cargando HeadLines...');

    final url = '$_URL/restaurants/';
    final resp = await http.get(Uri.parse(url));

    final newsResponse = restaurantesFromJson( resp.body );

    this.headline.addAll( newsResponse );
    notifyListeners();
  }

  Future<bool> insertComentario( Comentario comentarios ) async {
    final url ='$_URL/reviews/';
    final resp = await http.post(Uri.parse(url), body: comentarioToJson(comentarios));
    final decodedData = jsonDecode(resp.body);
    print(decodedData);
    return true;
  }

}