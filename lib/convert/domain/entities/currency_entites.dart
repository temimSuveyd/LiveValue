import 'package:equatable/equatable.dart';

class CurrencyEntiteys extends Equatable {
  final String code;
  final String name;

  const CurrencyEntiteys({required this.code, required this.name});

  @override
  List<Object?> get props => [code, name];
}
