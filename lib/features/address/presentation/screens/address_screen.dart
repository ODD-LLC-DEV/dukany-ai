import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/address_cubit.dart';
import '../../cubit/address_state.dart';
import '../../model/address_model.dart';
import '../../widgets/address_input_widget.dart';
import '../../widgets/address_type_chip_widget.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({super.key});

  final buildingController = TextEditingController();
  final apartmentController = TextEditingController();
  final floorController = TextEditingController();
  final streetController = TextEditingController();
  final phoneController = TextEditingController();
  final directionsController = TextEditingController();
  final labelController = TextEditingController();
  final companyController = TextEditingController();
  final houseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddressCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<AddressCubit, AddressState>(
          builder: (context, state) {
            return SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_back),
                        ),
                        const Expanded(
                          child: Text(
                            'New address',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        const SizedBox(width: 48),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xFFF1F1F1),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1524661135-423995f22d0b?q=80&w=1200&auto=format&fit=crop',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const Center(
                                  child: Icon(
                                    Icons.location_on,
                                    size: 48,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xFFE5E5E5)),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.location_on_outlined),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.address.areaTitle,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        state.address.areaSubtitle,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Text(
                                  'Change',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              AddressTypeChipWidget(
                                title: 'Apartment',
                                icon: Icons.apartment,
                                isSelected: state.address.type == AddressType.apartment,
                                onTap: () {
                                  context.read<AddressCubit>().selectType(AddressType.apartment);
                                },
                              ),
                              AddressTypeChipWidget(
                                title: 'House',
                                icon: Icons.home_outlined,
                                isSelected: state.address.type == AddressType.house,
                                onTap: () {
                                  context.read<AddressCubit>().selectType(AddressType.house);
                                },
                              ),
                              AddressTypeChipWidget(
                                title: 'Office',
                                icon: Icons.work_outline,
                                isSelected: state.address.type == AddressType.office,
                                onTap: () {
                                  context.read<AddressCubit>().selectType(AddressType.office);
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          if (state.address.type == AddressType.apartment) ...[
                            AddressInputWidget(
                              hint: 'Building name',
                              controller: buildingController,
                            ),
                            const SizedBox(height: 14),
                            Row(
                              children: [
                                Expanded(
                                  child: AddressInputWidget(
                                    hint: 'Apt. number',
                                    controller: apartmentController,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: AddressInputWidget(
                                    hint: 'Floor (optional)',
                                    controller: floorController,
                                  ),
                                ),
                              ],
                            ),
                          ],
                          if (state.address.type == AddressType.house) ...[
                            AddressInputWidget(
                              hint: 'House',
                              controller: houseController,
                            ),
                          ],
                          if (state.address.type == AddressType.office) ...[
                            AddressInputWidget(
                              hint: 'Building name',
                              controller: buildingController,
                            ),
                            const SizedBox(height: 14),
                            Row(
                              children: [
                                Expanded(
                                  child: AddressInputWidget(
                                    hint: 'Company',
                                    controller: companyController,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: AddressInputWidget(
                                    hint: 'Floor (optional)',
                                    controller: floorController,
                                  ),
                                ),
                              ],
                            ),
                          ],
                          const SizedBox(height: 14),
                          AddressInputWidget(
                            hint: 'Street',
                            controller: streetController,
                          ),
                          const SizedBox(height: 14),
                          AddressInputWidget(
                            hint: 'e.g 123 456 789 0',
                            controller: phoneController,
                          ),
                          const SizedBox(height: 14),
                          AddressInputWidget(
                            hint: 'Additional directions (optional)',
                            controller: directionsController,
                          ),
                          const SizedBox(height: 14),
                          AddressInputWidget(
                            hint: 'Address label (optional)',
                            controller: labelController,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Give this address a label so you can easily choose between them (e.g. Parent\'s home)',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 26),
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<AddressCubit>().saveAddress();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFB8E34B),
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                elevation: 0,
                              ),
                              child: state.isLoading
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(strokeWidth: 2),
                                    )
                                  : const Text(
                                      'Save Address',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                            ),
                          ),
                          if (state.isSaved) ...[
                            const SizedBox(height: 20),
                            const Center(
                              child: Text(
                                'Address saved successfully',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ]
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
