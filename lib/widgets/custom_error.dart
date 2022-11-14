// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CustomExcepiton extends Equatable implements Exception {
  final String message;
  final DateTime date;

  const CustomExcepiton({required this.message, required this.date});

  CustomExcepiton.now({
    required this.message,
  }) : date = DateTime.now();

  @override
  List<Object?> get props => [message, date];
}
