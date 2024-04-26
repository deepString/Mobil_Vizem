import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../bloc/cart/cart_cubit.dart';
import '../bloc/favorites/favorites_cubit.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late FavoritesCubit favoritesCubit;
  late CartCubit cartCubit;

  @override
  void initState() {
    super.initState();
    favoritesCubit = context.read<FavoritesCubit>();

    cartCubit = context.read<CartCubit>();
  }

  isAddBasket() async {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        title: Image.asset("assets/images/correct.png", height: 100),
        surfaceTintColor: Color.fromARGB(255, 200, 200, 200),
        content: Text(
          "Ürün sepetinize eklendi",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          ElevatedButton(
              onPressed: () => GoRouter.of(context).pop(),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black87),
              ),
              child: Text(
                "Tamam",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 248, 248, 248),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          title: Text(
            "Favorites",
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
          ],
        ),
        body: BlocBuilder<FavoritesCubit, FavoritesState>(
            builder: (context, state) {
          return SizedBox.expand(
            child: state.favoritesProducts.length == 0
                ? Center(
                    child: Text(
                      "Favories empty",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: state.favoritesProducts.length,
                    itemBuilder: (context, index) => Container(
                      padding: EdgeInsets.all(15),
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 130,
                                height: 130,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(state
                                          .favoritesProducts[index]["photo"]
                                          .toString())),
                                  color: Color.fromARGB(255, 238, 238, 238),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              Gap(15),
                              Container(
                                height: 100,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.favoritesProducts[index]["name"]
                                          .toString(),
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.circle,
                                            size: 14,
                                            color:
                                                state.favoritesProducts[index]
                                                    ["color"]),
                                        Gap(5),
                                        Text(
                                          state.favoritesProducts[index]
                                                  ["colorName"]
                                              .toString(),
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 141, 141, 141),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "₺" +
                                          state.favoritesProducts[index]
                                                  ["price"]
                                              .toString(),
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
                                if (favoritesCubit.isFavorite(state
                                    .favoritesProducts[index]["id"] as int))
                                  Container(
                                    width: 80,
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          barrierDismissible: true,
                                          builder: (context) => AlertDialog(
                                            title: Text(
                                              "Favorilerden Kaldir",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 22,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            surfaceTintColor: Color.fromARGB(
                                                255, 200, 200, 200),
                                            content: Text(
                                              "Favorilerden kaldirmak istediğinize emin misiniz ?",
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            actions: [
                                              ElevatedButton(
                                                  onPressed: () =>
                                                      GoRouter.of(context)
                                                          .pop(),
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                            Colors.black87),
                                                  ),
                                                  child: Text(
                                                    "İptal",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                    ),
                                                  )),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    favoritesCubit
                                                        .removeFromFavorites(
                                                            state.favoritesProducts[
                                                                    index]["id"]
                                                                as int);

                                                    GoRouter.of(context).pop();
                                                  },
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                            Colors.black87),
                                                  ),
                                                  child: Text(
                                                    "Kaldir",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        );
                                      },
                                      padding: const EdgeInsets.all(4),
                                      constraints: BoxConstraints(),
                                      icon: Icon(Icons.favorite,
                                          size: 25, color: Colors.black87),
                                    ),
                                  ),
                                InkWell(
                                  onTap: () {
                                    cartCubit.sepeteEkle(
                                        id: state.favoritesProducts[index]["id"] as int,
                                        photo:
                                            state.favoritesProducts[index]["photo"].toString(),
                                        color: state.favoritesProducts[index]["color"],
                                        colorName: state.favoritesProducts[index]["colorName"]
                                            .toString(),
                                        ad: state.favoritesProducts[index]["name"].toString(),
                                        sayi: 1,
                                        fiyat: state.favoritesProducts[index]
                                            ["price"] as double);

                                    isAddBasket();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 7),
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 238, 238, 238),
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                              176, 158, 158, 158),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text("Add to basket"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        }),
      ),
    );
  }
}
