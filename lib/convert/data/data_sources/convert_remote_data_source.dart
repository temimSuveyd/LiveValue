import 'package:Dinaro/core/databases/api/end_points.dart';
import 'package:Dinaro/core/databases/api_consumer.dart';
import 'package:Dinaro/core/params/convert_params.dart';
import 'package:Dinaro/convert/data/models/convert_model.dart';

class ConvertRemoteDataSource {
  final ApiConsumer apiConsumer;

  ConvertRemoteDataSource({required this.apiConsumer});
  Future<ConvertModel> convert({required ConvertParams params}) async {
    final response = await apiConsumer.get(
      "${EndPoints.baserUrl}${EndPoints.convert}"
      "?access_key=${EndPoints.accesskey}"
      "&${EndPoints.from}=${params.from}"
      "&${EndPoints.to}=${params.to}"
      "&${EndPoints.amount}=${params.amount.toInt()}",
    );
    return ConvertModel.fromJson(response);
  }
}
