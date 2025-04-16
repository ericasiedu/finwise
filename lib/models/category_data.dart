class CategoryData {
  final String title;
  final String image;
  const CategoryData({required this.title, required this.image});
}

class Category {
  final String title;
  final String time;
  final String amount;

  const Category({
    required this.title,
    required this.time,
    required this.amount,
  });
}

List<CategoryData> categoryItems = [
  CategoryData(title: 'Food', image: 'assets/images/category-food.png'),
  CategoryData(
    title: 'Transport',
    image: 'assets/images/category-transport.png',
  ),
  CategoryData(
    title: 'Medicine',
    image: 'assets/images/category-medicines.png',
  ),
  CategoryData(
    title: 'Groceries',
    image: 'assets/images/category-groceries.png',
  ),
  CategoryData(title: 'Rent', image: 'assets/images/category-rents.png'),
  CategoryData(title: 'Gifts', image: 'assets/images/category-gifts.png'),
  CategoryData(title: 'Savings', image: 'assets/images/category-savings.png'),
  CategoryData(
    title: 'Entertainment',
    image: 'assets/images/category-entertainment.png',
  ),
  CategoryData(title: 'More', image: 'assets/images/category-more.png'),
];

List<Category> foodItems = [
  Category(title: 'Dinner', time: '18:27 - April 20', amount: '-25.00'),
  Category(title: 'Delivery Pizza', time: '18:27 - April 20', amount: '-25.00'),
  Category(title: 'Lunch', time: '18:27 - April 20', amount: '-25.00'),
  Category(title: 'Brunch', time: '18:27 - April 20', amount: '-25.00'),
];

List<Category> transportItems = [
  Category(title: 'Fuel', time: '18:27 - April 20', amount: '-25.00'),
  Category(title: 'car parts', time: '18:27 - April 20', amount: '-25.00'),
  Category(title: 'New tires', time: '18:27 - April 20', amount: '-25.00'),
  Category(
    title: 'Public Transport',
    time: '18:27 - April 20',
    amount: '-25.00',
  ),
  Category(title: 'car wash', time: '18:27 - April 20', amount: '-25.00',),
];

List<Category> medicineItems = [
  Category(title: 'Acetaminophen', time: '18:27 - April 20', amount: '-25.00'),
  Category(title: 'Vitamin C', time: '18:27 - April 20', amount: '-25.00'),
  Category(title: 'Muscle pain cream', time: '18:27 - April 20', amount: '-25.00'),
  Category(title: 'Aspirin', time: '18:27 - April 20', amount: '-25.00',),
];

List<Category> groceryItems = [
  Category(title: 'Pantry', time: '18:27 - April 20', amount: '-25.00'),
  Category(title: 'Snacks', time: '18:27 - April 20', amount: '-25.00'),
  Category(title: 'Canned Food', time: '18:27 - April 20', amount: '-25.00'),
  Category(title: 'Veggies', time: '18:27 - April 20', amount: '-25.00',),
];

List<Category> rentItems = [
  Category(title: 'Rent', time: '18:27 - April 20', amount: '-25.00'),
  Category(title: 'Rent', time: '18:27 - April 20', amount: '-25.00'),
];

List<Category> giftItems = [
  Category(title: 'Perfume', time: '18:27 - April 20', amount: '-25.00'),
  Category(title: 'Make-up', time: '18:27 - April 20', amount: '-25.00'),
  Category(title: 'teddy Bear', time: '18:27 - April 20', amount: '-25.00'),
  Category(title: 'Cooking lessons', time: '18:27 - April 20', amount: '-25.00',),
  Category(title: 'toys for Dani', time: '18:27 - April 20', amount: '-25.00',),
];

List<Category> entertainmentItems = [
  Category(title: 'Cinema', time: '18:27 - April 20', amount: '-25.00'),
  Category(title: 'Netflix', time: '18:27 - April 20', amount: '-25.00'),
  Category(title: 'Karaoke', time: '18:27 - April 20', amount: '-25.00'),
  Category(title: 'Video Game', time: '18:27 - April 20', amount: '-25.00',),
];

List<CategoryData> savingsItems = [
  CategoryData(
    title: 'Travel',
    image: 'assets/images/travel.png',
  ),
  CategoryData(
    title: 'New House',
    image: 'assets/images/house.png',
  ),
  CategoryData(
    title: 'Car',
    image: 'assets/images/car-2.png',
  ),
  CategoryData(title: 'Wedding', image: 'assets/images/wedding.png'),
];



List<Category> travelItems = [
  Category(title: 'Travel Deposit', time: '18:27 - April 20', amount: '-25.00'),
  Category(title: 'Travel Deposit', time: '18:27 - April 20', amount: '-205.00'),
];

List<Category> houseItems = [
  Category(title: 'House Deposit', time: '18:27 - April 20', amount: '-25.00'),
  Category(title: 'House Deposit', time: '18:27 - April 20', amount: '-205.00'),
];

List<Category> carItems = [
  Category(title: 'Car Deposit', time: '18:27 - April 20', amount: '-25.00'),
  Category(title: 'Car Deposit', time: '18:27 - April 20', amount: '-205.00'),
];

List<Category> weddingItems = [
  Category(title: 'Wedding Deposit', time: '18:27 - April 20', amount: '-25.00'),
  Category(title: 'Wedding Deposit', time: '18:27 - April 20', amount: '-205.00'),
];
