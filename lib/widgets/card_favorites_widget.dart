import 'package:flutter/material.dart';
import 'package:prueba_flutter_nasa/widgets/buttom_elevated_widget.dart';

class CardFavoritesWidget extends StatelessWidget {
  final String img;
  final String? name;
  const CardFavoritesWidget({Key? key, required this.img, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Container(
        width: double.infinity,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 241, 241, 241),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 20),
                      child: const Icon(
                        Icons.keyboard_control,
                        size: 30,
                        color: Color.fromRGBO(177, 177, 177, 1),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 150,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: NetworkImage(img), fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          name!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Positioned(
              bottom: 5,
              left: 50,
              child: ButtomElevatedWidget(
                  icon: Icon(
                Icons.favorite,
                color: Color.fromRGBO(253, 120, 31, 1),
              )),
            )
          ],
        ),
      ),
    );
  }
}
