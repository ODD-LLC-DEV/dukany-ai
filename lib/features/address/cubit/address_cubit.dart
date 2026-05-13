import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/address_model.dart';
import 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit()
      : super(
          AddressState(
            address: const AddressModel(
              areaTitle: 'Area',
              areaSubtitle: 'El Sheikh Zayed - El Hay 7 Al Bostan',
              type: AddressType.apartment,
            ),
          ),
        );

  void selectType(AddressType type) {
    emit(
      state.copyWith(
        address: state.address.copyWith(type: type),
      ),
    );
  }

  Future<void> saveAddress() async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(milliseconds: 900));

    emit(state.copyWith(isLoading: false, isSaved: true));
  }
}
