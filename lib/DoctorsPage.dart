import 'package:flutter/material.dart';
import 'package:test_app/doctordata.dart';
import 'package:test_app/doctor_detail_screen.dart';

class DoctorsPage extends StatefulWidget {
  const DoctorsPage({super.key});

  @override
  State<DoctorsPage> createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> filteredDoctors = doctors;

  void filterDoctors(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredDoctors = doctors; // لو السيرش فاضي رجّع كل الدكاترة
      } else {
        filteredDoctors = doctors.where((doc) {
          final name = doc['name'].toString().toLowerCase();
          final specialization = doc['specialization'].toString().toLowerCase();
          final searchLower = query.toLowerCase();
          return name.contains(searchLower) || specialization.contains(searchLower);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 90),
              child: ListView.builder(
                itemCount: filteredDoctors.length,
                itemBuilder: (context, index) {
                  final doc = filteredDoctors[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(9),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.07),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 33,
                              backgroundImage: NetworkImage(doc['image']),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.only(left: 15, top: 5),
                                  child: Text(
                                    doc['name'],
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 15, top: 5),
                                  child: Text(
                                    doc['specialization'],
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black54),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        const Divider(
                          color: Colors.black12,
                          thickness: 1,
                          endIndent: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 30, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: [
                                    const Icon(Icons.calendar_month,
                                        color: Colors.grey, size: 24),
                                    Text(" ${doc['schedule']} ",
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.grey)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.schedule,
                                        color: Colors.grey, size: 24),
                                    Text(" ${doc['startTime']} - ${doc['endTime']} ",
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.grey)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DoctorDetailScreen(
                                  name: doc['name'],
                                  reviews: doc['reviews'],
                                  rate: doc['rate'],
                                  distance: doc['distance'],
                                  schedule: doc['schedule'],
                                  startTime: doc['startTime'],
                                  endTime: doc['endTime'],
                                  specialization: doc['specialization'],
                                  imageUrl: doc['image'],
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[50],
                            foregroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            minimumSize: const Size(320, 40),
                          ),
                          child: const Text('Details',
                              style: TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 30),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.05),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black.withOpacity(0.05),
                width: 1,
              ),
            ),
            child: TextField(
              controller: searchController,
              onChanged: filterDoctors,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search, color: Colors.grey),
                ),
                hintText: "Search doctor or health issue",
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 14, horizontal: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
