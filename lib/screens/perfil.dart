
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/util/gradientBack.dart';

import 'package:untitled/util/normal_button.dart';



import '../../../modelos/User.dart';
import '../util/button_bar.dart';
import '../util/user_info.dart';
import '../../../screens/login.dart';



class perfil_screen extends StatelessWidget {

  //MyUser user;

  perfil_screen();
  //static Widget create(BuildContext context) =>  perfil_screen(user: user);

  @override
  Widget build(BuildContext context) {

    final user = FirebaseAuth.instance.currentUser;




    // return Text("hola");

    final header = Stack(
        children: [
          gradientBack("Perfil"),
          user_info(),
        ]
    );

    return Scaffold(
      body: ListView(
            children: [
              header,
              button_bar(),
              description_txt("Nombre:",""),
              description_txt("Apellidos:", ""),
              description_txt("Email:", ""),
              description_txt("Años:", ""),
              description_txt("Puesto de trabajo:", ""),
        ]
        ),
    );
  }
}
class description_txt extends StatelessWidget {

  String titulo = "";
  String txt = "";

  description_txt(this.titulo, this.txt);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Text(
            "Nombre",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(txt, style: TextStyle(
            color: Colors.black26,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
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
  




