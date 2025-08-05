import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/features/home/cubit/get_tickets_state.dart';

import '../data/tickets_data.dart';

class GetTicketsCubit extends Cubit<GetTicketsState> {
  GetTicketsCubit() : super(GetTicketsInitial());
  GetTicketsCubit get(context) => BlocProvider.of(context);

  TicketsData data = TicketsData();
  getTicketsData() async {
    emit(GetTicketsLoading());
    var ticketsData = await data.getTickets();
    emit(GetTicketsSuccess(tickets: ticketsData));
  }


  searchTicketsData(
      {required String newDeparture, required String newArrival}) async {
    emit(SearchTicketsLoading());
    var searchTicketsData =
        await data.searchTickets(departure: newDeparture, arrival: newArrival);
    emit(SearchTicketsSuccess(searchTickets: searchTicketsData));
  }
}
