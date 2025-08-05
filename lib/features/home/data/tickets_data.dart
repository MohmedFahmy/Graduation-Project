import 'package:dio/dio.dart';
import 'package:graduation_app/features/home/data/model/ticket_model.dart';

class TicketsData {
  Dio dio = Dio();
  getTickets() async {
    Response response = await dio.get(
        'https://b4040788-f1d4-46c6-a125-e6d800704131-00-5eh9qo9n8y6o.riker.replit.dev/tickets');
    List data = response.data;
    List<TicketModel> tickets =
        data.map((e) => TicketModel.fromJson(e)).toList();
    return tickets;
  }

  Future<List<TicketModel>> searchTickets({
    required String departure,
    required String arrival,
  }) async {
    try {
      Response response = await dio.get(
        'https://b4040788-f1d4-46c6-a125-e6d800704131-00-5eh9qo9n8y6o.riker.replit.dev/tickets/search?departure=$departure&arrival=$arrival',
      );

      if (response.statusCode == 200) {
        List data = response.data;
        List<TicketModel> foundTickets =
            data.map((e) => TicketModel.fromJson(e)).toList();
        return foundTickets;
      } else {
        throw Exception('فشل تحميل التذاكر: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('حدث خطأ أثناء جلب التذاكر: $e');
    }
  }
}
