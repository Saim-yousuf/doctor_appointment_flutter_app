import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  Text(
                    "Notifications",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "1 new",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TODAY",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Text(
                    "Mark all as read",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: List.generate(
                  noti.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: noti[index].color,
                          child: Icon(
                            Icons.calendar_month_outlined,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    noti[index].title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    noti[index].text,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade600,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                noti[index].titles,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Notifica {
  final String title;
  final String titles;
  final String text;
  final Color color;
  Notifica({
    required this.title,
    required this.titles,
    required this.text,
    required this.color,
  });
}

List<Notifica> noti = [
  Notifica(
    title: "Appointment Success",
    titles:
        "You have successfully booked your \nappointment with Dr. Emily Walker.",
    text: "1h",
    color: const Color.fromARGB(255, 164, 254, 167),
  ),
  Notifica(
    title: "Appointment Cancelled",
    titles:
        "You have successfully cancelled your \nappointment with Dr. David Patel.",
    text: "2h",
    color: const Color.fromARGB(255, 248, 169, 164),
  ),
  Notifica(
    title: "Scheduled Changed",
    titles:
        "You have successfully changed your \nappointment with Dr. Jessica Turner.",
    text: "3h",
    color: const Color.fromARGB(255, 234, 169, 246),
  ),
];
