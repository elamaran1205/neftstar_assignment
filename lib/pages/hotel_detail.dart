import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_foodapp_assignment/bloc/cart/cart_block.dart';
import 'package:intern_foodapp_assignment/bloc/cart/cart_event.dart';
import 'package:intern_foodapp_assignment/bloc/cart/cart_state.dart';
import 'package:intern_foodapp_assignment/mockData/foodmenu_data.dart';
import 'package:intern_foodapp_assignment/utils/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelDetail extends StatefulWidget {
  const HotelDetail({super.key});

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  final food = FoodMenuData().foods;
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final hotelname = args["hotelname"];
    final hotelimg = args["hotelimg"];
    final location = args["location"];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Restaurant Deatils",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: MyColors.black,
            fontSize: 20,
          ),
        ),
        backgroundColor: MyColors.accent,
      ),
      backgroundColor: MyColors.bg1,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            hotelimg,
                            width: double.infinity,
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 1,
                          left: 5,
                          child: _hoteldetailtile(hotelname, location),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Divider(
                indent: 15,
                endIndent: 15,
                color: MyColors.black,
                height: 15,
              ),
              // child:
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.82,
                  ),
                  itemCount: food.length,
                  itemBuilder: (context, index) {
                    final foods = food[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white60,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          spacing: 7,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    foods.image,
                                    height: 100,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 5,
                                  left: 5,
                                  child: Container(
                                    height: 30,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child:
                                          BlocSelector<
                                            CartBloc,
                                            CartState,
                                            bool
                                          >(
                                            selector: (state) =>
                                                state.items.any(
                                                  (item) =>
                                                      item.name == foods.name,
                                                ),
                                            builder: (context, isInCart) {
                                              return IconButton(
                                                padding: EdgeInsets.zero,
                                                constraints:
                                                    const BoxConstraints(),
                                                onPressed: () {
                                                  if (isInCart) {
                                                    context
                                                        .read<CartBloc>()
                                                        .add(
                                                          RemoveFromCart(foods),
                                                        );
                                                  } else {
                                                    context
                                                        .read<CartBloc>()
                                                        .add(AddToCart(foods));
                                                    Get.snackbar(
                                                      "Success",
                                                      "Item added to cart",
                                                    );
                                                  }
                                                },
                                                icon: Icon(
                                                  isInCart
                                                      ? Icons.shopping_cart
                                                      : Icons
                                                            .shopping_cart_outlined,
                                                  color: isInCart
                                                      ? MyColors.accent
                                                      : MyColors.bg2,
                                                  size: 20,
                                                  shadows: [
                                                    const Shadow(
                                                      color: Colors.black,
                                                      blurRadius: 1,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              foods.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "₹${foods.originalprice}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  "₹${foods.strikeprice}",
                                  style: TextStyle(
                                    fontSize: 13,
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.black87,
                                  ),
                                ),
                                const Spacer(),
                                Text(foods.rating),
                                Icon(
                                  Icons.star_border_outlined,
                                  color: MyColors.accent,
                                ),
                              ],
                            ),
                            Row(
                              spacing: 5,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // Text(
                                //   foods.distance,
                                //   style: TextStyle(color: Colors.black54),
                                // ),
                                // Spacer(),
                                Icon(
                                  Icons.local_shipping_outlined,
                                  color: Colors.black54,
                                  size: 19,
                                ),

                                Text(
                                  "${foods.deliverytime} delivery",
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _hoteldetailtile(String name, String location) {
  return Container(
    padding: const EdgeInsets.all(3),
    margin: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Colors.black45,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 2),
        Row(
          children: [
            const Icon(Icons.location_on, color: MyColors.bg1, size: 16),
            const SizedBox(width: 4),
            Text(
              location,
              style: const TextStyle(
                color: MyColors.bg1,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
