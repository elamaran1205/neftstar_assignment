import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern_foodapp_assignment/mockData/foodmenu_data.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<AddToCart>((event, emit) {
      if (!state.items.contains(event.item)) {
        final updated = List<Foodmenu>.from(state.items)..add(event.item);
        emit(CartState(items: updated));
      }
    });

    on<RemoveFromCart>((event, emit) {
      final updated = List<Foodmenu>.from(state.items)..remove(event.item);
      emit(CartState(items: updated));
    });

    on<ClearCart>((event, emit) {
      emit(CartState(items: []));
    });
  }
}
