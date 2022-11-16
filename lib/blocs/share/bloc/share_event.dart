// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'share_bloc.dart';

abstract class ShareEvent extends Equatable {
  const ShareEvent();

  @override
  List<Object> get props => [];
}

class Share extends ShareEvent {
  final List<RewardModel> rewards;
  const Share({
    required this.rewards,
  });
}
