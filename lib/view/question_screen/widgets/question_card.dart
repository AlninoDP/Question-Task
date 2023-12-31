import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:question_task/controller/question_controller.dart';
import 'package:question_task/view/question_detail_screen/question_detail_screen.dart';
import 'package:question_task/view/question_screen/widgets/show_image_error.dart';

class QuestionCard extends StatelessWidget {
  final QuestionController controller;
  final int index;
  const QuestionCard(
      {super.key, required this.controller, required this.index});

  @override
  Widget build(BuildContext context) {
    controller.filteredList.add(controller.listOfQuestion[index]);
    return Card(
      elevation: 20,
      shadowColor: Colors.grey,
      child: InkWell(
        onTap: () {
          controller.clearFilteredList();
          controller.addToFilteredList(controller.listOfQuestion[index]);
          controller.resetHint();
          Get.to(() => QuestionDetailScreen(), transition: Transition.native);
        },
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FadeInImage(
                  width: 150,
                  height: 125,
                  fit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return const ShowImageError();
                  },
                  placeholder: const AssetImage('assets/images/loading.gif'),
                  image: NetworkImage(
                    controller.listOfQuestion[index].imagePath,
                  ),
                ),
              ),
              Text(controller.listOfQuestion[index].questionText),
              SizedBox(
                height: 5.h,
              ),
              Text(
                  'Category: ${controller.listOfQuestion[index].questionCategory.toString().split('.').last}')
            ],
          ),
        ),
      ),
    );
  }
}
