import 'package:flutter/material.dart';
import 'package:movie_app/models/Movie.dart';
import 'package:movie_app/shared/SizeConfig.dart';

class DetailView extends StatelessWidget {
  final Movie movie;

  DetailView({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            child: Image(
              width: SizeConfig.screenWidth,
              image: NetworkImage(movie.posterUrl()),
            ),
          ),
          Positioned(
            bottom: 0,
            child: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black, Colors.transparent],
                ).createShader(Rect.fromLTRB(0, 0, rect.width, 100)
                );
              },
              blendMode: BlendMode.dstIn,
              child: Container(
                color: Colors.black,
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight / 1.80,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight / 2,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title, style: TextStyle( fontWeight: FontWeight.bold, fontSize: 27, color: Colors.white ),),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Wrap(
                      spacing: 5,
                      children: [
                        Text("15+", style: TextStyle(color: Colors.white)),
                        Text("2020", style: TextStyle(color: Colors.white)),
                        Icon(Icons.star, color: Colors.orange, size: 16,),
                        Text("7.6", style: TextStyle(color: Colors.orange))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Wrap(
                      spacing: 10,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(5),
                          child: Text("Crime", style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(5),
                          child: Text("Drama", style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(5),
                          child: Text("Mystery", style: TextStyle(fontWeight: FontWeight.bold),),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: RichText(
                      text: TextSpan(
                          text: "Cast: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.", style: TextStyle(fontWeight: FontWeight.normal))
                          ]
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      "Summary",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.",
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}