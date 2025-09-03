import 'package:Dinaro/convert/domain/entities/currency_entites.dart';

class CurrencyModel extends CurrencyEntiteys {
  const CurrencyModel({
    required super.code,
    required super.name,
    required super.scienceCode,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      code: json['code'],
      name: json['name'],
      scienceCode: json["scienceCode"],
    );
  }

  Map<String, dynamic> toJson() {
    return {'code': code, 'name': name, "scienceCode": scienceCode};
  }
}
