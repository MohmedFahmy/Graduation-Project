import 'package:dio/dio.dart';
import 'package:graduation_app/features/shipments/data/model/ShipmentModel.dart';

class ShipmentsData {
  Dio dio = Dio();

  getMyShipments({required String userNumber}) async {
    Response response = await dio.get(
        'https://b4040788-f1d4-46c6-a125-e6d800704131-00-5eh9qo9n8y6o.riker.replit.dev/shipments/user/$userNumber');
    List data = response.data;
    List<ShipmentModel> tickets =
        data.map((e) => ShipmentModel.fromJson(e)).toList();
    return tickets;
  }
}
