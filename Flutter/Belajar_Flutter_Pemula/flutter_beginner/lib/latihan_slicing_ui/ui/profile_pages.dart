import 'package:flutter/material.dart';

import '../widgets/info_item.dart';
import '../widgets/profile_picture.dart';
import '../widgets/story_item.dart';
import '../widgets/tab_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: const [
            Text(
              "username",
              style: TextStyle(color: Colors.black),
            ),
            Icon(Icons.keyboard_arrow_down_outlined, color: Colors.black)
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_box_outlined, color: Colors.black)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu, color: Colors.black)),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const ProfilePicture(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InfoItem(postsValue: "0,000", postsString: "Posts"),
                      InfoItem(postsValue: "0,000", postsString: "Followers"),
                      InfoItem(postsValue: "0,000", postsString: "Followings"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text(
              "username",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: RichText(
              text: const TextSpan(
                  style: TextStyle(color: Colors.black),
                  text:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry ",
                  children: [
                    TextSpan(
                      style: TextStyle(color: Colors.blue),
                      text: "#hastag",
                    ),
                  ]),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
            child: Text(
              "Link goes here",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
            child: OutlinedButton(
              onPressed: () {},
              child: const Text(
                'Edit Profile',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  StoryItem(story: 'Story 1'),
                  StoryItem(story: 'Story 2'),
                  StoryItem(story: 'Story 3'),
                  StoryItem(story: 'Story 4'),
                  StoryItem(story: 'Story 5'),
                  StoryItem(story: 'Story 6'),
                  StoryItem(story: 'Story 7'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TabItem(tabIcon: Icons.add_box_outlined, active: true),
              TabItem(tabIcon: Icons.person_pin_outlined, active: false)
            ],
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 15,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) => Image.network(
                "https://picsum.photos/id/${index + 10}/200/300",
                fit: BoxFit.cover),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: 4,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.movie_filter_rounded), label: "Movie"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_rounded), label: "Shop"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person")
        ],
      ),
    );
  }
}
