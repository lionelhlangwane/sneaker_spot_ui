import 'package:flutter/material.dart';
import 'package:sneaker_spot_ui/models/product.dart';
import 'package:sneaker_spot_ui/widgets/add_button.dart';
import 'package:sneaker_spot_ui/widgets/product_size_button.dart';

class ProductScreen extends StatelessWidget {
  // Create a variable for data to be parsed
  final Product product;

  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBar(),
      body: _buildUI(context),
    );
  }

  // Custom appbar
  PreferredSizeWidget _appBar() {
    return AppBar(
      scrolledUnderElevation: 0,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_outline))
      ],
    );
  }

  Widget _buildUI(BuildContext context) {
    return Column(
      children: [
        _productImage(context),
        _productDetails(context),
      ],
    );
  }

  Widget _productImage(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.40,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: NetworkImage(
            product.image,
          ),
        ),
      ),
    );
  }

  Widget _productDetails(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 2,
              blurRadius: 10,
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).height * 0.05,
            vertical: MediaQuery.sizeOf(context).width * 0.02),
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _productTitleAndReviews(),
            _productPrice(context),
            _productDescription(context),
            _productSizeSelector(context),
            _addToCartButton(context),
          ],
        ),
      ),
    );
  }

  Widget _productTitleAndReviews() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          product.name,
          textScaler: const TextScaler.linear(1.4),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text("${product.rating.toString()}"),
      ],
    );
  }

  Widget _productPrice(BuildContext context) {
    return Text(
      "\R${product.price}",
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: 25,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _productDescription(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.03),
      child: Text("${product.description}"),
    );
  }

  Widget _productSizeSelector(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 15),
          child: Text("Select a size"),
        ),
        Row(
          children: [
            ProductSizeButton(size: 8),
            ProductSizeButton(size: 9),
            ProductSizeButton(
              size: 10,
              isSelected: true,
            ),
            ProductSizeButton(size: 11),
            ProductSizeButton(size: 12),
            ProductSizeButton(size: 14),
          ],
        )
      ],
    );
  }

  Widget _addToCartButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.02,
      ),
      child: AddButton(
        width: MediaQuery.sizeOf(context).width * 0.80,
        height: MediaQuery.sizeOf(context).height * 0.05,
      ),
    );
  }
}
