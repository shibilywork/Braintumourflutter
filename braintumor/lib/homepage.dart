import 'package:flutter/material.dart';

import 'complaint.dart';
import 'review.dart';
import 'viewdoctors.dart';
import 'viewbooking.dart';
import 'viewmedicines.dart';
import 'viewpost.dart';
import 'viewprescriptions.dart';
import 'register.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {'title': 'View Doctors', 'icon': Icons.medical_services, 'page': const ViewDoctors()},
      {'title': 'View Appointments', 'icon': Icons.calendar_today, 'page': const ViewAppointment()},
      {'title': 'View Medicines', 'icon': Icons.medication, 'page': const ViewMedicine()},
      {'title': 'View Reports', 'icon': Icons.article, 'page': const ViewPost()},
      {'title': 'View Prescriptions', 'icon': Icons.receipt_long, 'page': const ViewPrescriptions()},
      {'title': 'Submit Complaint', 'icon': Icons.report_problem, 'page': const ComplaintPage()},
      {'title': 'Submit Review', 'icon': Icons.rate_review, 'page': const ReviewPage()},
      {'title': 'Profile / Register', 'icon': Icons.person, 'page':  RegisterPage()},
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
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
                    Icon(Icons.home_outlined, size: 60, color: Colors.white),
                    SizedBox(height: 8),
                    Text(
                      'NeuroCare Dashboard',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Patient Module',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              // Menu Grid
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                    itemCount: menuItems.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1.0,
                    ),
                    itemBuilder: (context, index) {
                      final item = menuItems[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => item['page']),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white.withOpacity(0.2)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                blurRadius: 15,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(item['icon'], size: 40, color: Colors.white),
                              const SizedBox(height: 8),
                              Text(
                                item['title'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
