import 'package:flutter/material.dart';
import 'package:rules/rules.dart';

class CreateCollectionDialouge extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController collectionNameController;
  final VoidCallback saveChanges;
  final bool edit;
  const CreateCollectionDialouge(
      {Key key,
      this.formKey,
      this.collectionNameController,
      this.saveChanges,
      this.edit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.only(top: 16.0, left: 16, right: 16),
      contentPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      title: Text(edit ? "Choose new name" : 'Create new collection'),
      content: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  left: 16.0,
                  right: 16.0,
                  bottom: 24.0,
                ),
                child: TextFormField(
                  maxLines: null,
                  minLines: 1,
                  controller: collectionNameController,
                  validator: (name) {
                    final rule = Rule(
                      name,
                      name: "Name",
                      isRequired: true,
                      minLength: 1,
                      maxLength: 1000,
                    );

                    return rule.hasError ? rule.error : null;
                  },
                  decoration: InputDecoration(
                    hintText: "The summer collection.",
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                child: SizedBox.expand(
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0),
                      ),
                    ),
                    padding: EdgeInsets.zero,
                    child: Text(
                      edit ? 'Edit' : 'Create',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: saveChanges,
                    color: Colors.redAccent,
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
