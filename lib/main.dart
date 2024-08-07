import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'providers/job_provider.dart';
import 'screens/job_list_screen.dart';
import 'screens/add_job_screen.dart';
import 'screens/notifications_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => JobProvider()),
      ],
      child: MaterialApp(
        title: 'Job Portal',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: JobListScreen(),
        routes: {
          '/add_job': (context) => AddJobScreen(),
          '/notifications': (context) => NotificationsScreen(),
        },
      ),
    );
  }
}
