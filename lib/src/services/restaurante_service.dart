import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restaurantes_app/src/models/restaurante_model.dart';

final _URL = 'https://tellurium.behuns.com/api';

class NewRestaurant with ChangeNotifier {
  List<Restaurantes> headline = [];
  Restaurantes _restaurant;
  String _idRestaurant;
  String _nombreRestaurant;
  bool _cargaExitosa = true;

  Restaurantes get restaurante => this._restaurant;

  set restaurante(Restaurantes value) {
    this._restaurant = value;
    notifyListeners();
  }

  String get idrestaurante => this._idRestaurant;

  set idrestaurante( String value ){
    this._idRestaurant = value;
    notifyListeners();
  }

  String get nombrerestaurante => this._nombreRestaurant;

  set nombrerestaurante( String value ){
    this._nombreRestaurant = value;
    notifyListeners();
  }

  bool get cargaExitosa => this._cargaExitosa;

  set cargaExitosa( bool value ){
    this._cargaExitosa = value;
    notifyListeners();
  }

  NewRestaurant() {
    this.getTopHeadLines();
  }


  getTopHeadLines() async {
    print('Cargando HeadLines...');

    final url = '$_URL/restaurants/';
    final resp = await http.get(Uri.parse(url));

    final newsResponse = restaurantesFromJson(resp.body);

    this.headline.addAll(newsResponse);
    notifyListeners();
  }

  // String restauran = "d6f43583-6b20-4e52-a947-9d6456145642";

  Future<bool> insertComentario(String restaurant, String email, String comentario, String rating) async {
    final url = '$_URL/reviews/';
    final resp =
        // await http.post(Uri.parse(url), body: comentarioToJson(comentarios));
        await http.post(Uri.parse(url), body: {
      "restaurant": "$restaurant",
      "email": "$email",
      "comments": "$comentario",
      "rating": "$rating"
    });
    final decodedData = jsonDecode(resp.body);
    print(decodedData);
    this.cargaExitosa = true;
    notifyListeners();
    return true;
  }
}
