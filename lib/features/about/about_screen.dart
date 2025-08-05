import 'package:flutter/material.dart';
import 'package:graduation_app/core/styles/app_colors.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About App", style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Center(
              child:
                  Icon(Icons.train, size: 80, color: AppColors.kPrimaryColor),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "Smart Train Booking App",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "This app allows you to search for available train tickets, view offers, and book your tickets easily and quickly. "
              "You can choose your class, departure and arrival stations, and keep track of your bookings.\n\n"
              "🛠️ Built using Flutter for a smooth and fast cross-platform experience on both Android and iOS.\n\n"
              "🌐 Backend is powered by Node.js — ensuring fast, real-time data handling and high performance.\n\n"
              "🧾 The app supports different ticket classes (economy & business), provides special offers, and gives users the ability to search and book seamlessly.\n\n"
              "💳 Integrated with secure payment methods to complete your bookings safely.\n\n"
              "🗃️ Data is stored in MongoDB — a flexible and scalable NoSQL database that ensures fast access and storage for your booking data.\n\n"
              "🔒 User authentication and booking history are managed securely, ensuring your data privacy.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 30),
            const Text(
              "App Version: 1.0.0",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            const Text(
              "Developed by: Go Train Team",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 30),
            const Divider(),
            const Text(
              "Contact us:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text("Email: support@traintickets.com"),
            const Text("Phone: +20 123 456 7890"),
          ],
        ),
      ),
    );
  }
}
