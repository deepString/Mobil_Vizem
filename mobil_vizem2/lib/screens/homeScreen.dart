import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:preload_page_view/preload_page_view.dart';

import '../bloc/client/client_cubit.dart';
import '../bloc/favorites/favorites_cubit.dart';
import '../core/localizations.dart';
import '../core/storage.dart';
import '../widgets/drawerItem.dart';
import '../widgets/pageBoardingItem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  var products = [
    {
      "id": 1,
      "name": "Armchair",
      "photo": "assets/images/armChairImage1.png",
      "price": 320.00,
      "color": Colors.grey,
      "colorName": "Grey",
      "point": "4.5",
      "sales": "8374 satildi",
    },
    {
      "id": 2,
      "name": "Small Bookcase",
      "photo": "assets/images/bookCaseImage1.png",
      "price": 410.00,
      "color": Colors.brown,
      "colorName": "Brown",
      "point": "4.7",
      "sales": "7483 satildi",
    },
    {
      "id": 3,
      "name": "Glass Lamp",
      "photo": "assets/images/lampImage1.jpg",
      "price": 180.00,
      "color": Colors.black87,
      "colorName": "Black",
      "point": "4.3",
      "sales": "6937 satildi",
    },
    {
      "id": 4,
      "name": "Lounge Chair",
      "photo": "assets/images/loungeChairImage1.png",
      "price": 300.00,
      "color": Colors.grey,
      "colorName": "Grey",
      "point": "4.2",
      "sales": "5960 satildi",
    },
    {
      "id": 5,
      "name": "Armchair 2",
      "photo": "assets/images/armChairImage2.png",
      "price": 300.00,
      "color": Colors.grey,
      "colorName": "Grey",
      "point": "4.8",
      "sales": "7990 satildi",
    },
    {
      "id": 6,
      "name": "Candle",
      "photo": "assets/images/candleImage1.webp",
      "price": 80.00,
      "color": Colors.grey,
      "colorName": "Grey",
      "point": "4.6",
      "sales": "8640 satildi",
    },
    {
      "id": 7,
      "name": "Dolap",
      "photo": "assets/images/dolapImage1.webp",
      "price": 280.00,
      "color": Colors.brown,
      "colorName": "Brown",
      "point": "4.5",
      "sales": "5880 satildi",
    },
    {
      "id": 8,
      "name": "Golden Lamps",
      "photo": "assets/images/goldenLampsImage.png",
      "price": 250.00,
      "color": Colors.brown,
      "colorName": "Brown",
      "point": "4.8",
      "sales": "8340 satildi",
    },
    {
      "id": 9,
      "name": "Lamp",
      "photo": "assets/images/lampImage2.jpg",
      "price": 150.00,
      "color": Colors.grey,
      "colorName": "Grey",
      "point": "4.4",
      "sales": "6890 satildi",
    },
    {
      "id": 10,
      "name": "Oturma Grubu",
      "photo": "assets/images/oturmaGrubuImage1.webp",
      "price": 1200.00,
      "color": Colors.grey,
      "colorName": "Grey",
      "point": "4.7",
      "sales": "3540 satildi",
    },
    {
      "id": 11,
      "name": "Table",
      "photo": "assets/images/tableImage1.png",
      "price": 250.00,
      "color": Colors.brown,
      "colorName": "Brown",
      "point": "4.5",
      "sales": "5720 satildi",
    },
  ];

  int page = 0;

  late FavoritesCubit favoritesCubit;
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
    favoritesCubit = context.read<FavoritesCubit>();
    clientCubit = context.read<ClientCubit>();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: clientCubit.state.darkMode ? null : Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          toolbarHeight: 35,
          iconTheme: IconThemeData(
            size: 20,
            color: clientCubit.state.darkMode ? null : Colors.black87,
          ),
        ),
        drawer: Drawer(
          backgroundColor: clientCubit.state.darkMode
              ? null
              : Color.fromARGB(255, 251, 251, 251),
          surfaceTintColor: clientCubit.state.darkMode
              ? null
              : Color.fromARGB(255, 251, 251, 251),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 6, left: 10, top: 40, bottom: 20),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: clientCubit.state.darkMode
                            ? null
                            : Color.fromARGB(255, 132, 132, 132),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              clientCubit.state.darkMode ? null : Colors.white,
                        ),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/profil1.jpg"),
                          radius: 40,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Berkay T",
                      style: TextStyle(
                        color:
                            clientCubit.state.darkMode ? null : Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Divider(
                      color: clientCubit.state.darkMode
                          ? null
                          : Color.fromARGB(136, 155, 155, 155),
                    ),
                    DrawerItem(
                      clientCubit: clientCubit,
                      title: "Home",
                      icon: Icons.home_outlined,
                      onTap: () {}, // Zaten home sayfasindayiz bu yüzden eklemedim
                    ),
                    DrawerItem(
                      clientCubit: clientCubit,
                      title: "Privacy Policy",
                      icon: Icons.lock_outline,
                      onTap: () => GoRouter.of(context).push("/privacy"),
                    ),
                    DrawerItem(
                      clientCubit: clientCubit,
                      title: "Help Center",
                      icon: Icons.headset_mic,
                      onTap: () => GoRouter.of(context).push("/helpcenter"),
                    ),
                    Divider(
                      color: clientCubit.state.darkMode
                          ? null
                          : Color.fromARGB(136, 155, 155, 155),
                    ),
                    DrawerItem(
                      clientCubit: clientCubit,
                      title: "Logout",
                      icon: Icons.logout,
                      onTap: () async {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) => AlertDialog(
                            surfaceTintColor: Colors.white,
                            title: Row(
                              children: [
                                Icon(
                                  Icons.warning,
                                  size: 30,
                                  color: Colors.red.shade300,
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  "Çikişi Onayla",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                            content: Text(
                              "Çikiş yapmak istediğine emin misin?",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () async {
                                  Storage storage = Storage();
                                  await storage.logoutClear();

                                  GoRouter.of(context).replace("/login");
                                  GoRouter.of(context).pop();
                                },
                                child: Text(
                                  "Onayla",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () => GoRouter.of(context).pop(),
                                  child: Text(
                                    "İptal",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 15,
                                    ),
                                  )),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Text(
                "Version 1.2.4",
                style: TextStyle(
                    color: clientCubit.state.darkMode ? null : Colors.grey,
                    fontSize: 11),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        body: BlocBuilder<FavoritesCubit, FavoritesState>(
            builder: (context, state) {
          return Column(
            children: [
              Header(),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SearchBox(),
                        TitleItem(
                            AppLocalizations.of(context)
                                .getTranslate("home_specialOffers"),
                            AppLocalizations.of(context)
                                .getTranslate("home_seeAll"),
                            () => GoRouter.of(context).push("/specialoffers")),
                        SpecialOffers(),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 13, vertical: 5),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SpecialOffersIconCategory(
                                      Icons.chair,
                                      AppLocalizations.of(context)
                                          .getTranslate("home_sofa")),
                                  SpecialOffersSvgCategory(
                                      "assets/icons/chair.svg",
                                      AppLocalizations.of(context)
                                          .getTranslate("home_chair")),
                                  SpecialOffersIconCategory(
                                      Icons.table_bar,
                                      AppLocalizations.of(context)
                                          .getTranslate("home_table")),
                                  SpecialOffersIconCategory(
                                      Icons.kitchen,
                                      AppLocalizations.of(context)
                                          .getTranslate("home_kitchen")),
                                ],
                              ),
                              Gap(5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SpecialOffersSvgCategory(
                                      "assets/icons/table-lamp.svg",
                                      AppLocalizations.of(context)
                                          .getTranslate("home_lamp")),
                                  SpecialOffersSvgCategory(
                                      "assets/icons/wardrobe.svg",
                                      AppLocalizations.of(context)
                                          .getTranslate("home_cupboard")),
                                  SpecialOffersSvgCategory(
                                      "assets/icons/flower.svg",
                                      AppLocalizations.of(context)
                                          .getTranslate("home_vase")),
                                  SpecialOffersIconCategory(
                                      Icons.pending,
                                      AppLocalizations.of(context)
                                          .getTranslate("home_others")),
                                ],
                              ),
                            ],
                          ),
                        ),
                        TitleItem(
                            AppLocalizations.of(context)
                                .getTranslate("home_mostPopular"),
                            AppLocalizations.of(context)
                                .getTranslate("home_seeAll"),
                            () {}),
                        MostPopular(),
                      ],
                    ),
                  ),
                ),
              ),
              BottomMenu(),
            ],
          );
        }),
      ),
    );
  }

  Widget MostPopular() {
    // 2'ye tam bölünüyorsa, ~ ile sayının tam kısmını alarak satır sayısını bulur
    int productsRowCount = products.length ~/ 2;
    // 2'ye tam bölünmüyorsa demekki 1 ürün daha vardır ve ekstra 1 satır daha ekler
    if (products.length % 2 != 0) {
      productsRowCount = productsRowCount + 1;
    }
    double mostPopularHeight = productsRowCount.toDouble();
    return Container(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 12, top: 10),
              child: Row(
                children: [
                  FilledButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            clientCubit.state.darkMode
                                ? Theme.of(context).colorScheme.onBackground
                                : Colors.black87)),
                    child: Text(
                      AppLocalizations.of(context)
                          .getTranslate("home_allButton"),
                      style: TextStyle(
                        color: clientCubit.state.darkMode
                            ? Theme.of(context).colorScheme.background
                            : Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Gap(5),
                  OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      side: MaterialStatePropertyAll(BorderSide(
                          width: 2,
                          color: clientCubit.state.darkMode
                              ? Theme.of(context).colorScheme.onBackground
                              : Colors.black87)),
                    ),
                    child: Text(
                      AppLocalizations.of(context).getTranslate("home_sofa"),
                      style: TextStyle(
                        color: clientCubit.state.darkMode
                            ? Theme.of(context).colorScheme.onBackground
                            : Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Gap(5),
                  OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      side: MaterialStatePropertyAll(BorderSide(
                          width: 2,
                          color: clientCubit.state.darkMode
                              ? Theme.of(context).colorScheme.onBackground
                              : Colors.black87)),
                    ),
                    child: Text(
                      AppLocalizations.of(context).getTranslate("home_chair"),
                      style: TextStyle(
                        color: clientCubit.state.darkMode
                            ? Theme.of(context).colorScheme.onBackground
                            : Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Gap(5),
                  OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      side: MaterialStatePropertyAll(BorderSide(
                          width: 2,
                          color: clientCubit.state.darkMode
                              ? Theme.of(context).colorScheme.onBackground
                              : Colors.black87)),
                    ),
                    child: Text(
                      AppLocalizations.of(context).getTranslate("home_table"),
                      style: TextStyle(
                        color: clientCubit.state.darkMode
                            ? Theme.of(context).colorScheme.onBackground
                            : Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Gap(5),
                  OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      side: MaterialStatePropertyAll(BorderSide(
                          width: 2,
                          color: clientCubit.state.darkMode
                              ? Theme.of(context).colorScheme.onBackground
                              : Colors.black87)),
                    ),
                    child: Text(
                      AppLocalizations.of(context).getTranslate("home_kitchen"),
                      style: TextStyle(
                        color: clientCubit.state.darkMode
                            ? Theme.of(context).colorScheme.onBackground
                            : Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Gap(5),
                  OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      side: MaterialStatePropertyAll(BorderSide(
                          width: 2,
                          color: clientCubit.state.darkMode
                              ? Theme.of(context).colorScheme.onBackground
                              : Colors.black87)),
                    ),
                    child: Text(
                      AppLocalizations.of(context).getTranslate("home_lamp"),
                      style: TextStyle(
                        color: clientCubit.state.darkMode
                            ? Theme.of(context).colorScheme.onBackground
                            : Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Gap(5),
                  OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      side: MaterialStatePropertyAll(BorderSide(
                          width: 2,
                          color: clientCubit.state.darkMode
                              ? Theme.of(context).colorScheme.onBackground
                              : Colors.black87)),
                    ),
                    child: Text(
                      AppLocalizations.of(context)
                          .getTranslate("home_cupboard"),
                      style: TextStyle(
                        color: clientCubit.state.darkMode
                            ? Theme.of(context).colorScheme.onBackground
                            : Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Gap(5),
                  OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      side: MaterialStatePropertyAll(BorderSide(
                          width: 2,
                          color: clientCubit.state.darkMode
                              ? Theme.of(context).colorScheme.onBackground
                              : Colors.black87)),
                    ),
                    child: Text(
                      AppLocalizations.of(context).getTranslate("home_vase"),
                      style: TextStyle(
                        color: clientCubit.state.darkMode
                            ? Theme.of(context).colorScheme.onBackground
                            : Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            margin: EdgeInsets.only(top: 20),
            height: mostPopularHeight *
                285, // Ürün sayısı ile yüksekliği çarparak sayfanın yüksekliğini ürünlere göre ayarladım
            child: PreloadPageView(
              onPageChanged: (value) {},
              children: [
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.8,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 5),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (context, index) => GridViewItem(
                      products[index]["photo"].toString(),
                      products[index]["name"].toString(),
                      products[index]["price"] as double,
                      products[index]["point"].toString(),
                      products[index]["sales"].toString(),
                      index),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget GridViewItem(String image, String title, double price, String point,
      String sales, int index) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: 180,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(image)),
                color: Color.fromARGB(255, 243, 243, 243),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                padding: EdgeInsets.all(8),
                alignment: Alignment.topRight,
                child: Column(
                  children: [
                    if (favoritesCubit.isFavorite(products[index]["id"] as int))
                      InkWell(
                        onTap: () {
                          favoritesCubit.removeFromFavorites(
                              products[index]["id"] as int);
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.favorite,
                              color: Colors.white, size: 16),
                        ),
                      )
                    else
                      InkWell(
                        onTap: () {
                          favoritesCubit.addToFavorites(products[index]);
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.favorite_border,
                              color: Colors.white, size: 16),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: 180,
            padding: EdgeInsets.only(left: 15, top: 5),
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: TextStyle(
                color: clientCubit.state.darkMode
                    ? Theme.of(context).colorScheme.onBackground
                    : Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.star_half, size: 18),
                Gap(5),
                Text(
                  point + " |",
                  style: TextStyle(
                    color: Color.fromARGB(255, 148, 147, 147),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gap(8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 231, 231, 231),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    sales,
                    style: TextStyle(
                      color: clientCubit.state.darkMode
                          ? Theme.of(context).colorScheme.background
                          : Color.fromARGB(255, 114, 114, 114),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 180,
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "₺" + price.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: TextStyle(
                color: clientCubit.state.darkMode
                    ? Theme.of(context).colorScheme.onBackground
                    : Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget SpecialOffersSvgCategory(String svg, String title) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Color.fromARGB(255, 236, 236, 236),
            child: SvgPicture.asset(
              svg,
              height: 22,
              colorFilter: ColorFilter.mode(Colors.black87, BlendMode.srcIn),
            ),
            radius: 24,
          ),
          Gap(2),
          Text(
            title,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget SpecialOffersIconCategory(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Color.fromARGB(255, 236, 236, 236),
            child: Icon(
              icon,
              color: Colors.black87,
              size: 22,
            ),
            radius: 24,
          ),
          Gap(2),
          Text(
            title,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget SpecialOffers() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      height: 155,
      decoration: BoxDecoration(
        color: clientCubit.state.darkMode
            ? Theme.of(context).inputDecorationTheme.fillColor
            : Color.fromARGB(255, 231, 231, 231),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
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
              itemBuilder: (context, index) => page == index
                  ? Icon(
                      Icons.circle,
                      size: 8,
                      color: clientCubit.state.darkMode
                          ? null
                          : Color.fromARGB(180, 50, 50, 50),
                    )
                  : Icon(
                      Icons.circle_outlined,
                      size: 8,
                      color: clientCubit.state.darkMode
                          ? null
                          : Color.fromARGB(180, 50, 50, 50),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget TitleItem(String title, String link, Function()? onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: clientCubit.state.darkMode
                  ? Theme.of(context).colorScheme.onBackground
                  : Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                link,
                style: TextStyle(
                  color: clientCubit.state.darkMode
                      ? Theme.of(context).colorScheme.onBackground
                      : Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget SearchBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14, vertical: 15),
      padding: EdgeInsets.only(left: 15, right: 10),
      height: 45,
      decoration: BoxDecoration(
        color: clientCubit.state.darkMode
            ? Theme.of(context).inputDecorationTheme.fillColor
            : Color.fromARGB(255, 245, 245, 247),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            size: 20,
            color: clientCubit.state.darkMode
                ? Theme.of(context).colorScheme.onBackground
                : Color.fromARGB(255, 181, 179, 183),
          ),
          Expanded(
            child: TextField(
              cursorColor: clientCubit.state.darkMode
                  ? Theme.of(context).colorScheme.onBackground
                  : Color.fromARGB(255, 113, 113, 113),
              decoration: InputDecoration(
                isDense: true,
                hintText:
                    AppLocalizations.of(context).getTranslate("home_search"),
                hintStyle: TextStyle(
                  color: clientCubit.state.darkMode
                      ? Theme.of(context).colorScheme.onBackground
                      : Color.fromARGB(255, 181, 179, 183),
                  fontSize: 14,
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: SvgPicture.asset(
                    "assets/icons/settings.svg",
                    height: 21,
                    colorFilter: ColorFilter.mode(
                        clientCubit.state.darkMode
                            ? Theme.of(context).colorScheme.onBackground
                            : Colors.black87,
                        BlendMode.srcIn),
                  ),
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
    );
  }

  Widget Header() {
    return Container(
      color: clientCubit.state.darkMode
          ? Theme.of(context).appBarTheme.backgroundColor
          : null,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/profil1.jpg"),
              ),
              Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)
                            .getTranslate("home_goodMorning"),
                        style: TextStyle(
                          color: clientCubit.state.darkMode
                              ? Theme.of(context).colorScheme.onBackground
                              : Color.fromARGB(255, 145, 145, 145),
                          fontSize: 13,
                        ),
                      ),
                      Gap(3),
                      SvgPicture.asset(
                        "assets/icons/wavingHand.svg",
                        height: 14,
                      ),
                    ],
                  ),
                  Text(
                    "Berkay T",
                    style: TextStyle(
                      color: clientCubit.state.darkMode
                          ? Theme.of(context).colorScheme.onBackground
                          : Colors.black87,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: SvgPicture.asset(
                    "assets/icons/notification.svg",
                    height: 21,
                    colorFilter: ColorFilter.mode(
                        clientCubit.state.darkMode
                            ? Theme.of(context).colorScheme.onBackground
                            : Colors.black87,
                        BlendMode.srcIn),
                  ),
                ),
              ),
              InkWell(
                onTap: () => GoRouter.of(context).push("/favorites"),
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SvgPicture.asset(
                    "assets/icons/heart.svg",
                    height: 24,
                    colorFilter: ColorFilter.mode(
                        clientCubit.state.darkMode
                            ? Theme.of(context).colorScheme.onBackground
                            : Colors.black87,
                        BlendMode.srcIn),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget BottomMenu() {
    return Container(
      color: clientCubit.state.darkMode
          ? Theme.of(context).drawerTheme.backgroundColor
          : Colors.white,
      width: double.infinity,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {}, // Zaten ana sayfada olduğumuzdan GoRouter eklemedim
            child: BottomMenuItems(
                AppLocalizations.of(context).getTranslate("bottomItem_home"),
                Icons.home_outlined,
                Icons.home,
                true),
          ),
          InkWell(
            onTap: () => GoRouter.of(context).push("/checkout"),
            child: BottomMenuItems(
                AppLocalizations.of(context).getTranslate("bottomItem_cart"),
                Icons.shopping_bag_outlined,
                Icons.shopping_bag,
                false),
          ),
          InkWell(
            onTap: () => GoRouter.of(context).push("/wallet"),
            child: BottomMenuItems(
                AppLocalizations.of(context).getTranslate("bottomItem_wallet"),
                Icons.account_balance_wallet_outlined,
                Icons.account_balance_wallet,
                false),
          ),
          InkWell(
            onTap: () => GoRouter.of(context).push("/profile"),
            child: BottomMenuItems(
                AppLocalizations.of(context).getTranslate("bottomItem_profile"),
                Icons.person_outline,
                Icons.person,
                false),
          ),
        ],
      ),
    );
  }

  Widget BottomMenuItems(String iconName, IconData iconActive,
      IconData iconDeactive, bool active) {
    IconData changeIcon = active ? iconDeactive : iconActive;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            changeIcon,
            size: 26,
            color: clientCubit.state.darkMode
                ? (active ? Colors.white : Color.fromARGB(255, 172, 172, 172))
                : (active
                    ? Color.fromARGB(255, 60, 60, 60)
                    : Color.fromARGB(255, 172, 172, 172)),
          ),
          SizedBox(height: 2),
          Text(
            iconName,
            style: TextStyle(
              fontSize: 10,
              color: clientCubit.state.darkMode
                  ? (active ? Colors.white : Color.fromARGB(255, 172, 172, 172))
                  : (active
                      ? Color.fromARGB(255, 60, 60, 60)
                      : Color.fromARGB(255, 172, 172, 172)),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
