import 'package:advicer/1_domain/failures/failures.dart';
import 'package:advicer/1_domain/usecases/advice_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advicer_state.dart';

const generalFailureMessage = 'Oops, Unknown Error, please try again!';
const serverFailureMessage = 'Oops, API Error, please try again!';
const cacheFailureMessage = 'Oops, Cache Error, please try again!';

class AdvicerCubit extends Cubit<AdvicerQubitState> {
  AdvicerCubit() : super(AdvicerInitial());
  final AdviceUseCases adviceUseCases = AdviceUseCases();

  void adviceRequested() async {
    emit(AdvicerStateLoading());

    final failureOrAdvice = await adviceUseCases.getAdvice();
    failureOrAdvice.fold(
      (failure) => emit(AdvicerStateError(message: _mapFailureToMesssage(failure))),
      (advice) => emit(AdvicerStateLoaded(advice: advice.advice)),
    );
  }

  String _mapFailureToMesssage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return generalFailureMessage;
    }
  }
}
