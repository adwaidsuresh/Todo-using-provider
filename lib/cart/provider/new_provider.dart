import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_main/cart/modelclass/model.dart';

class CartNotifier extends StateNotifier<List<CartData>> {
  CartNotifier() : super([]);
  void add(CartData cartData) {
    state = [...state, cartData];
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartData>>((ref) {
  return CartNotifier();
});
