import 'package:flutter/material.dart';

class ViewMedicine extends StatefulWidget {
  const ViewMedicine({super.key});

  @override
  State<ViewMedicine> createState() => _ViewMedicineState();
}

class _ViewMedicineState extends State<ViewMedicine> {
  final List<Map<String, dynamic>> medicines = [
    {
      'medicine': 'Paracetamol',
      'description': '1 time a day',
      'quantity': '5 Nos',
      'price': '50 Rs',
    },
    {
      'medicine': 'Ibuprofen',
      'description': '2 times a day',
      'quantity': '10 Nos',
      'price': '120 Rs',
    },
    {
      'medicine': 'Amoxicillin',
      'description': '3 times a day',
      'quantity': '14 Nos',
      'price': '200 Rs',
    },
    {
      'medicine': 'Vitamin D',
      'description': 'Once a week',
      'quantity': '4 Nos',
      'price': '80 Rs',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0F2027),
              Color(0xFF203A43),
              Color(0xFF2C5364),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  children: const [
                    Icon(
                      Icons.medication_outlined,
                      size: 60,
                      color: Colors.white,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'NeuroCare',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Prescribed Medicines',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              // Medicine List
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: medicines.length,
                  itemBuilder: (context, index) {
                    final medicine = medicines[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 18),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            medicine['medicine'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          _infoRow(
                            Icons.description_outlined,
                            medicine['description'],
                          ),
                          _infoRow(
                            Icons.format_list_numbered_outlined,
                            'Quantity: ${medicine['quantity']}',
                          ),
                          _infoRow(
                            Icons.price_change_outlined,
                            'Price: ${medicine['price']}',
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.white70),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}
