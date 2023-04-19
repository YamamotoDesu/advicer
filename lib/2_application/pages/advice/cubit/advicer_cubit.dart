import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'advicer_state.dart';

class AdvicerCubit extends Cubit<AdvicerQubitState> {
  AdvicerCubit() : super(AdvicerInitial());

  void adviceRequested() async {
    emit(AdvicerStateLoading());

    debugPrint('fake get advice triggered');
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {},
    );
    debugPrint('got advice');
    emit(
      const AdvicerStateLoaded(
        advice: 'fake advice to test block',
      ),
    );
  }
}
