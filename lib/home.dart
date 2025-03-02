import 'package:flutter/material.dart';
import 'package:home_service/data.dart';
import 'package:home_service/category_model.dart';
import 'package:home_service/slider_data.dart';
import 'package:home_service/slider_model.dart';
// import 'package:home_service/slider_data.dart.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex = 0;
  int selectedIndex = 0;
  List<CategoryModel> categories = [];
  List<sliderModel> sliders=[];
  TextEditingController _searchController = TextEditingController(); // Declare _searchController here
  @override
  void initState(){
    categories = getCategories();
    sliders = getSliders();

    super.initState();
  }

// Define the pages for each tab
  final List<Widget> _pages = [
    Center(child: Text("Home Screen")),
    Center(child: Text("Search Screen")),
    Center(child: Text("Profile Screen")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Search Bar

            // Text Titles
            SizedBox(width: 10),

            Padding(
              padding: const EdgeInsets.only(left: 65.0),
              child: Text(
                " Service ",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 23.0,
                ),
              ),
            ),
            Text(
              " Nest",
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 23.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0 ),
              child: SizedBox(width: 10.1,),
            ),
            Container(
              width: 100,
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search services...",
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,

                  ),
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),

      body:

      SingleChildScrollView(
        child: Container(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10.0),
                height: 70,
                child:
            ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context,index){
              return CategoryTile(
                image: categories[index].image,
                categoryName: categories[index].categoryName,
              );
            }),
          ),
          SizedBox(height: 15.0,),

          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text("Offer For You!", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),),
            Text("View All", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 15.0),),
          ],
          ),
          ),
          SizedBox(
            height: 10.0,
          ),

          CarouselSlider.builder(itemCount: sliders.length, itemBuilder: (context, index, realIndex){
            String? res = sliders[index].image;
            String? res1 = sliders[index].name;
            return buildImage(res!, index, res1!);
          },options: CarouselOptions(height: 220,

              autoPlay: true,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            onPageChanged: (index,reason){
            setState(() {
              activeIndex = index;
            });
            }
          )),


              SizedBox(height: 30.0,),
             Center(child:  buildIndicator()),

              SizedBox(height: 20.0,),

              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Our Services", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),),
                    Text("View All", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 15.0),),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Column(
                children: [
                  // First Row with Image and Content
                  Material(
                    elevation: 6.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.5),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                "images/construction.jpg",
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Home Construction",
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Description for the first offer goes here.",
                                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () async {
                                          // Show the calendar when the button is pressed
                                          DateTime? selectedDate = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(2100),
                                          );
                                          if (selectedDate != null) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    "Booking Date: ${selectedDate.toLocal()}"),
                                              ),
                                            );
                                          }
                                        },
                                        child: Text("Book Now"),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text("Add to Cart"),
                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),

                  Material(
                    elevation: 6.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.5),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                "images/decoration.jpg",
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "House Decoration",
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Description for the first offer goes here.",
                                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () async {
                                          // Show the calendar when the button is pressed
                                          DateTime? selectedDate = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(2100),
                                          );
                                          if (selectedDate != null) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    "Booking Date: ${selectedDate.toLocal()}"),
                                              ),
                                            );
                                          }
                                        },
                                        child: Text("Book Now"),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text("Add to Cart"),
                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 15,),



                  Material(
                    elevation: 6.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.5),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                "images/cloth.jpg",
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Dry Cleaning",
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Description for the first offer goes here.",
                                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () async {
                                          // Show the calendar when the button is pressed
                                          DateTime? selectedDate = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(2100),
                                          );
                                          if (selectedDate != null) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    "Booking Date: ${selectedDate.toLocal()}"),
                                              ),
                                            );
                                          }
                                        },
                                        child: Text("Book Now"),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text("Add to Cart"),
                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),

                  Material(
                    elevation: 6.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.5),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                "images/construction.jpg",
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Construction Work",
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Description for the first offer goes here.",
                                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () async {
                                          // Show the calendar when the button is pressed
                                          DateTime? selectedDate = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(2100),
                                          );
                                          if (selectedDate != null) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    "Booking Date: ${selectedDate.toLocal()}"),
                                              ),
                                            );
                                          }
                                        },
                                        child: Text("Book Now"),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text("Add to Cart"),
                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),

                  Material(
                    elevation: 6.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.5),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                "images/offer2.jpg",
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Bathroom Cleaning",
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Description for the first offer goes here.",
                                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () async {
                                          // Show the calendar when the button is pressed
                                          DateTime? selectedDate = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(2100),
                                          );
                                          if (selectedDate != null) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    "Booking Date: ${selectedDate.toLocal()}"),
                                              ),
                                            );
                                          }
                                        },
                                        child: Text("Book Now"),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text("Add to Cart"),
                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),

                  Material(
                    elevation: 6.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.5),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                "images/plumber.jpg",
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Plumbering",
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Description for the first offer goes here.",
                                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () async {
                                          // Show the calendar when the button is pressed
                                          DateTime? selectedDate = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(2100),
                                          );
                                          if (selectedDate != null) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    "Booking Date: ${selectedDate.toLocal()}"),
                                              ),
                                            );
                                          }
                                        },
                                        child: Text("Book Now"),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text("Add to Cart"),
                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),

                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            "images/shifting.jpg",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Shifting",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Description for the first offer goes here.",
                                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      // Show the calendar when the button is pressed
                                      DateTime? selectedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2100),
                                      );
                                      if (selectedDate != null) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                "Booking Date: ${selectedDate.toLocal()}"),
                                          ),
                                        );
                                      }
                                    },
                                    child: Text("Book Now"),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Add to Cart"),
                                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),




                  // Add more rows similarly
                ],
              )


            ],
        ),
        ),
      ),




  bottomNavigationBar: BottomNavigationBar(
  currentIndex: selectedIndex,
  onTap: (index) {
  setState(() {
  selectedIndex = index;
  });
  // Add navigation logic if needed
  },
  items: [
  BottomNavigationBarItem(
  icon: Icon(Icons.home),
  label: 'Home',
  ),
  BottomNavigationBarItem(
  icon: Icon(Icons.category),
  label: 'Booking',
  ),

  BottomNavigationBarItem(
  icon: Icon(Icons.person),
  label: 'Profile',
  ),
  ],
  ),
  );

  }
  Widget buildImage(String image, int index, String name) => Container(
    margin: EdgeInsets.symmetric(horizontal: 10.0),
      child:  Stack(
        children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10) ,
          child: Image.asset(
            image, fit: BoxFit.cover, width: MediaQuery.of(context).size.width,
          ),
        ),
     Container(
       margin: EdgeInsets.only(top: 1.0),
       width: MediaQuery.of(context).size.width,
       decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(18),bottomRight: Radius.circular(18)) ),
     )
  ]
      ));

  Widget buildIndicator() => AnimatedSmoothIndicator(activeIndex: activeIndex, count: sliders.length);

}



class CategoryTile extends StatelessWidget {
  final image,categoryName;
  CategoryTile({this.categoryName, this.image});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
      margin: EdgeInsets.only(right: 14),
        child:
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(image,
              width: 120,
                height: 60,
              ),
            ),
            Container(
              width: 120,
              height: 60,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),color: Colors.black12,),
              child: Center(child: Text(categoryName,style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w900),)),
            )
          ],
        ),
      ),
    );


  }
}

