enum AddressType { apartment, house, office }

class AddressModel {
  const AddressModel({
    required this.areaTitle,
    required this.areaSubtitle,
    required this.type,
    this.buildingName = '',
    this.apartmentNumber = '',
    this.floor = '',
    this.house = '',
    this.company = '',
    this.street = '',
    this.phone = '',
    this.additionalDirections = '',
    this.addressLabel = '',
  });

  final String areaTitle;
  final String areaSubtitle;
  final AddressType type;
  final String buildingName;
  final String apartmentNumber;
  final String floor;
  final String house;
  final String company;
  final String street;
  final String phone;
  final String additionalDirections;
  final String addressLabel;

  AddressModel copyWith({
    String? areaTitle,
    String? areaSubtitle,
    AddressType? type,
    String? buildingName,
    String? apartmentNumber,
    String? floor,
    String? house,
    String? company,
    String? street,
    String? phone,
    String? additionalDirections,
    String? addressLabel,
  }) {
    return AddressModel(
      areaTitle: areaTitle ?? this.areaTitle,
      areaSubtitle: areaSubtitle ?? this.areaSubtitle,
      type: type ?? this.type,
      buildingName: buildingName ?? this.buildingName,
      apartmentNumber: apartmentNumber ?? this.apartmentNumber,
      floor: floor ?? this.floor,
      house: house ?? this.house,
      company: company ?? this.company,
      street: street ?? this.street,
      phone: phone ?? this.phone,
      additionalDirections: additionalDirections ?? this.additionalDirections,
      addressLabel: addressLabel ?? this.addressLabel,
    );
  }
}
