import 'package:e_commerce_app/models/car_model.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final Car car;
  const ProductDetails({super.key, required this.car});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [const BackButton(), Image.network(widget.car.image)],
      ),
    ));
  }
}
