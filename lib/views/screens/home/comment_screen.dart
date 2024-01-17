import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktokclone/controllers/comment_controller.dart';

class CommentScreen extends StatelessWidget {
  CommentScreen({super.key});

  final textController = TextEditingController();
  final commentsController = Get.put(CommentController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.black,
                        backgroundImage: NetworkImage('profile photo'),
                      ),
                      title: Row(
                        children: [
                          Text(
                            'userName',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Comment Description',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            'date',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'userName',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                      trailing: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    );
                  },
                ),
              ),
              const Divider(),
              ListTile(
                title: TextFormField(
                  controller: textController,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Comment',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                trailing: TextButton(
                  onPressed: () => commentsController.postComment(
                    textController.text,
                  ),
                  child: const Text(
                    'Send',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
