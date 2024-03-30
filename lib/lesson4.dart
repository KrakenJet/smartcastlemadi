
import 'package:flutter/material.dart';

class lesson4 extends StatefulWidget {
  lesson4({super.key});

  @override
  State<lesson4> createState() => _lesson4State();
}

class _lesson4State extends State<lesson4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 21, 21, 21),
      appBar: AppBar(centerTitle: true, title: Text('Сегодня в кино'),  
      backgroundColor: Colors.black, titleTextStyle: TextStyle(color: Colors.white, fontSize: 22)),
      body: SingleChildScrollView(
        child: Column(
          children: [ 
            Divider(thickness: 0.8, height: 1, color: Color.fromARGB(125, 158, 158, 158)),
            Container(
              color: Colors.black,
              child: Row(
              children: [Text('Город', style: TextStyle(color: Colors.white)), Spacer(), 
              Text('Шымкент', style: TextStyle(color: Colors.white))]),
            ),
          Divider(thickness: 0.8, height: 1, color: Color.fromARGB(125, 158, 158, 158)),
          Container(
            color: Colors.black,
            child: Row(
              children: [
                Text('Дата', style: TextStyle(color: Colors.white)), Spacer(),
                Text('12 декабря, 2023', style: TextStyle(color: Colors.white))
              ]
            ),
          ), Divider(thickness: 0.8, height: 1, color: Color.fromARGB(125, 158, 158, 158)),
          Container(
            color: Colors.black,
            child: Row(
              children: [
                Text('Жанры', style: TextStyle(color: Colors.white)), Spacer(),
                Text('Все жанры', style: TextStyle(color: Colors.white))]),
          ),
             Divider(thickness: 0.8, height: 1, color: Color.fromARGB(125, 158, 158, 158)),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(color: Colors.black, 
                  borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Image.network('https://upload.wikimedia.org/wikipedia/ru/thumb/9/93/%D0%9C%D0%B0%D0%BB%D1%8C%D1%87%D0%B8%D0%BA_%D0%B8_%D0%BF%D1%82%D0%B8%D1%86%D0%B0_%D0%BF%D0%BE%D1%81%D1%82%D0%B5%D1%80.jpeg/345px-%D0%9C%D0%B0%D0%BB%D1%8C%D1%87%D0%B8%D0%BA_%D0%B8_%D0%BF%D1%82%D0%B8%D1%86%D0%B0_%D0%BF%D0%BE%D1%81%D1%82%D0%B5%D1%80.jpeg', width: 100, height: 100),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Мальчик и птица', style: TextStyle(color: Colors.white, fontSize: 20),), 
                            Text('Kimitachi wa Dou ikiru ka(2023)', style: TextStyle(color: Colors.white, fontSize: 15)), 
                            Text('аниме, мультфильм, драма', style: TextStyle(color: Colors.grey)),
                            Row(
                              children: [
                                Text('7.8', style: TextStyle(color: Colors.green, fontSize: 18)), SizedBox(width: 10),
                                Text('13 053', style: TextStyle(color: Colors.grey, fontSize: 15)),
                                Spacer(),
                                Flexible(child: Text('Япония 2:04', style: TextStyle(color: Colors.white, fontSize: 12))),
                        
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(color: Colors.black, 
                  borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Image.network('https://avatars.mds.yandex.net/get-kinopoisk-image/9784475/86761019-697f-40d9-8115-2a08b5a5941d/600x900', width: 100, height: 100),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Голодные игры баллада о змеях и певчих птицах', style: TextStyle(color: Colors.white, fontSize: 20), overflow: TextOverflow.ellipsis,), 
                            Text('The hunger games the ballad of songbirds and snakes', style: TextStyle(color: Colors.white, fontSize: 15)), 
                            Text('фантастика, боевик, триллер', style: TextStyle(color: Colors.grey)),
                            Row(
                              children: [
                                Text('7.5', style: TextStyle(color: Colors.green, fontSize: 18)), SizedBox(width: 10),
                                Text('17 563', style: TextStyle(color: Colors.grey, fontSize: 15)), Spacer(),
                                Expanded(child: Text('США, Канада 2:37', style: TextStyle(color: Colors.white, fontSize: 12, overflow: TextOverflow.ellipsis))),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(color: Colors.black, 
                  borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Image.network('https://avatars.mds.yandex.net/get-kinopoisk-image/9784475/f0b70070-f11c-4789-9938-fc482e0c6f09/600x900', width: 100, height: 100),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Наполеон', style: TextStyle(color: Colors.white, fontSize: 20)), 
                            Text('Napoleon(2023)', style: TextStyle(color: Colors.white, fontSize: 15)), 
                            Text('биография, военный, драма', style: TextStyle(color: Colors.grey)),
                            Row(
                              children: [
                                Text('6.5', style: TextStyle(color: Colors.green, fontSize: 18)), SizedBox(width: 10),
                                Text('7 780', style: TextStyle(color: Colors.grey, fontSize: 15)), Spacer(),
                                Expanded(
                                  child: 
                                  Text(
                                    'США, Великобритания 2:38', 
                                    style: TextStyle(color: Colors.white, fontSize: 12, overflow: TextOverflow.ellipsis))),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(color: Colors.black, 
                  borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Image.network('https://avatars.mds.yandex.net/get-kinopoisk-image/10835644/1e8b39a8-4a70-4b88-b8df-a697aab2a731/600x900', width: 100, height: 100),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Тёща', style: TextStyle(color: Colors.white, fontSize: 20)), 
                            Text('(2023)', style: TextStyle(color: Colors.white, fontSize: 15)), 
                            Text('комедия', style: TextStyle(color: Colors.grey)),
                            Row(
                              children: [
                                Text('6.1', style: TextStyle(color: Colors.green, fontSize: 18)), SizedBox(width: 10),
                                Text('8 487', style: TextStyle(color: Colors.grey, fontSize: 15)), Spacer(),
                                Flexible(child: Text('Россия 1:38', style: TextStyle(color: Colors.white, fontSize: 12))),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(color: Colors.black, 
                  borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Image.network('https://static.kinoafisha.info/k/movie_posters/1080x1920/upload/movie_posters/9/6/6/8365669/186348314086.jpg', width: 100, height: 100),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Немая ярость', style: TextStyle(color: Colors.white, fontSize: 20)), 
                            Text('Silent Night(2023)', style: TextStyle(color: Colors.white, fontSize: 15)), 
                            Text('боевик', style: TextStyle(color: Colors.grey)),
                            Row(
                              children: [
                                Text('6.0', style: TextStyle(color: Colors.green, fontSize: 18)), SizedBox(width: 10),
                                Text('1 775', style: TextStyle(color: Colors.grey, fontSize: 15)), Spacer(),
                                Flexible(child: Text('США, Мекиска 1:44', style: TextStyle(color: Colors.white, fontSize: 15), overflow: TextOverflow.ellipsis)),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
          
          ]
        ),
      ),
    );
  }
}