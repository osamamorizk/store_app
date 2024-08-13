import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            child: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://img.freepik.com/free-photo/modern-stationary-collection-arrangement_23-2149309648.jpg?size=626&ext=jpg&ga=GA1.1.1396434654.1720388482&semt=ais_hybrid')),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Laptobs',
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
