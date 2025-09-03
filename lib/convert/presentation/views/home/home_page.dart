import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Dinaro/convert/presentation/controllers/cubit/convertCubit/convert_cubit.dart';
import 'package:Dinaro/convert/presentation/controllers/currencyCubit/cubit/currency_cubit.dart';
import 'package:Dinaro/convert/presentation/views/home/widgets/home_bodey.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: HomeBodey(),
        ),
      ),
    );
  }
}
