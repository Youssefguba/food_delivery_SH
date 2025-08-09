import 'package:flutter/material.dart';
import 'package:food_delivery/screens/cart_screen.dart';
import 'package:food_delivery/screens/home_screen.dart';

class WrapperHomeScreen extends StatefulWidget {
  const WrapperHomeScreen({super.key});

  @override
  State<WrapperHomeScreen> createState() => _WrapperHomeScreenState();
}

class _WrapperHomeScreenState extends State<WrapperHomeScreen> {
  int _bodyIndex = 0;

  final List<Widget> _body = const [
    HomeScreen(),
    CartScreen(),
    Center(child: Text('Profile Screen')),
  ];

  final List<String> _appbarTitles = const ['Home', 'Cart', 'Profile'];

  @override
  Widget build(BuildContext context) {
    // print(5000000 * 5000000);
    // DON'T WRITE ANY CODE HERE
    // DON'T TRY THIS AT HOME
    // 4000$ - 200,000 EGP
    return WillPopScope(
      // onPopInvokedWithResult: (isPopped, res) {
      //   print('I pressed on Pop Invoked $isPopped');
      //   if(_bodyIndex == 1 || _bodyIndex == 2) {
      //     setState(() {
      //       _bodyIndex = 0;
      //     });
      //   }
      //
      // },
      onWillPop: () async {
        print('I pressed on Pop Invoked');
        if(_bodyIndex == 1 || _bodyIndex == 2) {
          setState(() {
            _bodyIndex = 0;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(_appbarTitles[_bodyIndex]),
          actions: [
            if (_bodyIndex == 0)
              IconButton(
                onPressed: () {
                  setState(() {
                    _bodyIndex = 1; // Navigate to Cart screen
                  });
                },
                icon: Icon(Icons.shopping_cart_outlined),
              ),
          ],
        ),
        body: SafeArea(child: _body[_bodyIndex]),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _bodyIndex,
          onTap: (index) {
            setState(() {
              _bodyIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Cart',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person_2), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
