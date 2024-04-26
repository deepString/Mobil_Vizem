import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 248, 248, 248),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          title: Text(
            "Payment",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.pending_outlined),
            ),
            SizedBox(
              width: 5,
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    PaymentItem("assets/images/paypalImage.png", "PayPal", 22),
                    PaymentItem(
                        "assets/images/googleImage.webp", "Google Pay", 28),
                    PaymentItem(
                        "assets/images/appleImage.png", "Apple Pay", 22),
                    PaymentItem("assets/images/masterCardImage.png",
                        "**** **** **** 4679", 34),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: 380,
              child: FilledButton(
                onPressed: () => GoRouter.of(context).push("/addcard"),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black87),
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 20)),
                ),
                child: Text(
                  "Add New Card",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget PaymentItem(String logo, String card, double logoWidth) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  logo,
                  width: logoWidth,
                ),
                Gap(8),
                Text(
                  card,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Text(
              "Connected",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
