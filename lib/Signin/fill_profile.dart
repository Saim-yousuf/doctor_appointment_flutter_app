import 'dart:io';

import 'package:doctor_appointment/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class FillProfile extends StatefulWidget {
  const FillProfile({super.key});

  @override
  State<FillProfile> createState() => _FillProfileState();
}

class _FillProfileState extends State<FillProfile> {
  List<String> categoryitemss = ['Recent', 'Album'];
  String? selectedItemcategorys = 'Recent';
  File? image;
  Future galleryImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final pickImagefromgallery = File(image.path);
      setState(() => this.image = pickImagefromgallery);
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to pick image:$e');
    }
  }

  TextEditingController datecontroller = TextEditingController();
  List<String> categoryitems = ['Male', 'Female'];
  String? selectedItemcategory = 'Male';
  @override
  void initState() {
    super.initState();
    datecontroller = datecontroller;
  }

  final TextEditingController _dobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          "Fill Your Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  image != null
                      ? CircleAvatar(
                          radius: 80,
                          backgroundImage: FileImage(
                            image!,
                          ),
                        )
                      : CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.grey,
                          
                        ),
                  Positioned(
                    right: 20,
                    bottom: 0,
                    child: InkWell(
                      onTap: () {
                        galleryImage();
                      },
                      child: Container(
                        height: 30,
                        width: 35,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 8, 48, 81),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Michael Jordan",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Nickname",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "name@example.com",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextFormField(
                  autofocus: false,
                  controller: _dobController,
                  keyboardType: TextInputType.none,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: "Select Date",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(8),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    isDense: true,
                    labelText: "Date",
                  ),
                  onTap: () async {
                    DateTime? pickeddate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (pickeddate != null) {
                      setState(() {
                        _dobController.text =
                            DateFormat('yyyy-MM-dd').format(pickeddate);
                      });
                    }
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey),
                ),
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: "Select Gender",
                      isDense: true,
                      alignLabelWithHint: true,
                      contentPadding: EdgeInsets.all(8)),
                  value: selectedItemcategory,
                  items: categoryitems
                      .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          )))
                      .toList(),
                  onChanged: (item) =>
                      setState(() => selectedItemcategory != item),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BottomNavBar(),
                                      ),
                                    );
                                  },
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundColor: const Color.fromARGB(
                                        255, 149, 199, 240),
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ),
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
                                  "Your account is ready to use .you \nwill redirected to the Home Page \nin a few second...",
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                CircularProgressIndicator(
                                  color: const Color.fromARGB(255, 8, 48, 81),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 8, 48, 81),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      )
                    ],
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
