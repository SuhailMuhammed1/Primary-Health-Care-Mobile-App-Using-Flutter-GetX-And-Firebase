import '../home_page/widgets/categories_item_widget.dart';
import 'controller/home_controller.dart';
import 'models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:phc_lab/core/app_export.dart';
import 'package:phc_lab/widgets/app_bar/appbar_title.dart';
import 'package:phc_lab/widgets/app_bar/appbar_trailing_image.dart';
import 'package:phc_lab/widgets/app_bar/custom_app_bar.dart';


// ignore_for_file: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  HomeController controller = Get.put(HomeController(HomeModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 21.v),
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.h),
                        child: Column(children: [
                          SizedBox(height: 60.v),
                          _buildCategories(),
                        ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(90.v), // Adjust the height as needed
      child: Column(
          children: [
            CustomAppBar(
              height: 85.v,
              title: AppbarTitle(
                text: "msg_phc_mookkannoor".tr,
                margin: EdgeInsets.only(left: 24.h),
              ),
              actions: [
                Container(
                  height: 50.h, // Adjust the size as needed
                  width: 50.h,
                  margin: EdgeInsets.only(right: 24.h), // Adjust the right margin as needed
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.colorScheme.primary, // Red background color
                  ),
                  child: Center(
                    child: AppbarTrailingImage(
                      imagePath: ImageConstant.imgVector,
                      margin: EdgeInsets.all(5.v), // Adjust the margin as needed
                    ),
                  ),
                ),
              ],
            ),
            Divider( // You can also use a Container with a colored background here
              thickness: 3.h,// Adjust the height of the line
              color: theme.colorScheme.primary, // Set your desired line color
            ),
          ],
        ),
    );
  }


  /// Section Widget
  Widget _buildCategories() {
    return SizedBox(
      height: 437.v,
      child: Column(
        children: [
          CategoriesItemWidget(
            imagePath1: ImageConstant.labadd,
            text1: 'Add Lab Report',
            onTap: (){
              Get.toNamed(AppRoutes.addLabReport);
            },
          ),
          SizedBox(height: 80.v),
          CategoriesItemWidget(
            imagePath1: ImageConstant.labview,
            text1: 'View Lab Report',
            onTap: (){
              Get.toNamed(AppRoutes.viewLabReport);
            },
          ),
        ],
      ),
    );
  }

}
