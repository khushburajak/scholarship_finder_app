import 'package:equatable/equatable.dart';


class AuthEntity extends Equatable {
  final String? authid;
  final String fName;
  final String lName;
  final String phoneNo;
  final String username;
  final String password;

  const AuthEntity({
    this.authid,
    required this.fName,
    required this.lName,
    required this.phoneNo,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [authid];
}
