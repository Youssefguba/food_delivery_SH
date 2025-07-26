import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Food Delivery',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              print('Navigating to Cart');
            },
            icon: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: Column(
        spacing: 10,
        children: [
          /// Search Bar
          _buildSearchBar(),

          /// Image Banner
          _buildBanner(),

          /// Header
          _buildHeader(),

          /// List of Products
          Expanded(child: _buildProducts()),
        ],
      ),
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
            _buildListButton(
              text: 'List View',
              color: Color(0xfff3e7e8),
              textColor: Colors.black,
            ),
            _buildListButton(
              text: 'Grid View',
              color: Color(0xffe92932),
              textColor: Colors.white,
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
    return Expanded(
      child: Container(
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
      ),
    );
  }

  // TODO: Search for Grid View
  // TODO: Search for Grid Tile
  Widget _buildProducts() {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return _buildProductItem();
      },
    );
    // return SingleChildScrollView(
    //   child: Column(
    //     children: [for (int i = 0; i < 50; i++) _buildProductItem()],
    //   ),
    // );
  }

  Widget _buildProductItem() {
    return ListTile(
      leading: Container(
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage('assets/images/image_1.avif'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      trailing: _buildListButton(
        text: 'Add to Cart',
        textColor: Colors.black,
        color: Color(0xfff3e7e8),
      ),
      title: Text('Burger Combo'),
      subtitle: Text('Burger Combo with Fries'),
    );
  }
}
