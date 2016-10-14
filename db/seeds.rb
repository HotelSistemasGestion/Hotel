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
Service.create(nombre: "TV cable",descripcion: "900 canales",precio: 20000);
Service.create(nombre: "TV cable Nacionales",descripcion: "100 canales",precio: 10000);
TypesOfEmployee.create(tipo: "administrador", descripcion: "");
TypesOfEmployee.create(tipo: "limpiadora", descripcion: "");
TypesOfEmployee.create(tipo: "botones", descripcion: "");
