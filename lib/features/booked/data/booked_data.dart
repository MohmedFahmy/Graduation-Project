import 'package:dio/dio.dart';
import 'package:graduation_app/features/booked/data/model/booked_model.dart';

class BookedData {
  Dio dio = Dio();
  getBookedTickets({required String userNumber}) async {
    Response response = await dio.get(
        'https://b4040788-f1d4-46c6-a125-e6d800704131-00-5eh9qo9n8y6o.riker.replit.dev/bookings/$userNumber');
    List data = response.data;
    List<BookedModel> tickets =
        data.map((e) => BookedModel.fromJson(e)).toList();
    return tickets;
  }
}
