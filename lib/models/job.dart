import 'package:cloud_firestore/cloud_firestore.dart';

class Job {
  String id;
  String title;
  String description;
  String providerId;

  Job({required this.id, required this.title, required this.description, required this.providerId});

  factory Job.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Job(
      id: doc.id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      providerId: data['providerId'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'description': description,
      'providerId': providerId,
    };
  }
}
