import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Dinaro/convert/presentation/controllers/cubit/convertCubit/convert_cubit.dart';
import 'package:Dinaro/convert/presentation/controllers/cubit/convertCubit/convert_state.dart';
import 'package:Dinaro/convert/presentation/controllers/currencyCubit/cubit/currency_cubit.dart';
import 'package:Dinaro/convert/presentation/views/currency/currency_page.dart';
import 'package:Dinaro/convert/presentation/views/home/widgets/calculator_pord.dart';
import 'package:Dinaro/convert/presentation/views/home/widgets/conversion_error_box.dart';
import 'package:Dinaro/convert/presentation/views/home/widgets/conversion_result_box.dart';
import 'package:Dinaro/convert/presentation/views/home/widgets/conversion_result_box_loading.dart';
import 'package:Dinaro/convert/presentation/views/home/widgets/conveter_TextField.dart';
import 'package:Dinaro/convert/presentation/views/home/widgets/currency_selector.dart';
import 'package:Dinaro/convert/presentation/views/home/widgets/exchange_rateInfo_row.dart';
import 'package:Dinaro/convert/presentation/views/home/widgets/exchange_rateInfo_row_loaidng.dart';
import 'package:Dinaro/core/functions/make_a_text_on%20_sports_procedu.dartres.dart';
import 'package:Dinaro/core/params/convert_params.dart';

class HomeBodey extends StatelessWidget {
  const HomeBodey({super.key});

  @override
  Widget build(BuildContext context) {
    final convertCubit = BlocProvider.of<ConvertCubit>(context);
    final currencyCubit = BlocProvider.of<CurrencyCubit>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Top currency selectors
        BlocBuilder<ConvertCubit, ConvertState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CurrencySelector(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CurrencyPage(isFrom: true),
                      ),
                    );
                  },
                  flag: currencyCubit.selectedFromCurrency?.scienceCode ?? "?",
                  currency: currencyCubit.selectedFromCurrency?.code ?? "?",
                ),
                Icon(Icons.swap_horiz, color: Colors.black),
                CurrencySelector(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CurrencyPage(isFrom: false),
                      ),
                    );
                  },
                  flag: currencyCubit.sleectedToCurrency?.scienceCode ?? '?',
                  currency: currencyCubit.sleectedToCurrency?.code ?? '?',
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 32),
        // Input amount
        BlocBuilder<ConvertCubit, ConvertState>(
          builder: (context, state) {
            return CustomConveterTextField(
              focusNode: convertCubit.focusNode,
              controller: convertCubit.controller,
            );
          },
        ),
        const SizedBox(height: 10),

        const SizedBox(height: 10),
        BlocBuilder<ConvertCubit, ConvertState>(
          builder: (context, state) {
            if (state is ConvertLoading) {
              return Column(
                spacing: 20,
                children: [
                  ExchangeRateInfoRowLoading(),
                  ConversionResultBoxLoading(),
                ],
              );
            } else if (state is ConvertSuccessFully) {
              return Column(
                spacing: 20,
                children: [
                  ExchangeRateInfoRow(entities: state.entities),
                  ConversionResultBox(title: state.entities.result.toString()),
                ],
              );
            } else if (state is ConvertFailure) {
              return ConversionErrorBox(errorMessage: state.errorMesage);
            } else {
              return Center(child: Text("Have Error"));
            }
          },
        ),
        const Spacer(),
        // Calculator buttons
        CalculatorPad(
          onPressed: (value) {
            convertCubit.controller = makeATextOnSportsProcedures(
              value,
              convertCubit.controller,
            );
            if (value == "=") {
              convertCubit.convert(
                ConvertParams(
                  from: currencyCubit.selectedFromCurrency!.code,
                  to: currencyCubit.sleectedToCurrency!.code,
                  amount: double.tryParse(convertCubit.controller.text) ?? 1.0,
                ),
              );
            }
          },
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
