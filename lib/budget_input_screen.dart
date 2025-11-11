import 'package:flutter/material.dart';

class BudgetInputScreen extends StatefulWidget {
  const BudgetInputScreen({super.key});

  @override
  State<BudgetInputScreen> createState() => _BudgetInputScreenState();
}

class _BudgetInputScreenState extends State<BudgetInputScreen> {
  final _formKey = GlobalKey<FormState>();

  final _incomeController = TextEditingController();
  final _rentController = TextEditingController();
  final _foodController = TextEditingController();
  final _transportController = TextEditingController();
  final _othersController = TextEditingController();

  @override
  void dispose() {
    _incomeController.dispose();
    _rentController.dispose();
    _foodController.dispose();
    _transportController.dispose();
    _othersController.dispose();
    super.dispose();
  }

  void _submitData() {
    if (_formKey.currentState!.validate()) {
      final userData = {
        'income': double.parse(_incomeController.text),
        'rent': double.parse(_rentController.text),
        'food': double.parse(_foodController.text),
        'transport': double.parse(_transportController.text),
        'others': double.parse(_othersController.text),
      };

      Navigator.pushNamed(
        context,
        '/budgetResult',
        arguments: userData,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Monthly Expense Form')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                'Enter your monthly income and expenses:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildTextField('Monthly Income', _incomeController),
              _buildTextField('Rent/EMI', _rentController),
              _buildTextField('Food Expenses', _foodController),
              _buildTextField('Transport Expenses', _transportController),
              _buildTextField('Other Expenses', _othersController),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submitData,
                child: const Text('View Result'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          final num? val = num.tryParse(value);
          if (val == null || val < 0) {
            return 'Enter a valid positive number';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
