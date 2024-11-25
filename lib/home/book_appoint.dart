import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class BookAppoint extends StatefulWidget {
  const BookAppoint({super.key});

  @override
  State<BookAppoint> createState() => _BookAppointState();
}

class _BookAppointState extends State<BookAppoint> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
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
          "Book Appointment",
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Date",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: TableCalendar(
                  locale: "en_US",
                  rowHeight: 43,
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) => isSameDay(day, today),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                  focusedDay: today,
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  onDaySelected: _onDaySelected,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Select Hour",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GridView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: time.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 50,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: time[index].color,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          time[index].title,
                          style: TextStyle(
                            fontSize: 17,
                            color: time[index].textcolor,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor:
                                    const Color.fromARGB(255, 149, 199, 240),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Congratulations!",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Your appointment with Dr. David Patel \nis confirmed for june 30, 2023, at  \n10:00 AM",
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 40,
                                width: 210,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: const Color.fromARGB(255, 8, 48, 81),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Done",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Edit your appointment",
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 17,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: const Color.fromARGB(255, 8, 48, 81),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Confirm",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimeSelect {
  final String title;
  final Color color;
  final Color textcolor;
  TimeSelect({
    required this.title,
    required this.color,
    required this.textcolor,
  });
}

List<TimeSelect> time = [
  TimeSelect(
    title: "09:00 AM",
    color: Colors.grey.shade200,
    textcolor: Colors.grey.shade600,
  ),
  TimeSelect(
    title: "09:30 AM",
    color: Colors.grey.shade200,
    textcolor: Colors.grey.shade600,
  ),
  TimeSelect(
    title: "10:00 AM",
    color: const Color.fromARGB(255, 8, 48, 81),
    textcolor: Colors.white,
  ),
  TimeSelect(
    title: "10:30 AM",
    color: Colors.grey.shade200,
    textcolor: Colors.grey.shade600,
  ),
  TimeSelect(
    title: "11:00 AM",
    color: Colors.grey.shade200,
    textcolor: Colors.grey.shade600,
  ),
  TimeSelect(
    title: "11:30 AM",
    color: Colors.grey.shade200,
    textcolor: Colors.grey.shade600,
  ),
  TimeSelect(
    title: "12:00 PM",
    color: Colors.grey.shade200,
    textcolor: Colors.grey.shade600,
  ),
  TimeSelect(
    title: "12:30 PM",
    color: Colors.grey.shade200,
    textcolor: Colors.grey.shade600,
  ),
  TimeSelect(
    title: "01:00 PM",
    color: Colors.grey.shade200,
    textcolor: Colors.grey.shade600,
  ),
  TimeSelect(
    title: "01:30 PM",
    color: Colors.grey.shade200,
    textcolor: Colors.grey.shade600,
  ),
  TimeSelect(
    title: "02:00 PM",
    color: Colors.grey.shade200,
    textcolor: Colors.grey.shade600,
  ),
  TimeSelect(
    title: "02:30 AM",
    color: Colors.grey.shade200,
    textcolor: Colors.grey.shade600,
  ),
];
