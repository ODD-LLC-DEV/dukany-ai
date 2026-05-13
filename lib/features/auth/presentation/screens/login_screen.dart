import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/auth_cubit.dart';
import '../../cubit/auth_state.dart';
import '../../widgets/auth_button_widget.dart';
import '../../widgets/auth_logo_widget.dart';
import '../../widgets/auth_text_field_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(height: 20),
                    const AuthLogoWidget(),
                    const SizedBox(height: 28),
                    Center(
                      child: Text(
                        state.step == AuthStep.phone
                            ? 'Sign in or create your account'
                            : state.step == AuthStep.otp
                                ? 'Enter verification code'
                                : state.step == AuthStep.register
                                    ? 'Create your Dukany account'
                                    : 'Welcome',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        state.step == AuthStep.phone
                            ? 'Enter your phone number and we will check for you.'
                            : state.step == AuthStep.otp
                                ? 'Please enter the 6-digit verification code'
                                : 'Complete your profile details',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    if (state.step == AuthStep.phone) ...[
                      AuthTextFieldWidget(
                        controller: phoneController,
                        hint: 'Phone number',
                        keyboardType: TextInputType.phone,
                        errorText: state.errorMessage,
                      ),
                      const SizedBox(height: 20),
                      AuthButtonWidget(
                        title: 'Send Code',
                        isLoading: state.isLoading,
                        onPressed: () {
                          context.read<AuthCubit>().submitPhone(
                                phoneController.text,
                              );
                        },
                      ),
                    ],
                    if (state.step == AuthStep.otp) ...[
                      AuthTextFieldWidget(
                        controller: otpController,
                        hint: 'Code',
                        keyboardType: TextInputType.number,
                        errorText: state.errorMessage,
                      ),
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          const Text(
                            'Didn\'t receive it? ',
                            style: TextStyle(color: Colors.grey),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.read<AuthCubit>().resendCode();
                            },
                            child: const Text(
                              'Resend code',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      AuthButtonWidget(
                        title: 'Continue',
                        isLoading: state.isLoading,
                        onPressed: () {
                          context.read<AuthCubit>().verifyCode(
                                otpController.text,
                              );
                        },
                      ),
                    ],
                    if (state.step == AuthStep.register) ...[
                      AuthTextFieldWidget(
                        controller: firstNameController,
                        hint: 'First Name',
                      ),
                      const SizedBox(height: 14),
                      AuthTextFieldWidget(
                        controller: lastNameController,
                        hint: 'Last Name (optional)',
                      ),
                      const SizedBox(height: 14),
                      AuthTextFieldWidget(
                        controller: emailController,
                        hint: 'Email (optional)',
                        keyboardType: TextInputType.emailAddress,
                        errorText: state.errorMessage,
                      ),
                      const SizedBox(height: 14),
                      Row(
                        children: const [
                          Icon(Icons.check_box, color: Color(0xFFB8E34B)),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Yes, I want to receive offers and discounts',
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      AuthButtonWidget(
                        title: 'Continue',
                        isLoading: state.isLoading,
                        onPressed: () {
                          context.read<AuthCubit>().createAccount(
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                email: emailController.text,
                                receiveOffers: true,
                              );
                        },
                      ),
                      const SizedBox(height: 14),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(color: Colors.black54),
                          children: [
                            TextSpan(text: 'By creating an account, you agree to '),
                            TextSpan(
                              text: 'privacy policy',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: ' and to the '),
                            TextSpan(
                              text: 'terms of use.',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                    if (state.step == AuthStep.success)
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: Color(0xFFB8E34B),
                                size: 90,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'Welcome ${state.user?.firstName}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
