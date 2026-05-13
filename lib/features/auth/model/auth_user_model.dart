class AuthUserModel {
  const AuthUserModel({
    required this.phoneNumber,
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.receiveOffers = true,
  });

  final String phoneNumber;
  final String firstName;
  final String lastName;
  final String email;
  final bool receiveOffers;

  AuthUserModel copyWith({
    String? phoneNumber,
    String? firstName,
    String? lastName,
    String? email,
    bool? receiveOffers,
  }) {
    return AuthUserModel(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      receiveOffers: receiveOffers ?? this.receiveOffers,
    );
  }
}
