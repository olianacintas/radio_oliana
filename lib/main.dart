import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_oliana/cubit/radio_cubit/radio_cubit_cubit.dart';
import 'package:radio_oliana/routes/routes.dart';
import 'package:radio_oliana/screens/radio_list_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => RadioCubitCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const RadioListScreen(),
          routes: AppRoutes.routes,
        ));
  }
}
