import 'package:qimahalan/core/databases/api/end_points.dart';
import 'package:qimahalan/core/databases/api_consumer.dart';
import 'package:qimahalan/core/params/convert_params.dart';
import 'package:qimahalan/convert/data/models/convert_model.dart';

abstract class BaseConvertRemoteDataSource {
  Future<ConvertModel> convert({required ConvertParams params});
}

class ConvertRemoteDataSource extends BaseConvertRemoteDataSource {
  late final ApiConsumer apiConsumer;

  @override
  @override
  Future<ConvertModel> convert({required ConvertParams params}) async {
    final response = await apiConsumer.post(
      "${EndPoints.baserUrl}${EndPoints.convert}"
      "?access_key=${EndPoints.accesskey}"
      "&${EndPoints.from}=${params.from}"
      "&${EndPoints.to}=${params.to}"
      "&${EndPoints.amount}=${params.amount.toInt()}",
    );
    return ConvertModel.fromJson(response);
  }
}
