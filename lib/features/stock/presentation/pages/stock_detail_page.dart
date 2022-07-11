import 'package:demo_app/features/stock/domain/entities/stock_entity.dart';
import 'package:flutter/material.dart';

class StockDetailPage extends StatelessWidget {
  final StockEntity entity;
  const StockDetailPage({Key? key, required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Detail'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Stock ID : ${entity.id}'),
              Text('Document Date : ${entity.documentDate}'),
              Text('Posting Date : ${entity.postingDate}'),
              const Divider(color: Colors.transparent,),
              Text('Product', style: Theme.of(context).textTheme.headline6,),
              const Divider(),
              Text('Product ID : ${entity.product.id}'),
              Text('Product Code : ${entity.product.code}'),
              Text('Product Name : ${entity.product.name}'),
              Text('Product Stocking : ${entity.product.stockings}'),
              Text('Product Price : ${entity.product.price}'),
              Text('Product Description : ${entity.product.description}'),
              Text('Product Quantity : ${entity.quantity}'),
              const Divider(color: Colors.transparent,),
              Text('Warehouse', style: Theme.of(context).textTheme.headline6,),
              const Divider(),
              Text('Warehouse ID : ${entity.ware.id}'),
              Text('Warehouse Code : ${entity.ware.code}'),
              Text('Warehouse Stocking : ${entity.ware.stockings}'),
              Text('Warehouse Name : ${entity.ware.name}'),
              Text('Warehouse Description : ${entity.ware.description}')
            ],
          ),
        ),
      ),
    );
  }
}
