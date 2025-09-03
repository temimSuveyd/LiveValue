import 'package:dartz/dartz.dart';
import 'package:Dinaro/convert/data/data_sources/convert_remote_data_source.dart';
import 'package:Dinaro/convert/data/data_sources/currency_local_data_source.dart';
import 'package:Dinaro/core/connection/network_info.dart';
import 'package:Dinaro/core/errors/exception.dart';
import 'package:Dinaro/core/errors/failure.dart';
import 'package:Dinaro/core/params/convert_params.dart';
import 'package:Dinaro/convert/domain/entities/convert_entities.dart';
import 'package:Dinaro/convert/domain/entities/currency_entites.dart';
import 'package:Dinaro/convert/domain/repositories/base_convert_repositorie.dart';


class ConvertRepository extends BaseConvertRepositorie {
  final ConvertRemoteDataSource remoteDataSource;
  final CurrencyLocalDataSource localDataSource;
  final NetworkInfoImpl networkInfo;
  ConvertRepository({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.localDataSource,
  });

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
    } else {
      return Left(
        Failure(
          errorMessage:
              "There is a problem on the internet.Please check your connection.",
        ),
      );
    }
  }

  @override
  List<CurrencyEntiteys> getCurrency() {
    return localDataSource.fetchCurrency();
  }
}
