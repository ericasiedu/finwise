class OnBoardingData {
  final String title;
  final String image;

  const OnBoardingData({required this.title, required this.image});
}

List<OnBoardingData> item = [
  OnBoardingData(
    title: 'Welcome to Expense Manager',
    image: 'assets/images/slide-1.png',
  ),
  OnBoardingData(
    title: 'Are you ready to take control of your finances?',
    image: 'assets/images/slide-2.png',
  ),
];
