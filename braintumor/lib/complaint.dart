// import 'package:braintumor/complaintAPI.dart';
// import 'package:flutter/material.dart';

// class ComplaintPage extends StatelessWidget {
//   const ComplaintPage({super.key});

//   @override
//   Widget build(BuildContext context) {
    
//   TextEditingController complaint=TextEditingController();
  



//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               Color(0xFF0F2027),
//               Color(0xFF203A43),
//               Color(0xFF2C5364),
//             ],
//           ),
//         ),
//         child: SafeArea(
//           child: Center(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Column(
//                 children: [
//                   // Header / Branding (same style as login)
//                   Column(
//                     children: const [
//                       Icon(
//                         Icons.psychology_alt_rounded,
//                         size: 70,
//                         color: Colors.white,
//                       ),
//                       SizedBox(height: 12),
//                       Text(
//                         'NeuroCare',
//                         style: TextStyle(
//                           fontSize: 28,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.white,
//                           letterSpacing: 1.2,
//                         ),
//                       ),
//                       SizedBox(height: 6),
//                       Text(
//                         'Patient Complaint Portal',
//                         style: TextStyle(
//                           color: Colors.white70,
//                         ),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 40),

//                   // Glass Card (same as login)
//                   Container(
//                     padding: const EdgeInsets.all(24),
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.12),
//                       borderRadius: BorderRadius.circular(20),
//                       border: Border.all(
//                         color: Colors.white.withOpacity(0.2),
//                       ),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.25),
//                           blurRadius: 20,
//                           offset: const Offset(0, 10),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'Describe Your Complaint',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.white,
//                           ),
//                         ),
//                         const SizedBox(height: 14),

//                         // Complaint Field
//                         TextFormField(controller:complaint ,
//                           maxLines: 6,
//                           style: const TextStyle(color: Colors.white),
//                           decoration: _inputDecoration(
//                             hint:
//                                 'write your complaint here..',
//                             icon: Icons.edit_note_outlined,
//                           ),
//                         ),

//                         const SizedBox(height: 30),

//                         // Submit Button (same as login button)
//                         SizedBox(
//                           width: double.infinity,
//                           height: 52,
//                           child: ElevatedButton(
//                             onPressed: () {ComplaintAPI(Complaint: complaint.text);},
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: const Color(0xFF00E5FF),
//                               elevation: 10,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(14),
//                               ),
//                             ),
//                             child: const Text(
//                               'Submit Complaint',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   const SizedBox(height: 20),

//                   // Footer (same tone as login)
//                   const Text(
//                     'Your data is secure and confidential',
//                     style: TextStyle(
//                       color: Colors.white60,
//                       letterSpacing: 0.8,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   InputDecoration _inputDecoration({
//     required String hint,
//     required IconData icon,
//   }) {
//     return InputDecoration(
//       hintText: hint,
//       hintStyle: const TextStyle(color: Colors.white60),
//       prefixIcon: Icon(icon, color: Colors.white70),
//       filled: true,
//       fillColor: Colors.white.withOpacity(0.08),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(14),
//         borderSide: BorderSide.none,
//       ),
//     );
//   }
// }
import 'package:braintumor/complaintAPI.dart';
import 'package:flutter/material.dart';

class ComplaintPage extends StatefulWidget {
  const ComplaintPage({super.key});

  @override
  State<ComplaintPage> createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  TextEditingController complaint = TextEditingController();
  List complaints = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadComplaints();
  }

  Future<void> loadComplaints() async {
    complaints = await fetchComplaints();
    setState(() {
      loading = false;
    });
  }

  Future<void> submitComplaint() async {
    if (complaint.text.isEmpty) return;

    bool success = await sendComplaint(complaint: complaint.text);

    if (success) {
      complaint.clear();
      loadComplaints();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Complaint sent successfully')),
      );
    }
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
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  /// HEADER (UNCHANGED)
                  Column(
                    children: const [
                      Icon(Icons.psychology_alt_rounded,
                          size: 70, color: Colors.white),
                      SizedBox(height: 12),
                      Text(
                        'NeuroCare',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Patient Complaint Portal',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  /// COMPLAINT INPUT CARD (UNCHANGED UI)
                  Container(
                    padding: const EdgeInsets.all(24),
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
                        const Text(
                          'Describe Your Complaint',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 14),

                        TextFormField(
                          controller: complaint,
                          maxLines: 6,
                          style: const TextStyle(color: Colors.white),
                          decoration: _inputDecoration(
                            hint: 'write your complaint here..',
                            icon: Icons.edit_note_outlined,
                          ),
                        ),

                        const SizedBox(height: 30),

                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: submitComplaint,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF00E5FF),
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: const Text(
                              'Submit Complaint',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// 🔹 PREVIOUS COMPLAINTS + REPLIES
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Previous Complaints',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  loading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : complaints.isEmpty
                          ? const Text(
                              'No complaints yet',
                              style: TextStyle(color: Colors.white70),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: complaints.length,
                              itemBuilder: (context, index) {
                                final item = complaints[index];

                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 8),
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.12),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['complaint'],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        'Date: ${item['date'].toString()}',
                                        style: const TextStyle(
                                            color: Colors.white60),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        item['reply'] ?? 'No reply yet',
                                        style: TextStyle(
                                          color: item['reply'] == null
                                              ? Colors.white54
                                              : Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),

                  const SizedBox(height: 20),

                  const Text(
                    'Your data is secure and confidential',
                    style: TextStyle(
                      color: Colors.white60,
                      letterSpacing: 0.8,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.white60),
      prefixIcon: Icon(icon, color: Colors.white70),
      filled: true,
      fillColor: Colors.white.withOpacity(0.08),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
    );
  }
}
