import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/client/client_cubit.dart';
import '../core/localizations.dart';
import '../core/storage.dart';
import '../widgets/drawerItem.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
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
    clientCubit = context.read<ClientCubit>();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: clientCubit.state.darkMode
            ? null
            : Color.fromARGB(255, 248, 248, 248),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          title: Text(
            AppLocalizations.of(context).getTranslate("wallet_title"),
            style: TextStyle(
              color: clientCubit.state.darkMode ? null : Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.w600,
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
                      onTap: () => GoRouter.of(context).push("/home"),
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
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: Center(
                  child: Text(AppLocalizations.of(context)
                      .getTranslate("wallet_screenName")),
                ),
              ),
            ),
            BottomMenu(),
          ],
        ),
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
            onTap: () => GoRouter.of(context).push("/"),
            child: BottomMenuItems(
                AppLocalizations.of(context).getTranslate("bottomItem_home"),
                Icons.home_outlined,
                Icons.home,
                false),
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
            onTap:
                () {}, // Zaten cüzdan sayfasında olduğumuzdan GoRouter eklemedim
            child: BottomMenuItems(
                AppLocalizations.of(context).getTranslate("bottomItem_wallet"),
                Icons.account_balance_wallet_outlined,
                Icons.account_balance_wallet,
                true),
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
