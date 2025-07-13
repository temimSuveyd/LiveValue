import 'package:dartz/dartz.dart';
import 'package:qimahalan/core/errors/failure.dart';
import 'package:qimahalan/core/params/convert_params.dart';
import 'package:qimahalan/convert/domain/entities/convert_entities.dart';
import 'package:qimahalan/convert/domain/entities/currency_entites.dart';

abstract class BaseConvertRepositorie {
 CurrencyEntiteys getFromCountry();
 CurrencyEntiteys getToCountry();
  Future<Either<Failure, ConvertEntities>> convert({required ConvertParams params});
}
