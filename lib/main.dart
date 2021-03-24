import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantes_app/src/routes/routes.dart';
import 'package:restaurantes_app/src/services/restaurante_service.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new NewRestaurant(),)
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'index',
        routes: appRoutes,
      ),
    );
  }
}