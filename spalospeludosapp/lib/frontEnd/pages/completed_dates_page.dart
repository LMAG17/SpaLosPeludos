import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:spalospeludosapp/backend/bloc/complete_dates_bloc/complete_dates_bloc.dart';

class CompletedDatesPage extends StatelessWidget {
  const CompletedDatesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle title = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
    // DateTime dateDateTime;
    // String observations;

    return BlocListener<CompletedDatesBloc, CompletedDatesState>(
      listener: (context, state) {
        print("state is $state");
      },
      child: BlocBuilder<CompletedDatesBloc, CompletedDatesState>(
        builder: (context, state) {
          if (state is CompletedDatesLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CompletedDatesLoaded) {
            return Container(
              child: ListView.builder(
                itemCount: state.completedDates.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.pets),
                      title: Text(state.completedDates[index].data.pet),
                      subtitle: Text(state.completedDates[index].data.breed),
                      trailing: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(state.completedDates[index].data.name),
                          Text(state.completedDates[index].data.phone.toString())
                        ],
                      ),
                      onTap: () =>
                          BlocProvider.of<CompletedDatesBloc>(context).add(
                        LoadCompleteDetail(
                          state.completedDates[index],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (state is CompleteDetail) {
            return SingleChildScrollView(
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Completea de ${state.date.data.pet}",
                        style: title,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.pets),
                          title: Text("Fecha y Hora: "),
                          subtitle: Text("${state.date.data.date}"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.pets),
                          title: Text("Observaciones: "),
                          subtitle: Text("${state.date.data.observations}"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.pets),
                          title: Text("Peludito: "),
                          subtitle: Text("${state.date.data.pet}"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.radio_button_unchecked),
                          title: Text("Raza: "),
                          subtitle: Text("${state.date.data.breed}"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.person),
                          title: Text("Dueño: "),
                          subtitle: Text("${state.date.data.name}"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.phone_in_talk),
                          title: Text("Telefono: "),
                          subtitle: Text("${state.date.data.phone}"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.location_on),
                          title: Text("Direccion: "),
                          subtitle: Text("${state.date.data.address}"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.email),
                          title: Text("Correo Electronico: "),
                          subtitle: Text("${state.date.data.email}"),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                            color: Colors.red,
                            onPressed: () =>
                                BlocProvider.of<CompletedDatesBloc>(context).add(
                              LoadCompletedDates(),
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
                                BlocProvider.of<CompletedDatesBloc>(context).add(
                              LoadCompletedDates(),
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
                                            "Agrega datos para la datea",
                                            style: title,
                                          ),
                                          DateTimeField(
                                            decoration: InputDecoration(
                                              labelText:
                                                  "Selecciona una fecha:",
                                            ),
                                            onChanged: (dateTime) {
                                              //dateDateTime = dateTime;
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
                                              // observations = obs;
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
                                                  // BlocProvider.of<CompletedDatesBloc>(
                                                  //         context)
                                                  //     .add(
                                                  //   AddComplete(
                                                  //     date: state.date,
                                                  //     observations:
                                                  //         observations,
                                                  //     reservationDate:
                                                  //         dateDateTime,
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
                              "Completear",
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
