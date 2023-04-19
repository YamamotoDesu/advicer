part of 'advicer_cubit.dart';

abstract class AdvicerQubitState extends Equatable {
  const AdvicerQubitState();

  @override
  List<Object?> get props => [];
}

class AdvicerInitial extends AdvicerQubitState {}

class AdvicerStateLoading extends AdvicerQubitState {}

class AdvicerStateLoaded extends AdvicerQubitState {
  final String advice;
  const AdvicerStateLoaded({
    required this.advice,
  });

  @override
  List<Object?> get props => [advice];
}

class AdvicerStateError extends AdvicerQubitState {
  final String message;
  const AdvicerStateError({required this.message});

  @override
  List<Object?> get props => [message];
}
