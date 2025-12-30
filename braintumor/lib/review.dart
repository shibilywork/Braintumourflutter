import 'package:braintumor/loginAPI.dart';
import 'package:braintumor/regAPI.dart';
import 'package:flutter/material.dart';


class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final TextEditingController reviewController = TextEditingController();
  double rating = 5.0; 

  
Future<bool> submitReview({
  required String review,
  required double rating,
}) async {
  try {
    final response = await dio.post(
      '$baseurl/review/$lid',
      data: {
        'Review': review,
        'Rating': rating,
      },
    );

    return response.statusCode == 201;
  } catch (e) {
    print('Review error: $e');
    return false;
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
                        'Patient Review',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  /// GLASS CARD (UNCHANGED)
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
                          'Share Your Experience',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 14),

                        /// REVIEW INPUT
                        TextFormField(
                          controller: reviewController,
                          maxLines: 5,
                          style: const TextStyle(color: Colors.white),
                          decoration: _inputDecoration(
                            hint:
                                'Tell us about your experience with the service...',
                            icon: Icons.rate_review_outlined,
                          ),
                        ),

                        const SizedBox(height: 20),

                        /// RATING SLIDER (simple & clean)
                        Text(
                          'Rating: ${rating.toStringAsFixed(1)}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        Slider(
                          value: rating,
                          min: 1,
                          max: 5,
                          divisions: 8,
                          activeColor: const Color(0xFF00E5FF),
                          onChanged: (val) {
                            setState(() {
                              rating = val;
                            });
                          },
                        ),

                        const SizedBox(height: 20),

                        /// SUBMIT BUTTON
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: submitReviewHandler,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF00E5FF),
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: const Text(
                              'Submit Review',
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

                  const SizedBox(height: 20),

                  const Text(
                    'Your feedback helps us improve patient care',
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

  /// 🔹 SUBMIT HANDLER
  Future<void> submitReviewHandler() async {
    if (reviewController.text.isEmpty) return;

    bool success = await submitReview(
      review: reviewController.text,
      rating: rating,
    );

    if (success) {
      reviewController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Review submitted successfully')),
      );
    }
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
