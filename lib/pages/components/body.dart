import 'package:flutter/material.dart';
import 'package:prueba_flutter_nasa/models/movies_response.dart';
import 'package:prueba_flutter_nasa/services/movies_service.dart';
import 'package:prueba_flutter_nasa/widgets/buttom_elevated_widget.dart';
import 'package:prueba_flutter_nasa/widgets/card_favorites_widget.dart';
import 'package:prueba_flutter_nasa/widgets/category_list_widget.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final moviesService = MoviesService();

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Favorites',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    letterSpacing: -1,
                  ),
                ),
                ButtomElevatedWidget(
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          const CategoryListWidget(category: [
            'All',
            'Happy Hours',
            'Drinks',
            'Beer',
            'Movies',
            'Now'
          ]),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Colors.white,
            ),
            child: Column(
              children: [
                titleCardFavorites(),
                FutureBuilder(
                  future: moviesService.getNowPlaying(),
                  builder: (BuildContext context,
                      AsyncSnapshot<MoviesResponse> snapshot) {
                    final movies = snapshot.data?.results;

                    if (!snapshot.hasData) {
                      return Container(
                        padding: const EdgeInsets.only(top: 30),
                        width: double.infinity,
                        height: size.height,
                        child: Column(
                          children: const [CircularProgressIndicator()],
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: movies?.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return CardFavoritesWidget(
                              img: movies?[index].imgPath,
                              name: movies?[index].title);
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding titleCardFavorites() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Happy Hours',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 27,
              letterSpacing: -1,
            ),
          ),
          ButtomElevatedWidget(
            icon: Icon(
              Icons.delete_outline,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
