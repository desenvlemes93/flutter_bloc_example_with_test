import 'package:dio/dio.dart';
import 'package:projeto_bloc_test_example/app/modules/model/user_model.dart';

import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<List<UserModel>> findAll() async {
    final _dio = Dio();

    final response = await _dio.get('http://10.0.0.216:8080/users');

    final responseFinal = response.data as List;

    return responseFinal.map((lista) => UserModel.fromMap(lista)).toList();
  }
}
