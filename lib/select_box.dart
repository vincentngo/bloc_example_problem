import 'package:bloc_bug_problem/account_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class SelectBox extends StatefulWidget {
  final String initialAccountId;

  const SelectBox(
      {Key key, @required this.initialAccountId})
      : super(key: key);

  @override
  _SelectBoxState createState() => _SelectBoxState();
}

class _SelectBoxState extends State<SelectBox> {

  _SelectBoxState();
  var accounts = ["john", "adam", "christina", "felix", "reso-coder", "amy"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SearchableDropdown.single(
      items: accounts.map((String value) {
        return new DropdownMenuItem<String>(
          value: value,
          child: Text(value)
        );
      }).toList(),
      value: widget.initialAccountId,
      hint: "Account Id",
      searchHint: "Select Account",
      onChanged: (value) {
        BlocProvider.of<AccountBloc>(context).add(SelectAccount(value));
      },
      isExpanded: true,
    );
  }
}