import 'package:flutter/material.dart';

class BudgetResultScreen extends StatelessWidget {
  const BudgetResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map<String, double>;

    final income = data['income']!;
    final rent = data['rent']!;
    final food = data['food']!;
    final transport = data['transport']!;
    final others = data['others']!;

    final totalExpenses = rent + food + transport + others;
    final remaining = income - totalExpenses;

    Color balanceColor = remaining >= 0 ? Colors.green : Colors.red;
    String balanceMessage =
        remaining >= 0 ? 'Great! You are saving money!' : 'You are overspending!';

    return Scaffold(
      appBar: AppBar(title: const Text('Expense Summary')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Monthly Income: ₹$income'),
            Text('Rent/EMI: ₹$rent'),
            Text('Food Expenses: ₹$food'),
            Text('Transport Expenses: ₹$transport'),
            Text('Other Expenses: ₹$others'),
            const Divider(height: 30, thickness: 2),
            Text(
              'Remaining Balance: ₹${remaining.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: balanceColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              balanceMessage,
              style: TextStyle(color: balanceColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
