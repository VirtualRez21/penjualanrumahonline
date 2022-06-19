// ignore_for_file: file_names, prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id, nama, email, noHP, alamat;

  UserModel({
    required this.id,
    required this.nama,
    required this.email,
    required this.noHP,
    required this.alamat,
  });

  @override
  List<Object?> get props => [id, nama, email, noHP, alamat];
}
