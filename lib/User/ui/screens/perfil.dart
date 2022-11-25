
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/User/bloc/auth_cubit.dart';

import 'package:untitled/widgets/normal_button.dart';



import '../../model/User.dart';
import 'login.dart';



class perfil_screen extends StatelessWidget {
  const perfil_screen({Key? key}) : super(key: key);

  static Widget create(BuildContext context) => const perfil_screen();

  /*
  static Widget create(BuildContext context){
    return BlocProvider(
      create: (_) => UserCubit(UserRepository())..getMyUser(),
      child :  perfil_screen(),
    );

   */


  @override
  Widget build(BuildContext context) {
    // return Text("hola");

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Salir',
              onPressed: () =>
                 // context.read<AuthCubit>().signOut(),

                Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => new login_screen())


          )
          ),
        ],
      ),
    );
  }
}

     /*
      body: BlocBuilder<UserCubit, UserState>(

        builder: (_, state) {
          if (state is UserReadyState) {
            return _UserSection(
              user: state.user,
              pickedImage: state.pickedImage,
              isSaving: state.isSaving,
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
    /*
        body:BlocBuilder<UserCubit,UserState>(
          builder: (_,state) {
            if(state is UserReadyState){
              return _UserSection(
                user: state.user,
                pickedImage: state.pickedImage,
                isSaving: state.isSaving,
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
    );

     */
  }
}
/*

      */
class _UserSection extends StatefulWidget{
  final myUser? user;
  final File? pickedImage;
  final bool isSaving;


  const _UserSection({this.user, this.pickedImage, this.isSaving = false});

  @override
  _UserSectionState createState() => _UserSectionState();
}
  
class _UserSectionState extends State<_UserSection> {
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();
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
                final myUserCubit = context.read<UserCubit>();
                final pickedImage = await picker.pickImage(source: ImageSource.gallery);
                if(pickedImage!=null)
                  myUserCubit.setImage(File(pickedImage.path));
                },
                child : Center(
                    child: ClipOval(
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: image,
                    ),
                    ),
                ),
            ),
            SizedBox(height: 8),
            BlocBuilder<AuthCubit,AuthState>(
                //buildWhen: (_, current) => current is AuthtSignedIn,
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
              controller: _emailController,
              decoration: InputDecoration(
                  labelText: 'email'),
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
                    onPressed: widget.isSaving ? null : () {
                      context.read<UserCubit>().saveMyUser(
                          (context.read<AuthCubit>().state as AuthtSignedIn).user.uid,
                          _nameController.text,
                          _lastNameController.text,
                          int.tryParse(_ageController.text) ?? 0,
                          _emailController.text,
                      [],[]
                      );
                      },
                  child: const Text('Guardar'),
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

 */
  




