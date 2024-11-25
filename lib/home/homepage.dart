import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'all_doctor.dart';
import 'notification.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List imageList = [
    {"image_path": 'assets/png/imd doctor.jpeg'},
    {"image_path": 'assets/png/imd doctor.jpeg'},
    {"image_path": 'assets/png/imd doctor.jpeg'}
  ];

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Location",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey.shade600,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: const Color.fromARGB(255, 8, 48, 81),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Sealtte USA",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: const Color.fromARGB(255, 8, 48, 81),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Notifications(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey.shade200,
                        child: Icon(
                          Icons.notification_important,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "search doctor..",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.all(12),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        print(currentIndex);
                      },
                      child: CarouselSlider(
                        items: imageList
                            .map(
                              (item) => ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Image.asset(
                                  item['image_path'],
                                  height: 120,
                                  width: 370,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                            .toList(),
                        carouselController: carouselController,
                        options: CarouselOptions(
                          scrollPhysics: const BouncingScrollPhysics(),
                          // autoPlay: true,
                          aspectRatio: 2,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 05,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imageList.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () =>
                                carouselController.animateToPage(entry.key),
                            child: Container(
                              width: currentIndex == entry.key ? 22 : 7,
                              height: 7.0,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 3.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: currentIndex == entry.key
                                    ? Colors.white
                                    : Colors.grey,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AllDoctor(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: categor.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisExtent: 120,
                  ),
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 65,
                          width: 80,
                          decoration: BoxDecoration(
                            color: categor[index].color,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  categor[index].image,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          categor[index].text,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    );
                  }),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nearby Medical Centers",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      2,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 310,
                          width: 260,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 140,
                                width: 260,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      "https://img.freepik.com/premium-photo/interior-hospital-consulting-room-with-medical-eye-test-chart-wheelchair-service-office-ophthalmologic-clinic-visual-examination-equipment-devices-treatment-vision_35148-258.jpg",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundColor:
                                            Colors.black.withOpacity(0.4),
                                        child: Icon(
                                          Icons.favorite_border,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Sunrise Health Clinic",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          color: Colors.grey.shade600,
                                        ),
                                        Text(
                                          "123 Oak Street, CA 98765",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "5.0",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        Text(
                                          "(58 Reviews)",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color: Colors.grey.shade600,
                                      indent: 10,
                                      endIndent: 10,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.roundabout_left_outlined,
                                          color: Colors.grey.shade600,
                                        ),
                                        Text(
                                          "2.5 Km/40min",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.local_hospital_outlined,
                                          color: Colors.grey.shade600,
                                        ),
                                        Text(
                                          "Hospital",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Categories {
  final String image;
  final String text;
  final Color color;
  Categories({
    required this.image,
    required this.text,
    required this.color,
  });
}

List<Categories> categor = [
  Categories(
    image: "assets/png/img cate1.png",
    text: "Dentistry",
    color: const Color.fromARGB(255, 252, 187, 209),
  ),
  Categories(
      image: "assets/png/img cate2.png",
      text: "Cardiolo..",
      color: const Color.fromARGB(255, 169, 251, 171)),
  Categories(
    image: "assets/png/img cate3.png",
    text: "Pulmono..",
    color: const Color.fromARGB(255, 255, 208, 138),
  ),
  Categories(
    image: "assets/png/img cate4.png",
    text: "General",
    color: const Color.fromARGB(255, 213, 134, 227),
  ),
  Categories(
      image: "assets/png/img cate5.png",
      text: "Neurology",
      color: const Color.fromARGB(255, 80, 153, 83)),
  Categories(
      image: "assets/png/img cate6.png",
      text: "Gastroen..",
      color: const Color.fromARGB(255, 102, 17, 117)),
  Categories(
      image: "assets/png/img cate7.png",
      text: "Laborato..",
      color: const Color.fromARGB(255, 240, 176, 198)),
  Categories(
    image: "assets/png/img cate8.png",
    text: "Vaccinat..",
    color: const Color.fromARGB(255, 111, 185, 246),
  ),
];
