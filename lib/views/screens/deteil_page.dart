import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
      backgroundColor: Colors.green,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 150),
            height: 600,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(120, 70),
                topRight: Radius.elliptical(120, 70),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 130),
                Text(
                  '${res['name']}',
                  style: GoogleFonts.habibi(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                      color: Colors.black),
                ),
                const SizedBox(height: 10),
                Text(
                  'price:   ₹ ${res['price']}',
                  style: GoogleFonts.ubuntu(
                      fontSize: 22, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 30),
                Text(
                  "About Food",
                  style: GoogleFonts.actor(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  'food, substance consisting essentially of protein, fat, and other nutrients used in the body of an organism to sustain growth and vital processes and to furnish energy. ',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.balooBhai2(
                      fontWeight: FontWeight.w200,
                      fontSize: 17,
                      color: Colors.black),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 27,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '4.5',
                      style: GoogleFonts.ubuntu(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.watch_later_outlined,
                      color: Colors.black,
                      size: 25,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '15 Min.',
                      style: GoogleFonts.ubuntu(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.bloodtype,
                      color: Colors.red,
                      size: 25,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '100 Klc.',
                      style: GoogleFonts.ubuntu(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                const SizedBox(height: 60),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed("CartPage");
                  },
                  child: Container(
                    height: 55,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green.shade500,
                        border: Border.all(color: Colors.black)),
                    alignment: Alignment.center,
                    child: Text(
                      'Add cart',
                      style: GoogleFonts.ubuntu(fontSize: 22),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 150,
            width: 150,
            margin: const EdgeInsets.only(top: 80),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(res['image']), scale: 5),
              border: Border.all(color: Colors.black),
              color: Colors.green.shade600,
            ),
          )
        ],
      ),
    );
  }
}