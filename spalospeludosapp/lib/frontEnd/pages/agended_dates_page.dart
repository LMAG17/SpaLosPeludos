import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spalospeludosapp/backend/bloc/agended_dates_bloc/agended_dates_bloc.dart';

class AgendedDatesPage extends StatelessWidget {
  const AgendedDatesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle title = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
    String total;
    String comments;

    return BlocListener<AgendedDatesBloc, AgendedDatesState>(
      listener: (context, state) {
        print("state is $state");
      },
      child: BlocBuilder<AgendedDatesBloc, AgendedDatesState>(
        builder: (context, state) {
          if (state is AgendedDatesLoading) {
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
                      title: Text(state.agendedDates[index].data.pet),
                      subtitle: Text(state.agendedDates[index].data.breed),
                      trailing: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(state.agendedDates[index].data.name),
                          Text(state.agendedDates[index].data.phone.toString())
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
                        "Agenda de ${state.agend.data.pet}",
                        style: title,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.pets),
                          title: Text("Fecha y Hora: "),
                          subtitle: Text("${state.agend.data.date}"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.pets),
                          title: Text("Observaciones: "),
                          subtitle: Text("${state.agend.data.observations}"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.pets),
                          title: Text("Peludito: "),
                          subtitle: Text("${state.agend.data.pet}"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.radio_button_unchecked),
                          title: Text("Raza: "),
                          subtitle: Text("${state.agend.data.breed}"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.person),
                          title: Text("Dueño: "),
                          subtitle: Text("${state.agend.data.name}"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.phone_in_talk),
                          title: Text("Telefono: "),
                          subtitle: Text("${state.agend.data.phone}"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.location_on),
                          title: Text("Direccion: "),
                          subtitle: Text("${state.agend.data.address}"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.email),
                          title: Text("Correo Electronico: "),
                          subtitle: Text("${state.agend.data.email}"),
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
                                          TextField(
                                            keyboardType: TextInputType.numberWithOptions(),
                                            onChanged: (obs) {
                                              total = obs;
                                            },
                                            decoration: InputDecoration(
                                                labelText:
                                                    "Total recibido:"),
                                          ),
                                          TextField(
                                            onChanged: (obs) {
                                              comments = obs;
                                            },
                                            decoration: InputDecoration(
                                                labelText:
                                                    "Agregar Comentarios (Para el cliente):"),
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
                                                  BlocProvider.of<AgendedDatesBloc>(
                                                          context)
                                                      .add(
                                                    CompleteDate(
                                                      agend: state.agend,
                                                      comments:
                                                          comments,
                                                      total:
                                                          total,
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
                              "Completar Cita",
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
