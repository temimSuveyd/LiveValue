import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Dinaro/convert/data/data_sources/convert_remote_data_source.dart';
import 'package:Dinaro/convert/data/data_sources/currency_local_data_source.dart';
import 'package:Dinaro/convert/data/repositories/convert_repository.dart';

import 'package:Dinaro/convert/domain/usecases/convert_useCase.dart';
import 'package:Dinaro/convert/presentation/controllers/cubit/convertCubit/convert_state.dart';
import 'package:Dinaro/core/connection/network_info.dart';
import 'package:Dinaro/core/databases/api/dio_consumer.dart';
import 'package:Dinaro/core/params/convert_params.dart';

class ConvertCubit extends Cubit<ConvertState> {
  ConvertUsecase convertUsecase;

  ConvertCubit(this.convertUsecase) : super(ConvertInitial()) {
    convert(ConvertParams(from: "USD", to: "USD", amount: 1.0));
  }

  FocusNode focusNode = FocusNode();
  TextEditingController controller = TextEditingController();

  convert(ConvertParams params) async {
    emit(ConvertLoading());

    final response = await convertUsecase.call(
      params: ConvertParams(
        from: params.from,
        to: params.to,
        amount: params.amount,
      ),
    );
    response.fold(
      (failuer) => emit(ConvertFailure(errorMesage: failuer.errorMessage)),
      (convert) => emit(ConvertSuccessFully(entities: convert)),
    );
  }
}
