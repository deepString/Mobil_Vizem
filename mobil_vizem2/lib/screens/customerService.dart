import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';

class CustomerServiceScreen extends StatefulWidget {
  const CustomerServiceScreen({super.key});

  @override
  State<CustomerServiceScreen> createState() => _CustomerServiceScreenState();
}

class _CustomerServiceScreenState extends State<CustomerServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          title: Text(
            "Customer Service",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(Icons.call, size: 21, color: Colors.black87),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.pending_outlined, color: Colors.black87),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    BubbleSpecialThree(
                      text: "Hello, good morning",
                      color: Color.fromARGB(255, 232, 232, 238),
                      tail: true,
                      isSender: false,
                      textStyle: TextStyle(color: Colors.black87, fontSize: 14),
                    ),
                    BubbleSpecialThree(
                      text:
                          "I am a Customer Service. Is there anything I can help you with?",
                      color: Color.fromARGB(255, 232, 232, 238),
                      tail: false,
                      isSender: false,
                      textStyle: TextStyle(color: Colors.black87, fontSize: 14),
                    ),
                    BubbleSpecialThree(
                      text: "Hi I'm having problems with my order & payment",
                      color: Colors.black87,
                      tail: true,
                      isSender: true,
                      textStyle: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    BubbleSpecialThree(
                      text: "Can you help me?",
                      color: Colors.black87,
                      tail: false,
                      isSender: true,
                      textStyle: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    BubbleSpecialThree(
                      text: "Of course",
                      color: Color.fromARGB(255, 232, 232, 238),
                      tail: true,
                      isSender: false,
                      textStyle: TextStyle(color: Colors.black87, fontSize: 14),
                    ),
                    BubbleSpecialThree(
                      text:
                          "Can you tell me the problem you are having? So I can solve it",
                      color: Color.fromARGB(255, 232, 232, 238),
                      tail: false,
                      isSender: false,
                      textStyle: TextStyle(color: Colors.black87, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 5, top: 10, bottom: 10),
                    height: 48,
                    width: 330,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 242, 242, 242),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      cursorColor: Color.fromARGB(255, 113, 113, 113),
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.image_outlined, size: 20),
                        isDense: true,
                        hintText: "Message..",
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
                      backgroundColor: MaterialStatePropertyAll(Colors.black87),
                      shape: MaterialStatePropertyAll(CircleBorder()),
                      padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                    ),
                    child: Icon(Icons.mic, size: 17),
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
