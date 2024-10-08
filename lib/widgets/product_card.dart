import 'package:flutter/material.dart';
import 'package:sneaker_spot_ui/models/product.dart';

class ProductCard extends StatelessWidget {
  // Access to the actual products
  final Product product;
  final EdgeInsets margin;
  final Function onTap;

  const ProductCard(
      {super.key,
      required this.product,
      this.margin = const EdgeInsets.only(),
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: margin,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.02,
            vertical: MediaQuery.sizeOf(context).height * 0.02),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 10,
            )
          ],
          image: DecorationImage(
            fit: BoxFit.contain,
            image: NetworkImage(product.image),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _pricingInformation(context),
            Text(
              product.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  Widget _pricingInformation(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "\R${product.price.toString()}",
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary, fontSize: 20),
        ),
        const Icon(Icons.favorite_outline),
      ],
    );
  }
}
