import 'package:dartz/dartz.dart';
import 'package:qimahalan/convert/data/data_sources/convert_remote_data_source.dart';
import 'package:qimahalan/core/connection/network_info.dart';
import 'package:qimahalan/core/errors/exception.dart';
import 'package:qimahalan/core/errors/failure.dart';
import 'package:qimahalan/core/params/convert_params.dart';
import 'package:qimahalan/convert/domain/entities/convert_entities.dart';
import 'package:qimahalan/convert/domain/entities/currency_entites.dart';
import 'package:qimahalan/convert/domain/repositories/base_convert_repositorie.dart';

class ConvertRepository extends BaseConvertRepositorie {
  final BaseConvertRemoteDataSource remoteDataSource;
  final NetworkInfoImpl networkInfo;
  ConvertRepository(this.remoteDataSource, this.networkInfo);

  @override
  Future<Either<Failure, ConvertEntities>> convert({
    required ConvertParams params,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final response = await remoteDataSource.convert(params: params);
        return Right(response);
      } on ServerException catch (error) {
        return Left(Failure(errorMessage: error.errorModel.errorMessage));
      }
    }else {

      return Left(Failure(errorMessage: "There is a problem on the internet.Please check your connection."));
    }
  }

  @override
  CurrencyEntiteys getFromCountry() {
    // TODO: implement getFromCountry
    throw UnimplementedError();
  }

  @override
  CurrencyEntiteys getToCountry() {
    // TODO: implement getToCountry
    throw UnimplementedError();
  }
}
