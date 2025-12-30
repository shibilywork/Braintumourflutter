import 'package:braintumor/loginAPI.dart';
import 'package:braintumor/regAPI.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ViewDoctors extends StatefulWidget {
  const ViewDoctors({super.key});

  @override
  State<ViewDoctors> createState() => _ViewDoctorsState();
}

class _ViewDoctorsState extends State<ViewDoctors> {
   List<Map<String, dynamic>> doctors = [];
   DateTime? selectedDate;
   TimeOfDay? selectedtime;
   String? formattedTime;

  bool isloading=true;
  @override
  void initState() {
    super.initState();
viewdoctors();
  }

  Future<void> viewdoctors() async {
    try{
      final response = await dio.get("$baseurl/viewdoctorAPI");
      print(response.data);

      if (response.statusCode == 200 && response.data is List) {
        setState(() {
          doctors = List<Map<String, dynamic>>.from(response.data);
          isloading = false;
        });
      }
  } catch (e) {
    isloading = false;
    debugPrint("Error loading doctors: $e");
  }}




///////////PICK DATE////////////
Future<void> _pickDate(BuildContext context) async {
  DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2030),
  );

  if (picked != null) {
    setState(() => selectedDate = picked);
  }
}




///////////PICK TIME////////
  Future<void> _pickTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        selectedtime = picked;
        formattedTime =
            "${selectedtime!.hour.toString().padLeft(2, '0')}:"
            "${selectedtime!.minute.toString().padLeft(2, '0')}";
      });
    }
  }




///////BOOK DOCTOR/////
Future<void> _bookDoctor(int doctorId) async {
  try {
    await dio.post(
      "$baseurl/bookDoctor/$lid",
      data: {
        "DOCTORID": doctorId,
        "date":
            "${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}",
        "time": formattedTime,
      },
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Doctor booked successfully")),
    );
  } catch (e) {
    debugPrint("Booking failed: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Doctor booking failed")),
    );
  }
}


  /// ------------------- BOOKING DIALOG -------------------
  void _showBookingDialog(int doctorId) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Select Date & Time"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: Text(
                selectedDate == null
                    ? "Select Date"
                    : "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}",
              ),
              onTap: () => _pickDate(context),
            ),

            ListTile(
              leading: const Icon(Icons.access_time),
              title: Text(
                selectedtime == null
                    ? "Select Time"
                    : selectedtime!.format(context),
              ),
              onTap: () => _pickTime(context),
            ),
          ],
        ),

        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2E7D32),
            ),
            onPressed: () {
              if (selectedDate == null || selectedtime == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Select date and time"),
                  ),
                );
                return;
              }

              Navigator.pop(context);
              _bookDoctor(doctorId);
            },
            child: const Text("Confirm"),
          ),
        ],
      ),
    );
  }




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
              // Header / Branding
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
                      'Available Doctors',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              // Doctors List
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: doctors.length,
                  itemBuilder: (context, index) {
                    final doctor = doctors[index];
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
                          // Doctor name
                          Text(
                            doctor['name'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),

                          _infoRow(
                            Icons.local_hospital_outlined,
                            doctor['hospitalname'],
                          ),
                          _infoRow(
                            Icons.medical_information_outlined,
                            doctor['specialisation'],
                          ),
                          _infoRow(
                            Icons.phone_outlined,
                            doctor['phone'].toString(),
                          ),
                          _infoRow(
                            Icons.cake_outlined,
                            'Age: ${doctor['age'].toString()}',
                          ),

                          const SizedBox(height: 18),

                          // Book Button
                          SizedBox(
                            width: double.infinity,
                            height: 46,
                            child: ElevatedButton(
                              onPressed: () {
                                _showBookingDialog(doctor['id']);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color(0xFF00E5FF),
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              child: const Text(
                                'Book Appointment',
                                style: TextStyle(
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
