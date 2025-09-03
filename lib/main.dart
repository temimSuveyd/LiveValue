import 'package:Dinaro/core/services/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Dinaro/convert/presentation/controllers/cubit/convertCubit/convert_cubit.dart';
import 'package:Dinaro/convert/presentation/controllers/currencyCubit/cubit/currency_cubit.dart';
import 'package:Dinaro/convert/presentation/views/home/home_page.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ConvertCubit(sl())),
        BlocProvider(create: (context) => CurrencyCubit(sl())),
      ],
      child: MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false),
    );
  }
}
