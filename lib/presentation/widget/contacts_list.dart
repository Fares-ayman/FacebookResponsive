import 'package:facebook/domain/entities/user_entity.dart';
import 'package:facebook/presentation/widget/profile_avatar.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  final List<UserEntity>users;
  const ContactsList({Key? key,required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 280.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Contacts",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              Icon(Icons.video_call,color: Colors.grey[600],),
              SizedBox(width: 10.0,),
              Icon(Icons.search,color: Colors.grey[600],),
              SizedBox(width: 10.0,),
              Icon(Icons.more_horiz,color: Colors.grey[600],),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              itemCount: users.length,
              itemBuilder: (context,index){
                final UserEntity user=users[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: InkWell(
                    onTap: ()=>print("User Card"),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ProfileAvatar(imageUrl: user.imageUrl),
                        SizedBox(width: 6.0,),
                        Flexible(child: Text("${user.name}",style: TextStyle(fontSize:16.0,fontWeight: FontWeight.w500 ),overflow: TextOverflow.ellipsis,)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
