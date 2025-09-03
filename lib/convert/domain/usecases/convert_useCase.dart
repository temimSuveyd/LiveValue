import 'package:dartz/dartz.dart';
import 'package:Dinaro/core/errors/failure.dart';
import 'package:Dinaro/core/params/convert_params.dart';
import 'package:Dinaro/convert/domain/entities/convert_entities.dart';
import 'package:Dinaro/convert/domain/repositories/base_convert_repositorie.dart';

class ConvertUsecase {
  final BaseConvertRepositorie repositorie;

  ConvertUsecase({required this.repositorie});

  Future<Either<Failure, ConvertEntities>> call({
    required ConvertParams params,
  }) {
    return repositorie.convert(params: params);
  }


  
}
