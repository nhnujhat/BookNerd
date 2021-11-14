import 'package:book_nerd/constants/colors.dart';
import 'package:book_nerd/pages/saved/saved.dart';
import 'package:book_nerd/pages/home/widgets/book_staggered_grid_view.dart';
import 'package:book_nerd/pages/home/widgets/custom_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var tabIndex = 0;
  var bottomIndex = 0;
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          CustomTab(tabIndex, (int index) {
            setState(() {
              tabIndex = index;
            });
            pageController.jumpToPage(index);
          }),
          Expanded(
              child: BookStaggeredGridView(
            tabIndex,
            pageController,
            (int index) => setState(() {
              tabIndex = index;
            }),
          ))
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Savedpage())),
          icon: const Icon(Icons.bookmark_border_outlined),
          color: kFont,
        ),
        title: const Text(
          'BookNerd',
          style: TextStyle(
            color: kFont,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search_outlined,
              color: kFont,
            ),
          )
        ]);
  }
}
