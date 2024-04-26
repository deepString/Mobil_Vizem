import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: Text(
          "Privacy Policy",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrivacyPolicyItem("1. Types of Data We Collect",
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vel sapien dapibus tortor auctor vulputate eget in ligula. Aenean sed malesuada ante. Morbi sit amet nunc ligula. Proin in bibendum augue. Donec fringilla vitae lectus nec elementum. Ut non diam congue, congue nulla nec, elementum tellus. Proin sit amet rhoncus purus. Vivamus auctor elit libero, quis efficitur nisi vestibulum ornare."),
            PrivacyPolicyItem("2. Use of Your Personal Data",
                "Mauris sed lacinia ante. Vivamus tristique dui eros, nec efficitur nisl scelerisque et. Phasellus ultrices hendrerit sem, sit amet scelerisque ipsum hendrerit sit amet. Suspendisse nulla risus, lobortis at elit in, rutrum auctor lorem. Vivamus elementum enim ligula. Fusce at ornare dolor, non scelerisque turpis. Aenean feugiat risus ut magna porttitor, non rhoncus metus euismod. Fusce quis eleifend leo. Suspendisse eros arcu, ullamcorper ut consequat eu, pretium ac massa. Fusce id augue rutrum, lobortis leo efficitur, eleifend mi. Curabitur aliquet sapien quis tempus eleifend."),
            PrivacyPolicyItem("3. Disclosure of Your Personal Data",
                "Curabitur volutpat fermentum nunc eget porttitor. Praesent placerat pellentesque sapien. Proin efficitur enim velit, eu ultricies sem pellentesque sed. Sed luctus aliquet ligula, ac luctus tortor consequat in. Nulla pellentesque convallis urna, sit amet iaculis orci maximus eget. Quisque ut vehicula quam. Nunc id feugiat sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Mauris eu quam iaculis, blandit lacus vitae, cursus dolor. Vivamus efficitur arcu sagittis libero dapibus volutpat. Sed sed orci sed mauris vulputate scelerisque quis at mauris. Integer sagittis rutrum erat sit amet pretium. Nam vitae erat ipsum. Etiam a pulvinar arcu, in scelerisque felis."),
          ],
        ),
      ),
    );
  }

  Widget PrivacyPolicyItem(String title, String description) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            description,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
