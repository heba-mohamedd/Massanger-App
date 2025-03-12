import 'package:flutter/material.dart';
import 'package:messenger_app/message_item_widget.dart';
import 'package:messenger_app/models/product_model.dart';
import 'package:messenger_app/story_item_widget.dart';

import 'dio/api_provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class User {
  String name;
  String lastMessage;
  String time;
  String image;

  User({
    required this.name,
    required this.image,
    required this.lastMessage,
    required this.time,

  });
}

class UserState {
  String name;
  String image;
  UserState({required this.name, required this.image});
}

class _HomepageState extends State<Homepage> {
  @override
  List<UserState> states = [
    UserState(
      name: "Heba Mohamed",
      image: "https://th.bing.com/th/id/OIP.JGAaVjQIHZVtlxeZdYjZ-gAAAA?pid=ImgDet&w=277&h=237&rs=1",

    ),
    UserState(
      name: "Ahmed Salah",
      image: "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/a6971270048085.5b968a1a1bb21.jpg",

    ),
    UserState(
      name: "Mona Hassan",
      image: "https://th.bing.com/th/id/OIP.VEVEMalwhr3BPwzpPpVtjgHaHa?w=1200&h=1200&rs=1&pid=ImgDetMain",
    ),
    UserState(
      name: "Omar Khaled",
      image: "https://www.creativeboom.com/uploads/articles/ea/ea27ec01e6603fe987e1cc4d40b3c326c5bde74c_810.jpg",
    ),
    UserState(
      name: "Sara Ali",
      image: "https://th.bing.com/th/id/R.fbfb9f15f4cab25264e51d3912f69b1d?rik=O83ol7vxuFN76g&pid=ImgRaw&r=0&sres=1&sresct=1",
    ),
    UserState(
      name: "Youssef Gamal",
      image: "https://yt3.ggpht.com/ytc/AKedOLTjkVSvAx0Ykycq4TDRidlTwVyVaZ6Ij-7mNMjR=s900-c-k-c0x00ffffff-no-rj",

    ),
    UserState(
      name: "Nour Amr",
      image: "https://i.redd.it/jeuusd992wd41.jpg",

    ),
    UserState(
      name: "Tamer Said",
      image: "https://th.bing.com/th/id/OIP.BUKBU3OEkRGQRWJrUS4P3QHaHa?rs=1&pid=ImgDetMain",

    ),
    UserState(
      name: "Laila Hassan",
      image: "https://th.bing.com/th/id/OIP.6uGlJuQmBH3-C-cDarMr8gHaHa?w=960&h=960&rs=1&pid=ImgDetMain",

    ),
    UserState(
      name: "Khaled Nabil",
      image: "https://th.bing.com/th/id/R.6149d8b9b80d8db1801a87bbd152865e?rik=j5FzJKcg7QGrHA&riu=http%3a%2f%2fwww.dumpaday.com%2fwp-content%2fuploads%2f2017%2f01%2frandom-pictures-109.jpg&ehk=HfmMsSc0H%2f3ldEQNZhnaDTN2LVFZyRuKDHzGd8JXHpw%3d&risl=&pid=ImgRaw&r=0",

    ),
  ];
  List<User> users = [
    User(
      name: "Heba Mohamed",
      image: "https://th.bing.com/th/id/OIP.JGAaVjQIHZVtlxeZdYjZ-gAAAA?pid=ImgDet&w=277&h=237&rs=1",
      lastMessage:
          "Hello my name is Heba Mohamed, I'm a flutter developer, and I'm currently learning flutter.",
      time: "11:51 PM",

    ),
    User(
      name: "Ahmed Salah",
      image: "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/a6971270048085.5b968a1a1bb21.jpg",
      lastMessage:
          "Hi, I'm Ahmed Salah, a backend developer specializing in Node.js and Express.",
      time: "10:30 AM",

    ),
    User(
      name: "Mona Hassan",
      image: "https://th.bing.com/th/id/OIP.VEVEMalwhr3BPwzpPpVtjgHaHa?w=1200&h=1200&rs=1&pid=ImgDetMain",
      lastMessage:
          "Hello! I'm Mona Hassan, a UI/UX designer passionate about creating intuitive user experiences.",
      time: "03:15 PM",

    ),
    User(
      name: "Omar Khaled",
      image: "https://www.creativeboom.com/uploads/articles/ea/ea27ec01e6603fe987e1cc4d40b3c326c5bde74c_810.jpg",
      lastMessage:
          "Hey, I'm Omar Khaled, a full-stack developer working with React and Django.",
      time: "07:45 PM",

    ),
    User(
      name: "Sara Ali",
      image: "https://th.bing.com/th/id/R.fbfb9f15f4cab25264e51d3912f69b1d?rik=O83ol7vxuFN76g&pid=ImgRaw&r=0&sres=1&sresct=1",
      lastMessage:
          "Hi there, I'm Sara Ali, a data analyst with experience in Python and Power BI.",
      time: "09:20 AM",

    ),
    User(
      name: "Youssef Gamal",
      image: "https://yt3.ggpht.com/ytc/AKedOLTjkVSvAx0Ykycq4TDRidlTwVyVaZ6Ij-7mNMjR=s900-c-k-c0x00ffffff-no-rj",
      lastMessage:
          "Hello! I'm Youssef Gamal, a mobile app developer focusing on Swift and Kotlin.",
      time: "06:10 PM",

    ),
    User(
      name: "Nour Amr",
      image: "https://i.redd.it/jeuusd992wd41.jpg",
      lastMessage:
          "Hey, I'm Nour Amr, a cybersecurity enthusiast learning ethical hacking.",
      time: "01:45 PM",

    ),
    User(
      name: "Tamer Said",
      image: "https://th.bing.com/th/id/OIP.BUKBU3OEkRGQRWJrUS4P3QHaHa?rs=1&pid=ImgDetMain",
      lastMessage:
          "Hi, I'm Tamer Said, a DevOps engineer specializing in cloud solutions.",
      time: "08:05 AM",

    ),
    User(
      name: "Laila Hassan",
      image: "https://th.bing.com/th/id/OIP.6uGlJuQmBH3-C-cDarMr8gHaHa?w=960&h=960&rs=1&pid=ImgDetMain",
      lastMessage:
          "Hello, I'm Laila Hassan, a game developer working with Unity and C#.",
      time: "05:30 PM",

    ),
    User(
      name: "Khaled Nabil",
      image: "https://th.bing.com/th/id/R.6149d8b9b80d8db1801a87bbd152865e?rik=j5FzJKcg7QGrHA&riu=http%3a%2f%2fwww.dumpaday.com%2fwp-content%2fuploads%2f2017%2f01%2frandom-pictures-109.jpg&ehk=HfmMsSc0H%2f3ldEQNZhnaDTN2LVFZyRuKDHzGd8JXHpw%3d&risl=&pid=ImgRaw&r=0",
      lastMessage:
          "Hey there, I'm Khaled Nabil, a machine learning engineer focused on AI models.",
      time: "02:55 PM",

    ),
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff367849),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Icon(Icons.person_2, size: 30, color: Color(0xff367849)),
            ),
            SizedBox(width: 10),
            Text(
              "Messenger",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 20),
            onPressed: () {},
            icon: Icon(Icons.edit_calendar, color: Colors.white, size: 30),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xff367849),
                      child: Icon(Icons.search, color: Colors.white, size: 20),
                    ),
                  ),
                  hintText: 'Search',
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  itemBuilder: (context, index) => StoryItemWidget(
                    name: states[index].name,
                    image: states[index].image,
                  ),
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(height: 10),
              ListView.separated(
                itemBuilder:
                    (context, index) => new MessageItemWidget(
                      name: users[index].name,
                      image: users[index].image,
                      lastMessage: users[index].lastMessage,
                      time: users[index].time,

                    ),
                separatorBuilder:
                    (context, index) => SizedBox(
                      height: 10,
                    ), // Adjust the spacing between items
                itemCount: users.length, // Adjust the number of items as needed
                shrinkWrap: true, // To make the ListView scrollable
                physics:
                    NeverScrollableScrollPhysics(), // To prevent the ListView from scrolling
              ),
            ],
          ),
        ),
      ),
    );
  }
}
