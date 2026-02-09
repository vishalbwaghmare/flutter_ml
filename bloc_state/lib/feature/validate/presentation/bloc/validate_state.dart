part of 'validate_bloc.dart';

class ValidateState extends Equatable {
  final bool? isValid;
  final String? validateMessage;
  final Color? iconColor;
  final bool isButtonEnabled;
  const ValidateState({
    this.isValid,
    this.validateMessage,
    this.iconColor,
    required this.isButtonEnabled,
  });

  // factory constructor for inital state
  factory ValidateState.initial(){
    return ValidateState(
      isValid: false,
      validateMessage: '',
      iconColor: Colors.grey,
      isButtonEnabled: true,
    );
  }

/// capyWith method for immutability
  ValidateState copyWith({
    bool? isValid,
    String? validateMessage,
    Color? iconColor,
    bool? isButtonEnabled,
  }){
      return ValidateState(
        isValid: isValid ?? this.isValid,
        validateMessage: validateMessage ?? this.validateMessage,
        iconColor: iconColor ?? this.iconColor,
        isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      );
  }
  @override
  List<Object?> get props => [
    isValid,
    validateMessage,
    iconColor,
    isButtonEnabled,
  ];
}
