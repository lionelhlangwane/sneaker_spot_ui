import 'package:flutter/material.dart';

class ProductSizeButton extends StatelessWidget {
  final int size;
  final bool isSelected;

  const ProductSizeButton(
      {super.key, required this.size, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.05),
      margin: EdgeInsets.only(
        right: MediaQuery.sizeOf(context).width * 0.01,
      ),
      decoration: BoxDecoration(
        color:
            isSelected ? Theme.of(context).colorScheme.primary : Colors.white,
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        size.toString(),
        style: TextStyle(
            color: isSelected ? Colors.white : Colors.black38,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
