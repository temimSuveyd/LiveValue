import 'package:Dinaro/convert/domain/entities/currency_entites.dart';
import 'package:Dinaro/convert/domain/repositories/base_convert_repositorie.dart';

class GetCurrencyUsecase {
  final BaseConvertRepositorie repositorie;

  GetCurrencyUsecase({required this.repositorie});

  List<CurrencyEntiteys> call() {
    return repositorie.getCurrency();
  }
}
