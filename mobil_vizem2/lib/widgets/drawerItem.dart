import 'package:flutter/material.dart';

import '../bloc/client/client_cubit.dart';

class DrawerItem extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final IconData icon;

  const DrawerItem({
    super.key,
    required this.clientCubit,
    this.onTap,
    required this.title,
    required this.icon,
  });

  final ClientCubit clientCubit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          children: [
            Icon(icon, size: 22),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(
                color: clientCubit.state.darkMode ? null : Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
