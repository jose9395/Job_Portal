import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job_portal/models/job.dart';
import 'job_detail_screen.dart';


class JobListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Listings'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('jobs').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          var jobs = snapshot.data!.docs.map((doc) => Job.fromFirestore(doc)).toList();
          return ListView.builder(
            itemCount: jobs.length,
            itemBuilder: (context, index) {
              var job = jobs[index];
              return ListTile(
                title: Text(job.title),
                subtitle: Text(job.description),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JobDetailScreen(job: job),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
