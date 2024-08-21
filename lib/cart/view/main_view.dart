import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_main/cart/modelclass/model.dart';
import 'package:todo_main/cart/provider/new_provider.dart';
import 'package:todo_main/cart/view/cartpage.dart';

class Shopping extends ConsumerWidget {
  const Shopping({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final addcart = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cartpage(),
                    ));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      10,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 250,
                              height: 150,
                              color: const Color.fromARGB(255, 244, 130, 130),
                            ),
                          )),
                ),
              ),
              GridView.builder(
                itemCount: 10,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.92,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 2),
                itemBuilder: (context, index) {
                  final product =
                      (CartData(name: 'product$index', price: 10 + index));
                  return Container(
                    width: 250,
                    height: 150,
                    color: const Color.fromARGB(255, 244, 130, 130),
                    child: Column(
                      children: [
                        Text(product.name),
                        Text(product.price.toString()),
                        IconButton(
                            onPressed: () {
                              ref.watch(cartProvider.notifier).add(product);
                            },
                            icon: Icon(Icons.add))
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
