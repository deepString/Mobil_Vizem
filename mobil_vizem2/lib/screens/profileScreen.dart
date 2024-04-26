import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../bloc/client/client_cubit.dart';
import '../core/localizations.dart';
import '../core/storage.dart';
import '../widgets/drawerItem.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
    return BlocBuilder<ClientCubit, ClientState>(builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: clientCubit.state.darkMode
              ? null
              : Color.fromARGB(255, 248, 248, 248),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            title: Text(
              AppLocalizations.of(context).getTranslate("profile_title"),
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
                            color: clientCubit.state.darkMode
                                ? null
                                : Colors.white,
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
                          color: clientCubit.state.darkMode
                              ? null
                              : Colors.black87,
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
              ProfileSection(),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Gap(20),
                        SettingsItemIcon(
                            Icons.person_outline,
                            AppLocalizations.of(context)
                                .getTranslate("profile_editProfile"),
                            () {}),
                        SettingsItemIcon(
                            Icons.location_on_outlined,
                            AppLocalizations.of(context)
                                .getTranslate("profile_address"),
                            () => GoRouter.of(context).push("/address")),
                        SettingsItemSvg(
                            "assets/icons/notification.svg",
                            AppLocalizations.of(context)
                                .getTranslate("profile_notification"),
                            () {}),
                        SettingsItemIcon(
                            Icons.account_balance_wallet_outlined,
                            AppLocalizations.of(context)
                                .getTranslate("profile_payment"),
                            () => GoRouter.of(context).push("/payment")),
                        SettingsItemIcon(
                            Icons.verified_user_outlined,
                            AppLocalizations.of(context)
                                .getTranslate("profile_security"),
                            () {}),
                        Container(
                          margin: EdgeInsets.only(right: 10, left: 20, top: 8),
                          width: double.infinity,
                          child: Column(
                            children: [
                              if (clientCubit.state.language == "tr")
                                InkWell(
                                  onTap: () {
                                    clientCubit.changeLanguage(language: "en");
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.public,
                                                size: 20,
                                                color:
                                                    clientCubit.state.darkMode
                                                        ? Theme.of(context)
                                                            .colorScheme
                                                            .onBackground
                                                        : Colors.black87),
                                            Gap(8),
                                            Text(
                                              AppLocalizations.of(context)
                                                  .getTranslate(
                                                      "profile_language"),
                                              style: TextStyle(
                                                color:
                                                    clientCubit.state.darkMode
                                                        ? Theme.of(context)
                                                            .colorScheme
                                                            .onBackground
                                                        : Colors.black87,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          child: Text(
                                            "Türkçe",
                                            style: TextStyle(
                                              color: clientCubit.state.darkMode
                                                  ? Theme.of(context)
                                                      .colorScheme
                                                      .onBackground
                                                  : Colors.black87,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              else
                                InkWell(
                                  onTap: () {
                                    clientCubit.changeLanguage(language: "tr");
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.public,
                                                size: 20,
                                                color:
                                                    clientCubit.state.darkMode
                                                        ? Theme.of(context)
                                                            .colorScheme
                                                            .onBackground
                                                        : Colors.black87),
                                            Gap(8),
                                            Text(
                                              AppLocalizations.of(context)
                                                  .getTranslate(
                                                      "profile_language"),
                                              style: TextStyle(
                                                color:
                                                    clientCubit.state.darkMode
                                                        ? Theme.of(context)
                                                            .colorScheme
                                                            .onBackground
                                                        : Colors.black87,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          child: Text(
                                            "English",
                                            style: TextStyle(
                                              color: clientCubit.state.darkMode
                                                  ? Theme.of(context)
                                                      .colorScheme
                                                      .onBackground
                                                  : Colors.black87,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              Row(
                                children: [
                                  Gap(20),
                                  Expanded(
                                    child: Divider(
                                      color: Color.fromARGB(255, 225, 225, 225),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10, left: 20, top: 8),
                          width: double.infinity,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                            clientCubit.state.darkMode
                                                ? Icons.nightlight_outlined
                                                : Icons.wb_sunny_outlined,
                                            size: 20,
                                            color: clientCubit.state.darkMode
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .onBackground
                                                : Colors.black87),
                                        Gap(8),
                                        Text(
                                          clientCubit.state.darkMode
                                              ? AppLocalizations.of(context)
                                                  .getTranslate(
                                                      "profile_darkMode")
                                              : AppLocalizations.of(context)
                                                  .getTranslate(
                                                      "profile_lightMode"),
                                          style: TextStyle(
                                            color: clientCubit.state.darkMode
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .onBackground
                                                : Colors.black87,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 20,
                                      child: Transform.scale(
                                        scale: 0.7,
                                        child: Switch(
                                          value: clientCubit.state.darkMode,
                                          onChanged: (value) {
                                            clientCubit.changeDarkMode(
                                                darkMode: value);
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Gap(20),
                                  Expanded(
                                    child: Divider(
                                      color: Color.fromARGB(255, 225, 225, 225),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SettingsItemIcon(
                            Icons.vpn_key_outlined,
                            AppLocalizations.of(context)
                                .getTranslate("profile_permissions"),
                            () => GoRouter.of(context).push("/perms")),
                        SettingsItemIcon(
                            Icons.lock_outline,
                            AppLocalizations.of(context)
                                .getTranslate("profile_privacyPolicy"),
                            () => GoRouter.of(context).push("/privacy")),
                        SettingsItemIcon(
                            Icons.headset_mic,
                            AppLocalizations.of(context)
                                .getTranslate("profile_helpCenter"),
                            () => GoRouter.of(context).push("/helpcenter")),
                        Container(
                          margin: EdgeInsets.only(
                              right: 10, left: 22, top: 8, bottom: 20),
                          width: double.infinity,
                          child: InkWell(
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
                                        onPressed: () =>
                                            GoRouter.of(context).pop(),
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
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.logout,
                                          size: 20,
                                          color: clientCubit.state.darkMode
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .error
                                              : Color.fromARGB(
                                                  230, 234, 86, 76)),
                                      Gap(8),
                                      Text(
                                        AppLocalizations.of(context)
                                            .getTranslate("profile_logout"),
                                        style: TextStyle(
                                          color: clientCubit.state.darkMode
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .error
                                              : Color.fromARGB(
                                                  230, 234, 86, 76),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BottomMenu(),
            ],
          ),
        ),
      );
    });
  }

  Widget SettingsItemIcon(IconData icon, String title, Function()? onTap) {
    return Container(
      margin: EdgeInsets.only(right: 10, left: 20, top: 8),
      width: double.infinity,
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(icon,
                          size: 20,
                          color: clientCubit.state.darkMode
                              ? Theme.of(context).colorScheme.onBackground
                              : Colors.black87),
                      Gap(8),
                      Text(
                        title,
                        style: TextStyle(
                          color: clientCubit.state.darkMode
                              ? Theme.of(context).colorScheme.onBackground
                              : Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.chevron_right,
                      size: 20,
                      color: clientCubit.state.darkMode
                          ? Theme.of(context).colorScheme.onBackground
                          : Colors.black87),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Gap(20),
              Expanded(
                child: Divider(
                  color: Color.fromARGB(255, 225, 225, 225),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget SettingsItemSvg(String svg, String title, Function()? onTap) {
    return Container(
      margin: EdgeInsets.only(right: 10, left: 20, top: 8),
      width: double.infinity,
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        svg,
                        height: 18,
                        colorFilter: ColorFilter.mode(
                            clientCubit.state.darkMode
                                ? Theme.of(context).colorScheme.onBackground
                                : Colors.black87,
                            BlendMode.srcIn),
                      ),
                      Gap(8),
                      Text(
                        title,
                        style: TextStyle(
                          color: clientCubit.state.darkMode
                              ? Theme.of(context).colorScheme.onBackground
                              : Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.chevron_right,
                      size: 20,
                      color: clientCubit.state.darkMode
                          ? Theme.of(context).colorScheme.onBackground
                          : Colors.black87),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Gap(20),
              Expanded(
                child: Divider(
                  color: Color.fromARGB(255, 225, 225, 225),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget ProfileSection() {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(1.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  stops: [0.0, 0.2, 0.0, 0.0, 1],
                  colors: clientCubit.state.darkMode
                      ? [
                          Theme.of(context).colorScheme.background,
                          Theme.of(context).colorScheme.background,
                          Theme.of(context).colorScheme.onBackground,
                          Theme.of(context).colorScheme.onBackground,
                          Theme.of(context).colorScheme.onBackground,
                        ]
                      : [
                          Color.fromARGB(255, 248, 248, 248),
                          Color.fromARGB(255, 248, 248, 248),
                          Color.fromARGB(255, 132, 132, 132),
                          Color.fromARGB(255, 132, 132, 132),
                          Color.fromARGB(255, 132, 132, 132),
                        ],
                ),
                shape: BoxShape.circle,
              ),
              child: Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: clientCubit.state.darkMode
                      ? Theme.of(context).colorScheme.background
                      : Color.fromARGB(255, 248, 248, 248),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/profil1.jpg"),
                  radius: 38,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    height: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: clientCubit.state.darkMode
                                ? Theme.of(context).colorScheme.onBackground
                                : Colors.black87,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/pen.svg",
                            height: 13,
                            colorFilter: ColorFilter.mode(
                                clientCubit.state.darkMode
                                    ? Theme.of(context).colorScheme.background
                                    : Colors.white,
                                BlendMode.srcIn),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 250,
              child: Text(
                "Berkay T",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: clientCubit.state.darkMode ? null : Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              "+90 500 999 9999",
              style: TextStyle(
                color: clientCubit.state.darkMode ? null : Colors.black87,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
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
            onTap: () => GoRouter.of(context).push("/wallet"),
            child: BottomMenuItems(
                AppLocalizations.of(context).getTranslate("bottomItem_wallet"),
                Icons.account_balance_wallet_outlined,
                Icons.account_balance_wallet,
                false),
          ),
          InkWell(
            onTap:
                () {}, // Zaten profil sayfasında olduğumuzdan GoRouter eklemedim
            child: BottomMenuItems(
                AppLocalizations.of(context).getTranslate("bottomItem_profile"),
                Icons.person_outline,
                Icons.person,
                true),
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
