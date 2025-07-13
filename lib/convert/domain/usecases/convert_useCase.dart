import 'package:dartz/dartz.dart';
import 'package:qimahalan/core/errors/failure.dart';
import 'package:qimahalan/core/params/convert_params.dart';
import 'package:qimahalan/convert/domain/entities/convert_entities.dart';
import 'package:qimahalan/convert/domain/repositories/base_convert_repositorie.dart';

class ConvertUsecase {
  final BaseConvertRepositorie repositorie;

  ConvertUsecase({required this.repositorie});

  Future<Either<Failure, ConvertEntities>> call({
    required ConvertParams params,
  }) {
    return repositorie.convert(params: params);
  }
}
