import 'package:test_app/DoctorsPage.dart';
import 'package:flutter/material.dart';
import 'package:test_app/doctordata.dart';
import 'package:flutter/material.dart';
class DoctorDetailScreen extends StatelessWidget {
  final String name;
  final String specialization;
  final String imageUrl;
  final double rate;
  final int reviews;
  final String distance;
  final String schedule;
  final String startTime;
  final String endTime;

  const DoctorDetailScreen({
    super.key,
    required this.name,
    required this.specialization,
    required this.imageUrl,
    required this.rate,
    required this.reviews,
    required this.distance,
    required this.schedule,
    required this.startTime,
    required this.endTime,
  });



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Doctor'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(imageUrl),
            ),
            const SizedBox(height: 20),
            Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              specialization,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 30),

            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, size: 24, color: Colors.orange[700]),
                        const SizedBox(width: 12),
                        Text("rate: $rate ⭐"),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(Icons.comment, size: 24, color: Colors.blue[700]),
                        const SizedBox(width: 12),
                        Text(" reviews: $reviews"),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 24, color: Colors.red[700]),
                        const SizedBox(width: 12),
                        Text("rate : $distance km"),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(Icons.calendar_today, size: 24, color: Colors.blue[700]),
                        const SizedBox(width: 12),
                        Text(" schedule : $schedule"),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(Icons.access_time, size: 24, color: Colors.green[700]),
                        const SizedBox(width: 12),
                        Text("time : $startTime - $endTime"),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),


          ],
        ),
      ),
    );
  }
}
