import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_foodapp_assignment/utils/colors.dart';

class OrderHistoryPage extends StatelessWidget {
  final String location;
  final String paymentMode;
  final int totalPrice;

  const OrderHistoryPage({
    super.key,
    this.location = "123, Main Street, City",
    this.paymentMode = "Cash on Delivery",
    this.totalPrice = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bg1,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Order History",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: MyColors.accent,
        leading: IconButton(
          onPressed: () {
            Get.toNamed("/home"); // navigate to home
          },
          icon: const Icon(Icons.home_outlined),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed("/home"); // back to home page
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.accent,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            "Back to Home",
            style: TextStyle(
              fontSize: 16,
              color: MyColors.bg2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              // color: Colors.white70,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Current Order",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(height: 20, thickness: 1.2),
                    ListTile(
                      leading: const Icon(Icons.location_on),
                      title: const Text("Delivery Location"),
                      subtitle: Text(location),
                    ),
                    ListTile(
                      leading: const Icon(Icons.payment),
                      title: const Text("Payment Mode"),
                      subtitle: Text(paymentMode),
                    ),
                    ListTile(
                      leading: const Icon(Icons.attach_money),
                      title: const Text("Total Price"),
                      subtitle: Text("₹$totalPrice"),
                    ),
                    ListTile(
                      leading: const Icon(Icons.check_circle_outline),
                      title: const Text("Status"),
                      subtitle: const Text("Order Placed"),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
