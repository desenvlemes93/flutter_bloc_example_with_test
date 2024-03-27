// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'listagem_controller_cubit.dart';

sealed class ListagemControllerState extends Equatable {
  List<UserModel> contatos = [];
  @override
  List<Object?> get props => [contatos];
}

@immutable
final class ListagemControllerInitial extends ListagemControllerState {}

final class ListagemControllerLoading extends ListagemControllerState {}

class ListagemControllerLoaded extends ListagemControllerState {
  final List<UserModel> nome;
  ListagemControllerLoaded({
    required this.nome,
  });
}
