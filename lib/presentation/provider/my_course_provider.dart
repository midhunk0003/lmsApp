import 'package:flutter/material.dart';

class ContinueLearningModel {
  final String title;
  final String image;
  final double progress;

  ContinueLearningModel({
    required this.title,
    required this.image,
    required this.progress,
  });
}

class MyCourseProvider extends ChangeNotifier {
  bool _isLoading = false;
  List<ContinueLearningModel> _continueLearningList = [];

  // getter
  bool get isLoading => _isLoading;
  List<ContinueLearningModel> get continueLearningList => _continueLearningList;

  Future<void> getMyCoursesPro() async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    _continueLearningList = [
      ContinueLearningModel(
        title: 'The Psychology of Relationships',
        image: 'assets/images/imgclearn.png',
        progress: 0.7,
      ),

      ContinueLearningModel(
        title: 'Flutter UI Masterclass',
        image: 'assets/images/imgclearn.png',
        progress: 0.5,
      ),

      ContinueLearningModel(
        title: 'Business Management Basics',
        image: 'assets/images/imgclearn.png',
        progress: 0.9,
      ),

      ContinueLearningModel(
        title: 'Digital Marketing Strategy',
        image: 'assets/images/imgclearn.png',
        progress: 0.3,
      ),

      ContinueLearningModel(
        title: 'Complete Web Development',
        image: 'assets/images/imgclearn.png',
        progress: 0.8,
      ),
    ];
    _isLoading = false;
    notifyListeners();
  }
}
