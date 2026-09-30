import 'package:flutter/material.dart';

class QuestionC3 extends StatelessWidget {
  const QuestionC3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  'https://picsum.photos/600/400',
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    color: Colors.red,
                    child: const Text('20% OFF', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Premium Headphones', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    children: ['Wireless', 'Noise Cancelling', 'Bluetooth 5.0', 'Long Battery Life']
                        .map((tag) => Chip(label: Text(tag)))
                        .toList(),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Experience high-quality sound with these premium wireless headphones. Featuring active noise cancellation and up to 40 hours of battery life.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      const Expanded(
                        child: Text('\$199.99', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green)),
                      ),
                      const SizedBox(width: 20),
                      Flexible(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor: Colors.orange,
                          ),
                          child: const Text('Add to Cart'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
