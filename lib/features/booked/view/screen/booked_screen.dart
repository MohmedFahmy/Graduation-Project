import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_app/features/booked/cubit/booked_tickets_cubit.dart';
import 'package:graduation_app/features/home/view/widget/custom_ticket_card.dart';

import '../../../../core/styles/app_colors.dart';

class MyBookedScreen extends StatefulWidget {
  @override
  State<MyBookedScreen> createState() => _MyBookedScreenState();
}

class _MyBookedScreenState extends State<MyBookedScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Bookings", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo,
      ),
      body: BlocBuilder<BookedTicketsCubit, BookedTicketsState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    "Please Enter Your User Number 'Your National ID' To See Your Bookings",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 21, 54, 112)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: "User Number",
                      hintText: "Enter your User Number",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      String userNumber = _controller.text.trim();
                      if (userNumber.isNotEmpty) {
                        context
                            .read<BookedTicketsCubit>()
                            .getTicketsData(userNumber: userNumber);
                      }
                    },
                    child: Text("Get My Bookings",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                  SizedBox(height: 20),
                  if (state is BookedTicketsLoading)
                    Center(child: CircularProgressIndicator()),
                  if (state is BookedTicketsSuccess)
                    if (state.tickets.isEmpty)
                      Center(child: Text("No bookings found."))
                    else
                      ...state.tickets.map((booking) {
                        final barcode = Barcode.code128();
                        final svg = barcode.toSvg(
                          booking.id,
                          width: 300,
                          height: 80,
                          drawText: true,
                        );

                        return Container(
                          margin: EdgeInsets.only(bottom: 16),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.shade100,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 6,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Barcode
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("🔍 Scan Barcode",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 8),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 4,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: SvgPicture.string(
                                          svg,
                                          width: 280,
                                          height: 80,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Text('🎫 Ticket Details',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),

                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: CustomTicketCard(
                                  buttonLabel: 'Booked Successfully',
                                  buttonIcon: Icon(Icons.check,
                                      size: 25, color: Colors.white),
                                  trainClass: booking.trainClass,
                                  price: booking.price,
                                  departure: booking.departure,
                                  arrival: booking.arrival,
                                  getMyTrainImage: (myTrainClass) {
                                    return getTrainImage(myTrainClass);
                                  },
                                  date: booking.ticketDate,
                                  time: booking.time,
                                  isOferd: booking.offer,
                                ),
                              ),
                              SizedBox(height: 10),

                              // Booking Info
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text("📌 Booking Info",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(height: 10),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: ListTile(
                                  leading: Icon(
                                    Icons.person,
                                    size: 40,
                                    color: Colors.indigo,
                                  ),
                                  title: Text(
                                    "User: ${booking.userNumber}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                      "Booking Date: ${booking.bookingDate}"),
                                  trailing: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.indigo, width: 1.5),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Seat",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.indigo,
                                          ),
                                        ),
                                        Text(
                                          "${booking.seatNumber}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }).toList(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

String getTrainImage(String trainClass) {
  switch (trainClass.toLowerCase()) {
    case 'first class':
      return 'images/first_class.jpg';
    case 'second class':
      return 'images/second_class.jpg';
    default:
      return 'images/economy.jpg';
  }
}
