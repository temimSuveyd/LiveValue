import 'package:Dinaro/core/databases/api/end_points.dart';
import 'package:Dinaro/convert/domain/entities/sub_entites/info_entites.dart';

class InfoModel extends InfoEntite {
  const InfoModel({required super.quote});

  factory InfoModel.fromJson(Map<String, dynamic> json) =>
      InfoModel(quote: json[ApiKey.quote].toDouble());
}
