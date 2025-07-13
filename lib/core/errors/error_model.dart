
import 'package:qimahalan/core/databases/api/end_points.dart';

class ErrorModel {
  final String errorMessage;
  ErrorModel({required this.errorMessage});


  factory ErrorModel.fromJson(Map <String ,dynamic>json) => ErrorModel(errorMessage: json[ApiKey.errorMessage]);

}