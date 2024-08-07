import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job_portal/models/job.dart';


class JobDetailScreen extends StatelessWidget {
  final Job job;

  JobDetailScreen({required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(job.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(job.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(job.description, style: TextStyle(fontSize: 16)),
            Spacer(),
            ElevatedButton(
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection('job_applications')
                    .add({'jobId': job.id, 'applicantId': 'currentUser'});  // Replace 'currentUser' with actual user ID
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Application Submitted')),
                );
              },
              child: Text('Apply'),
            ),
          ],
        ),
      ),
    );
  }
}
