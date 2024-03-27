import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:projeto_bloc_test_example/app/modules/model/user_model.dart';
import 'package:projeto_bloc_test_example/app/modules/repository/user_repository_impl.dart';

part 'listagem_controller_state.dart';

class ControllerCubit extends Cubit<ListagemControllerState> {
  ControllerCubit() : super(ListagemControllerInitial());

  final _repository = UserRepositoryImpl();

  Future<void> findAll() async {
    emit(ListagemControllerLoading());
    await Future.delayed(const Duration(seconds: 1));
    final lista = await _repository.findAll();

    emit(ListagemControllerLoaded(nome: lista));
  }
}
