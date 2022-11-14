
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/login/bloc/UserCubit.dart';
import 'package:untitled/widgets/normal_button.dart';

import '../../bloc/AuthCubit.dart';
import '../../model/User.dart';
import '../../repository/UserRepository.dart';

class perfil extends StatelessWidget {
  static Widget create(BuildContext context){
    return BlocProvider(create: (_) => UserCubit(UserRepository())..getMyUser(),
    child : perfil(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PERFIL"),
          actions: [
            IconButton(
              onPressed: () => context.read<AuthCubit>().signOut(),
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body:BlocBuilder<UserCubit,UserState>(
          builder: (_,state) {
            if(state is UserReadyState){
              return _UserSection(
                user: state.user,
                pickedImage: state.pickedImage,
                isSaving: state.isSaving,
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
    );
  }
}

class _UserSection extends StatefulWidget{
  final myUser? user;
  final File? pickedImage;
  final bool isSaving;


  _UserSection({this.user, this.pickedImage, this.isSaving = false});

  @override
  State<StatefulWidget> createState() => _UserSectionState();
  }
  
  class _UserSectionState extends State<_UserSection> {
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final picker = ImagePicker();

  @override
  void initState(){
    _nameController.text = widget.user?.name ?? '';
    _lastNameController.text = widget.user?.lastname ?? '';
    _ageController.text = widget.user?.age.toString() ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //usuario nuevo(por defecto) -> poner la imagen
    Widget image = Image.asset('', fit:BoxFit.fill
    );
    //selección de imagen por archivo
    if(widget.pickedImage != null){
      image = Image.file(widget.pickedImage!,
        fit: BoxFit.fill,
      );
    }
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: () async{
                final pickedImage = await picker.pickImage(source: ImageSource.gallery);
                if(pickedImage!=null)
                  context.read<UserCubit>().setImage(File(pickedImage.path));
                },
                child : Center(
                    child: ClipOval(
                      child: Container(
                        width: 150,
                        height: 150,
                        child: image,
                    ),
                    ),
                ),
            ),
            SizedBox(height: 8),
            BlocBuilder<AuthCubit,AuthState>(
              buildWhen: (_, current) => current is AuthtSignedIn,
                builder: (_,state){
                return Center(
                  child: Text('UID ${(state as AuthtSignedIn).user.uid}'),
                );
                },
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name'),
            ),
            SizedBox(height: 8,),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(
                  labelText: 'Last name'),
            ),
            SizedBox(height: 8,),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Age'),
            ),
            SizedBox(height: 8,),
            Stack(
              children: [
                ElevatedButton(
                    child: Text("Guardar"),
                    onPressed: widget.isSaving ? null : () {
                      context.read<UserCubit>().saveMyUser(
                          (context.read<AuthCubit>().state as AuthtSignedIn).user.uid,
                          _nameController.text,
                          _lastNameController.text,
                          int.tryParse(_ageController.text) ?? 0,);
                      },
                ),
                if(widget.isSaving)CircularProgressIndicator(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
  



