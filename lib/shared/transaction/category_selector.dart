import 'package:personal_finance_tracker/config/config.dart';
import 'package:personal_finance_tracker/generated/l10n.dart';
import 'package:personal_finance_tracker/models/models.dart';
import 'package:flutter/material.dart';

class CategorySelector extends StatelessWidget {
  final Category category;
  final bool isSelected;
  final VoidCallback onPressed;

  const CategorySelector({
    super.key,
    required this.category,
    this.isSelected = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onPressed,
      child: Stack(
        children: <Widget>[
          isSelected
              ? Align(
                  alignment: Alignment.center,
                  child: Container(
                    color: thriftyBlue.withValues(alpha: 0.15),
                  ),
                )
              : Container(),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 30,
                    height: 30,
                    child: Image.asset(
                      'assets/categories/${category.icon}',
                    ),
                  ),
                  Text(
                    S
                        .of(context)
                        .categoryName(transformCategoryToKey(category)),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
