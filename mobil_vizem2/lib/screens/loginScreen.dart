import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/storage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = true;
  bool rememberUser = false;
  bool emailFormat = false;
  bool isEmailEmpty = true;
  // Eğer hiçbir bilgi girilmediyse hata mesajı vermesin diye isEmailEmpty tanımladım
  bool isPasswordEmpty = true;
  // İlk başta kutular boş geldiği için değerleri true yani boş olarak tanımladım

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  login() async {
    Storage storage = Storage();

    await storage.saveUser(email: emailController.text);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Başariyla giriş yaptin!"),
      backgroundColor: Colors.green.shade400,
      behavior: SnackBarBehavior.floating,
    ));

    GoRouter.of(context).replace("/home");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 16, left: 16, top: 65, bottom: 16),
              child: Column(
                children: [
                  Image.asset("assets/images/appLogo.png", height: 80),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Tekrar Hoşgeldin!",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Hesabiniza erişmek için",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(text: " "),
                        TextSpan(
                          text: "oturum açiniz",
                          style: TextStyle(
                            color: Color.fromARGB(240, 253, 107, 77),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  emailBox("Email", Icons.mail, "E-posta adresi", 325),
                  passwordBox("Şifre", Icons.lock, "Şifre", 325),
                  Container(
                    width: 325,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Color.fromARGB(240, 0, 0, 0),
                              side: BorderSide(
                                color: const Color.fromARGB(240, 0, 0, 0),
                              ),
                              value: rememberUser,
                              onChanged: (value) {
                                setState(() {
                                  rememberUser = value ?? false;
                                });
                              },
                            ),
                            Text(
                              "Beni hatirla",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(240, 0, 0, 0),
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          hoverColor: Colors.transparent,
                          splashColor: Color.fromARGB(255, 251, 251, 251),
                          highlightColor: Color.fromARGB(255, 251, 251, 251),
                          onTap: () {},
                          child: Text(
                            "Şifremi Unuttum",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(240, 0, 0, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    hoverColor: Colors.transparent,
                    splashColor: Color.fromARGB(255, 251, 251, 251),
                    highlightColor: Color.fromARGB(255, 251, 251, 251),
                    onTap: () {
                      if (isEmailEmpty == false && isPasswordEmpty == false) {
                        if (emailFormat == true) {
                          login();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "Email formatiniz yanliş, lütfen kontrol ediniz"),
                            backgroundColor: Colors.red.shade300,
                            behavior: SnackBarBehavior.floating,
                          ));
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Lütfen ilgili alanlari doldurunuz"),
                          backgroundColor: Colors.red.shade300,
                          behavior: SnackBarBehavior.fixed,
                        ));
                      }
                    },
                    child: Container(
                      width: 300,
                      padding:
                          EdgeInsets.symmetric(horizontal: 70, vertical: 13),
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 253, 136, 82),
                            const Color.fromARGB(255, 253, 97, 80),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Giriş Yap",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Hesabin yok mu?",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(text: " "),
                        TextSpan(
                          text: "Şimdi kayit ol",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              GoRouter.of(context).replace("/register");
                            },
                          style: TextStyle(
                            color: Color.fromARGB(240, 253, 107, 77),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 325,
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Color.fromARGB(136, 155, 155, 155),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Veya",
                          style: TextStyle(
                            fontSize: 10,
                            color: const Color.fromARGB(136, 155, 155, 155),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Divider(
                            color: const Color.fromARGB(136, 155, 155, 155),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 249, 249, 253),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Color.fromARGB(255, 230, 233, 246),
                        ),
                      ),
                      child: Image.asset(
                        "assets/images/googleImage.webp",
                        width: 5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget passwordBox(String name, IconData icon, String hint, double width) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 14,
              color: Color.fromARGB(190, 0, 0, 0),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: const Color.fromARGB(190, 0, 0, 0),
              ),
            ),
            width: width,
            height: 50,
            child: Container(
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: 20,
                    color: const Color.fromARGB(190, 0, 0, 0),
                  ),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        if (value.isEmpty) {
                          setState(() {
                            isPasswordEmpty = true;
                          });
                        } else {
                          setState(() {
                            isPasswordEmpty = false;
                          });
                        }
                      },
                      cursorColor: Color.fromARGB(190, 0, 0, 0),
                      controller: passwordController,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: hint,
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                        suffixIcon: IconButton(
                          icon: passwordVisible
                              ? Icon(Icons.visibility_off, size: 20)
                              : Icon(Icons.visibility, size: 20),
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
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
                      obscureText: passwordVisible,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget emailBox(String name, IconData icon, String hint, double width) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 14,
              color: Color.fromARGB(190, 0, 0, 0),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: const Color.fromARGB(190, 0, 0, 0),
              ),
            ),
            width: width,
            height: 50,
            child: Container(
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: 20,
                    color: const Color.fromARGB(190, 0, 0, 0),
                  ),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        if (RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          setState(() {
                            emailFormat = true;
                            isEmailEmpty = false;
                          });
                        } else if (value.isEmpty) {
                          setState(() {
                            isEmailEmpty = true;
                          });
                        } else {
                          setState(() {
                            emailFormat = false;
                            isEmailEmpty = false;
                          });
                        }
                      },
                      cursorColor: Color.fromARGB(190, 0, 0, 0),
                      controller: emailController,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: hint,
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
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
            ),
          ),
        ],
      ),
    );
  }
}
