import 'package:equatable/equatable.dart';

class CurrencyEntiteys extends Equatable {
  final String code;
  final String name;
  final String scienceCode;

  const CurrencyEntiteys(
 {
    required this.code,
    required this.name,
    required this.scienceCode
  });

  @override
  List<Object?> get props => [code, name];
}
