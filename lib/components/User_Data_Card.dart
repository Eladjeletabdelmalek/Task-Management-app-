import 'package:flutter/material.dart';

class UserDataCard extends StatefulWidget {
  final TextEditingController dataController;

  // final Icon IconController;
  // final TextEditingController phoneController;
  // final TextEditingController emailController;
  // final TextEditingController positionController;

  const UserDataCard({super.key, required this.dataController});
    // required this.familynameController,
    // required this.phoneController,
    // required this.emailController,
    // required this.positionController,});

  @override
  State<UserDataCard> createState() => _UserDataCardState();
}

class _UserDataCardState extends State<UserDataCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
                  width: 330,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF0F0F5), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.10),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: widget.dataController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            // hintText: 'Enter your data',
                          ),
                        ),
                      ),
                    ],
                  ),
                );






  }
}