// lib/blocs/cart/cart_state.dart
import 'package:equatable/equatable.dart';
import 'package:intern_foodapp_assignment/mockData/foodmenu_data.dart'
    show Foodmenu;

class CartState extends Equatable {
  final List<Foodmenu> items;
  const CartState({this.items = const []});

  int get totalItems => items.length;

  @override
  List<Object?> get props => [items];
}
