import "package:flutter/material.dart";
import 'package:vidz_upload/controller/auth_controller.dart';
import "package:vidz_upload/view/widget/glitch.dart";
import "package:vidz_upload/view/widget/textinputfield.dart";

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _setpasswordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();

  //for image pick

  // String? imagePath;
  // ImagePicker pick = ImagePicker();
  // XFile? imageFile;
  //
  // File? _photo;
  // File? image;
  // final ImagePicker _picker = ImagePicker();
  // Future imgFromGallery() async {
  //   final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //
  //   setState(() {
  //     if (pickedFile != null) {
  //       _photo = File(pickedFile.path);
  //     } else {
  //       print('No image selected.');
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap method for remove keyboard while touch on screen
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 100),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const GlithEffect(
                    child: Text(
                      "Welcome to Person Vidz ",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                    )),
                const SizedBox(
                  height: 30,
                ),
                // pick image from gallary
                // InkWell(
                //   onTap: () {
                //     imgFromGallery();
                //   },
                //   child: CircleAvatar(
                //     radius: 50,
                //     backgroundColor: Colors.black,
                //     child: _photo != null
                //         ? ClipRRect(
                //             borderRadius: BorderRadius.circular(50),
                //             child: Image.file(_photo!,
                //                 width: 100, height: 100, fit: BoxFit.fitHeight),
                //           )
                //         : Container(
                //             decoration: BoxDecoration(
                //                 color: Colors.grey[200],
                //                 borderRadius: BorderRadius.circular(50)),
                //             width: 100,
                //             height: 100,
                //             child: Icon(
                //               Icons.camera_alt,
                //               color: Colors.grey[800],
                //             ),
                //           ),
                //   ),
                // ),
                InkWell(onTap: () {
                  AuthController.instance.pickImage();
                },
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage("images/default.jpeg"),
                        radius: 60,
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: const Icon(
                                Icons.edit,
                                size: 20,
                                color: Colors.black,
                              )))
                    ],
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextInputField(
                      controller: _usernameController,
                      myIcon: Icons.person,
                      myLableText: "User Name"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextInputField(
                      controller: _emailController,
                      myIcon: Icons.email,
                      myLableText: "Email"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextInputField(
                    controller: _setpasswordController,
                    myIcon: Icons.lock,
                    myLableText: "Set Password",
                    toHide: true,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child:TextInputField(
                      controller: _confirmpasswordController,
                      myIcon: Icons.lock,
                      myLableText: "Confirm Password"),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      AuthController.instance.Signup(
                          _usernameController.text.trim(),
                          _emailController.text.trim(),
                          _setpasswordController.text.trim(),
                          AuthController.instance.proimg);
                    },
                    child: Container(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        child: const Text("Sign Up")))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
