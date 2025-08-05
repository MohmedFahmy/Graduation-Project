import 'package:flutter/material.dart';
import 'package:graduation_app/core/styles/app_colors.dart';
import 'package:graduation_app/features/home/view/screens/search_screen.dart';
import 'package:graduation_app/features/home/view/screens/tikets_screen.dart';
import 'package:graduation_app/features/home/view/widget/train_slider.dart';
import 'package:graduation_app/features/shipments/view/screen/add_new_shipment_screen.dart';

import '../widget/custom_drawer.dart';
import '../widget/custom_home_buttom.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kPrimaryColor,
          title: Text(
            'Tanta Station',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        endDrawer: CustomDrawerWidget(),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/station.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.darken,
              ),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                  child: Text(
                    'We allows you to easily search for and book your train tickets across various destinations',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 15, bottom: 25),
                  child: Text(
                    'Start your journey now!  fast, simple, and reliable',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TrainSlider(),
                SizedBox(
                  height: 40,
                ),
                Divider(
                  color: Colors.white,
                  thickness: 3,
                  indent: 50,
                  endIndent: 50,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomHomeButtom(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TiketsScreen()));
                  },
                  title: 'All Tickets',
                  icon: Icons.train,
                ),
                CustomHomeButtom(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchScreen()));
                  },
                  title: 'Search For Ticket',
                  icon: Icons.search,
                ),
                CustomHomeButtom(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddNewShipmentScreen()));
                  },
                  title: 'Ship Cargo',
                  icon: Icons.local_shipping,
                ),
                SizedBox(
                  height: 70,
                )
              ],
            ),
          ),
        ));
  }
}
