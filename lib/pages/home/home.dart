import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:makanan/modul/detailmodel.dart';
import 'package:makanan/pages/home/widgets/daily_dzikir.dart';
import 'package:makanan/pages/home/widgets/thum_card.dart';
import 'package:makanan/service/service.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Yuk",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          " Doa",
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.transparent,
                        ),
                        iconSize: 25,
                        splashColor: Colors.transparent,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 160.0,
                color: Colors.transparent,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  children: const <Widget>[
                    ThumbnailCard(
                      balance: "Learn Quran and \nRecite once everyday",
                      img: 'assets/images/thumb/2.jpg',
                    ),
                    ThumbnailCard(
                      balance: "A Wonderful Agency to \nFulfill your Dreams",
                      img: 'assets/images/thumb/3.jpg',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: 2,
                effect: const WormEffect(
                    dotHeight: 7.5,
                    dotWidth: 10,
                    type: WormType.thin,
                    dotColor: Colors.black26
                    // strokeWidth: 5,
                    ),
              ),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text(
                      'Daily Dzikir',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
              // DailyDzikir(),
            ],
          ),
        ),
      ),
    );
  }
}
