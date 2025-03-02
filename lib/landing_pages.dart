import 'package:flutter/material.dart';

import 'package:home_service/home.dart';

class LandingPages extends StatefulWidget {
  const LandingPages({super.key});

  @override
  State<LandingPages> createState() => _LandingPagesState();
}

class _LandingPagesState extends State<LandingPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple,
              Colors.blueAccent,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 0.1, vertical: 0.1),
        child: Column(
          children: [
            Material(
              elevation: 3.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  "images/login.jpeg",
                  height: MediaQuery.of(context).size.height / 1.39,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Service ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Nest",
                  style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 23.0),
                ),
              ],
            ),
            const Text(
              "     Let's Find Professional    \nCleaning and Repair Services",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            const Text(
              "Best App to find services near you which deliver\n                you a professional service",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the second page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                child: const Text('Lets Get Started'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
