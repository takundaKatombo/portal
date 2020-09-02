import 'package:flutter/material.dart';
import 'package:portal/services/firebase_services.dart';
import 'package:portal/services/locator.dart';
import 'package:portal/services/route_generator.dart';
import 'package:portal/ui/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseServices firebaseServices = FirebaseServices();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Portal',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      /*home: StreamProvider(
          create: (BuildContext context) => firebaseServices.getProductList(),
          builder: (context, snapshot) {
            return MyHomePage();
          }),*/
      initialRoute: '/',
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
    );
  }
}
