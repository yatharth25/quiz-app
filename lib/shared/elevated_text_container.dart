import 'package:flutter/material.dart';
import 'package:quiz/theme.dart';

class ElevatedTextContainer extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  const ElevatedTextContainer(
      {super.key,
      required this.text,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.rectangle, boxShadow: [
        BoxShadow(color: AppColor.black.withOpacity(0.12), blurRadius: 16)
      ]),
      child: PhysicalModel(
        color: Colors.white,
        elevation: 4,
        shadowColor: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            focusColor: AppColor.behan,
            splashColor: AppColor.behan,
            highlightColor: AppColor.behan,
            hoverColor: AppColor.behan,
            borderRadius: BorderRadius.circular(12),
            radius: 12,
            onTap: onTap,
            child: Container(
              alignment: Alignment.center,
              height: 80,
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width - 48,
              decoration: BoxDecoration(
                  border: isSelected
                      ? Border.all(width: 2, color: AppColor.behan)
                      : null,
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColor.black48,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
