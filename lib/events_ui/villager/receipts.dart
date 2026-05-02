import 'package:flutter/material.dart';

// Data model for a receipt
class Receipt {
  final String id;
  final double amount;
  final DateTime date;

  Receipt({required this.id, required this.amount, required this.date});
}

class ReceiptsScreen extends StatefulWidget {
  final List<Receipt> receipts;

  const ReceiptsScreen({super.key, required this.receipts});

  @override
  State<ReceiptsScreen> createState() => _ReceiptsScreenState();
}

class _ReceiptsScreenState extends State<ReceiptsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receipts'),
        backgroundColor: Colors.blue,
      ),
      body: widget.receipts.isEmpty
          ? const Center(
              child: Text(
                'No receipts found.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: widget.receipts.length,
              itemBuilder: (context, index) {
                final receipt = widget.receipts[index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.receipt,
                      color: Colors.blue,
                      size: 40,
                    ),
                    title: Text(
                      'Contribution: \u20B9${receipt.amount.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      'Date: ${receipt.date.day}/${receipt.date.month}/${receipt.date.year}\nTransaction ID: ${receipt.id}',
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Optional: Navigate to a detailed receipt view
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Tapped on receipt ${receipt.id}'),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
