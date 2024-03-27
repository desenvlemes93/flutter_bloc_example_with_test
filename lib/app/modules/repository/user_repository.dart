
import 'package:projeto_bloc_test_example/app/modules/model/user_model.dart';

abstract interface class UserRepository {
  Future <List<UserModel>> findAll() ;
}