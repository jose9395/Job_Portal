import 'package:flutter/material.dart';
import 'package:job_portal/models/job.dart';
import 'package:job_portal/providers/job_provider.dart';
import 'package:provider/provider.dart';
// import '.providers/job_provider.dart';
// import '.models/job.dart';

class AddJobScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Job'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Job Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a job title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Job Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a job description';
                  }
                  return null;
                },
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final job = Job(
                      id: '',
                      title: _titleController.text,
                      description: _descriptionController.text,
                      providerId: 'currentProvider',  // Replace with actual provider ID
                    );
                    Provider.of<JobProvider>(context, listen: false).addJob(job);
                    Navigator.pop(context);
                  }
                },
                child: Text('Add Job'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
