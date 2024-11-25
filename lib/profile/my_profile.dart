import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
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
                            backgroundImage: AssetImage(
                              "assets/png/img onboard3.png",
                            ),
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
                  height: 10,
                ),
                Text(
                  "Daniel Martinez",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "+123 89456321",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: List.generate(
                    profile.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              profile[index].icon,
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                profile[index].title,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey.shade600,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            enableDrag: true,
                            isScrollControlled: false,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(14),
                              topRight: Radius.circular(14),
                            )),
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  height: 150,
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Text(
                                          "Logout",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
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
                                      Text(
                                        "Are you sure you want to Logout",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey.shade500,
                                        ),
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
                                            width: 180,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade300,
                                              borderRadius:
                                                  BorderRadius.circular(22),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Center(
                                                child: Text(
                                                  "Canel",
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              height: 50,
                                              width: 180,
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 8, 48, 81),
                                                borderRadius:
                                                    BorderRadius.circular(22),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Center(
                                                  child: Text(
                                                    "Yes, Logout",
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
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
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Logout",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey.shade600,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Profile {
  final Icon icon;
  final String title;
  Profile({
    required this.icon,
    required this.title,
  });
}

List<Profile> profile = [
  Profile(
    icon: Icon(
      Icons.person_add,
      color: Colors.black.withOpacity(0.8),
    ),
    title: "Edit Profile",
  ),
  Profile(
    icon: Icon(
      Icons.favorite,
      color: Colors.black.withOpacity(0.8),
    ),
    title: "Favorite",
  ),
  Profile(
    icon: Icon(
      Icons.notifications_none,
      color: Colors.black.withOpacity(0.8),
    ),
    title: "Notifications",
  ),
  Profile(
    icon: Icon(
      Icons.settings,
      color: Colors.black.withOpacity(0.8),
    ),
    title: "Settings",
  ),
  Profile(
    icon: Icon(
      Icons.help_outline_sharp,
      color: Colors.black.withOpacity(0.8),
    ),
    title: "Help & Support",
  ),
  Profile(
    icon: Icon(
      Icons.shield_sharp,
      color: Colors.black.withOpacity(0.8),
    ),
    title: "Terms & Conditions",
  ),
];
