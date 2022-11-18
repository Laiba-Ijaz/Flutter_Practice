import 'package:flutter/material.dart';
import 'package:technewz_app/utils/color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technewz_app/backend/functions.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);
  static TextEditingController searchController = TextEditingController(text: '');
  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final double size = 45;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
              height: 50.0,
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                color: AppColors.darkGrey,
                borderRadius: BorderRadius.circular(50.0)
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 10,),
                    Expanded(
                        child: TextField(
                          controller: SearchBar.searchController,
                          decoration: InputDecoration(
                            hintText: 'Search a keyword or a phrase',
                            hintStyle: GoogleFonts.lato(),
                            border: InputBorder.none
                          ),
                        )
                    )
                  ],
                ),
              ),
            )
        ),
        InkWell(
          onTap: (){
            FocusScope.of(context).unfocus();
            fetchNews();
          },
          child: Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              color: AppColors.darkGrey,
              shape: BoxShape.circle
            ),
            child: Icon(
              Icons.search,
              color: AppColors.white,
            ),
          ),
        ),
        const SizedBox(width: 10,)
      ],
    );
  }
}
