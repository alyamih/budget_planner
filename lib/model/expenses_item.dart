import 'package:budget_planner/model/category_item.dart';
import 'package:flutter/material.dart';

class ExpensesItem {
  String? description;
  DateTime? date;
  double? cost;
  ECategoryType? type;

  ExpensesItem({this.description, this.date, this.cost, this.type});

  factory ExpensesItem.fromJson(Map<String, dynamic> parsedJson) {
    return ExpensesItem(
        description: parsedJson['description'] ?? "",
        cost: parsedJson['cost'] ?? "",
        type: ECategoryType.values.byName(parsedJson['type']),
        date: DateTime.tryParse(parsedJson['date']));
  }

  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "cost": cost,
      "type": type!.name,
      "date": date.toString()
    };
  }
}
