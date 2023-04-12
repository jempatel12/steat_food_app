import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../componets/food_page.dart';
import '../componets/fruit_page.dart';
import '../componets/grocery_app.dart';
import '../componets/vegetabel_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

late TabController tabController2;
int initialtabindexbottom = 0;

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  int initialtabindex = 0;
  int bottomindex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomindex,
        backgroundColor: Colors.white,
        onTap: (val) {
          setState(() {
            bottomindex = val;
            if (bottomindex == 2) {
              Navigator.of(context).pushNamed("CartPage");
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
                const Icon(
                  Icons.location_on_rounded,
                  color: Colors.green,
                ),
                const Text("Surat,Gujarat"),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage("assets/images/man.jpg"),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hii Dhruvin",
                  style: GoogleFonts.ubuntu(
                    fontSize: 21,
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Find Your food",
                  style: GoogleFonts.ubuntu(
                      fontSize: 27, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            margin: const EdgeInsets.all(15),
            child: TextField(
              decoration: InputDecoration(
                enabled: true,
                filled: true,
                fillColor: Colors.green.shade50,
                hintText: "Search Food",
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15)),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: Container(
                  margin: const EdgeInsets.all(8),
                  height: 43,
                  width: 43,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 17),
          TabBar(
            isScrollable: true,
            physics: BouncingScrollPhysics(),
            labelColor: Colors.green,
            controller: tabController,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.green,
            onTap: (val) {
              setState(() {
                initialtabindex = val;
              });
            },
            tabs: const [
              Tab(text: " Food   "),
              Tab(text: "   Fruit   "),
              Tab(text: "   Vegetables   "),
              Tab(text: "   Grocery  "),
            ],
          ),
          (initialtabindex == 0) ? Food() : Container(),
          (initialtabindex == 1) ? Fruit() : Container(),
          (initialtabindex == 2) ? Vegetables() : Container(),
          (initialtabindex == 3) ? Grocery() : Container(),
        ],
      ),
    );
  }
}