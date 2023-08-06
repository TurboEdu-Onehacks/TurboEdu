// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String name;
  final String uid;
  final String email;
  final String password;
  final String coins;
  final String state;
  final String points;
  UserModel({
    required this.name,
    required this.uid,
    required this.email,
    required this.password,
    required this.coins,
    required this.state,
    required this.points,
  });

  UserModel copyWith({
    String? name,
    String? uid,
    String? email,
    String? password,
    String? coins,
    String? state,
    String? points,
  }) {
    return UserModel(
      name: name ?? this.name,
      uid: uid ?? this.uid,
      email: email ?? this.email,
      password: password ?? this.password,
      coins: coins ?? this.coins,
      state: state ?? this.state,
      points: points ?? this.points,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'uid': uid,
      'email': email,
      'password': password,
      'coins': coins,
      'state': state,
      'points': points,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      uid: map['uid'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      coins: map['coins'] as String,
      state: map['state'] as String,
      points: map['points'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, uid: $uid, email: $email, password: $password, coins: $coins, state: $state, points: $points)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.uid == uid &&
      other.email == email &&
      other.password == password &&
      other.coins == coins &&
      other.state == state &&
      other.points == points;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      uid.hashCode ^
      email.hashCode ^
      password.hashCode ^
      coins.hashCode ^
      state.hashCode ^
      points.hashCode;
  }
}

 