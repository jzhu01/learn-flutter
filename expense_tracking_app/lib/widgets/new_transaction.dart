import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmt = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmt <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmt,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Platform.isIOS ? CupertinoTextField(
                placeholder: 'Title',
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
              ) : TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
              ),
              Platform.isIOS ? CupertinoTextField(
                placeholder: 'Amount',
                controller: _amountController,
                onSubmitted: (_) => _submitData(),
              ) : TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      _selectedDate == null
                          ? 'No Date Chosen!'
                          : 'Chosen Date: ${DateFormat.yMd().format(_selectedDate)}',
                    )),
                    Platform.isIOS ? CupertinoButton(
                      child: Text(
                        "Choose Date",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: _presentDatePicker,
                    ) : FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text(
                        "Choose Date",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: _presentDatePicker,
                    )
                  ],
                ),
              ),
              RaisedButton(
                child: Text('Add Transaction'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: _submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
