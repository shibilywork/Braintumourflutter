import 'package:braintumor/loginAPI.dart';
import 'package:braintumor/regAPI.dart';
import 'package:flutter/material.dart';

class ViewAppointment extends StatefulWidget {
  const ViewAppointment({super.key});

  @override
  State<ViewAppointment> createState() => _ViewAppointmentState();
}

class _ViewAppointmentState extends State<ViewAppointment> {
  List<dynamic> appointments = [];

  Future<void> viewbooking() async {
    try {
      final response = await dio.get("$baseurl/ViewBookings/$lid");
      print(response.data);

      if (response.statusCode == 200 && response.data is List) {
        setState(() {
          appointments = response.data;
        });
      }
    } catch (e) {
      debugPrint("Error loading doctors: $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewbooking();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header (same branding)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  children: const [
                    Icon(
                      Icons.calendar_month_outlined,
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
                      'Your Appointments',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              // Appointment List
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: appointments.length,
                  itemBuilder: (context, index) {
                    final appointment = appointments[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(18),
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
                          // Doctor
                          Text(
                            appointment['doct'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // _row(
                          //   Icons.person_outline,
                          //   'Patient: ${appointment['Patient']}',
                          // ),
                          _row(
                            Icons.calendar_today_outlined,
                            'Date: ${appointment['date']}',
                          ),
                          _row(
                            Icons.access_time_outlined,
                            'Time: ${appointment['time']}',
                          ),

                          const SizedBox(height: 12),

                          // Status Chip
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: _statusColor(
                                  appointment['st+atus'],
                                ).withOpacity(0.9),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                appointment['status'],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
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

  Widget _row(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.white70),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'Live':
        return const Color(0xFF00E5FF);
      case 'Completed':
        return Colors.greenAccent;
      case 'Pending':
        return Colors.orangeAccent;
      default:
        return Colors.grey;
    }
  }
}
