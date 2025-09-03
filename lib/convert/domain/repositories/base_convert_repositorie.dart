import 'package:dartz/dartz.dart';
import 'package:Dinaro/core/errors/failure.dart';
import 'package:Dinaro/core/params/convert_params.dart';
import 'package:Dinaro/convert/domain/entities/convert_entities.dart';
import 'package:Dinaro/convert/domain/entities/currency_entites.dart';

abstract class BaseConvertRepositorie {
 List<CurrencyEntiteys> getCurrency();
  Future<Either<Failure, ConvertEntities>> convert({required ConvertParams params});
}
