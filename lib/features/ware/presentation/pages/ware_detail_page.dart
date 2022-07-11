import 'package:demo_app/features/ware/domain/entities/ware_entity.dart';
import 'package:flutter/material.dart';

class WareDetailPage extends StatelessWidget {
  final WareEntity entity;
  const WareDetailPage({Key? key, required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Warehouse Detail'),
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
              Text('Description : ${entity.description}'),
            ],
          ),
        ),
      ),
    );
  }
}
