import 'package:components_design/screens/student_screen.dart';
import 'package:flutter/material.dart';
import 'package:components_design/emi_calculator.dart';
import 'package:components_design/budget_input_screen.dart';
import 'package:components_design/budget_result_screen.dart';
import 'package:components_design/travel_home.dart';

void main() {
  runApp(MyTravelApp());
}

class MyTravelApp extends StatelessWidget {
  const MyTravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Destination Explorer',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/emi': (context) => EMICalculatorPage(),
        '/budgetInput': (context) => BudgetInputScreen(),
        '/budgetResult': (context) => BudgetResultScreen(),
        '/travel': (context) => TravelHomePage(),
        '/student': (context) => StudentScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/travel'),
              child: const Text('Explore Travel Destinations'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/emi'),
              child: const Text('Open EMI Calculator'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/budgetInput'),
              child: const Text('Open Expense Manager'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/student'),
              child: const Text('Student Info Management'),
            ),
          ],
        ),
      ),
    );
  }
}
