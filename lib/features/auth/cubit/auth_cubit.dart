import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/auth_user_model.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  void submitPhone(String phone) async {
    if (phone.length < 11) {
      emit(state.copyWith(errorMessage: 'Please enter a valid phone number'));
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null));

    await Future.delayed(const Duration(milliseconds: 800));

    emit(state.copyWith(
      isLoading: false,
      phone: phone,
      step: AuthStep.otp,
    ));
  }

  void verifyCode(String code) async {
    if (code.length < 6) {
      emit(state.copyWith(errorMessage: 'Incorrect verification code or phone number'));
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null));

    await Future.delayed(const Duration(milliseconds: 800));

    emit(state.copyWith(
      isLoading: false,
      code: code,
      step: AuthStep.register,
    ));
  }

  void createAccount({
    required String firstName,
    required String lastName,
    required String email,
    required bool receiveOffers,
  }) async {
    if (!email.contains('@')) {
      emit(state.copyWith(errorMessage: 'Please enter valid email'));
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null));

    await Future.delayed(const Duration(milliseconds: 800));

    emit(state.copyWith(
      isLoading: false,
      step: AuthStep.success,
      user: AuthUserModel(
        phoneNumber: state.phone,
        firstName: firstName,
        lastName: lastName,
        email: email,
        receiveOffers: receiveOffers,
      ),
    ));
  }

  void resendCode() {}
}
