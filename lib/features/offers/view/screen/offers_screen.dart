import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/features/offers/cubit/offersdata_cubit.dart';
import 'package:graduation_app/features/offers/view/widget/custom_offer_ticket.dart';

import '../../../../core/styles/app_colors.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OffersdataCubit()..getTicketsData(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kPrimaryColor,
          title: const Text(
            'Offers',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        body: BlocBuilder<OffersdataCubit, OffersdataState>(
          builder: (context, state) {
            if (state is GetOffersDataLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is GetOffersataSuccess) {
              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: state.offers.length,
                itemBuilder: (context, index) {
                  return CustomOfferTicket(
                    trainClass: state.offers[index].trainClass,
                    price: state.offers[index].price,
                    departure: state.offers[index].departure,
                    arrival: state.offers[index].arrival,
                    getMyTrainImage: (myTrainClass) =>
                        getTrainImage(myTrainClass),
                    date: state.offers[index].date,
                    time: state.offers[index].time,
                    isOferd: state.offers[index].offer,
                    discount: state.offers[index].discountPercentage,
                  );
                },
              );
            }

            // Fallback UI
            return const Center(
              child: Text('No offers available'),
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
