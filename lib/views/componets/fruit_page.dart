import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helper/db_helper.dart';

class Fruit extends StatefulWidget {
  const Fruit({Key? key}) : super(key: key);

  @override
  State<Fruit> createState() => _FruitState();
}

class _FruitState extends State<Fruit> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseHelpers.firebaseHelpers.featchData(dbname: "fruit"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else if (snapshot.hasData) {
            QuerySnapshot? querysnapshot = snapshot.data;

            List<DocumentSnapshot> alldocs = querysnapshot!.docs;
            print("))))))))))))))))))))))))))))))))))))))))))))))))");
            print("${alldocs[0]["name"]}");
            print("))))))))))))))))))))))))))))))))))))))))))))))))");

            return SizedBox(
              height: 400,
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(10),
                itemCount: alldocs.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4,
                  mainAxisExtent: 220,
                ),
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
                        boxShadow: [
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
                                  image: AssetImage("${alldocs[i]["image"]}")),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Text(
                                  "Rs  ${alldocs[i]["price"]}",
                                  style: GoogleFonts.ubuntu(
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
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
                                  Icons.add,
                                  color: Colors.white,
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
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}