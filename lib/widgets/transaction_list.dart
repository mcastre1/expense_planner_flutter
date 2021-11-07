import 'package:expense_planner/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No Transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 20,),
                Container(height: 200, child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,)),
              ],
            )
          :
          // HERE IS HOW WE MAP A LIST INTO WIDGETS! :) EASY!
          ListView(
              children: transactions.map((tx) {
                return Card(
                    child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      )),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '\$${tx.amount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          tx.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          DateFormat().format(tx.date),
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    )
                  ],
                ));
              }).toList(),
            ),
    );
  }
}
