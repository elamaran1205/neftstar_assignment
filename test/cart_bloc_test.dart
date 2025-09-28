import 'package:flutter_test/flutter_test.dart';
import 'package:intern_foodapp_assignment/bloc/cart/cart_block.dart';
import 'package:intern_foodapp_assignment/bloc/cart/cart_event.dart';
import 'package:intern_foodapp_assignment/bloc/cart/cart_state.dart';
import 'package:intern_foodapp_assignment/mockData/foodmenu_data.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('CartBloc Test', () {
    late CartBloc cartBloc;
    final foodItem = FoodMenuData().foods.first;

    setUp(() {
      cartBloc = CartBloc();
    });

    test('initial state is empty cart', () {
      expect(cartBloc.state.items, []);
    });

    blocTest<CartBloc, CartState>(
      'adds item to cart',
      build: () => cartBloc,
      act: (bloc) => bloc.add(AddToCart(foodItem)),
      expect: () => [
        CartState(items: [foodItem]),
      ],
    );

    blocTest<CartBloc, CartState>(
      'removes item from cart',
      build: () => cartBloc..add(AddToCart(foodItem)),
      act: (bloc) => bloc.add(RemoveFromCart(foodItem)),
      expect: () => [
        CartState(items: [foodItem]),
        CartState(items: []),
      ],
    );

    blocTest<CartBloc, CartState>(
      'clears the cart',
      build: () => cartBloc..add(AddToCart(foodItem)),
      act: (bloc) => bloc.add(ClearCart()),
      expect: () => [
        CartState(items: [foodItem]),
        CartState(items: []),
      ],
    );
  });
}
