import 'package:choose_price/models/product_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final products = [
  ProductInfo('Wireless mouse', 3),
  ProductInfo('Keyboard', 8),
  ProductInfo('Camera', 9),
  ProductInfo('Speaker', 4),
  ProductInfo('Ipad', 1000),
  ProductInfo('Iphone', 13000),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentProductIndex = 0;
  String valuePrice = '0';
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(products[_currentProductIndex].name),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: TextField(
                  key: const Key('priceInput'),
                  onChanged: (value) => valuePrice = value,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    debugPrint(valuePrice);
                    if (products[_currentProductIndex].price ==
                        int.parse(valuePrice)) {
                      result = 'pass';
                    } else {
                      result = 'false';
                    }
                    if (_currentProductIndex < products.length - 1) {
                      _currentProductIndex++;
                    }
                  });
                },
                child: const Text("Check"),
              ),
              Text(result),
            ],
          ),
        ),
      ),
    );
  }
}
