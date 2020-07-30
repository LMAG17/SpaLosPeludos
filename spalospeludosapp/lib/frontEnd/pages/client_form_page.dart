import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:spalospeludosapp/backend/bloc/user_form_bloc/bloc.dart';

class ClientFormsPage extends StatefulWidget {
  ClientFormsPage({Key key}) : super(key: key);

  @override
  _ClientFormsPageState createState() => _ClientFormsPageState();
}

class _ClientFormsPageState extends State<ClientFormsPage> {
  TextStyle title = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  DateTime agendDateTime;
  String observations;
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserFormBloc, UserFormState>(
      listener: (context, state) {
        print("state is $state");
      },
      child: BlocBuilder<UserFormBloc, UserFormState>(
        builder: (context, state) {
          if (state is UserFormLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserFormLoaded) {
            return Container(
              child: ListView.builder(
                itemCount: state.userForms.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.pets),
                      title: Text(state.userForms[index].data.pet),
                      subtitle: Text(state.userForms[index].data.breed),
                      trailing: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(state.userForms[index].data.name),
                          Text(state.userForms[index].data.phone.toString())
                        ],
                      ),
                      onTap: () => BlocProvider.of<UserFormBloc>(context)
                          .add(Agend(userForm: state.userForms[index])),
                    ),
                  );
                },
              ),
            );
          } else if (state is Agending) {
            return SingleChildScrollView(
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Agendando",
                        style: title,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.pets),
                          title: Text("Peludito: "),
                          subtitle: Text("${state.userForm.data.pet}"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.radio_button_unchecked),
                          title: Text("Raza: "),
                          subtitle: Text("${state.userForm.data.breed}"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.person),
                          title: Text("Dueño: "),
                          subtitle: Text("${state.userForm.data.name}"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.phone_in_talk),
                          title: Text("Telefono: "),
                          subtitle: Text("${state.userForm.data.phone}"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.location_on),
                          title: Text("Direccion: "),
                          subtitle: Text("${state.userForm.data.address}"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.email),
                          title: Text("Correo Electronico: "),
                          subtitle: Text("${state.userForm.data.email}"),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                            color: Colors.red,
                            onPressed: () =>
                                BlocProvider.of<UserFormBloc>(context).add(
                              LoadUserForm(),
                            ),
                            child: Text(
                              "Eliminar",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          RaisedButton(
                            color: Colors.yellow,
                            onPressed: () =>
                                BlocProvider.of<UserFormBloc>(context).add(
                              LoadUserForm(),
                            ),
                            child: Text(
                              "Cancelar",
                            ),
                          ),
                          RaisedButton(
                            color: Colors.green,
                            onPressed: () {
                              showDialog(
                                context: context,
                                child: Dialog(
                                  insetPadding: EdgeInsets.all(16),
                                  child: Card(
                                    child: Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Text(
                                            "Agrega datos para la agenda",
                                            style: title,
                                          ),
                                          DateTimeField(
                                            decoration: InputDecoration(
                                              labelText:
                                                  "Selecciona una fecha:",
                                            ),
                                            onChanged: (dateTime) {
                                              agendDateTime = dateTime;
                                            },
                                            onShowPicker:
                                                (context, currentValue) async {
                                              final date = await showDatePicker(
                                                  context: context,
                                                  firstDate: DateTime(1900),
                                                  initialDate: currentValue ??
                                                      DateTime.now(),
                                                  lastDate: DateTime(2100));
                                              if (date != null) {
                                                final time =
                                                    await showTimePicker(
                                                  context: context,
                                                  initialTime:
                                                      TimeOfDay.fromDateTime(
                                                          currentValue ??
                                                              DateTime.now()),
                                                );
                                                return DateTimeField.combine(
                                                    date, time);
                                              } else {
                                                return currentValue;
                                              }
                                            },
                                            format:
                                                DateFormat("yyyy-MM-dd HH:mm"),
                                          ),
                                          TextField(
                                            onChanged: (obs) {
                                              observations = obs;
                                            },
                                            decoration: InputDecoration(
                                                labelText:
                                                    "Agregar Observaciones:"),
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              RaisedButton(
                                                color: Colors.red,
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "Cancelar",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              RaisedButton(
                                                color: Colors.green,
                                                onPressed: () {
                                                  BlocProvider.of<UserFormBloc>(
                                                          context)
                                                      .add(
                                                    AddAgend(
                                                      userForm: state.userForm,
                                                      observations:
                                                          observations,
                                                      reservationDate:
                                                          agendDateTime,
                                                    ),
                                                  );
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "Confirmar",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              "Agendar",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: Text(state.toString()),
            );
          }
        },
      ),
    );
  }
}
