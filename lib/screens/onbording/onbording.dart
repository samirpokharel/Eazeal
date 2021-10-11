class Onbording {
  final String title;
  final String summary;
  final String imagePath;

  const Onbording({
    required this.title,
    required this.summary,
    required String image,
  }) : imagePath = "assets/images/onbording-$image.svg";
}

const List<Onbording> onbordings = [
  Onbording(
    title: "Deliver on time",
    summary: "we offers the fast and on time delvery service to our customer",
    image: "delevery",
  ),
  Onbording(
    title: "Cash on delevery",
    summary: "we offers the fast and on time delvery service to our customer",
    image: "cash-on-delevery",
  ),
  Onbording(
    title: "variety of product",
    summary: "we offers the fast and on time delvery service to our customer",
    image: "variety-of-products",
  )
];
