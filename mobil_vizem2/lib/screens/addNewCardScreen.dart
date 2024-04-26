import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 248, 248, 248),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          title: Text(
            "Add New Card",
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
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    height: 170,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Mocard",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Image.asset(
                              "assets/images/amazonImage.png",
                              height: 20,
                            )
                          ],
                        ),
                        Gap(4),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 8, color: Colors.white),
                            Gap(2),
                            Icon(Icons.circle, size: 8, color: Colors.white),
                            Gap(2),
                            Icon(Icons.circle, size: 8, color: Colors.white),
                            Gap(2),
                            Icon(Icons.circle, size: 8, color: Colors.white),
                            Gap(6),
                            Icon(Icons.circle, size: 8, color: Colors.white),
                            Gap(2),
                            Icon(Icons.circle, size: 8, color: Colors.white),
                            Gap(2),
                            Icon(Icons.circle, size: 8, color: Colors.white),
                            Gap(2),
                            Icon(Icons.circle, size: 8, color: Colors.white),
                            Gap(6),
                            Icon(Icons.circle, size: 8, color: Colors.white),
                            Gap(2),
                            Icon(Icons.circle, size: 8, color: Colors.white),
                            Gap(2),
                            Icon(Icons.circle, size: 8, color: Colors.white),
                            Gap(2),
                            Icon(Icons.circle, size: 8, color: Colors.white),
                            Gap(6),
                            Icon(Icons.circle, size: 8, color: Colors.white),
                            Gap(2),
                            Icon(Icons.circle, size: 8, color: Colors.white),
                            Gap(2),
                            Icon(Icons.circle, size: 8, color: Colors.white),
                            Gap(2),
                            Icon(Icons.circle, size: 8, color: Colors.white),
                          ],
                        ),
                        Gap(4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Card Holder Name",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 169, 169, 169),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  ".... ....",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 169, 169, 169),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Expry date",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 169, 169, 169),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "..../....",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 169, 169, 169),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Image.asset(
                              "assets/images/mastercardLogo.png",
                              height: 25,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Row(
                      children: [
                        Text(
                          "Card Name",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 238, 238, 238),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      cursorColor: Color.fromARGB(255, 113, 113, 113),
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: "Berkay T",
                        hintStyle: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Row(
                      children: [
                        Text(
                          "Card Number",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 238, 238, 238),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      cursorColor: Color.fromARGB(255, 113, 113, 113),
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: "2672 4738 7837 7270",
                        hintStyle: TextStyle(
                          color: Colors.black87,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: Row(
                              children: [
                                Text(
                                  "Expiry Date",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5),
                            width: 140,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 238, 238, 238),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextField(
                              cursorColor: Color.fromARGB(255, 113, 113, 113),
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: "16/04/2026",
                                hintStyle: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                                suffixIcon: Icon(Icons.calendar_month),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: Row(
                              children: [
                                Text(
                                  "CVV",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5),
                            width: 140,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 238, 238, 238),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextField(
                              cursorColor: Color.fromARGB(255, 113, 113, 113),
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: "699",
                                hintStyle: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: 380,
              child: FilledButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black87),
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 20)),
                ),
                child: Text(
                  "Add",
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
}
