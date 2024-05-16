import 'package:emotiondetectedbyai/controller/fromgalary_controller.dart';
import 'package:emotiondetectedbyai/core/class/handlingdataview.dart';
import 'package:emotiondetectedbyai/core/constant/color.dart';
import 'package:emotiondetectedbyai/core/constant/routes.dart';
import 'package:emotiondetectedbyai/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class FromGalaryScan extends StatelessWidget {
  const FromGalaryScan({super.key});




  void _showBottomSheet(BuildContext context,String advice) {
    String? selectedOption;
    String? selectedTravelClass;


    showModalBottomSheet(
      context: context,
      elevation: 10,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: AppColor.primaryColor,
          width: 3.0,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      builder: (_) {
        return Container(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),

            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    advice,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor,

                    ),
                    textAlign: TextAlign.left,
                  ),
                ),


                const SizedBox(height: 20),


                CustomButtomAuth(text: "Save", onPressed: () {

                }),
              ],
            ),

          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(FromGalaryController());

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text(
          'From Gallery',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              height: 1.4,
              fontFamily: 'SofiaSans',
              fontSize: 20),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {

            Get.offAllNamed(AppRoute.homescreen);

          },
        ),
      ),
      body:GetBuilder<FromGalaryController>(
        init: FromGalaryController(),
    builder:(controller) {
      return Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(

                width: 300.0,
                height: 300.0,
                decoration: BoxDecoration(
                  color: AppColor.splsh2,
                  border: Border.all(
                    color: Colors.blueGrey,
                    width: 2.0,
                  ),
                  borderRadius:
                  BorderRadius.circular(12.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      12.0),
                  child:  controller.fileimage != null ? Image.file(
                    controller.fileimage!,
                    fit: BoxFit.cover,
                  ) : Image.asset(
                    'assets/images/upload.png', // Provide path to placeholder image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              controller.label != '' ?    "Result: ${controller.label!}"  : 'Result:-----',

              style: const TextStyle(
                  fontSize: 28,
                  fontFamily: 'SofiaSans',
                  fontWeight: FontWeight.bold),
            ),

            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                 controller.pickImageFromGallery();
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                alignment: Alignment.center,
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                decoration: BoxDecoration(
                  color:AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'Pick Image',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // here i want check controller.label != ''
            Visibility(
              visible: controller.label != '',
              child: GestureDetector(

                onTap: () {
                  if (controller.label != '') {

                    switch (controller.label) {
                      case '0 Anger':
                        print('Anger ...........................');
                        _showBottomSheet(context , 'Anger:  \n\n1. Take deep breaths and count to ten before reacting. \n2. Engage in physical activity to help release tension.  \n3. Practice relaxation techniques like meditation or yoga.');
                        break;
                      case '1 Contempt':
                        print('1 Contempt........................');
                        _showBottomSheet(context , 'Contempt:  \n\n1. Reflect on the reasons behind your feelings and try to address the root cause.\n2. Communicate directly and honestly with the person involved5.\n3. Focus on empathy to understand the other person');
                        break;
                      case '2 Disgust........................':
                        print('Disgust');
                        _showBottomSheet(context , 'Disgust: \n\n1. Acknowledge your feelings without judgment and allow yourself to feel them fully before letting them go. \n2. Identify the trigger that caused your disgust and consider if there’s a way to avoid or address it in the future.\n3. Shift your focus to something pleasant or neutral to change your emotional state.');

                        break;
                      case '3 Fear........................':
                        print('Fear');
                        _showBottomSheet(context , 'Fear:  \n\n1. Recognize that fear is often rooted in the unknown; gather more information about what you’re afraid of to demystify it.\n2. Use visualization techniques to imagine yourself successfully handling the situation you’re afraid of.\n3. Build a support system of friends or family who can provide comfort and advice when you’re feeling scared.');

                        break;
                      case '4 Happy........................':
                        print('Happy');
                        _showBottomSheet(context , 'Happiness: \n\n1. Savor the moment by being fully present and mindful of your joy.\n2. Share your happiness with others to spread the positive emotions.\n3. Express gratitude for what’s making you happy, as it can prolong the feeling.');

                        break;
                      case '5 Sadness........................':
                        print('Sadness');
                        _showBottomSheet(context , 'Sadness: \n\n1. Allow yourself to grieve or feel sad, recognizing it as a natural and healthy emotion.\n2. Seek out comforting activities, such as reading a book or listening to music.\n3. Reach out to someone you trust to talk about your feelings.');

                        break;
                      case '6 Surprise........................':
                        print('Surprise');
                        _showBottomSheet(context , 'Surprise:\n\n1.Take a moment to process the unexpected event before reacting.\n2. Evaluate the surprise—is it positive, negative, or neutral? This can guide your response.\n3. Adapt to the situation by staying flexible and open-minded about the change.');

                        break;
                      default:
                        print('Unknown');
                    }
                  } else {
                    // Do something when the switch is OFF
                  }


                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 18),
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'Get Advice',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }),
    );
  }
}
