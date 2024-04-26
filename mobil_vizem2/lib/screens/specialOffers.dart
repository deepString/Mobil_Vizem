import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:preload_page_view/preload_page_view.dart';

import '../bloc/client/client_cubit.dart';
import '../widgets/pageBoardingItem.dart';

class SpecialOffersScreen extends StatefulWidget {
  const SpecialOffersScreen({super.key});

  @override
  State<SpecialOffersScreen> createState() => _SpecialOffersScreenState();
}

class _SpecialOffersScreenState extends State<SpecialOffersScreen> {
  final boardingData = [
    {
      "image": "assets/images/loungeChairImage1.png",
      "discount": "%25",
      "title": "Bugüne Özel!",
      "description":
          "Sadece bugün için geçerli olan her siparişte indirim kazanin",
    },
    {
      "image": "assets/images/goldenLampsImage.png",
      "discount": "%30",
      "title": "Hafta Sonu Firsatlari",
      "description":
          "Sadece bugün için geçerli olan her siparişte indirim kazanin",
    },
    {
      "image": "assets/images/armChairImage1.png",
      "discount": "%20",
      "title": "Yeni Gelenler",
      "description":
          "Sadece bugün için geçerli olan her siparişte indirim kazanin",
    },
    {
      "image": "assets/images/loungeChairImage1.png",
      "discount": "%25",
      "title": "Black Friday",
      "description":
          "Sadece bugün için geçerli olan her siparişte indirim kazanin",
    },
  ];

  final boardingData2 = [
    {
      "image": "assets/images/goldenLampsImage.png",
      "discount": "%30",
      "title": "Hafta Sonu Firsatlari",
      "description":
          "Sadece bugün için geçerli olan her siparişte indirim kazanin",
    },
    {
      "image": "assets/images/loungeChairImage1.png",
      "discount": "%25",
      "title": "Bugüne Özel!",
      "description":
          "Sadece bugün için geçerli olan her siparişte indirim kazanin",
    },
    {
      "image": "assets/images/armChairImage1.png",
      "discount": "%20",
      "title": "Yeni Gelenler",
      "description":
          "Sadece bugün için geçerli olan her siparişte indirim kazanin",
    },
    {
      "image": "assets/images/loungeChairImage1.png",
      "discount": "%25",
      "title": "Black Friday",
      "description":
          "Sadece bugün için geçerli olan her siparişte indirim kazanin",
    },
  ];

  int pageData1 = 0;
  int pageData2 = 0;

  late ClientCubit clientCubit;
  @override
  void initState() {
    super.initState();
    clientCubit = context.read<ClientCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: clientCubit.state.darkMode ? null : Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          title: Text(
            "Special Offers",
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
        body: Column(
          children: [
            Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  height: 155,
                  decoration: BoxDecoration(
                    color: clientCubit.state.darkMode ? Theme.of(context).inputDecorationTheme.fillColor : Color.fromARGB(255, 231, 231, 231),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: PreloadPageView.builder(
                          onPageChanged: (value) {
                            setState(() {
                              pageData1 = value;
                            });
                          },
                          itemCount: boardingData.length,
                          preloadPagesCount: boardingData.length,
                          itemBuilder: (context, index) => PageBoardingItem(
                              image: boardingData[index]["image"]!,
                              discount: boardingData[index]["discount"]!,
                              title: boardingData[index]["title"]!,
                              description: boardingData[index]["description"]!),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 8,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: boardingData.length,
                          itemBuilder: (context, index) => pageData1 == index
                              ? Icon(
                                  Icons.circle,
                                  size: 8,
                                  color: clientCubit.state.darkMode ? null : Color.fromARGB(180, 50, 50, 50),
                                )
                              : Icon(
                                  Icons.circle_outlined,
                                  size: 8,
                                  color: clientCubit.state.darkMode ? null : Color.fromARGB(180, 50, 50, 50),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  height: 155,
                  decoration: BoxDecoration(
                    color: clientCubit.state.darkMode ? Theme.of(context).inputDecorationTheme.fillColor : Color.fromARGB(255, 231, 231, 231),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: PreloadPageView.builder(
                          onPageChanged: (value) {
                            setState(() {
                              pageData2 = value;
                            });
                          },
                          itemCount: boardingData2.length,
                          preloadPagesCount: boardingData2.length,
                          itemBuilder: (context, index) => PageBoardingItem(
                              image: boardingData2[index]["image"]!,
                              discount: boardingData2[index]["discount"]!,
                              title: boardingData2[index]["title"]!,
                              description: boardingData2[index]["description"]!),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 8,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: boardingData2.length,
                          itemBuilder: (context, index) => pageData2 == index
                              ? Icon(
                                  Icons.circle,
                                  size: 8,
                                  color: clientCubit.state.darkMode ? null : Color.fromARGB(180, 50, 50, 50),
                                )
                              : Icon(
                                  Icons.circle_outlined,
                                  size: 8,
                                  color: clientCubit.state.darkMode ? null : Color.fromARGB(180, 50, 50, 50),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
