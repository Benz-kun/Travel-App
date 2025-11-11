
import 'package:flutter/material.dart';
import 'dart:math';

class EMICalculatorPage extends StatefulWidget {
  const EMICalculatorPage({super.key});

  @override
  State<EMICalculatorPage> createState() => _EMICalculatorPageState();
}

class _EMICalculatorPageState extends State<EMICalculatorPage> {
  final _formKey = GlobalKey<FormState>();
  final _loanAmountController = TextEditingController();
  final _interestRateController = TextEditingController();
  final _tenureController = TextEditingController();

  double? _emi;
  double? _totalInterest;

  void _calculateEMI() {
    if (_formKey.currentState!.validate()) {
      double P = double.parse(_loanAmountController.text);
      double annualRate = double.parse(_interestRateController.text);
      int N = int.parse(_tenureController.text);

      double R = annualRate / 12 / 100;
      double emi = (P * R * (pow(1 + R, N))) / (pow(1 + R, N) - 1);
      double totalPayment = emi * N;
      double totalInterest = totalPayment - P;

      setState(() {
        _emi = emi;
        _totalInterest = totalInterest;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EMI Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _loanAmountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Loan Amount',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Enter loan amount';
                  if (double.tryParse(value)! <= 0) return 'Must be positive';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _interestRateController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Annual Interest Rate (%)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Enter interest rate';
                  if (double.tryParse(value)! <= 0) return 'Must be positive';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _tenureController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Loan Tenure (months)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Enter tenure';
                  if (int.tryParse(value)! <= 0) return 'Must be positive integer';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateEMI,
                child: const Text('Calculate EMI'),
              ),
              const SizedBox(height: 20),
              if (_emi != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Loan Amount: ₹${_loanAmountController.text}'),
                    Text('Monthly EMI: ₹${_emi!.toStringAsFixed(2)}'),
                    Text('Total Interest: ₹${_totalInterest!.toStringAsFixed(2)}'),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
