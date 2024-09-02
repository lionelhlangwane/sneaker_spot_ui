import 'package:flutter/material.dart';
import 'package:sneaker_spot_ui/models/brand.dart';

class BrandButton extends StatelessWidget {
  // Properties from data.dart
  final Brand brand;
  final bool isSelected;

  const BrandButton({super.key, required this.brand, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    // Width & height of the brand button widget
    double iconSize = MediaQuery.sizeOf(context).width * 0.05;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.03),
      decoration: BoxDecoration(
          color:
              isSelected ? Theme.of(context).colorScheme.primary : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.white : Colors.black38,
          ),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: iconSize,
            width: iconSize,
            margin: EdgeInsets.only(right: 10),
            child: Image.network(
              brand.iconURL,
              color: isSelected ? Colors.white : Colors.black38,
            ),
          ),
          Text(
            brand.name,
            style: TextStyle(color: isSelected ? Colors.white : Colors.black38),
          )
        ],
      ),
    );
  }
}
