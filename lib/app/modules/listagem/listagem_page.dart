import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_bloc_test_example/app/modules/listagem/cubit/listagem_controller_cubit.dart';

class ListagemPage extends StatefulWidget {
  const ListagemPage({super.key});

  @override
  State<ListagemPage> createState() => _ListagemPageState();
}

class _ListagemPageState extends State<ListagemPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ControllerCubit>().findAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: BlocConsumer<ControllerCubit, ListagemControllerState>(
        listener: (context, state) {},
        builder: (context, state) {
          return switch (state) {
            ListagemControllerInitial() => const SizedBox.shrink(),
            ListagemControllerLoading() => const Center(
                child: SizedBox(
                  height: 50,
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                ),
              ),
            ListagemControllerLoaded(nome: var rr) => ListView.builder(
                itemCount: rr.length,
                itemBuilder: (context, index) {
                  var contato = rr[index];
                  print('ENtrou aqui');
                  return ListTile(
                    title: Text(contato.name),
                    subtitle: Text(contato.email),
                  );
                },
              ),
          };
        },
      ),
    );
  }
}
