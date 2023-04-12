import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../helper/db_helper.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Page"),
        backgroundColor: Colors.green,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseHelpers.firebaseHelpers.featchData(dbname: "Food"),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (snapshot.hasData) {
              QuerySnapshot? querysnapshot = snapshot.data;
              List<DocumentSnapshot> alldocs2 = querysnapshot!.docs;
              List<DocumentSnapshot> alldocs = [];

              for (var product in alldocs2) {
                if (product["isFirst"] == true) {
                  alldocs.add(product);
                }
              }

              return Column(
                children: [
                  Expanded(
                    flex: 18,
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.all(10),
                      itemCount: alldocs.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 9,
                          mainAxisExtent: 220,
                          mainAxisSpacing: 10),
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed("DetailPage", arguments: alldocs[i]);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 1,
                                    blurRadius: 3),
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.favorite_border),
                                  ),
                                ),
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            "${alldocs[i]["image"]}")),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "${alldocs[i]["name"]}",
                                  style: GoogleFonts.actor(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child: Text(
                                        "Rs  ${alldocs[i]["price"]}",
                                        style: GoogleFonts.ubuntu(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        if (alldocs[i]["isFirst"] == false) {
                                          Map<String, dynamic> data = {
                                            "isFirst": true,
                                          };
                                          await FirebaseHelpers.firebaseHelpers
                                              .updatedata(
                                              data: data,
                                              id: alldocs[i].id,
                                              dbname: "Food");
                                        }
                                      },
                                      child: Container(
                                        height: 37,
                                        width: 37,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(17),
                                              bottomRight: Radius.circular(15),
                                            )),
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.green,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total Price: 550",
                            style: GoogleFonts.actor(
                                fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}