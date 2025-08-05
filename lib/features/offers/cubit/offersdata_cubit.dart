import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/features/offers/data/offers_data.dart';

import '../data/model/offers_model.dart';

part 'offersdata_state.dart';

class OffersdataCubit extends Cubit<OffersdataState> {
  OffersdataCubit() : super(OffersdataInitial());
  OffersdataCubit get(context) => BlocProvider.of(context);

  OffersData data = OffersData();
  getTicketsData() async {
    emit(GetOffersDataLoading());
    var ticketsData = await data.getOffersTickets();
    emit(GetOffersataSuccess(offers: ticketsData));
  }
}
