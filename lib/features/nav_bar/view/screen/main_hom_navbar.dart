import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:graduation_app/features/map/view/screen/map_screen.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../home/view/screens/home_screen.dart';
import '../../../profile/view/screen/profile_screen.dart';
import '../../cubit/navbar_cubit.dart';

class MainHomNavbar extends StatelessWidget {
  MainHomNavbar({super.key, required this.token});
  final String token;
  late final List<Widget> _screens = [
    HomeScreen(),
    MapScreen(),
    ProfileScreen(
      token: token,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavbarCubit(),
      child: BlocBuilder<NavbarCubit, NavbarState>(
        builder: (context, state) {
          NavbarCubit cubit = BlocProvider.of<NavbarCubit>(context);
          return Scaffold(
            body: SafeArea(child: _screens[cubit.currentIndex]),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: GNav(
                  onTabChange: (value) {
                    cubit.changeIndex(value);
                  },
                  rippleColor: AppColors
                      .kPrimaryColor, // tab button ripple color when pressed
                  hoverColor: AppColors.kPrimaryColor, // tab button hover color

                  duration: Duration(
                    milliseconds: 400,
                  ), // tab animation duration
                  gap: 4, // the tab button gap between icon and text
                  color: Colors.grey, // unselected icon color
                  activeColor: Colors.white, // selected icon and text color
                  iconSize: 24, // tab button icon size
                  tabBackgroundColor:
                      AppColors.kPrimaryColor, // selected tab background color
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ), // navigation bar padding
                  tabs: [
                    GButton(icon: Icons.home, text: 'Home'),
                    GButton(
                        icon: Icons.directions, iconSize: 30, text: 'Your Way'),
                    GButton(icon: Icons.person, text: 'Profile'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
