import 'package:flutter/material.dart';

import '../ui/pages/cocktail.dart';
import '../ui/pages/dialog_details.dart';
import '../ui/pages/recipe.dart';
import 'cache_image.dart';
import 'separator.dart';

/// CARD SCROLL
/// This widgets allows users to select recipes or cocktails from a list.
/// It also presents the first four ones in the main view.
class CardScroll extends StatelessWidget {
  final String title;
  final List children, displayChildren;

  CardScroll({
    this.title,
    this.children,
    this.displayChildren,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context).textTheme.subhead.copyWith(
                        color: Theme.of(context).textTheme.subhead.color,
                      ),
                ),
                InkResponse(
                  child: Text(
                    'MORE',
                    style: Theme.of(context).textTheme.subhead.copyWith(
                          color: Theme.of(context).accentColor,
                        ),
                  ),
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailsDialog(
                                title: title,
                                recipes: children,
                              ),
                          fullscreenDialog: true,
                        ),
                      ),
                )
              ],
            ),
            Separator.spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: displayChildren,
            )
          ],
        ),
      ),
    );
  }

  factory CardScroll.recipe({
    BuildContext context,
    String title,
    List children,
  }) {
    return CardScroll(
      title: title,
      children: children,
      displayChildren: children
          .sublist(0, 4)
          .map((recipe) => ScrollItem(
                url: recipe.photo,
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => RecipePage(recipe)),
                    ),
              ))
          .toList(),
    );
  }
  factory CardScroll.cocktail({
    BuildContext context,
    String title,
    List children,
  }) {
    return CardScroll(
      title: title,
      children: children,
      displayChildren: children
          .sublist(0, 4)
          .map((cocktail) => ScrollItem(
                url: cocktail.photo,
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => CocktailPage(cocktail)),
                    ),
              ))
          .toList(),
    );
  }
}

class ScrollItem extends StatelessWidget {
  final String url;
  final VoidCallback onTap;

  ScrollItem({this.url, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 64,
      child: InkWell(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: CacheImage(url),
        ),
        onTap: onTap,
      ),
    );
  }
}
