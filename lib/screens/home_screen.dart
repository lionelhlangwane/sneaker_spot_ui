import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sneaker_spot_ui/data.dart';
import 'package:sneaker_spot_ui/models/brand.dart';
import 'package:sneaker_spot_ui/models/product.dart';
import 'package:sneaker_spot_ui/screens/product_screen.dart';
import 'package:sneaker_spot_ui/widgets/brand_button.dart';
import 'package:sneaker_spot_ui/widgets/product_card.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(context),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return WaterDropNavBar(
        backgroundColor: Colors.white,
        bottomPadding: MediaQuery.sizeOf(context).height * 0.02,
        waterDropColor: Theme.of(context).colorScheme.primary,
        barItems: [
          BarItem(
            filledIcon: Icons.home,
            outlinedIcon: Icons.home_outlined,
          ),
          BarItem(
            filledIcon: Icons.shopping_bag,
            outlinedIcon: Icons.shopping_bag_outlined,
          ),
          BarItem(
            filledIcon: Icons.settings,
            outlinedIcon: Icons.settings_outlined,
          ),
        ],
        selectedIndex: 0,
        onItemSelected: (index) {});
  }

  Widget _buildUI(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.02,
          vertical: MediaQuery.sizeOf(context).height * 0.01,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _topBar(context),
            _title(),
            _searchField(context),
            _categoriesList(context),
            _productsGrid(context),
          ],
        ),
      ),
    );
  }

  Widget _topBar(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).width * 0.06,
      child: const Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
            "https://i.pravatar.cc/150?img=65",
          ),
        ),
      ]),
    );
  }

  Widget _title() {
    return const Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "Discover\n",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
          ),
          TextSpan(
            text: "Get the best sneakers",
            style: TextStyle(
                color: Colors.black26,
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _searchField(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.08,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.04),
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.search,
            color: Colors.black26,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.80,
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search your favourite sneakers",
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoriesList(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.05,
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.01,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: brands.length,
        itemBuilder: (context, index) {
          // Variable of the brands list
          Brand brand = brands[index];
          // Return an instance of the brand button
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: BrandButton(
              brand: brand,
              isSelected: index == 0,
            ),
          );
        },
      ),
    );
  }

  Widget _productsGrid(BuildContext context) {
    return Expanded(
      child: Container(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              Product product = products[index];
              return ProductCard(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * 0.02,
                    vertical: MediaQuery.sizeOf(context).height * 0.02),
                product: product,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProductScreen(product: product);
                  }));
                },
              );
            }),
      ),
    );
  }
}
