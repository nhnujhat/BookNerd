import 'package:book_nerd/constants/colors.dart';
import 'package:book_nerd/pages/saved/widgets/saved_custom_tab.dart';
import 'package:book_nerd/pages/saved/widgets/saved_staggered_grid_view.dart';
import 'package:flutter/material.dart';

class Savedpage extends StatefulWidget {
  const Savedpage({Key? key}) : super(key: key);

  @override
  State<Savedpage> createState() => _SavedpageState();
}

class _SavedpageState extends State<Savedpage> {
  var savedtabIndex = 0;
  var savedbottomIndex = 0;
  final savedpageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: Column(
          children: [
            SavedCustomTab(savedtabIndex, (int index) {
              setState(() {
                savedtabIndex = index;
              });
              savedpageController.jumpToPage(index);
            }),
            Expanded(
                child: SavedStaggeredGridView(
                  savedtabIndex,
                  savedpageController,
                      (int index) => setState(() {
                        savedtabIndex = index;
                  }),
                ))
          ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(
          Icons.arrow_back_ios_outlined,
          color: kFont,
        ),
      ),
      title: const Text(
        'Saved Items',
        style: TextStyle(
          color: kFont,
          fontSize: 18,
        ),
      ),
      centerTitle: true,
    );
  }
}
