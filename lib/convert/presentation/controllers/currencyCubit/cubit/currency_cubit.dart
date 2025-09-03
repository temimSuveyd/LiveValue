import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Dinaro/convert/domain/entities/currency_entites.dart';
import 'package:Dinaro/convert/domain/usecases/get_currency_useCase.dart';


part 'currency_state.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  GetCurrencyUsecase getCurrencyUsecase ;
  CurrencyCubit(this.getCurrencyUsecase) : super(CurrencyInitial()) {
    fetchCurrency();
  }
  int currntIndex = 0;
  CurrencyEntiteys? selectedFromCurrency;
  CurrencyEntiteys? sleectedToCurrency;
  List<CurrencyEntiteys> allCurrencies = [] ;
  fetchCurrency() {
    final response =getCurrencyUsecase.call();

    allCurrencies = response ;
    emit(CurrencySuccessFully(currencyModel: allCurrencies));
  }

  void selectCountry(CurrencyEntiteys currency, isFrom, int index) {
    currntIndex = index;
    if (isFrom) {
      selectedFromCurrency = currency;
    } else {
      sleectedToCurrency = currency;
    }
    emit(CurrencyUpdated());
  }

  seaechBayName(String query) {
    emit(CurrencyUpdated());
  if (query.isEmpty) {
      emit(CurrencySuccessFully(currencyModel: allCurrencies));
    } else {
      final filtered = allCurrencies.where(
        (currency) =>
            currency.name.toLowerCase().contains(query.toLowerCase()) ||
            currency.code.toLowerCase().contains(query.toLowerCase()),
      ).toList();
      emit(CurrencySuccessFully(currencyModel: filtered));
    }
  }
  }
