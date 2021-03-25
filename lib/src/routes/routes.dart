import 'package:flutter/material.dart';
import 'package:restaurantes_app/src/pages/comentar_page.dart';
import 'package:restaurantes_app/src/pages/detalles_page.dart';
import 'package:restaurantes_app/src/pages/index_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  
  'index': ( _ ) => IndexPage(),
  'detalles': ( _ ) => Detalles(),
  'comentar': ( _ ) => Comentar(),

};