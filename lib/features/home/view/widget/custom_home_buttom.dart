import 'package:flutter/material.dart';

import '../../../../core/styles/app_colors.dart';

class CustomHomeButtom extends StatelessWidget {
  const CustomHomeButtom({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });
  final void Function() onTap;
  final String title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 240,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.kScaffoldColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.indigo,
                size: 35,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
