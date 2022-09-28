import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainContainers extends StatefulWidget {
  final String imagePath;
  final String mainLabel;
  final String subText;
  final String location;
  final String routeName;

  MainContainers(
    this.imagePath,
    this.mainLabel,
    this.subText,
    this.location,
    this.routeName,
  );

  @override
  State<MainContainers> createState() => _MainContainersState();
}

class _MainContainersState extends State<MainContainers> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, widget.routeName);
      },
      child: Container(
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  widget.imagePath,
                  width: 371.4,
                  fit: BoxFit.cover,
                ),
                Row(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.mainLabel,
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              height: 1.5,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            widget.subText,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 146, 146, 146),
                              fontSize: 13,
                              height: 1.5,
                            ),
                          ),
                          Text(
                            widget.location,
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 146, 146, 146),
                              fontSize: 13,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.only(left: 16),
                      margin: EdgeInsets.only(right: 20),
                      width: 300,
                    ),
                    IconButton(
                      onPressed: () {
                        isFavourite = !isFavourite;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.favorite_border_outlined,
                        color: isFavourite ? Colors.red : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        width: 371.4,
        height: 234,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}
