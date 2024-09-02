import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final double width, height;

  const AddButton({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: MaterialButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              Text(
                " Add to cart",
                style: TextStyle(color: Colors.white),
              )
            ],
          )),
    );
  }
}
