import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leadingIcon;
  final List<Widget>? actions;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.leadingIcon,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: leadingIcon ?? IconButton(
        icon: const Icon(Icons.menu, color: Colors.black),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
     title: Row(
  children: [
    if (leadingIcon != null) leadingIcon!,
    const SizedBox(width: 8),
    Image.asset(
      'assets/Logo/logo.png', // Replace with your image path
      width: 180, // Adjust width as needed
      height: 230, // Adjust height as needed
    ),
    const Spacer(),
    if (actions != null) ...actions!,
  ],
),

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
