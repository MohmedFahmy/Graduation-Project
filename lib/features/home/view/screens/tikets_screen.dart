import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/features/home/cubit/get_tickets_cubit.dart';
import 'package:graduation_app/features/home/view/widget/custom_drawer.dart';

import '../../../../core/styles/app_colors.dart';
import '../../cubit/get_tickets_state.dart';
import '../widget/custom_ticket_card.dart';

class TiketsScreen extends StatelessWidget {
  const TiketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetTicketsCubit()..getTicketsData(),
      child: Scaffold(
        endDrawer: CustomDrawerWidget(),
        appBar: AppBar(
          backgroundColor: AppColors.kPrimaryColor,
          title: Text(
            'Our Trips',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        body: BlocConsumer<GetTicketsCubit, GetTicketsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetTicketsSuccess) {
              return ListView.builder(
                  itemBuilder: (context, index) {
                    return CustomTicketCard(
                      trainClass: state.tickets[index].trainClass,
                      departure: state.tickets[index].departure,
                      arrival: state.tickets[index].arrival,
                      price: state.tickets[index].price,
                      getMyTrainImage: (myTrainClass) {
                        return getTrainImage(state.tickets[index].trainClass);
                      },
                      date: state.tickets[index].date,
                      time: state.tickets[index].time,
                      isOferd: state.tickets[index].isOfer,
                    );
                  },
                  itemCount: state.tickets.length);
            }
            return Center(child: CircularProgressIndicator());
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
