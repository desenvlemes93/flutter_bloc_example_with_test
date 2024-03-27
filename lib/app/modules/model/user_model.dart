import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  final String name;
  final String email;
  final String endereco;
  UserModel({
    required this.name,
    required this.email,
    required this.endereco,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'endereco': endereco,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        'name': final String name,
        'email': final String email,
        'endereco': final String endereco
      } =>
        UserModel(
          name: name,
          email: email,
          endereco: endereco,
        ),
      _ => throw ArgumentError('Invalid Json'),

      // TODO: Handle this case.
    };
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(name: $name, email: $email, endereco: $endereco)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.email == email &&
      other.endereco == endereco;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ endereco.hashCode;
}
