import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 248, 248, 248),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          title: Text(
            "Address",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    AddressInfo("Home", "61480 Sunbrook Park, PC 5679", true),
                    AddressInfo(
                        "Office", "6993 Meadow Valley Terra, PC 3637", false),
                    AddressInfo(
                        "Apartment", "21833 Clyde Gallagher, PC 4662", false),
                    AddressInfo("Parent's House",
                        "5259 Blue Bill Park, PC 4627", false),
                    AddressInfo(
                        "Town Square", "5375 Summerhouse, PC 4627", false),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: 380,
              child: FilledButton(
                onPressed: () => GoRouter.of(context).push("/addAddress"),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black87),
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 20)),
                ),
                child: Text(
                  "Add New Address",
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

  Widget AddressInfo(String location, String address, bool defaultAddress) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      height: 80,
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
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 213, 213, 213),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.black87,
                  child: Icon(Icons.location_on, color: Colors.white, size: 25),
                  radius: 16,
                ),
              ),
              Gap(10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        location,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Gap(8),
                      if (defaultAddress == true)
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 225, 225, 225),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            "Default",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 9,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                    ],
                  ),
                  Text(
                    address,
                    style: TextStyle(
                      color: Color.fromARGB(255, 147, 147, 147),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SvgPicture.asset(
                "assets/icons/pen.svg",
                height: 21,
                colorFilter: ColorFilter.mode(Colors.black87, BlendMode.srcIn),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
