import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:preload_page_view/preload_page_view.dart';

import '../core/storage.dart';
import '../widgets/welcomeBoardingItem.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  final boardingData = [
    {
      "image": "assets/images/boardingImage1.jpg",
      "description": "Sadece sizin için yüksek kaliteli ürünler sunuyoruz",
    },
    {
      "image": "assets/images/boardingImage2.jpg",
      "description": "Sizin memnuniyetiniz bizim bir numarali önceliğimizdir",
    },
    {
      "image": "assets/images/boardingImage3.jpg",
      "description": "Evinizin ihtiyaçlarini hemen karşilayin",
    },
  ];

  int page = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            if (page != 2)
              InkWell(
                onTap: () async {
                  final storage = Storage();
                  await storage.firstLaunched();

                  GoRouter.of(context).replace("/login");
                },
                hoverColor: Colors.transparent,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Atla",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: PreloadPageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    page = value;
                  });
                },
                itemCount: boardingData.length,
                preloadPagesCount: boardingData.length,
                itemBuilder: (context, index) => WelcomeBoardingItem(
                  image: boardingData[index]["image"]!,
                  description: boardingData[index]["description"]!,
                ),
              ),
            ),
            Container(
              height: 140,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 28),
                    height: 6,
                    alignment: Alignment.center,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: boardingData.length,
                      itemBuilder: (context, index) => page == index
                          ? Container(
                              margin: EdgeInsets.symmetric(horizontal: 1),
                              height: 5,
                              width: 15,
                              decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.circular(5)),
                            )
                          : Container(
                              margin: EdgeInsets.symmetric(horizontal: 1),
                              child: Icon(Icons.circle,
                                  size: 7, color: Colors.grey),
                            ),
                    ),
                  ),
                  page == 2
                      ? FilledButton(
                          onPressed: () async {
                            final storage = Storage();
                            await storage.firstLaunched();

                            GoRouter.of(context).replace("/login");
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black87),
                            padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                    horizontal: 85, vertical: 20)),
                          ),
                          child: Text(
                            "Başla",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        )
                      : FilledButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black87),
                            padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                    horizontal: 85, vertical: 20)),
                          ),
                          child: Text(
                            "İleri",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
