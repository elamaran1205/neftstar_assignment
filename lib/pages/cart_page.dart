import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intern_foodapp_assignment/bloc/cart/cart_block.dart';
import 'package:intern_foodapp_assignment/bloc/cart/cart_event.dart';
import 'package:intern_foodapp_assignment/bloc/cart/cart_state.dart';
import 'package:intern_foodapp_assignment/pages/Orders_page.dart';
import 'package:intern_foodapp_assignment/utils/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  final String location = "123 Street bypass";
  void _showCheckoutSheet(BuildContext context, int totalPrice) {
    showModalBottomSheet(
      backgroundColor: MyColors.bg1,
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        String selectedPayment = "Cash on Delivery";

        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: StatefulBuilder(
            builder: (context, setState) => Container(
              padding: const EdgeInsets.all(16),
              height: MediaQuery.of(context).size.height * 0.55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: SizedBox(
                      height: 5,
                      width: 50,
                      child: Divider(color: MyColors.grey, thickness: 3),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Location Card
                  Card(
                    child: ListTile(
                      leading: const Icon(
                        Icons.location_on,
                        color: MyColors.accent,
                      ),
                      title: Text(
                        location,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text("Home Address"),
                      trailing: TextButton(
                        onPressed: () {},
                        child: const Text("Change"),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Payment Options Card
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Payment Options",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Divider(),
                          RadioListTile(
                            value: "Cash on Delivery",
                            groupValue: selectedPayment,
                            onChanged: (value) {
                              setState(() {
                                selectedPayment = value!;
                              });
                            },
                            title: const Text("Cash on Delivery"),
                          ),
                          RadioListTile(
                            value: "Credit/Debit Card",
                            groupValue: selectedPayment,
                            onChanged: (value) {
                              setState(() {
                                selectedPayment = value!;
                              });
                            },
                            title: const Text("Credit/Debit Card"),
                          ),
                          RadioListTile(
                            value: "UPI",
                            groupValue: selectedPayment,
                            onChanged: (value) {
                              setState(() {
                                selectedPayment = value!;
                              });
                            },
                            title: const Text("UPI"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  // Pay Button
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<CartBloc>().add(ClearCart());
                        Get.snackbar("success", "Ordered Successfull");
                        Get.offAll(
                          () => OrderHistoryPage(
                            location: location,
                            paymentMode: selectedPayment,
                            totalPrice: totalPrice,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.accent,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Pay ₹$totalPrice",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bg1,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "My Cart",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: MyColors.accent,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.items.isEmpty) {
            return const Center(child: Text("Your cart is empty 🛒"));
          }

          final itemPrice = state.items.fold<int>(
            0,
            (sum, food) => sum + int.parse(food.originalprice),
          );
          const platformFee = 20;
          final totalPrice = itemPrice + platformFee;

          return Column(
            children: [
              SizedBox(height: 15),
              Expanded(
                child: ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final food = state.items[index];
                    return Card(
                      margin: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 5,
                        bottom: 5,
                      ),
                      child: ListTile(
                        leading: Image.asset(
                          food.image,
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(food.name),
                        subtitle: Text("₹${food.originalprice}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            context.read<CartBloc>().add(RemoveFromCart(food));
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _showCheckoutSheet(context, totalPrice),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.accent,
                      // padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Checkout ₹$totalPrice",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
