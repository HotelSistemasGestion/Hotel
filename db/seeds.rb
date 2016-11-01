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
Service.create(nombre: "Lavanderia",descripcion: "Lavado y planchado",precio: 50000);
TypesOfEmployee.create(tipo: "administrador", descripcion: "");
TypesOfEmployee.create(tipo: "limpiadora", descripcion: "");
TypesOfEmployee.create(tipo: "botones", descripcion: "");

Room.create(type_of_room_id: 1,state_id: 1 ,capacidad: 2,identificador: 's',precio: 10000);

AccountingYear.create(anho: "2016",estado: "actual");
AccountingYear.create(anho: "2015",estado: "antiguo");
AccountingYear.create(anho: "2014",estado: "antiguo");
AccountingEntry.create(numero:"1",fecha:"2016/05/15",iva: "0",debe: "10000",haber: "0");
AccountingEntry.create(numero:"1",fecha:"2016/05/15",iva: "0",debe: "0",haber: "10000");
AccountingEntry.create(numero:"2",fecha:"2016/06/11",iva: "0",debe: "1000",haber: "0");
AccountingEntry.create(numero:"2",fecha:"2016/06/11",iva: "0",debe: "0",haber: "1000");
AccountingEntry.create(numero:"3",fecha:"2016/07/18",iva: "0",debe: "100",haber: "0");
AccountingEntry.create(numero:"3",fecha:"2016/07/18",iva: "0",debe: "0",haber: "100");
AccountingEntry.create(numero:"4",fecha:"2016/08/01",iva: "0",debe: "100000",haber: "0");
AccountingEntry.create(numero:"4",fecha:"2016/08/01",iva: "0",debe: "0",haber: "100000");
AccountingEntry.create(numero:"5",fecha:"2016/09/23",iva: "0",debe: "20000",haber: "0");
AccountingEntry.create(numero:"5",fecha:"2016/09/23",iva: "0",debe: "0",haber: "20000");
AccountingEntry.create(numero:"6",fecha:"2016/10/15",iva: "0",debe: "4000",haber: "0");
AccountingEntry.create(numero:"6",fecha:"2016/10/15",iva: "0",debe: "0",haber: "4000");
AccountingEntry.create(numero:"7",fecha:"2016/10/19",iva: "0",debe: "20000",haber: "0");
AccountingEntry.create(numero:"7",fecha:"2016/10/19",iva: "0",debe: "0",haber: "20000");
AccountingEntry.create(numero:"8",fecha:"2016/10/25",iva: "0",debe: "10000",haber: "0");
AccountingEntry.create(numero:"8",fecha:"2016/10/25",iva: "0",debe: "0",haber: "10000");
AccountingAccount.create(grupo:"00",nombre:"Cuentas por cobrar",imputable:"true");
AccountingAccount.create(grupo:"01",nombre:"Clientes",imputable:"true");
AccountingAccount.create(grupo:"00",nombre:"Ingreso",imputable:"true");
AccountingAccount.create(grupo:"01",nombre:"Ingreso de Habitacion",imputable:"true");
AccountingAccount.create(grupo:"001",nombre:"Habitacion",imputable:"true");
AccountingAccount.create(grupo:"02",nombre:"Ingreso de Alimentacion",imputable:"true");
AccountingAccount.create(grupo:"001",nombre:"Restaurant",imputable:"true");
AccountingAccount.create(grupo:"002",nombre:"RoomService",imputable:"true");
AccountingAccount.create(grupo:"03",nombre:"Ingreso de Bebidas",imputable:"true");
AccountingAccount.create(grupo:"001",nombre:"Bebidas",imputable:"true");
AccountingAccount.create(grupo:"04",nombre:"Ingreso de Telefono",imputable:"true");
AccountingAccount.create(grupo:"001",nombre:"Llamadas internacionales",imputable:"true");
AccountingAccount.create(grupo:"002",nombre:"Llamadas locales",imputable:"true");
AccountPlan.create(accounting_year_id: "1",descripcion:"no se",estado:"vigente",version:"1");
AccountXPlan.create(account_plan_id:"1",accounting_account_id:"1",cuenta_superior:"1");
AccountXPlan.create(account_plan_id:"1",accounting_account_id:"2",cuenta_superior:"1");
AccountXPlan.create(account_plan_id:"1",accounting_account_id:"3",cuenta_superior:"2");
AccountXPlan.create(account_plan_id:"1",accounting_account_id:"4",cuenta_superior:"2");
AccountXPlan.create(account_plan_id:"1",accounting_account_id:"5",cuenta_superior:"2.1");
AccountXPlan.create(account_plan_id:"1",accounting_account_id:"6",cuenta_superior:"2");
AccountXPlan.create(account_plan_id:"1",accounting_account_id:"7",cuenta_superior:"2.2");
AccountXPlan.create(account_plan_id:"1",accounting_account_id:"8",cuenta_superior:"2.02");
AccountXPlan.create(account_plan_id:"1",accounting_account_id:"9",cuenta_superior:"2");
AccountXPlan.create(account_plan_id:"1",accounting_account_id:"10",cuenta_superior:"2.3");
AccountXPlan.create(account_plan_id:"1",accounting_account_id:"11",cuenta_superior:"2");
AccountXPlan.create(account_plan_id:"1",accounting_account_id:"12",cuenta_superior:"2.4");
AccountXPlan.create(account_plan_id:"1",accounting_account_id:"13",cuenta_superior:"2.4");
AccountXEntry.create(accounting_entry_id:"1",accounting_account_id:"2",monto:"20000",observacion:"Hospedaje",tipo:"A");
AccountXEntry.create(accounting_entry_id:"2",accounting_account_id:"5",monto:"20000",observacion:"Hospedaje",tipo:"D");
AccountXEntry.create(accounting_entry_id:"3",accounting_account_id:"2",monto:"20000",observacion:"Sector Bar y Restaurant ",tipo:"A");
AccountXEntry.create(accounting_entry_id:"4",accounting_account_id:"7",monto:"20000",observacion:"Sector Bar y Restaurant ",tipo:"D");
AccountXEntry.create(accounting_entry_id:"5",accounting_account_id:"2",monto:"20000",observacion:"Servicio para habitaciones",tipo:"A");
AccountXEntry.create(accounting_entry_id:"6",accounting_account_id:"8",monto:"20000",observacion:"Servicio para habitaciones",tipo:"D");
AccountXEntry.create(accounting_entry_id:"7",accounting_account_id:"2",monto:"20000",observacion:"Hospedaje",tipo:"A");
AccountXEntry.create(accounting_entry_id:"8",accounting_account_id:"5",monto:"20000",observacion:"Hospedaje",tipo:"D");
AccountXEntry.create(accounting_entry_id:"9",accounting_account_id:"2",monto:"20000",observacion:"Servicio para habitaciones",tipo:"A");
AccountXEntry.create(accounting_entry_id:"10",accounting_account_id:"8",monto:"20000",observacion:"Servicio para habitaciones",tipo:"D");
AccountXEntry.create(accounting_entry_id:"11",accounting_account_id:"2",monto:"20000",observacion:"Hospedaje",tipo:"A");
AccountXEntry.create(accounting_entry_id:"12",accounting_account_id:"5",monto:"20000",observacion:"Hospedaje",tipo:"D");
AccountXEntry.create(accounting_entry_id:"13",accounting_account_id:"2",monto:"20000",observacion:"Telefono y telecomunicaciones",tipo:"A");
AccountXEntry.create(accounting_entry_id:"14",accounting_account_id:"12",monto:"20000",observacion:"Telefono y telecomunicaciones",tipo:"D");


