import 'package:thrifty/generated/l10n.dart';
import 'package:thrifty/models/models.dart';
import 'package:thrifty/shared/shared.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatefulWidget {
  final String date;
  final Map<String, List<Transaction>> grouped;

  const TransactionList({
    super.key,
    required this.date,
    required this.grouped,
  });

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildListHeader(),
        ...visible
            ? (widget.grouped[widget.date]?.map((txn) => TransactionListTile(txn)) ?? [])
            : [],
      ],
    );
  }

  InkWell buildListHeader() {
    return InkWell(
      onTap: () {
        setState(() => visible = !visible);
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 30,
          bottom: 10,
          left: 20,
          right: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            DateLabel(widget.date),
            Row(
              children: <Widget>[
                visible
                    ? Container()
                    : Text(
                        S.of(context).transactionListHiddenTransactionText(
                            widget.grouped[widget.date]?.length ?? 0),
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                SizedBox(width: 5),
                Icon(
                  visible ? Icons.arrow_upward : Icons.arrow_downward,
                  size: 12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
