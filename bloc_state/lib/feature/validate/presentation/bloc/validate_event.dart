part of 'validate_bloc.dart';

sealed class ValidateEvent extends Equatable {
  const ValidateEvent();

  @override
  List<Object> get props => [];
}

final class InitEvent extends ValidateEvent{}

final class CheckForValidationEvent extends ValidateEvent{
  final String email;
  const CheckForValidationEvent({required this.email});

  @override
  List<Object> get props => [email];
}