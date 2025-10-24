import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:studify/core/theme/color.dart';

class OptionTile extends StatelessWidget {
  final String option;
  final int id;
  final int questionId;
  final int correctId;
  final int? selectedId;
  final Function(int, int) callback;
  
  const OptionTile({super.key, required this.option, required this.id, required this.correctId, required this.callback, this.selectedId, required this.questionId});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            splashColor: AppColors.borderSurface,
            highlightColor: AppColors.primaryPurple.withValues(alpha: .3),
            onTap: ()=>callback(questionId, id),
            child: Container(
              constraints: BoxConstraints(minHeight: 55),
              padding: EdgeInsets.symmetric(vertical: 17.5, horizontal: 24),
              // margin: EdgeInsets.only(bottom: 19),
              decoration: 
                correctoptions() ? correctDecoration() 
                : incorrectoptions() ? incorrectDecoration() 
                : showCorrectoptions() ? correctDecoration() 
                : unSelectedDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(option)
                  ),
                  // const Spacer(),
                  customRadio()
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 19,)
      ],
    );
  }

  bool correctoptions(){
    // log("called correct option");
    return (id == correctId) && (id == selectedId);
  }

  bool incorrectoptions(){
    return (id != correctId) && (id == selectedId);
  }

  bool showCorrectoptions(){
    return (selectedId != null) && (id == correctId);
  }

  BoxDecoration unSelectedDecoration()=> BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(
      width: .2,
      color: AppColors.iconGrey
    )
  );

  BoxDecoration correctDecoration()=> BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(
      width: .5,
      color: AppColors.green
    ),
    boxShadow: [
      BoxShadow(
        blurRadius: 4,
        color: AppColors.green
      )
    ]
  );

  BoxDecoration incorrectDecoration()=> BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(
      width: .5,
      color: AppColors.redError
    ),
  );

  Widget customRadio(){
    return Container(
      height: 20,
      width: 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.whiteSurface,
        shape: BoxShape.circle,
        border: Border.all(
          width: 0.2,
          color: correctoptions() ? AppColors.green
            : incorrectoptions() ? AppColors.redError
            : showCorrectoptions() ? AppColors.green
            : AppColors.borderSurface
        ),
      ),
      child: Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: correctoptions() ? AppColors.green
            : incorrectoptions() ? AppColors.redError
            : showCorrectoptions() ? AppColors.green
            : AppColors.whiteSurface
        ),
      ),
    );
  }
}