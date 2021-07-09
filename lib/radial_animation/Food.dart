import 'dart:ui';

class Food {
  final int id;
  final String title;
  final double rating;
  final String note;
  final String image;
  final Color color;

  Food(
      {this.id,
        this.title,
        this.rating,
        this.note,
        this.image,
        this.color});

  String get asset => 'assets/images/$image.jpeg';
  bool get isDark => color.computeLuminance() < 0.6;
}

final List<Food> foods = [
  Food(
      id: 1,
      title: 'Burger',
      rating: 3.2,
      note: 'A veggie burger is a burger patty that does not contain meat. These burgers may be made from ingredients like beans, especially soybeans and tofu, nuts, grains, seeds or fungi such as mushrooms or mycoprotein.',
      image: 'burger',
      color: Color.fromRGBO(234, 188, 48, 1.0)),
  Food(
      id: 2,
      title: 'Garlic Bread',
      rating: 3.8,
      note: 'Garlic bread is a classic accompaniment to almost any kind of soup or stew. Its commonly paired with tomato-based soups, but is equally appropriate served alongside bean, vegetable, chicken, beef and seafood soups or stews. Top a simple, chunky stew of roasted vegetables with hunks of garlic bread.',
      image: 'garlicbread',
      color: Color.fromRGBO(237, 142, 47, 1.0)),
  Food(
      id: 3,
      title: 'HotDog',
      rating: 3.8,
      note: 'A vegetarian hot dog is a hot dog produced completely from non-meat products. Unlike traditional home-made meat sausages, the casing is not made of intestine, but of cellulose or other plant based ingredients. The filling is usually based on some sort of soy protein, wheat gluten, or pea protein.',
      image: 'hotdog',
      color: Color.fromRGBO(200, 76, 42, 1.0)),
  Food(
      id: 4,
      title: 'Noodles',
      rating: 3.8,
      note: 'Hakka noodles are thin, flat noodles made from unleavened dough made with rice or wheat flour. To cook these noodles, you have to simply toss them in boiling water, cook al-dente, drain out the water and then toss them with your favorite veggies and sauces.',
      image: 'noodles',
      color: Color.fromRGBO(155, 77, 42, 1.0)),
  Food(
      id: 5,
      title: 'Pasta',
      rating: 3.8,
      note: 'The ingredients to make dried pasta usually include water and semolina flour; egg for colour and richness (in some types of pasta), and possibly vegetable juice (such as spinach, beet, tomato, carrot), herbs or spices for colour and flavour.',
      image: 'pasta',
      color: Color.fromRGBO(54, 80, 143, 1.0)),
  Food(
      id: 6,
      title: 'Pizza',
      rating: 3.8,
      note: 'Fresh Dough. Unbleached enriched wheat flour, water, sugar, soybean oil, salt, yeast. ...Cheese. Part-skim mozzarella cheese (pasteurized milk, cultures, salt, enzymes), modified food starch, sugarcane fiber, whey protein concentrate, sodium citrate. ...Pizza Sauce. ...',
      image: 'pizza',
      color: Color.fromRGBO(130, 61, 99, 1.0)),
  Food(
      id: 7,
      title: 'Puffs',
      rating: 3.8,
      note: 'a popular snack, very similar to pie is prepared from puff pastry sheets. in other words, the puffs are prepared from special sheets known as puff pastry sheets which is a layered sheet and sandwiched with butter or dalda.',
      image: 'puffs',
      color: Color.fromRGBO(88, 90, 59, 1.0)),
  Food(
      id: 8,
      title: 'Sandwich',
      rating: 3.8,
      note: 'Spread Out. Sandwich spreads add flavor but also perform the essential task of lending moisture and sometimes creaminess to sandwiches. ...Use the Right Bread. Choose bread appropriate to the sandwich you are making. ...Choose To-Go Toppings. ...Take the Edge Off Onions.',
      image: 'sandwich',
      color: Color.fromRGBO(121, 118, 114, 1.0)),
  Food(
      id: 9,
      title: 'Sub',
      rating: 3.8,
      note: 'Sauteed bell peppers, sauteed mushrooms, sauteed and raw onions, lettuce, tomato, mayo, deli mustard, Italian dressing, provolone, cheddar, and Monterey Jack.',
      image: 'sub',
      color: Color.fromRGBO(136, 91, 61, 1.0)),
  Food(
      id: 10,
      title: 'Tacos',
      rating: 3.8,
      note: 'If you want to keep it classic, the best taco toppings are cheese, pico de gallo, lettuce, tomatoes, and sour cream. But you can also add in onions, jalepenos, green chiles, beans, and more!',
      image: 'takos',
      color: Color.fromRGBO(167, 163, 156, 1.0)),
];