Room.create(type_of_room_id: 1,state_id: 1, capacidad: 2, identificador:"A1");
RoomComfort.create(room_id: 1 , comfort_id: 1);
RoomComfort.create(room_id: 1 , comfort_id: 2);
Photo.create(room_id: 1, my_file:"image/upload/v1477017980/dszqxru3husf5tv6toxg.jpg");

#Service.create(nombre: "TV cable",descripcion: "900 canales",precio: 20000);
#Service.create(nombre: "TV cable Nacionales",descripcion: "100 canales",precio: 10000);

TypesOfEmployee.create(tipo: "administrador", descripcion: "");
TypesOfEmployee.create(tipo: "limpiadora", descripcion: "");
TypesOfEmployee.create(tipo: "botones", descripcion: "");

Employee.create(nombre: "Pedro", types_of_employee_id: 2);

User.create(:email => "admin@gmail.com", :password => '123456', :password_confirmation => '123456',roles_mask:1);

ReservationRequest.create(nombre: "Leo", apellido: "Messi", email: "messi@gmail.com", telefono: "0012", type_of_room_id: 3, cantidad_de_adultos: 1, cantidad_de_ninhos: 1, cantidad_de_familias: 1, check_in: (Date.today+1).to_s, check_out: (Date.today+7).to_s, comentarios: "");
ReservationRequest.create(nombre: "Matias", apellido: "Gonzalez", email: "maedgoro@gmail.com", telefono: "0012", type_of_room_id: 3, cantidad_de_adultos: 1, cantidad_de_ninhos: 1, cantidad_de_familias: 1, check_in: (Date.today+1).to_s, check_out: (Date.today+7).to_s, comentarios: "");
ReservationRequest.create(nombre: "Matias", apellido: "Gonzalez", email: "maedgoro@gmail.com", telefono: "0012", type_of_room_id: 3, cantidad_de_adultos: 1, cantidad_de_ninhos: 1, cantidad_de_familias: 1, check_in: (Date.today+1).to_s, check_out: (Date.today+7).to_s, comentarios: "");
ReservationRequest.create(nombre: "Mirta", apellido: "Arambulo", email: "mirtambulo@gmail.com", telefono: "0012", type_of_room_id: 1, cantidad_de_adultos: 1, cantidad_de_ninhos: 1, cantidad_de_familias: 1, check_in: (Date.today+1).to_s, check_out: (Date.today+3).to_s, comentarios: "");
ReservationRequest.create(nombre: "Katya", apellido: "Chaparro", email: "katya.chaparro.2010@gmail.com", telefono: "0012", type_of_room_id: 2, cantidad_de_adultos: 1, cantidad_de_ninhos: 1, cantidad_de_familias: 1, check_in: (Date.today+1).to_s, check_out: (Date.today+5).to_s, comentarios: "");
ReservationRequest.create(nombre: "Matias", apellido: "Gonzalez", email: "maedgoro@gmail.com", telefono: "0012", type_of_room_id: 3, cantidad_de_adultos: 1, cantidad_de_ninhos: 1, cantidad_de_familias: 1, check_in: (Date.today+1).to_s, check_out: (Date.today+7).to_s, comentarios: "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
ReservationRequest.create(nombre: "Mirta", apellido: "Arambulo", email: "mirtambulo@gmail.com", telefono: "0012", type_of_room_id: 3, cantidad_de_adultos: 1, cantidad_de_ninhos: 1, cantidad_de_familias: 1, check_in: (Date.today+1).to_s, check_out: (Date.today+7).to_s, comentarios: "");
