class Slider {
  String image;
  String title;
  String description;

  Slider({required this.image, required this.title, required this.description});
}

List<Slider> contents = [
  Slider(
    image: 'assets/images/slider_1.png',
    title: 'Find Your Perfect Destination',
    description: 'All tourist destinations are in your hands, just click and find the convenience in your phone',
  ),
  Slider(
    image: 'assets/images/slider_2.png',
    title: 'Start Your Journey',
    description: 'You will find an amazing and diverse journey through the grip and click',
  ),
  Slider(
    image: 'assets/images/slider_3.png',
    title: 'Explore The Beauty of Indonesia',
    description: 'Explore different places in Indonesia and find many suprises always by your side',
  ),
];
