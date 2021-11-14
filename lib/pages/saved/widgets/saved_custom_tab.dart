import 'package:book_nerd/constants/colors.dart';
import 'package:flutter/material.dart';

class SavedCustomTab extends StatelessWidget {
  final int savedselected;
  final Function savedcallback;
  SavedCustomTab(this.savedselected, this.savedcallback, {Key? key}) : super(key: key);
  final savedtabs = ['Ebooks', 'Audiobooks'];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(5),
        ),
        width: width,
        height: 56,
        child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => GestureDetector(
              onTap: () => savedcallback(index),
              child: Container(
                decoration: BoxDecoration(
                  color:
                  savedselected == index ? Colors.white : Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: const EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.center,
                width: (width - 40) / 2 - 10,
                child: Text(
                  savedtabs[index],
                  style: const TextStyle(
                    color: kFont,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            separatorBuilder: (_, index) => const SizedBox(width: 10),
            itemCount: savedtabs.length));
  }
}
