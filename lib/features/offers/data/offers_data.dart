import 'package:dio/dio.dart';
import 'package:graduation_app/features/offers/data/model/offers_model.dart';

class OffersData {
  Dio dio = Dio();
  getOffersTickets() async {
    Response response = await dio.get(
        'https://b4040788-f1d4-46c6-a125-e6d800704131-00-5eh9qo9n8y6o.riker.replit.dev/offers');
    List data = response.data;
    List<OfferModel> offersTickets =
        data.map((e) => OfferModel.fromJson(e)).toList();
    return offersTickets;
  }
}
