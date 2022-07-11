import 'package:demo_app/features/product/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntity entity;
  const ProductDetailPage({Key? key, required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ID : ${entity.id}'),
              Text('Code : ${entity.code}'),
              Text('Stocking : ${entity.stockings}'),
              Text('Name : ${entity.name}'),
              Text('Price : \$ ${entity.price.toString()}'),
              Text('Description : ${entity.description}'),
            ],
          ),
        ),
      ),
    );
  }
}
