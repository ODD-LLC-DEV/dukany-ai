import 'package:flutter/material.dart';

class AddressTypeChipWidget extends StatelessWidget {
  const AddressTypeChipWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 42,
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFB8E34B) : Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFFE5E5E5)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 18),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
