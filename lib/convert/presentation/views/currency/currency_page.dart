import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Dinaro/convert/presentation/controllers/cubit/convert_cubit.dart';
import 'package:Dinaro/convert/presentation/controllers/currencyCubit/cubit/currency_cubit.dart';
import 'package:Dinaro/convert/presentation/views/home/home_page.dart';
import 'package:Dinaro/core/params/convert_params.dart';

class CurrencyPage extends StatelessWidget {
  const CurrencyPage({super.key, required this.isFrom});

  final bool isFrom;

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      context.read<CurrencyCubit>().fetchCurrency();
    });
    final currencyCubit = BlocProvider.of<CurrencyCubit>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Currency"), backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            TextField(
              onChanged: (value) {
                currencyCubit.seaechBayName(value);
              },
              decoration: InputDecoration(
                hintText: 'Search currency',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: const Color.fromARGB(32, 158, 158, 158),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 16,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Example currency list
            BlocBuilder<CurrencyCubit, CurrencyState>(
              builder: (context, state) {
                if (state is CurrencySuccessFully) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.currencyModel.length,
                      itemBuilder: (context, index) => ListTile(
                        leading: Text(
                          state.currencyModel[index].scienceCode,
                          style: TextStyle(fontSize: 20),
                        ),
                        title: Text(state.currencyModel[index].name),
                        onTap: () {
                          currencyCubit.selectCountry(
                            state.currencyModel[index],
                            isFrom,
                            index,
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BlocProvider.value(
                                value: context.read<CurrencyCubit>(),
                                child: HomePage(),
                              ),
                            ),
                          ).then((_) {
                            context.read<ConvertCubit>().convert(
                              ConvertParams(
                                from: currencyCubit.selectedFromCurrency!.code,
                                to: currencyCubit.sleectedToCurrency!.code,
                                amount: 1,
                              ),
                            );
                          });
                        },
                      ),
                    ),
                  );
                } else {
                  return Center(child: Text(state.toString()));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
