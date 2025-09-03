import 'package:Dinaro/convert/domain/entities/convert_entities.dart';
import 'package:Dinaro/convert/domain/entities/currency_entites.dart';

class ConvertState {}

final class ConvertInitial extends ConvertState {}

final class ConvertSuccessFully extends ConvertState {
  final ConvertEntities entities;
  ConvertSuccessFully({required this.entities});
}

final class ConvertLoading extends ConvertState {}

final class ConvertUpdated extends ConvertState {}

final class ConvertFailure extends ConvertState {
  final String errorMesage;
  ConvertFailure({required this.errorMesage});
}


