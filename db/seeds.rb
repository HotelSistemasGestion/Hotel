# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
TypeOfRoom.create(tipo: "simple",descripcion:"");
TypeOfRoom.create(tipo: "doble",descripcion:"");
TypeOfRoom.create(tipo: "matrimonial",descripcion:"");
TypeOfRoom.create(tipo: "suite",descripcion:"");

State.create(descripcion: "libre");
State.create(descripcion: "ocupado");
State.create(descripcion: "reservado");
State.create(descripcion: "fuera de servicio");

Comfort.create(descripcion: "cama doble");
Comfort.create(descripcion: "aire acondicionado");
Comfort.create(descripcion: "television por cable");
Comfort.create(descripcion: "frizzer");

Room.create(type_of_room_id: 1,state_id: 1, capacidad: 2, identificador:"A1");
RoomComfort.create(room_id: 1 , comfort_id: 1);
RoomComfort.create(room_id: 1 , comfort_id: 2);
Photo.create(room_id: 1, my_file:"image/upload/v1477017980/dszqxru3husf5tv6toxg.jpg");

#Service.create(nombre: "TV cable",descripcion: "900 canales",precio: 20000);
#Service.create(nombre: "TV cable Nacionales",descripcion: "100 canales",precio: 10000);
TypesOfEmployee.create(tipo: "administrador", descripcion: "");
TypesOfEmployee.create(tipo: "limpiadora", descripcion: "");
TypesOfEmployee.create(tipo: "botones", descripcion: "");

Employee.create(nombre: "Pedro", types_of_employee_id: 2,);
