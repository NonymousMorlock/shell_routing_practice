import 'package:flutter/material.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  static const routeName = '/shop';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Shop', style: TextStyle(fontSize: 30, color: Colors.red)),
      ),
    );
  }
}
