import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/features/booked/data/booked_data.dart';
import 'package:graduation_app/features/booked/data/model/booked_model.dart';
import 'package:meta/meta.dart';

part 'booked_tickets_state.dart';

class BookedTicketsCubit extends Cubit<BookedTicketsState> {
  BookedTicketsCubit() : super(BookedTicketsInitial());
  BookedTicketsCubit get(context) => BlocProvider.of(context);

  BookedData bookedData = BookedData();

  getTicketsData({required String userNumber}) async {
    emit(BookedTicketsLoading());
    var ticketsData = await bookedData.getBookedTickets(userNumber: userNumber);
    emit(BookedTicketsSuccess(tickets: ticketsData));
  }
}
