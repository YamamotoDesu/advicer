import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  AdvicerBloc() : super(AdvicerInitial()) {
    on<AdvicerEvent>((event, emit) async {
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
        AdvicerStateLoaded(advice: 'fake advice to test block'),
      );
      // emit(
      //   AdvicerStateError(message: 'error message'),
      // );
    });
  }
}
