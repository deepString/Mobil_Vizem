import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 248, 248, 248),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            title: Text(
              "Help Center",
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
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(48),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Colors.black87,
                  labelColor: Colors.black87,
                  unselectedLabelColor: Color.fromARGB(255, 173, 173, 173),
                  dividerColor: Color.fromARGB(255, 232, 232, 232),
                  dividerHeight: 2,
                  tabs: [
                    Tab(
                      text: "FAQ",
                    ),
                    Tab(
                      text: "Contact Us",
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Row(
                          children: [
                            FilledButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.black87)),
                              child: Text(
                                "Hepsi",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            Gap(8),
                            OutlinedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                side: MaterialStatePropertyAll(
                                    BorderSide(width: 2)),
                              ),
                              child: Text(
                                "Hesap",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SearchBox(),
                      Gap(5),
                      ExpansionTileItem("What is Funica?",
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed da eiusmad hampor incididunt ut labore et dolore magna aliquet"),
                      ExpansionTileItem("How to use Funica?",
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed da eiusmad hampor incididunt ut labore et dolore magna aliquet"),
                      ExpansionTileItem("How do I cancel a orders product?",
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed da eiusmad hampor incididunt ut labore et dolore magna aliquet"),
                      ExpansionTileItem("İs Funica free to use?",
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed da eiusmad hampor incididunt ut labore et dolore magna aliquet"),
                      ExpansionTileItem("How to add promo when checkout?",
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed da eiusmad hampor incididunt ut labore et dolore magna aliquet"),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    ContactItemIcons(Icons.headset, "Customer Service",
                        () => GoRouter.of(context).push("/customerservice")),
                    ContactItemSvg("assets/icons/whatsapp.svg", "WhatsApp", () {
                      final Uri uri = Uri.parse(
                          "https://wa.me/+905009990000?text=Urlencodedtext");
                      launchUrl(uri);
                    }),
                    ContactItemIcons(Icons.language, "Website", () {}),
                    ContactItemSvg("assets/icons/facebook.svg", "Facebook", () {
                      final Uri uri = Uri.parse("https://www.facebook.com/");
                      launchUrl(uri);
                    }),
                    ContactItemSvg("assets/icons/twitter.svg", "Twitter", () {
                      final Uri uri = Uri.parse("https://twitter.com/");
                      launchUrl(uri);
                    }),
                    ContactItemSvg("assets/icons/instagram.svg", "Instagram",
                        () {
                      final Uri uri = Uri.parse("https://www.instagram.com/");
                      launchUrl(uri);
                    }),
                    ContactItemSvg("assets/icons/github.svg", "Github", () {
                      final Uri uri =
                          Uri.parse("https://github.com/deepString");
                      launchUrl(uri);
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ContactItemIcons(IconData icon, String title, Function()? onTap) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Row(
          children: [
            Gap(20),
            Icon(icon, size: 19, color: Colors.black87),
            Gap(10),
            Text(
              title,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ContactItemSvg(String svg, String title, Function()? onTap) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Row(
          children: [
            Gap(20),
            SvgPicture.asset(
              svg,
              height: 16,
              colorFilter: ColorFilter.mode(Colors.black87, BlendMode.srcIn),
            ),
            Gap(10),
            Text(
              title,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ExpansionTileItem(String title, String description) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ExpansionTile(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        collapsedBackgroundColor: Colors.white,
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: Color.fromARGB(30, 158, 158, 158),
          ),
        ),
        collapsedIconColor: Colors.black87,
        iconColor: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: Color.fromARGB(30, 158, 158, 158),
          ),
        ),
        backgroundColor: Colors.white,
        childrenPadding: EdgeInsets.only(bottom: 10),
        children: [
          Row(
            children: [
              Gap(25),
              Expanded(
                child: Divider(
                  color: Color.fromARGB(255, 240, 240, 240),
                ),
              ),
              Gap(25),
            ],
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text(
              description,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget SearchBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      padding: EdgeInsets.only(left: 15, right: 10, top: 3, bottom: 3),
      height: 50,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 238, 240),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            size: 20,
            color: Color.fromARGB(255, 181, 179, 183),
          ),
          Expanded(
            child: TextField(
              cursorColor: Color.fromARGB(255, 113, 113, 113),
              decoration: InputDecoration(
                isDense: true,
                hintText: "Ara",
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 181, 179, 183),
                  fontSize: 14,
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: SvgPicture.asset(
                    "assets/icons/settings.svg",
                    height: 21,
                    colorFilter:
                        ColorFilter.mode(Colors.black87, BlendMode.srcIn),
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
}
