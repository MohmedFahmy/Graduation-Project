import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/core/styles/app_colors.dart';
import 'package:graduation_app/features/home/cubit/get_tickets_cubit.dart';

import '../../cubit/get_tickets_state.dart';
import '../widget/custom_ticket_card.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> departureStations = ['tanta', 'Tanta'];
  final List<String> arrivalStations = [
    'Alexandria',
    'Cairo',
    'Giza',
    'Assuit',
    'Aswan',
    'Luxor',
    'Mansoura',
    'Damanhur',
    'Benha',
    'Zagazig',
    'Suez',
    'Port Said',
    'Fayoum',
    'Qena',
    'Menia',
    'Matrouh',
    'Domietta',
    'El-Mahalla',
    'Zifta',
    'Passeon',
    'Birkat Al-Sab',
    'Quesna',
    'Shibin El-Kom',
    'tukh',
    'Qaha',
    'Shubra Al-Kheima',
    'Qalyub',
    'Kafr El-Zayat',
    'El-Tawfikia',
    'Abu Hummus',
    'Kafr El-Dawar',
    'Sidi Gaber',
    'El-Tahrir',
  ];

  String? selectedDeparture;
  String? selectedArrival;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetTicketsCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Search For Tickets",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          backgroundColor: AppColors.kPrimaryColor,
        ),
        body: BlocConsumer<GetTicketsCubit, GetTicketsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return ListView(
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: const Text(
                    "If you want to search for economy tickets select 'Tanta' at departure station and if you want to search for business tickets select 'tanta' at departure station",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 21, 54, 112)),
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(
                  color: Colors.black,
                  thickness: 1.5,
                  endIndent: 20,
                  indent: 20,
                ),
                const SizedBox(height: 15),

                // Departure
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 8),
                  child: const Text(
                    "Departure Station",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: selectedDeparture,
                    hint: const Text("Select Departure"),
                    items: departureStations.map((station) {
                      return DropdownMenuItem(
                        value: station,
                        child: Text(station),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedDeparture = value;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 16),

                // Arrival
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 8),
                  child: const Text(
                    "Arrival Station",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Autocomplete<String>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text.isEmpty) {
                        return const Iterable<String>.empty();
                      }
                      return arrivalStations.where((station) => station
                          .toLowerCase()
                          .startsWith(textEditingValue.text.toLowerCase()));
                    },
                    onSelected: (String selection) {
                      setState(() {
                        selectedArrival = selection;
                      });
                    },
                    fieldViewBuilder:
                        (context, controller, focusNode, onFieldSubmitted) {
                      return TextField(
                        controller: controller,
                        focusNode: focusNode,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Arrival Station',
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 30),

                // Search Button
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: const Size(200, 50),
                    ),
                    onPressed: () {
                      log(selectedArrival!);
                      log(selectedDeparture!);
                      BlocProvider.of<GetTicketsCubit>(context)
                          .searchTicketsData(
                        newDeparture: selectedDeparture!,
                        newArrival: selectedArrival!,
                      );
                    },
                    child: const Text(
                      "Search",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                if (state is SearchTicketsLoading)
                  Expanded(
                      child: const Center(child: CircularProgressIndicator())),
                if (state is SearchTicketsSuccess)
                  state.searchTickets.isEmpty
                      ? const Center(child: Text("No tickets found."))
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 10),
                              child: Text(
                                "Your Search Result:",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.kPrimaryColor,
                                ),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.searchTickets.length,
                              itemBuilder: (context, index) {
                                final ticket = state.searchTickets[index];
                                return CustomTicketCard(
                                  trainClass: ticket.trainClass,
                                  departure: ticket.departure,
                                  arrival: ticket.arrival,
                                  price: ticket.price,
                                  getMyTrainImage: (trainClass) =>
                                      getTrainImage(trainClass),
                                  date: ticket.date,
                                  time: ticket.time,
                                  isOferd: ticket.isOfer,
                                );
                              },
                            ),
                          ],
                        ),
              ],
            );
          },
        ),
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
