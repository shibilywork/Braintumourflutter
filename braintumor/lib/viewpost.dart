import 'package:flutter/material.dart';

class ViewPost extends StatefulWidget {
  const ViewPost({super.key});

  @override
  State<ViewPost> createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
  final List<Map<String, dynamic>> posts = [
    {
      'image': 'https://upload.wikimedia.org/wikipedia/commons/3/3f/Brain_MRI_image.jpg',
      'document': 'Brain MRI Scan Report',
      'date': '12/08/2025',
      'doctor': 'Dr. Albert',
    },
    {
      'image': 'data:image/jpeg;base64,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',
      'document': 'Follow-up MRI Report',
      'date': '15/08/2025',
      'doctor': 'Dr. Rohan',
    },
    {
      'image': 'https://www.radiologyinfo.org/en/gallery/image/526',
      'document': 'Pre-op MRI Scan',
      'date': '20/08/2025',
      'doctor': 'Dr. Razin',
    },
    {
      'image': 'https://www.radiologyinfo.org/en/gallery/image/526',
      'document': 'Post-op MRI Report',
      'date': '22/08/2025',
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
                      Icons.article_outlined,
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
                      'Medical Reports',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              // Posts List
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
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
                          // Image thumbnail
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              post['image'],
                              height: 160,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 12),

                          // Document / info
                          _infoRow(Icons.description_outlined, post['document']),
                          _infoRow(Icons.calendar_today_outlined, post['date']),
                          _infoRow(Icons.person_outline, post['doctor']),
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
