import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/login_pages.dart';
import 'package:chat_app/widgets/capture_image.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'LoginPage': (context) => LoginPages(),
        ChatPages.id: (context) => ChatPages()
      },
      // home: LoginPages(),
      home: ChatPages(),
    );
  }
}

//////    https://github.com/flutter/flutter/issues/49507