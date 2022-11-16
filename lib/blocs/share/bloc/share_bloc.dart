import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yeliz/models/reward.dart';
import 'package:yeliz/services/share_service.dart';

part 'share_event.dart';
part 'share_state.dart';

class ShareBloc extends Bloc<ShareEvent, ShareState> {
  ShareService service;
  ShareBloc(this.service) : super(ShareInitial()) {
    on<Share>((event, emit) {
      service.onShare(event.rewards);
      emit(ShareInitial());
    });
  }
}
