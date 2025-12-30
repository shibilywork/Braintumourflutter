import 'package:flutter/material.dart';

class ViewPrescriptions extends StatefulWidget {
  const ViewPrescriptions({super.key});

  @override
  State<ViewPrescriptions> createState() => _ViewPrescriptionsState();
}

class _ViewPrescriptionsState extends State<ViewPrescriptions> {
  final List<Map<String, dynamic>> prescriptions = [
    {
      'patient': 'Rohan',
      'prescription': 'Take 2 tablets daily after meals',
      'medicine': 'Paracetamol',
      'doctor': 'Dr. Albert',
    },
    {
      'patient': 'Swalih',
      'prescription': 'Apply ointment twice a day',
      'medicine': 'Betadine Cream',
      'doctor': 'Dr. Rohan',
    },
    {
      'patient': 'Razin',
      'prescription': 'Drink 1 glass of juice daily',
      'medicine': 'Vitamin C',
      'doctor': 'Dr. Razin',
    },
    {
      'patient': 'Rinshad',
      'prescription': 'Take 1 capsule before sleep',
      'medicine': 'Melatonin',
      'doctor': 'Dr. Rinshad',
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
                      Icons.medical_services_outlined,
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
                      'Prescriptions',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              // Prescription list
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: prescriptions.length,
                  itemBuilder: (context, index) {
                    final item = prescriptions[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 18),
                      padding: const EdgeInsets.all(16),
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
                          _infoRow(Icons.person_outline, item['patient']),
                          _infoRow(Icons.description_outlined, item['prescription']),
                          _infoRow(Icons.medication, item['medicine']),
                          _infoRow(Icons.person, item['doctor']),
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
