import '../model/address_model.dart';

class AddressState {
  const AddressState({
    required this.address,
    this.isLoading = false,
    this.isSaved = false,
  });

  final AddressModel address;
  final bool isLoading;
  final bool isSaved;

  AddressState copyWith({
    AddressModel? address,
    bool? isLoading,
    bool? isSaved,
  }) {
    return AddressState(
      address: address ?? this.address,
      isLoading: isLoading ?? this.isLoading,
      isSaved: isSaved ?? this.isSaved,
    );
  }
}
