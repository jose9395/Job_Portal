import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:job_portal/models/job.dart';

class JobProvider with ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  List<Job> jobs = [];

  JobProvider() {
    _fetchJobs();
  }

  Future<void> _fetchJobs() async {
    final snapshot = await _db.collection('jobs').get();
    jobs = snapshot.docs.map((doc) => Job.fromFirestore(doc)).toList();
    notifyListeners();
  }

  Future<void> addJob(Job job) async {
    final docRef = await _db.collection('jobs').add(job.toFirestore());
    job.id = docRef.id;
    jobs.add(job);
    notifyListeners();
  }
}
