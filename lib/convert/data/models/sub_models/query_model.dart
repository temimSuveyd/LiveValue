import 'package:Dinaro/core/databases/api/end_points.dart';
import 'package:Dinaro/convert/domain/entities/sub_entites/query_entite.dart';

class QueryModel extends QueryEntite {
  const QueryModel({
    required super.from,
    required super.to,
    required super.amount,
  });

  factory QueryModel.fromJson(Map<String, dynamic> json) => QueryModel(
    from: json[ApiKey.from],
    to: json[ApiKey.to],
    amount: json[ApiKey.amount].toDouble(),
  );
}
