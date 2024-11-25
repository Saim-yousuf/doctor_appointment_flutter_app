import 'package:flutter/material.dart';

class MyBooking extends StatefulWidget {
  const MyBooking({super.key});

  @override
  State<MyBooking> createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Center(
                child: Text(
                  "My Booking",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TabBar(
                labelColor: const Color.fromARGB(255, 8, 48, 81),
                indicatorColor: const Color.fromARGB(255, 8, 48, 81),
                unselectedLabelColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.label,
                controller: tabController,
                tabs: [
                  Tab(
                    text: "Upcoming",
                  ),
                  Tab(
                    text: "Completed",
                  ),
                  Tab(
                    text: "Canceled",
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    //1st tab
                    ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: book.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 1,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      book[index].text,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: const Color.fromARGB(
                                            255, 8, 48, 81),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(14),
                                        child: Image.asset(
                                          book[index].image,
                                          height: 100,
                                          width: 120,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            book[index].title,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            book[index].address,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey.shade600,
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
                                                book[index].address,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey.shade600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius:
                                              BorderRadius.circular(22),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 8, 48, 81),
                                          borderRadius:
                                              BorderRadius.circular(22),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(
                                              "Reschedule",
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    //2nd tab
                    ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: book.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 1,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      book[index].text,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: const Color.fromARGB(
                                            255, 8, 48, 81),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(14),
                                        child: Image.asset(
                                          book[index].image,
                                          height: 100,
                                          width: 120,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            book[index].title,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            book[index].address,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey.shade600,
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
                                                book[index].address,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey.shade600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius:
                                              BorderRadius.circular(22),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(
                                              "Re-Book",
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 8, 48, 81),
                                          borderRadius:
                                              BorderRadius.circular(22),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(
                                              "Add a Review",
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    //3rd tab
                    ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: book.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 1,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      book[index].text,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: const Color.fromARGB(
                                            255, 8, 48, 81),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(14),
                                        child: Image.asset(
                                          book[index].image,
                                          height: 100,
                                          width: 120,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            book[index].title,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            book[index].address,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey.shade600,
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
                                                book[index].address,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey.shade600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Book {
  final String image;
  final String text;
  final String title;
  final String des;
  final String address;
  Book({
    required this.image,
    required this.text,
    required this.title,
    required this.des,
    required this.address,
  });
}

List<Book> book = [
  Book(
    image: "assets/png/img onboard2.png",
    text: "May 22, 2023 - 10:00 AM",
    title: "Dr. James Robinson",
    des: "Orthopedic Surgery",
    address: "Elite Ortho Clinic, USA",
  ),
  Book(
    image: "assets/png/img onboard2.png",
    text: "June 14, 2023 - 15:00 PM",
    title: "Dr. Daniel Lee",
    des: "Gastroenterologist",
    address: "Digestive Institute, USA",
  ),
  Book(
    image: "assets/png/img onboard2.png",
    text: "June 21, 2023 - 10:00 AM",
    title: "Dr. William Robinson",
    des: "Cardiologist",
    address: "Elite Cardio Clinic, USA",
  ),
];
