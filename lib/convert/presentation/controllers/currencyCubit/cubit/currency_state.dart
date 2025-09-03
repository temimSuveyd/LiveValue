part of 'currency_cubit.dart';

sealed class CurrencyState extends Equatable {
  const CurrencyState();

  @override
  List<Object> get props => [];
}

final class CurrencyInitial extends CurrencyState {}
final class CurrencyUpdated extends CurrencyState {}

final class CurrencySuccessFully extends CurrencyState {
  final List<CurrencyEntiteys> currencyModel;
  const CurrencySuccessFully({required this.currencyModel});
}
