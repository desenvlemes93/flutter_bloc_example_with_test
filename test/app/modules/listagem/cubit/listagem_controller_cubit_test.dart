import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:projeto_bloc_test_example/app/modules/listagem/cubit/listagem_controller_cubit.dart';
import 'package:projeto_bloc_test_example/app/modules/model/user_model.dart';
import 'package:projeto_bloc_test_example/app/modules/repository/user_repository.dart';

class MockContactsRepository extends MockBloc implements UserRepository {}

void main() {
  late UserRepository repository;
  late ControllerCubit cubit;
  late List<UserModel> contancts;

  setUp(() {
    repository = MockContactsRepository();
    cubit = ControllerCubit();
    contancts = [
      UserModel(name: 'Ricardo', email: 'teste@gmail.com', endereco: '222'),
      UserModel(name: 'Ricardo', email: 'teste@gmail.com', endereco: '222'),
      UserModel(name: 'Ricardo', email: 'teste@gmail.com', endereco: '222'),
      UserModel(name: 'Ricardo', email: 'teste@gmail.com', endereco: '222'),
      UserModel(name: 'Ricardo', email: 'teste@gmail.com', endereco: '222'),
    ];
  });

  blocTest<ControllerCubit, ListagemControllerState>('Teste',
      build: () => cubit,
      act: (cubit)  =>  cubit.findAll(),
      setUp: () {
        when(
          () => repository.findAll(),
        ).thenAnswer((_) async => contancts);
      },
      expect: () => [
            ListagemControllerLoading(),
            ListagemControllerLoaded( nome: contancts)
          ]);
}
