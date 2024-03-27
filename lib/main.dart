import 'package:flutter/material.dart';
import 'package:projeto_bloc_test_example/app/modules/home/home_page.dart';
import 'package:projeto_bloc_test_example/app/modules/listagem/cubit/listagem_controller_cubit.dart';
import 'package:projeto_bloc_test_example/app/modules/listagem/listagem_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Provider<ControllerCubit>(
      create: (context) => ControllerCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
        routes: {
          '/listagem': (_) => const ListagemPage(),
        },
      ),
    );
  }
}
