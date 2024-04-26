import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../bloc/cart/cart_cubit.dart';
import '../bloc/client/client_cubit.dart';
import '../core/localizations.dart';
import '../core/storage.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late CartCubit cartCubit;
  late ClientCubit clientCubit;

  checkLogin() async {
    Storage storage = Storage();

    final email = await storage.loadUser();

    if (email == null) {
      GoRouter.of(context).replace("/login");
    }
  }

  @override
  void initState() {
    super.initState();
    cartCubit = context.read<CartCubit>();
    clientCubit = context.read<ClientCubit>();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: clientCubit.state.darkMode ? null : Color.fromARGB(255, 248, 248, 248),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          title: Text(
            AppLocalizations.of(context).getTranslate("cart_title"),
            style: TextStyle(
              color: clientCubit.state.darkMode ? null : Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.pending_outlined),
            ),
          ],
        ),
        body: BlocBuilder<CartCubit, CartState>(builder: (context, state) {
          // Sepette ürünler tek tek dizildiği için 2'ye bölmedim
          // Ürün sayısı satır sayısına eşit
          int productsRowCount = state.sepet.length;
          
          double orderListHeight = productsRowCount.toDouble();

          return Column(
            children: [
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TitleItem(AppLocalizations.of(context).getTranslate("cart_shippingAddress")),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          height: 80,
                          decoration: BoxDecoration(
                            color: clientCubit.state.darkMode ? Theme.of(context).colorScheme.onBackground : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    margin: EdgeInsets.only(left: 18),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 213, 213, 213),
                                      shape: BoxShape.circle,
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black87,
                                      child: Icon(Icons.location_on,
                                          color: Colors.white, size: 25),
                                      radius: 18,
                                    ),
                                  ),
                                  Gap(10),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).getTranslate("cart_home"),
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        "61480 Sunbrook Park, PC 5679",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 147, 147, 147),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () =>
                                    GoRouter.of(context).push("/address"),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: SvgPicture.asset(
                                    "assets/icons/pen.svg",
                                    height: 21,
                                    colorFilter: ColorFilter.mode(
                                        Colors.black87, BlendMode.srcIn),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Divider(
                                color: Color.fromARGB(255, 235, 235, 235),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        TitleItem(AppLocalizations.of(context).getTranslate("cart_orderList")),
                        Column(
                          children: [
                            OrderListItem2(
                                "assets/images/armChairImage1.png",
                                "Lawson Chair",
                                250.00,
                                Colors.grey,
                                "Grey",
                                1, 
                                ),
                            OrderListItem2(
                                "assets/images/goldenLampsImage.png",
                                "Parabolic Reflector",
                                170,
                                Colors.brown,
                                "Brown",
                                2, 
                                ),
                          ],
                        ),
                        Container(
                            height: orderListHeight * 180,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: state.sepet.length,
                              itemBuilder: (context, index) => OrderListItem(
                                  state.sepet[index]["photo"].toString(),
                                  state.sepet[index]["name"].toString(),
                                  state.sepet[index]["price"] as double,
                                  state.sepet[index]["color"],
                                  state.sepet[index]["colorName"].toString(),
                                  state.sepet[index]["count"] as int, 
                                  state, 
                                  index),
                            )),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Divider(
                                color: Color.fromARGB(255, 235, 235, 235),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        TitleItem(AppLocalizations.of(context).getTranslate("cart_chooseShipping")),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    margin: EdgeInsets.only(left: 18),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Icon(Icons.local_shipping,
                                          color: Colors.black87, size: 25),
                                      radius: 18,
                                    ),
                                  ),
                                  Gap(10),
                                  Text(
                                    AppLocalizations.of(context).getTranslate("cart_chooseShippingType"),
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Icon(Icons.chevron_right,
                                    size: 25, color: Colors.black87),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Divider(
                                color: Color.fromARGB(255, 235, 235, 235),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        TitleItem(AppLocalizations.of(context).getTranslate("cart_promoCode")),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              height: 45,
                              width: 300,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 238, 238, 238),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: TextField(
                                cursorColor: Color.fromARGB(255, 113, 113, 113),
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: AppLocalizations.of(context).getTranslate("cart_promoCodeHint"),
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 181, 179, 183),
                                    fontSize: 14,
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
                            FilledButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.black87),
                                shape: MaterialStatePropertyAll(CircleBorder()),
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.all(20)),
                              ),
                              child: Icon(Icons.add, size: 17),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PromoCodeInfo(AppLocalizations.of(context).getTranslate("cart_amount"), "₺645.00"),
                              PromoCodeInfo(AppLocalizations.of(context).getTranslate("cart_shipping"), "-"),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Divider(
                                      color: Color.fromARGB(255, 235, 235, 235),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                              PromoCodeInfo(AppLocalizations.of(context).getTranslate("cart_total"), "-"),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Divider(
                                color: Color.fromARGB(255, 235, 235, 235),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: 380,
                child: FilledButton(
                  onPressed: () => GoRouter.of(context).push("/payment"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(clientCubit.state.darkMode ? Theme.of(context).colorScheme.onBackground : Colors.black87),
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 20)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context).getTranslate("cart_continueButton"),
                        style: TextStyle(
                          color: clientCubit.state.darkMode ? Theme.of(context).colorScheme.background : Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      Gap(5),
                      Icon(
                        Icons.arrow_right,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget PromoCodeInfo(String title, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Color.fromARGB(255, 144, 144, 144),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          price,
          style: TextStyle(
            color: Color.fromARGB(255, 118, 118, 118),
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget OrderListItem(String image, String title, double price,
      Color iconColor, String color, int count, CartState state, int index) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 115,
                height: 130,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(image)),
                  color: Color.fromARGB(255, 238, 238, 238),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Gap(15),
              Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      child: Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.circle, size: 14, color: iconColor),
                        Gap(5),
                        Text(
                          color,
                          style: TextStyle(
                            color: Color.fromARGB(255, 141, 141, 141),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "₺" + price.toString(),
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 80,
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      cartCubit.sepettenCikart(id: state.sepet[index]["id"] as int);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: SvgPicture.asset(
                        "assets/icons/trash.svg",
                        height: 20,
                        colorFilter:
                            ColorFilter.mode(Colors.black87, BlendMode.srcIn),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.remove, size: 18, color: Colors.black87),
                      padding: EdgeInsets.all(4),
                      constraints: BoxConstraints(),
                    ),
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 238, 238, 238),
                      child: Text(count.toString()),
                      radius: 18,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add, size: 18, color: Colors.black87),
                      padding: EdgeInsets.all(4),
                      constraints: BoxConstraints(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget OrderListItem2(String image, String title, double price,
      Color iconColor, String color, int count) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 115,
                height: 130,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(image)),
                  color: Color.fromARGB(255, 238, 238, 238),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Gap(15),
              Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      child: Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.circle, size: 14, color: iconColor),
                        Gap(5),
                        Text(
                          color,
                          style: TextStyle(
                            color: Color.fromARGB(255, 141, 141, 141),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "₺" + price.toString(),
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 80,
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: SvgPicture.asset(
                        "assets/icons/trash.svg",
                        height: 20,
                        colorFilter:
                            ColorFilter.mode(Colors.black87, BlendMode.srcIn),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.remove, size: 18, color: Colors.black87),
                      padding: EdgeInsets.all(4),
                      constraints: BoxConstraints(),
                    ),
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 238, 238, 238),
                      child: Text(count.toString()),
                      radius: 18,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add, size: 18, color: Colors.black87),
                      padding: EdgeInsets.all(4),
                      constraints: BoxConstraints(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget TitleItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: clientCubit.state.darkMode ? Theme.of(context).colorScheme.onBackground : Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
