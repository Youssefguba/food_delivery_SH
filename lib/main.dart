import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:provider/provider.dart';

import 'screens/wrapper_home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartController(), // One Instance, One Object
      child: MaterialApp(home: WrapperHomeScreen()),
    );
  }
}


// architecture patterns
//      vs
// design pattern

// MVC - Model, View, Controller(Business Logic)
// MVVM - Model, ViewModel, View
// Clean Architecture, Features ( Data , Domain , Presentation )
