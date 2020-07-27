import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:spalospeludosapp/backend/bloc/agended_dates_bloc/agended_dates_bloc.dart';

class AgendedDatesPage extends StatelessWidget {
  const AgendedDatesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle title = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
    DateTime agendDateTime;
    String observations;

    return BlocListener<AgendedDatesBloc, AgendedDatesState>(
      listener: (context, state) {
        print("state is $state");
      },
      child: BlocBuilder<AgendedDatesBloc, AgendedDatesState>(
        builder: (context, state) {
          if (state is AgendedDatesLoading) {
            BlocProvider.of<AgendedDatesBloc>(context).add(LoadAgendedDates());
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AgendedDatesLoaded) {
            return Container(
              child: ListView.builder(
                itemCount: state.agendedDates.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.pets),
                      title: Text(state.agendedDates[index].pet),
                      subtitle: Text(state.agendedDates[index].breed),
                      trailing: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(state.agendedDates[index].name),
                          Text(state.agendedDates[index].phone.toString())
                        ],
                      ),
                      onTap: () =>
                          BlocProvider.of<AgendedDatesBloc>(context).add(
                        LoadAgendDetail(
                          state.agendedDates[index],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (state is AgendDetail) {
            return SingleChildScrollView(
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Agenda de ${state.agend.pet}",
                        style: title,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.pets),
                          title: Text("Fecha y Hora: "),
                          subtitle: Text("${state.agend.date}"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.pets),
                          title: Text("Observaciones: "),
                          subtitle: Text("${state.agend.observations}"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.pets),
                          title: Text("Peludito: "),
                          subtitle: Text("${state.agend.pet}"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.radio_button_unchecked),
                          title: Text("Raza: "),
                          subtitle: Text("${state.agend.breed}"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.person),
                          title: Text("Dueño: "),
                          subtitle: Text("${state.agend.name}"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.phone_in_talk),
                          title: Text("Telefono: "),
                          subtitle: Text("${state.agend.phone}"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.location_on),
                          title: Text("Direccion: "),
                          subtitle: Text("${state.agend.address}"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.email),
                          title: Text("Correo Electronico: "),
                          subtitle: Text("${state.agend.email}"),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                            color: Colors.red,
                            onPressed: () =>
                                BlocProvider.of<AgendedDatesBloc>(context).add(
                              LoadAgendedDates(),
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
                                BlocProvider.of<AgendedDatesBloc>(context).add(
                              LoadAgendedDates(),
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
                                                  locale: Locale('es'),
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
                                                  // BlocProvider.of<AgendedDatesBloc>(
                                                  //         context)
                                                  //     .add(
                                                  //   AddAgend(
                                                  //     agend: state.agend,
                                                  //     observations:
                                                  //         observations,
                                                  //     reservationDate:
                                                  //         agendDateTime,
                                                  //   ),
                                                  // );
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
