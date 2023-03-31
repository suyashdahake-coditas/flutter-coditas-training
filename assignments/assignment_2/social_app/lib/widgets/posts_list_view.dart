import 'package:flutter/material.dart';
import 'package:social_app/dummyData.dart';

class PostsListView extends StatelessWidget {
  const PostsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: postsData.length,
        itemBuilder: (context, index) => Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 0,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    SizedBox(
                      height: 30,
                      child: Image.asset(postsData[index].userProfilePic),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        postsData[index].userName,
                        style: const TextStyle(
                            fontSize: 15, fontFamily: 'Circular-Std'),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      '1 hour ago',
                      style: TextStyle(
                        color: Color(0xFFbdbdbd),
                      ),
                    )
                  ],
                ),
              ),
              Image.asset(postsData[index].postPic),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 20,
                  child: Row(
                    children: [
                      Image.asset('assets/images/plus-circle.png'),
                      const Spacer(),
                      Text(postsData[index].commentsNo.toString(),style: const TextStyle(fontSize: 15,color: Color(0XFF828282),),),
                      const SizedBox(width: 5,),
                      Image.asset('assets/images/Chat.png'),
                      const SizedBox(width: 10,),
                      Text(postsData[index].likes.toString(),style: const TextStyle(fontSize: 15,color: Color(0XFF828282),),),
                      const SizedBox(width: 5,),
                      Image.asset('assets/images/heart.png'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
