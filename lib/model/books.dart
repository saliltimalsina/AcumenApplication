class Books {
  int id;
  String title;
  String subtitle;
  String price;
  String imageUrl;
  List<String> detailUrl;

  Books(this.id, this.title, this.subtitle, this.price, this.imageUrl,
      this.detailUrl);

  static List<Books> generateBooks() {
    return [
      Books(1, "Sherlock Holmes", "", "\$69", 'assets/images/arrival.jpg',
          ['assets/images/arrival1.jpg', 'assets/images/arrival.jpg']),
      Books(2, "Don Quixote", "", "\$39.99", 'assets/images/arrival2.jpg',
          ['assets/images/arrival2.jpg', 'assets/images/detail3.jpg'])
    ];
  }
}
