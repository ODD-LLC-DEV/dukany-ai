import '../model/auth_user_model.dart';

enum AuthStep {
  phone,
  otp,
  register,
  success,
}

class AuthState {
  const AuthState({
    this.step = AuthStep.phone,
    this.isLoading = false,
    this.phone = '',
    this.code = '',
    this.errorMessage,
    this.user,
  });

  final AuthStep step;
  final bool isLoading;
  final String phone;
  final String code;
  final String? errorMessage;
  final AuthUserModel? user;

  AuthState copyWith({
    AuthStep? step,
    bool? isLoading,
    String? phone,
    String? code,
    String? errorMessage,
    AuthUserModel? user,
  }) {
    return AuthState(
      step: step ?? this.step,
      isLoading: isLoading ?? this.isLoading,
      phone: phone ?? this.phone,
      code: code ?? this.code,
      errorMessage: errorMessage,
      user: user ?? this.user,
    );
  }
}
