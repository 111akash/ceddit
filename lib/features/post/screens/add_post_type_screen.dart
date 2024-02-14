import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPostTypeScreen extends StatefulWidget {
  final String type;
  const AddPostTypeScreen({
    super.key,
    required this.type,
  });

  @override
  State<AddPostTypeScreen> createState() => _AddPosttypeScreenState();
}

class _AddPosttypeScreenState extends State<AddPostTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
