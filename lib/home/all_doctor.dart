import 'package:doctor_appointment/home/doctor_detail.dart';
import 'package:flutter/material.dart';

class AllDoctor extends StatefulWidget {
  const AllDoctor({super.key});

  @override
  State<AllDoctor> createState() => _AllDoctorState();
}

class _AllDoctorState extends State<AllDoctor> {
  final List<Map<String, dynamic>> _allUsers = [
    {
      "id": 1,
      "image": "assets/png/img onboard.png",
      "name": "Dr. David Patel",
      "text1": "Cardiologist",
      "text2": "Cardiology Center, USA",
      "text3": "1,872 Reviews",
      "text4": "5",
      "icon": Icon(
        Icons.star,
        color: Colors.yellow,
      ),
    },
    {
      "id": 2,
      "image": "assets/png/img onboard2.png",
      "name": "Dr. Jessica Turner",
      "text1": "Gynecologist",
      "text2": "Women's Clinic, Seatle, USA",
      "text3": "127 Review",
      "text4": "4.9",
      "icon": Icon(
        Icons.star,
        color: Colors.yellow,
      ),
    },
    {
      "id": 3,
      "image": "assets/png/img onboard3.png",
      "name": "Dr. Michael Johnson",
      "text1": "Orthopedic Surgery",
      "text2": "Maple Associates, NY,USA",
      "text3": "5,233 Reviews",
      "text4": "4.7",
      "icon": Icon(
        Icons.star_half,
        color: Colors.yellow,
      ),
    },
    {
      "id": 4,
      "image": "assets/png/img onboard2.png",
      "name": "Dr. Emily Walker",
      "text1": "Pediatrics",
      "text2": "Serenity Pediatrics Clinic",
      "text3": "15,777 Reviews",
      "text4": "5",
      "icon": Icon(
        Icons.star_half,
        color: Colors.yellow,
      ),
    },
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "All Doctor",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                  hintText: "search doctor..",
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.all(12),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "All",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "General",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "Cardiologist",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "Dentist",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "532 founds",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                Text(
                  "Default",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Icon(
                  Icons.unfold_less_double_outlined,
                  color: Colors.grey.shade600,
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DoctorDetail(
                                    image: _foundUsers[index]['image'],
                                    text: _foundUsers[index]['name'],
                                    text1: _foundUsers[index]['text1'],
                                    text2: _foundUsers[index]['text2'],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(14),
                                      child: Image.asset(
                                        _foundUsers[index]['image'],
                                        height: 140,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                _foundUsers[index]['name'],
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              Spacer(),
                                              Icon(
                                                Icons.favorite_border,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Divider(
                                            thickness: 1,
                                            color: Colors.grey.shade600,
                                            indent: 10,
                                            endIndent: 10,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            _foundUsers[index]['text1'],
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey.shade600,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.location_on_outlined,
                                                color: Colors.grey.shade600,
                                              ),
                                              Text(
                                                _foundUsers[index]['text2'],
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey.shade600,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              _foundUsers[index]['icon'],
                                              Text(
                                                _foundUsers[index]['text4'],
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey.shade600,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                '${_foundUsers[index]["text3"]}',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey.shade600,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : const Text(
                      'No results found ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
