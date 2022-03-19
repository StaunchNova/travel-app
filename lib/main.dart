import 'dart:ffi';

import 'package:flutter/material.dart';

List<AttractionModel> attractions = [
  AttractionModel(
      imgPath:
          'https://i0.wp.com/handluggageonly.co.uk/wp-content/uploads/2014/10/GOPR0009-s-s.jpg?resize=800%2C800&ssl=1',
      name: 'Gipuzkoa',
      location: 'Spain',
      description:
          'We\’re so excited about this new addition to Hand Luggage Only and we promise to start to upload more and more videos and make this a regular thing! For now '),
  AttractionModel(
      imgPath:
          'https://i0.wp.com/handluggageonly.co.uk/wp-content/uploads/2017/05/mosque-298742.jpg?resize=1122%2C1496&ssl=1',
      name: 'The Palace',
      location: 'Morocco',
      description:
          'Bordering on the Atlantic Ocean and the Mediterranean Sea, Morocco has everything to offer, from quaint seaside towns to snowy mountains and with enigmatic cities in between.'),
  AttractionModel(
      imgPath:
          'https://i0.wp.com/handluggageonly.co.uk/wp-content/uploads/2017/05/gondar-2062921.jpg?resize=905%2C1024&ssl=1',
      name: 'Ancient city of Aksum',
      location: 'Ethiopia',
      description:
          'Ethiopia is a country of ancient culture, with archaeological finds dating back over 3 million years, including the 12th-century churches in Lalibela and the ruins of the ancient city of Aksum.'),
  AttractionModel(
      imgPath:
          'https://i2.wp.com/handluggageonly.co.uk/wp-content/uploads/2017/05/seychelles-1415432.jpg?w=448&h=672&ssl=1',
      name: 'The Island',
      location: 'Seychelles',
      description:
          'Seychelles has a reputation as one of the world\’s most idyllic places to visit and it’s easy to see why.'),
];

const Color mainYello = Color(0xFFFFB02F);
const Color primaryGray = Color(0xFF313131);
const Color secondaryGray = Color(0xFF1C1C1C);
const Color lightGray = Color(0xFF3B3B3B);

void main() {
  runApp(
    MaterialApp(
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryGray,
        iconTheme: const IconThemeData(color: mainYello),
        elevation: 0,
        title: const Center(
          child: Icon(
            Icons.airplanemode_active,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: IconButton(
              icon: const Icon(Icons.notifications_active, color: Colors.grey),
              onPressed: () {},
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: mainYello,
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.all(20),
          child: const Icon(
            Icons.airplanemode_active,
            size: 80,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              primaryGray,
              secondaryGray,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HeaderWidegt(),
            AttractionListView(),
            BottomBarWidget(),
          ],
        ),
      ),
    );
  }
}

//------WIDGETS----
class HeaderWidegt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Fly to anywhere',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'in the world',
                style: TextStyle(
                  color: mainYello,
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: lightGray,
            ),
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              children: const [
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Search',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AttractionListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(left: 10),
        itemCount: attractions.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          AttractionModel currentAttraction = attractions[index];
          return AttractionCard(attractionModel: currentAttraction);
        },
      ),
    );
  }
}

class AttractionCard extends StatelessWidget {
  AttractionModel? attractionModel;
  AttractionCard({this.attractionModel});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              selectedModel: attractionModel,
            ),
          ),
        );
      },
      child: Container(
        width: 180,
        margin: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(attractionModel!.imgPath!),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.5),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      attractionModel!.name!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(attractionModel!.location!,
                        style: const TextStyle(color: mainYello))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BottomBarWidget extends StatefulWidget {
  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  final List<BottomBarModel> _bottomBarItems = [
    BottomBarModel(icon: Icons.explore_outlined, isSelected: true),
    BottomBarModel(icon: Icons.favorite_border, isSelected: false),
    BottomBarModel(icon: Icons.comment_outlined, isSelected: false),
    BottomBarModel(icon: Icons.account_balance_outlined, isSelected: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          _bottomBarItems.length,
          (index) {
            var barItemWidget = _bottomBarItems[index];
            return IconButton(
              icon: Icon(
                barItemWidget.icon,
                color: barItemWidget.isSelected! ? mainYello : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _bottomBarItems.forEach((element) {
                    element.isSelected = element == barItemWidget;
                  });
                });
              },
            );
          },
        ),
      ),
    );
  }
}

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => LandingPage()),
      );
    });
    return Stack(
      children: [
        Container(
          color: mainYello,
        ),
        const Align(
          alignment: Alignment.center,
          child: Icon(
            Icons.airplanemode_active,
            color: Colors.black,
            size: 80,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 160,
            height: 160,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.black.withOpacity(0.2),
              ),
              strokeWidth: 10,
            ),
          ),
        ),
      ],
    );
  }
}

// ----MODELS----
class AttractionModel {
  String? imgPath;
  String? name;
  String? location;
  String? description;
  AttractionModel({
    this.imgPath,
    this.name,
    this.location,
    this.description,
  });
}

class BottomBarModel {
  IconData? icon;
  bool? isSelected;
  BottomBarModel({this.icon, this.isSelected});
}

class DetailsPage extends StatelessWidget {
  AttractionModel? selectedModel;
  DetailsPage({this.selectedModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(selectedModel!.imgPath!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.8),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  selectedModel!.name!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(selectedModel!.location!,
                    style: const TextStyle(
                      color: mainYello,
                    )),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  selectedModel!.description!,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        child: const Text('View Comments',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {}),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Material(
                        color: mainYello,
                        child: InkWell(
                          onTap: () {},
                          splashColor: Colors.black.withOpacity(0.1),
                          highlightColor: Colors.black.withOpacity(0.2),
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 20, right: 20),
                            child: const Text(
                              'Use Itinerary',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(color: mainYello),
            title: const Center(
              child: Icon(Icons.airplanemode_active),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: IconButton(
                  icon: const Icon(Icons.favorite, color: mainYello),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
