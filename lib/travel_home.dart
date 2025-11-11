import 'package:flutter/material.dart';

class TravelHomePage extends StatelessWidget {
  const TravelHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Travel Destination Explorer',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Text(
            "Explore Top Destinations",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),

          // Destination 1 - Paris
          DestinationItem(
            name: "Paris, France",
            description: "The city of lights and love.",
            rating: 4.5,
            imagePath: "assets/images/paris.jpg",
          ),
          SizedBox(height: 15),

          // Destination 2 - Tokyo
          DestinationItem(
            name: "Tokyo, Japan",
            description: "A mix of tradition and modern life.",
            rating: 5.0,
            imagePath: "assets/images/tokyo.jpg",
          ),
          SizedBox(height: 15),

          // Destination 3 - New York
          DestinationItem(
            name: "New York, USA",
            description: "The city that never sleeps.",
            rating: 4.0,
            imagePath: "assets/images/newyork.jpg",
          ),
          SizedBox(height: 25),

          // NEW SECTION: Dynamic List
          Text(
            "Discover Activities",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),

          Container(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final activity = activities[index];
                return ActivityCard(
                  title: activity['title']!,
                  description: activity['description']!,
                  imagePath: activity['imagePath']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// -------------------- DATA SECTION --------------------
final List<Map<String, String>> activities = [
  {
    "title": "Scuba Diving",
    "description": "Explore marine life under crystal waters.",
    "imagePath": "assets/images/scuba.jpg",
  },
  {
    "title": "Mountain Trekking",
    "description": "Reach new heights with adventure trails.",
    "imagePath": "assets/images/trekking.jpg",
  },
  {
    "title": "Safari Ride",
    "description": "Witness wild animals in their natural habitat.",
    "imagePath": "assets/images/safari.jpg",
  },
//   {
//   "title": "Desert Camping",
//   "description": "Spend a night under the stars.",
//   "imagePath": "assets/images/camping.jpg",
// }
];

// -------------------- DESTINATION WIDGET --------------------
class DestinationItem extends StatelessWidget {
  final String name;
  final String description;
  final double rating;
  final String imagePath;

  const DestinationItem({
    super.key,
    required this.name,
    required this.description,
    required this.rating,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2)
      ]),
      child: Column(
        children: [
          Image.asset(imagePath,
              height: 180, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(name,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    rating.floor(),
                    (index) => Icon(Icons.star, color: Colors.yellow),
                  )
                    ..addAll(
                      rating - rating.floor() >= 0.5
                          ? [Icon(Icons.star_half, color: Colors.yellow)]
                          : [],
                    ),
                ),
                SizedBox(height: 5),
                Text(description, textAlign: TextAlign.center),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: null, // placeholder
                  child: Text("Explore"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// -------------------- ACTIVITY WIDGET --------------------
class ActivityCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const ActivityCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imagePath,
              height: 110,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(title,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                SizedBox(height: 5),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
