import 'package:flutter/widgets.dart';
import 'package:lms/data/model/help_center_model/help_center_model.dart';

class CartCourseModel {
  final String title;
  final String image;
  final String price;
  final double rating;
  final bool isNew;
  final bool isBest;

  CartCourseModel({
    required this.title,
    required this.image,
    required this.price,
    required this.rating,
    this.isNew = false,
    this.isBest = false,
  });
}

class ProfileProvider extends ChangeNotifier {
  List<bool> _selectedItems = [];
  bool _selectionMode = false;
  bool _showHideQuestionANdAnswer = false;

  List<CartCourseModel> _cartCourses = [];
  List<HelpCenter>? _helpCenterData = [];

  // getter
  List<bool> get selectedItems => _selectedItems;
  bool get selectionMode => _selectionMode;
  bool get showHideQuestionANdAnswer => _showHideQuestionANdAnswer;
  List<CartCourseModel> get cartCourses => _cartCourses;
  List<HelpCenter>? get helpCenterData => _helpCenterData;

  Future<void> loadCartCourses() async {
    _cartCourses = [
      CartCourseModel(
        title: 'The Complete Guitar Course',
        image: 'assets/images/toprated.png',
        price: '₹2,799',
        rating: 4.9,
        isBest: true,
      ),

      CartCourseModel(
        title: 'The Science of Decision Making',
        image: 'assets/images/toprated.png',
        price: '₹3,799',
        rating: 4.9,
        isNew: true,
      ),

      CartCourseModel(
        title: 'Cognitive Psychology: An Introduction',
        image: 'assets/images/toprated.png',
        price: '₹2,999',
        rating: 4.8,
      ),

      CartCourseModel(
        title: 'Advanced UI UX Design Masterclass',
        image: 'assets/images/toprated.png',
        price: '₹4,499',
        rating: 5.0,
        isBest: true,
      ),

      CartCourseModel(
        title: 'Flutter App Development Bootcamp',
        image: 'assets/images/toprated.png',
        price: '₹5,999',
        rating: 4.7,
        isNew: true,
      ),
    ];
    // IMPORTANT
    _selectedItems = List.generate(_cartCourses.length, (index) => false);
    notifyListeners();
  }

  void onLongPress(int indexPass) {
    _selectionMode = true;
    _selectedItems[indexPass] = true;
    notifyListeners();
  }

  void onTap(int index) {
    if (!selectionMode) return;

    _selectedItems[index] = !_selectedItems[index];

    if (!_selectedItems.contains(true)) {
      _selectionMode = false;
    }

    notifyListeners();
  }

  int get selectedCount {
    return selectedItems.where((e) => e).length;
  }

  // helpcenter
  void getHelpCenterData() {
    _helpCenterData = [
      HelpCenter(
        categoryId: 1,
        categoryName: "Getting Started",
        questions: [
          Question(
            questionId: 1,
            question: "How do I find courses on this app?",
            answer:
                "After you log in, you can explore the Find a Live Class section from the home screen.",
          ),
          Question(
            questionId: 2,
            question: "How do I join a live class?",
            answer:
                "Open the course details page and click the Join Live Class button.",
          ),
        ],
      ),

      HelpCenter(
        categoryId: 2,
        categoryName: "My Account & Payments",
        questions: [
          Question(
            questionId: 3,
            question: "How do I update my profile information?",
            answer:
                "Go to Profile > Settings > Edit Profile to update your information.",
          ),
          Question(
            questionId: 4,
            question: "What payment methods are accepted?",
            answer:
                "We support debit cards, credit cards, UPI, wallets, and net banking.",
          ),
        ],
      ),

      HelpCenter(
        categoryId: 3,
        categoryName: "Course & Technical Issues",
        questions: [
          Question(
            questionId: 5,
            question: "The video is not playing. What should I do?",
            answer:
                "Please check your internet connection and restart the application.",
          ),
          Question(
            questionId: 6,
            question: "Where can I find my course resources?",
            answer:
                "Course resources are available inside the course details page.",
          ),
        ],
      ),
    ];

    notifyListeners();
  }

  void showHideQuestionAnswerPro(int indexindexCategory, int indexQuestion) {
    _showHideQuestionANdAnswer = !_showHideQuestionANdAnswer;
    notifyListeners();
  }
}
