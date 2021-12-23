import 'package:crud/providers/Users/users.dart';
import 'package:crud/utils/app_routes.dart';
import 'package:crud/views/form_view.dart';
import 'package:crud/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => Users()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Crud',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          AppRoutes.HOME: (_) => const HomeView(),
          AppRoutes.FORM: (_) => const FormView(),
        },
      ),
    );
  }
}
