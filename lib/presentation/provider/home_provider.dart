import 'package:flutter/material.dart';

class TopRatedCourseModel {
  final String image;
  final String title;
  final String description;
  final String price;
  final double rating;
  final bool isPaid;

  TopRatedCourseModel({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.isPaid,
  });
}

class HomeProvider extends ChangeNotifier {
  bool _isLoading = false;

  List<TopRatedCourseModel> _topRatedCourseList = [];

  // getter
  bool get isLoading => _isLoading;
  List<TopRatedCourseModel> get topRatedCourseList => _topRatedCourseList;

  // dummy data
  Future<void> getTopRatedCourses() async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 3));
    _topRatedCourseList = [
      TopRatedCourseModel(
        image: 'assets/images/brain1.png',
        title: 'Cognitive Psychology: An Introduction',
        description: 'A deep dive into the human mind.',
        price: '₹2,999',
        rating: 4.9,
        isPaid: true,
      ),
      TopRatedCourseModel(
        image: 'assets/images/brain2.png',
        title: 'The Science of Decision Making',
        description: 'Understand how humans make choices.',
        price: '₹0',
        rating: 4.9,
        isPaid: false,
      ),
      TopRatedCourseModel(
        image: 'assets/images/brain3.png',
        title: 'Human Behaviour Basics',
        description: 'Learn psychology fundamentals.',
        price: '₹1,499',
        rating: 4.8,
        isPaid: true,
      ),
      TopRatedCourseModel(
        image: 'assets/images/brain4.png',
        title: 'Mind and Memory',
        description: 'Improve memory and focus power.',
        price: '₹799',
        rating: 4.7,
        isPaid: true,
      ),
    ];

    _isLoading = false;
    notifyListeners();
  }
}
