import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/products_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        /// Search Bar
        _buildSearchBar(),

        /// Image Banner
        _buildBanner(),

        /// Header
        _buildHeader(),

        /// List of Products
        const Expanded(child: ProductsListWidget()),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          hintText: 'Search for food',
          // hintStyle: TextStyle(
          // color: Colors.red.shade300
          // ),4
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return CarouselSlider(
      options: CarouselOptions(height: 200.0),
      items:
          ['assets/images/image_1.avif', 'assets/images/image_2.avif'].map((
            name,
          ) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(name),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'Featured Items',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),

        // Buttons
        Row(
          spacing: 16,
          children: [
            Expanded(
              child: _buildListButton(
                text: 'List View',
                color: Color(0xfff3e7e8),
                textColor: Colors.black,
              ),
            ),
            Expanded(
              child: _buildListButton(
                text: 'Grid View',
                color: Color(0xffe92932),
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildListButton({
    required String text,
    required Color color,
    required Color textColor,
  }) {
    return Container(
      margin: EdgeInsetsDirectional.only(start: 16),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: color, // TODO (Youssef) : Explain this later
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
        ), // TODO (Youssef): Use Font Family
      ),
    );
  }

  // TODO: Search for Grid View

}
