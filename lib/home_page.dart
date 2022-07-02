import 'package:flutter/material.dart';
import 'features/product/presentation/pages/product_page.dart';
import 'features/stock/presentation/pages/stock_page.dart';
import 'features/ware/presentation/pages/ware_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Product'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProductPage(),));
              },
            ),
            ListTile(
              title: const Text('Ware'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WarePage(),));
              },
            ),
            ListTile(
              title: const Text('Stock'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StockPage(),));
              },
            )
          ],
        ),
      ),
      body: const SafeArea(
        child: Center(
          child: Text('Home Page'),
        ),
      ),
    );
  }
}
