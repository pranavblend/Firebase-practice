

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  Future addUser({
    required String taskName,
    required String taskDate,
    required String taskTime,
  }) async {
    try {
      final firestore = FirebaseFirestore.instance;

      await firestore.collection('users').doc().set({
        'task_name': taskName,
        'task_date': taskDate,
        'task_time': taskTime,
      }).then((el){
      });
    } catch (e) {
     print(e.toString());
    }
  }

  // Future<String?> getUser() async {
  //   try {
  //     CollectionReference users =
  //     FirebaseFirestore.instance.collection('users');
  //     final snapshot = await users.doc().get();
  //     final data = snapshot.data() as Map<String, dynamic>;
  //     return data['task_name'];
  //   } catch (e) {
  //     return 'Error fetching user';
  //   }
  }


