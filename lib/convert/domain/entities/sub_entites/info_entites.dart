import 'package:equatable/equatable.dart';

class InfoEntite extends Equatable {
  final double quote;

  const InfoEntite({required this.quote});

  @override
  List<Object?> get props => [quote];
}
