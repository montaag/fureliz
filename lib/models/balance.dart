// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Balance extends Equatable {
  int id;
  double earnedBalance;
  DateTime date;
  Balance({
    this.id = 0,
    required this.earnedBalance,
    required this.date,
  });

  @override
  List<Object?> get props => [id, earnedBalance, date];
}

class CurrentBalance extends Equatable {
  List<Balance> balances;
  double currentBalance;
  CurrentBalance({
    required this.balances,
    required this.currentBalance,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
