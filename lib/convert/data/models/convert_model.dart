import 'package:qimahalan/core/databases/api/end_points.dart';
import 'package:qimahalan/convert/data/models/sub_models/info_model.dart';
import 'package:qimahalan/convert/data/models/sub_models/query_model.dart';
import 'package:qimahalan/convert/domain/entities/convert_entities.dart';

class ConvertModel extends ConvertEntities {
  const ConvertModel({
    required super.info,
    required super.query,
    required super.result,
  });

  factory ConvertModel.fromJson(Map<String, dynamic> json) => ConvertModel(
    info: InfoModel.fromJson(json[ApiKey.info]),
    query: QueryModel.fromJson(json[ApiKey.query]),
    result: json[ApiKey.result],
  );
}
