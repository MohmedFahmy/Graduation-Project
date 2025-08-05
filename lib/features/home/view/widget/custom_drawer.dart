import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/features/about/about_screen.dart';
import 'package:graduation_app/features/shipments/view/screen/shipments_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../booked/cubit/booked_tickets_cubit.dart';
import '../../../booked/view/screen/booked_screen.dart';
import '../../../offers/view/screen/offers_screen.dart';
import '../../../shipments/cubit/shipments_cubit.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({
    super.key,
  });
  final String email = 'example@gmail.com';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      semanticLabel: 'Navigation Menu',
      child: Container(
        alignment: Alignment.centerRight,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      title: Text('Home'),
                      leading: Icon(Icons.home),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OffersScreen()));
                    },
                    child: ListTile(
                      title: Text('Offers'),
                      leading: Icon(Icons.local_offer_outlined),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider(
                            create: (_) => BookedTicketsCubit(),
                            child: MyBookedScreen(),
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text('Booked Tickets'),
                      leading: Icon(Icons.bookmark_border_outlined),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider(
                            create: (_) => ShipmentsCubit(),
                            child: ShipmentScreen(),
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text('My Shipments'),
                      leading: Icon(Icons.bookmark_border_outlined),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AboutScreen()));
                    },
                    child: ListTile(
                      title: Text('About'),
                      leading: Icon(Icons.info),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text('Settings'),
                      leading: Icon(Icons.settings),
                    ),
                  ),
                ],
              ),
            ),

            // Footer section
            Container(
              padding: EdgeInsets.all(16.0),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade100,
                border: Border(
                  top: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '   Version 1.0.0',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        try {
                          await launchUrl(emailLaunchUri);
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Could not open email client.')),
                          );
                        }
                      },
                      child: Text(
                        'Contact Us via Email',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 10, 62, 153),
                            fontSize: 14),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final Uri emailLaunchUri = Uri(
  scheme: 'mailto',
  path: 'example@gmail.com',
  query: Uri.encodeFull(
      'subject=Train Ticket Inquiry&body=Hello, I have a question about...'),
);
