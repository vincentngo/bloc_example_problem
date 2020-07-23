import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {

  AccountBloc() : super(AccountState(null));

  bool didSelectedFleet() {
    return state.selectedAccountId != null;
  }

  @override
  Stream<AccountState> mapEventToState(
    AccountEvent event,
  ) async* {
    if (event is SelectAccount) {
      if (event.accountId == null) {
        yield(AccountState(null));
      } else {
        yield AccountState(event.accountId);
      }
    }
  }
}

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}


class SelectAccount extends AccountEvent {
  final String accountId;

  SelectAccount(this.accountId);

  List<Object> get props => [accountId];

  @override
  String toString() => 'Selected account { accountId :$accountId }';
}


class AccountState extends Equatable {
  final String selectedAccountId
  ;

  AccountState(this.selectedAccountId);

  @override
  List<Object> get props => [selectedAccountId];

  @override
  String toString() {
    return selectedAccountId != null ? selectedAccountId : "no account selected";
  }
}
