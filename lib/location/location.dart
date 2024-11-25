import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage(
                "assets/png/img map.png",
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Container(
                width: 380,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search Doctor Hospital",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.all(12),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 60),
              child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  "assets/png/img location.png",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  "assets/png/img location.png",
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 60),
              child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  "assets/png/img location.png",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  "assets/png/img location.png",
                ),
              ),
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
    );
  }
}
