import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:scholarshuip_finder_app/app/constants/hive_table_constant.dart';
import 'package:scholarshuip_finder_app/features/auth/domain/entity/auth_entity.dart';
import 'package:uuid/uuid.dart';

part 'auth_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.studentTableId)
class AuthHiveModel extends Equatable {
  @HiveField(0)
  final String studentId;

  @HiveField(1)
  final String? fname;

  @HiveField(2)
  final String? lname;

  @HiveField(3)
  final String? image;

  @HiveField(6)
  final String username;

  @HiveField(7)
  final String password;

  @HiveField(8)
  final String phoneNo;

  // Main Constructor
  AuthHiveModel({
    String? studentId,
    required this.fname,
    required this.lname,
    this.image,
    required this.username,
    required this.password,
    required this.phoneNo,
  }) : studentId = studentId ?? const Uuid().v4();

  // Initial Constructor
  AuthHiveModel.initial()
      : studentId = const Uuid().v4(),
        fname = '',
        lname = '',
        image = '',
        username = '',
        password = '',
        phoneNo = '';

  // from Entity
  factory AuthHiveModel.fromEntity(AuthEntity entity) {
    return AuthHiveModel(
      studentId: entity.authid,
      fname: entity.fName,
      lname: entity.lName,
      image: '', // If `image` exists in AuthEntity, map it here
      username: entity.username,
      password: entity.password,
      phoneNo: entity.phoneNo,
    );
  }

  // to Entity
  AuthEntity toEntity() {
    return AuthEntity(
      authid: studentId,
      fName: fname ?? '',
      lName: lname ?? '',
      phoneNo: phoneNo,
      username: username,
      password: password,
    );
  }

  @override
  List<Object?> get props => [
        studentId,
        fname,
        lname,
        image,
        username,
        password,
        phoneNo
      ];
}
