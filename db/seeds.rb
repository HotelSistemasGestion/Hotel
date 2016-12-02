
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




Service.create(nombre: "TV cable",descripcion: "900 canales",precio: 20000);
Service.create(nombre: "TV cable Nacionales",descripcion: "100 canales",precio: 10000);
Service.create(nombre: "Lavanderia",descripcion: "Lavado y planchado",precio: 50000);

Service.create(nombre: "Desayuno clasico",descripcion: "Valido hasta las 10 p.m.",precio: 18000);
Service.create(nombre: "Pizza familiar",descripcion: "8 porciones",precio: 40000);
Service.create(nombre: "Hamburguesa p/Niños",descripcion: "Porcion pequeña",precio: 6000);

Comfort.create(descripcion: "una estrella",precio: 10000);
Comfort.create(descripcion: "dos estrellas",precio: 20000);
Comfort.create(descripcion: "tres estrellas",precio: 50000);


#AccountingEntry.create(numero:"1",fecha:"2016/05/15",iva: "0",debe: "10000",haber: "0");
#AccountingEntry.create(numero:"1",fecha:"2016/05/15",iva: "10",debe: "0",haber: "10000");
#AccountingEntry.create(numero:"2",fecha:"2016/06/11",iva: "10",debe: "1000",haber: "0");
#AccountingEntry.create(numero:"2",fecha:"2016/06/11",iva: "10",debe: "0",haber: "1000");
#AccountingEntry.create(numero:"3",fecha:"2016/07/18",iva: "10",debe: "100",haber: "0");
#AccountingEntry.create(numero:"3",fecha:"2016/07/18",iva: "10",debe: "0",haber: "100");
#AccountingEntry.create(numero:"4",fecha:"2016/08/01",iva: "10",debe: "100000",haber: "0");
#AccountingEntry.create(numero:"4",fecha:"2016/08/01",iva: "10",debe: "0",haber: "100000");
#AccountingEntry.create(numero:"5",fecha:"2016/09/23",iva: "10",debe: "20000",haber: "0");
#AccountingEntry.create(numero:"5",fecha:"2016/09/23",iva: "10",debe: "0",haber: "20000");
#AccountingEntry.create(numero:"6",fecha:"2016/10/15",iva: "10",debe: "4000",haber: "0");
#AccountingEntry.create(numero:"6",fecha:"2016/10/15",iva: "10",debe: "0",haber: "4000");
#AccountingEntry.create(numero:"7",fecha:"2016/10/19",iva: "10",debe: "20000",haber: "0");
#AccountingEntry.create(numero:"7",fecha:"2016/10/19",iva: "10",debe: "0",haber: "20000");


#AccountingEntry.create(numero:"8",fecha:"2016/11/25",iva: "10",debe: "15000",haber: "0");
#AccountingEntry.create(numero:"8",fecha:"2016/11/25",iva: "10",debe: "10000",haber: "0");
#AccountingEntry.create(numero:"8",fecha:"2016/11/25",iva: "10",debe: "25000",haber: "0");
#AccountingEntry.create(numero:"8",fecha:"2016/11/25",iva: "10",debe: "0",haber: "50000");

#AccountingEntry.create(numero:"9",fecha:"2016/12/25",iva: "10",debe: "54000",haber: "0");
#AccountingEntry.create(numero:"9",fecha:"2016/12/25",iva: "10",debe: "0",haber: "18000");
#AccountingEntry.create(numero:"9",fecha:"2016/12/25",iva: "10",debe: "0",haber: "17000");
#AccountingEntry.create(numero:"9",fecha:"2016/12/25",iva: "10",debe: "0",haber: "19000");

#AccountingEntry.create(numero:"10",fecha:"2016/12/25",iva: "10",debe: "35000",haber: "0");
#AccountingEntry.create(numero:"10",fecha:"2016/12/25",iva: "10",debe: "0",haber: "18000");
#AccountingEntry.create(numero:"10",fecha:"2016/12/25",iva: "10",debe: "0",haber: "17000");


AccountPlan.create(descripcion:"Plan de cuentas 2016",estado:"vigente",version:"1.0.1");
AccountPlan.create(descripcion:"Plan de cuentas 2015",estado:"vigente",version:"1.0.1");

AccountingYear.create(anho: "2016",estado: "vigente",account_plan_id: "1");
AccountingYear.create(anho: "2015",estado: "finalizado",account_plan_id: "2");


AccountingAccount.create(grupo:"1",nombre:"Servicios",imputable:"false",cuenta:"0",ejercicio:"1",parent_id:"1");
AccountingAccount.create(grupo:"111",nombre:"TV cable",imputable:"true",cuenta:"0",ejercicio:"1",parent_id:"1");
AccountingAccount.create(grupo:"112",nombre:"TV cable Nacionales",imputable:"true",cuenta:"0",ejercicio:"1",parent_id:"1");
AccountingAccount.create(grupo:"113",nombre:"Lavanderia",imputable:"true",cuenta:"0",ejercicio:"1",parent_id:"1");
AccountingAccount.create(grupo:"2",nombre:"Restaurant",imputable:"false",cuenta:"0",ejercicio:"1",parent_id:"2");
AccountingAccount.create(grupo:"221",nombre:"Desayuno clasico",imputable:"true",cuenta:"0",ejercicio:"1",parent_id:"2");
AccountingAccount.create(grupo:"222",nombre:"Pizza familiar",imputable:"true",cuenta:"0",ejercicio:"1",parent_id:"2");
AccountingAccount.create(grupo:"223",nombre:"Hamburguesa p/Niños",imputable:"true",cuenta:"0",ejercicio:"1",parent_id:"2");

AccountingAccount.create(grupo:"1",nombre:"Servicios",imputable:"false",cuenta:"0",ejercicio:"2",parent_id:"1");
AccountingAccount.create(grupo:"111",nombre:"TV cable",imputable:"true",cuenta:"0",ejercicio:"2",parent_id:"1");
AccountingAccount.create(grupo:"112",nombre:"TV cable Nacionales",imputable:"true",cuenta:"0",ejercicio:"2",parent_id:"1");
AccountingAccount.create(grupo:"113",nombre:"Lavanderia",imputable:"true",cuenta:"0",ejercicio:"2",parent_id:"1");

AccountingAccount.create(grupo:"3",nombre:"Cuentas por cobrar",imputable:"false",cuenta:"0",ejercicio:"1",parent_id:"3");
AccountingAccount.create(grupo:"331",nombre:"Cliente",imputable:"true",cuenta:"0",ejercicio:"1",parent_id:"3");



AccountXPlan.create(account_plan_id:"1",accounting_account_id:"1");
AccountXPlan.create(account_plan_id:"1",accounting_account_id:"2");
AccountXPlan.create(account_plan_id:"1",accounting_account_id:"3");
AccountXPlan.create(account_plan_id:"1",accounting_account_id:"4");
AccountXPlan.create(account_plan_id:"1",accounting_account_id:"5");
AccountXPlan.create(account_plan_id:"1",accounting_account_id:"6");
AccountXPlan.create(account_plan_id:"1",accounting_account_id:"7");
AccountXPlan.create(account_plan_id:"1",accounting_account_id:"8");
AccountXPlan.create(account_plan_id:"2",accounting_account_id:"9");
AccountXPlan.create(account_plan_id:"2",accounting_account_id:"10");
AccountXPlan.create(account_plan_id:"2",accounting_account_id:"11");
AccountXPlan.create(account_plan_id:"2",accounting_account_id:"12");


#AccountXEntry.create(accounting_entry_id:"1",accounting_account_id:"2",monto:"20000",observacion:"Hospedaje",tipo:"A");
#AccountXEntry.create(accounting_entry_id:"2",accounting_account_id:"5",monto:"20000",observacion:"Hospedaje",tipo:"D");
#AccountXEntry.create(accounting_entry_id:"3",accounting_account_id:"2",monto:"20000",observacion:"Sector Bar y Restaurant ",tipo:"A");
#AccountXEntry.create(accounting_entry_id:"4",accounting_account_id:"7",monto:"20000",observacion:"Sector Bar y Restaurant ",tipo:"D");
#AccountXEntry.create(accounting_entry_id:"5",accounting_account_id:"2",monto:"20000",observacion:"Servicio para habitaciones",tipo:"A");
#AccountXEntry.create(accounting_entry_id:"6",accounting_account_id:"8",monto:"20000",observacion:"Servicio para habitaciones",tipo:"D");
#AccountXEntry.create(accounting_entry_id:"7",accounting_account_id:"2",monto:"20000",observacion:"Hospedaje",tipo:"A");
#AccountXEntry.create(accounting_entry_id:"8",accounting_account_id:"5",monto:"20000",observacion:"Hospedaje",tipo:"D");
#AccountXEntry.create(accounting_entry_id:"9",accounting_account_id:"2",monto:"20000",observacion:"Servicio para habitaciones",tipo:"A");
#AccountXEntry.create(accounting_entry_id:"10",accounting_account_id:"8",monto:"20000",observacion:"Servicio para habitaciones",tipo:"D");
#AccountXEntry.create(accounting_entry_id:"11",accounting_account_id:"2",monto:"20000",observacion:"Hospedaje",tipo:"A");
#AccountXEntry.create(accounting_entry_id:"12",accounting_account_id:"5",monto:"20000",observacion:"Hospedaje",tipo:"D");
#A#ccountXEntry.create(accounting_entry_id:"13",accounting_account_id:"2",monto:"20000",observacion:"Telefono y telecomunicaciones",tipo:"A");
#AccountXEntry.create(accounting_entry_id:"14",accounting_account_id:"12",monto:"20000",observacion:"Telefono y telecomunicaciones",tipo:"D");

#AccountXEntry.create(accounting_entry_id:"15",accounting_account_id:"2",monto:"20000",observacion:"Telefono y telecomunicaciones",tipo:"A");
#AccountXEntry.create(accounting_entry_id:"16",accounting_account_id:"5",monto:"20000",observacion:"Telefono y telecomunicaciones",tipo:"A");
#AccountXEntry.create(accounting_entry_id:"17",accounting_account_id:"7",monto:"20000",observacion:"Telefono y telecomunicaciones",tipo:"A");
#AccountXEntry.create(accounting_entry_id:"18",accounting_account_id:"12",monto:"20000",observacion:"Telefono y telecomunicaciones",tipo:"D");

#AccountXEntry.create(accounting_entry_id:"19",accounting_account_id:"12",monto:"20000",observacion:"Hospedaje",tipo:"A");
#AccountXEntry.create(accounting_entry_id:"20",accounting_account_id:"8",monto:"20000",observacion:"Hospedaje",tipo:"D");
#AccountXEntry.create(accounting_entry_id:"21",accounting_account_id:"2",monto:"20000",observacion:"Hospedaje",tipo:"D");
#AccountXEntry.create(accounting_entry_id:"22",accounting_account_id:"5",monto:"20000",observacion:"Hospedaje",tipo:"D");

#AccountXEntry.create(accounting_entry_id:"23",accounting_account_id:"5",monto:"20000",observacion:"Telefono y telecomunicaciones",tipo:"A");
#AccountXEntry.create(accounting_entry_id:"24",accounting_account_id:"13",monto:"20000",observacion:"Telefono y telecomunicaciones",tipo:"D");
#AccountXEntry.create(accounting_entry_id:"25",accounting_account_id:"12",monto:"20000",observacion:"Telefono y telecomunicaciones",tipo:"D");




TypeOfRoom.create(tipo: "Simple",descripcion:"",precio: 10000);
TypeOfRoom.create(tipo: "Doble",descripcion:"",precio: 20000);
TypeOfRoom.create(tipo: "Matrimonial",descripcion:"Cama matrimonial y una cama para el baby",precio: 50000);
TypeOfRoom.create(tipo: "Suite",descripcion:"",precio: 100000);

State.create(descripcion: "libre");
State.create(descripcion: "ocupado");
State.create(descripcion: "reservado");
State.create(descripcion: "fuera de servicio");


#Habitaciones 
Room.create(type_of_room_id: 1,state_id: 1, identificador:"AU1",  comfort_id: 1);
Room.create(type_of_room_id: 1,state_id: 1, identificador: 'AD2', comfort_id: 2);
Room.create(type_of_room_id: 3,state_id: 1 ,identificador: 'CU3', comfort_id: 1);
Room.create(type_of_room_id: 2,state_id: 1, identificador:"BU1",  comfort_id: 1);
Room.create(type_of_room_id: 2,state_id: 1, identificador:"BD1",  comfort_id: 2);
Room.create(type_of_room_id: 2,state_id: 1 ,identificador: 'B2',  comfort_id: 1);
Room.create(type_of_room_id: 3,state_id: 4 ,identificador: 'D3',  comfort_id: 1);
Room.create(type_of_room_id: 1,state_id: 1 ,identificador: 'A1', comfort_id: 3);
Room.create(type_of_room_id: 1,state_id: 1 ,identificador: 'A2', comfort_id: 3);
Room.create(type_of_room_id: 1,state_id: 1 ,identificador: 'A3', comfort_id: 3);
Room.create(type_of_room_id: 1,state_id: 1 ,identificador: 'A4', comfort_id: 3);



#Reservation.create(nombre: "Leo",apellido: "Mesi",email: "Messi@gmail.com",telefono: "0901212",total: 10000);
#ReservationRoom.create(reservation_id: 1,type_of_room_id:1,comfort_id: 1,room_id: 1,check_in: (Date.today+1).to_s, check_out: (Date.today+7).to_s,subtotal: 10000,start: "2016-11-29",end: "2016-12-06" ,title: "Habitacion A1 Reservada" ,color: "#33ff00",textColor: "#ffffff");
#Reservation.create(nombre: "Fabri",email: "fabri@gmail.com",check_in: (Date.today+1).to_s, check_out: (Date.today+7).to_s,type_of_room_id: 1,room_id: 5,total: 10000);
#Reservation.create(nombre: "Fabri",email: "fabri@gmail.com",check_in: (Date.today+8).to_s, check_out: (Date.today+9).to_s,type_of_room_id: 1,room_id: 5,total: 10000);

######
#ReservationRoom.create(reservation_id: 1,room_id:1,budget_id:1,cantidad: 2,type_of_room_id:1,subtotal:10000);
#ReservationRoom.create(reservation_id: 1,room_id:4,budget_id:2,cantidad: 2,type_of_room_id:2,subtotal:10000);
#######



RoomComfort.create(room_id: 1 , comfort_id: 1);
RoomComfort.create(room_id: 1 , comfort_id: 2);



#Service.create(nombre: "TV cable",descripcion: "900 canales",precio: 20000);
#Service.create(nombre: "TV cable Nacionales",descripcion: "100 canales",precio: 10000);

TypesOfEmployee.create(tipo: "administrador", descripcion: "");
TypesOfEmployee.create(tipo: "limpiadora", descripcion: "");
TypesOfEmployee.create(tipo: "botones", descripcion: "");
TypesOfEmployee.create(tipo: "cajero", descripcion: "");
Employee.create(types_of_employee_id: 2, nombre: "Fernando", apellido:"Escurra",edad: 20, cedula: 4333333, telefono: 666, correo: "niko@gmail.com", direccion: "Capitan Miranda" , hijo: 3);
Employee.create(types_of_employee_id: 2, nombre: "Enrique", apellido:"Escurra",edad: 20, cedula: 4333333, telefono: 666, correo: "niko@gmail.com", direccion: "Capitan Miranda" , hijo: 3);
Employee.create(types_of_employee_id: 2, nombre: "Julio", apellido:"Escurra",edad: 20, cedula: 4333333, telefono: 666, correo: "niko@gmail.com", direccion: "Capitan Miranda" , hijo: 3);

Employee.create(types_of_employee_id: 4, nombre: "Miguel", apellido:"Carreras",edad: 20, cedula: 3832128, telefono: 666, correo: "miguel@gmail.com", direccion: "Capitan Miranda" , hijo: 3);


ComplaintService.create(description: "Limpieza");
ComplaintService.create(description: "Servicio a Cuarto");
ComplaintService.create(description: "Atencion al publico");
ComplaintService.create(description: "Buffet");
ComplaintService.create(description: "Otros");

Complaint.create(description: "Mal servicio de limpieza a cuarto",complaint_service_id: 1,service_description: "",state: false,room_id: 1);
Complaint.create(description: "Tuve que esperar 25 minutos para ser atendido en la mesa de consultas",complaint_service_id: 3,service_description: "",state: false,room_id: 1);
Complaint.create(description: "Tardaron 45 minutos en traerme mi pedido",complaint_service_id: 2,service_description: "",state: false,room_id: 1);
Complaint.create(description: "El aire acondicionado no funciona correctamente",complaint_service_id: 5,service_description: "Aire acondicionado",state: false,room_id: 1);
Complaint.create(description: "Las ventanas no se cerraban del todo",complaint_service_id: 5,service_description: "Ventanas",state: false,room_id: 1);


Action.create(accion: "Admin");
#Acciones para Movimientos
Action.create(accion: "Ver Movimiento");
Action.create(accion: "Crear Movimiento");
Action.create(accion: "Editar Movimiento");
Action.create(accion: "Eliminar Movimiento");
#Acciones para Caja
Action.create(accion: "Ver Caja");
Action.create(accion: "Crear Caja");
Action.create(accion: "Editar Caja");
Action.create(accion: "Eliminar Caja");
#Acciones para Apertura
Action.create(accion: "Ver Apertura");
Action.create(accion: "Crear Apertura");
Action.create(accion: "Editar Apertura");
Action.create(accion: "Eliminar Apertura");
#Acciones para Cierre
Action.create(accion: "Ver Cierre");
Action.create(accion: "Crear Cierre");
Action.create(accion: "Editar Cierre");
Action.create(accion: "Eliminar Cierre");
#Acciones para Arqueo
Action.create(accion: "Ver Arqueo");
Action.create(accion: "Crear Arqueo");
Action.create(accion: "Editar Arqueo");
Action.create(accion: "Eliminar Arqueo");
#Acciones para Pedidos de Reservaciones
Action.create(accion: "Ver Pedido");
Action.create(accion: "Crear Pedido");
Action.create(accion: "Editar Pedido");
Action.create(accion: "Eliminar Pedido");
#Acciones para Reservaciones
Action.create(accion: "Ver Reservacion");
Action.create(accion: "Crear Reservacion");
Action.create(accion: "Editar Reservacion");
Action.create(accion: "Eliminar Reservacion");
#Acciones para Facturas
Action.create(accion: "Ver Factura");
Action.create(accion: "Crear Factura");
Action.create(accion: "Editar Factura");
Action.create(accion: "Eliminar Factura");
#Acciones para Cuentas
Action.create(accion: "Ver Cuenta");
Action.create(accion: "Crear Cuenta");
Action.create(accion: "Editar Cuenta");
Action.create(accion: "Eliminar Cuenta");
#Acciones para Clientes
Action.create(accion: "Ver Cliente");
Action.create(accion: "Crear Cliente");
Action.create(accion: "Editar Cliente");
Action.create(accion: "Eliminar Cliente");
#Acciones para Servicios
Action.create(accion: "Ver Servicio");
Action.create(accion: "Crear Servicio");
Action.create(accion: "Editar Servicio");
Action.create(accion: "Eliminar Servicio");
#Acciones para Contabilidad
Action.create(accion: "Control de Asientos");
Action.create(accion: "Control de Cuentas");
Action.create(accion: "Control de Planes de Cuentas");
#Acciones para Habitaciones
Action.create(accion: "Ver Habitaciones");
Action.create(accion: "Crear Habitaciones");
Action.create(accion: "Editar Habitaciones");
Action.create(accion: "Inhabilitar Habitaciones");


Rol.create(:nombre => "Admin", :action_ids => [1])
User.create(:username => "Ariel", :numero_ci => "4384512", :celular => "0983433454", :apellido => "Sanabria", :email => "admin@gmail.com", :password => '123456', :password_confirmation => '123456', :rol_id => 1);
#User.create(:username => "Miguel", :numero_ci => "3832128", :celular => "0981226979", :apellido => "Carreras", :email => "miguel@gmail.com", :password => '123456', :password_confirmation => '123456', :rol_ids => 3);
Photo.create(:user_id => 1);

ReservationRequest.create(nombre: "Leo", apellido: "Messi", email: "messi@gmail.com", telefono: "0012", comfort_id: 3, cantidad_de_adultos: 1, cantidad_de_ninhos: 1, cantidad_de_familias: 1, check_in: (Date.today+1).to_s, check_out: (Date.today+7).to_s, comentarios: "");
ReservationRequest.create(nombre: "Cristiano", apellido: "Ronaldo", email: "cr7@gmail.com", telefono: "0012", comfort_id: 3, cantidad_de_adultos: 1, cantidad_de_ninhos: 1, cantidad_de_familias: 1, check_in: (Date.today+1).to_s, check_out: (Date.today+7).to_s, comentarios: "");
ReservationRequest.create(nombre: "Matias", apellido: "Gonzalez", email: "maedgoro@gmail.com", telefono: "0012", comfort_id: 3, cantidad_de_adultos: 1, cantidad_de_ninhos: 1, cantidad_de_familias: 1, check_in: (Date.today+1).to_s, check_out: (Date.today+7).to_s, comentarios: "");
#ReservationRequest.create(nombre: "Mirta", apellido: "Arambulo", email: "mirtambulo@gmail.com", telefono: "0012", comfort_id: 1, cantidad_de_adultos: 1, cantidad_de_ninhos: 1, cantidad_de_familias: 1, check_in: (Date.today+1).to_s, check_out: (Date.today+3).to_s, comentarios: "");
ReservationRequest.create(nombre: "Katya", apellido: "Chaparro", email: "katya.chaparro.2010@gmail.com", telefono: "0012", comfort_id: 2, cantidad_de_adultos: 1, cantidad_de_ninhos: 1, cantidad_de_familias: 1, check_in: (Date.today+1).to_s, check_out: (Date.today+5).to_s, comentarios: "");
ReservationRequest.create(nombre: "Matias", apellido: "Gonzalez", email: "maedgoro@gmail.com", telefono: "0012", comfort_id: 3, cantidad_de_adultos: 1, cantidad_de_ninhos: 1, cantidad_de_familias: 1, check_in: (Date.today+1).to_s, check_out: (Date.today+7).to_s, comentarios: "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
#eservationRequest.create(nombre: "Mirta", apellido: "Arambulo", email: "mirtambulo@gmail.com", telefono: "0012", comfort_id: 3, cantidad_de_adultos: 1, cantidad_de_ninhos: 1, cantidad_de_familias: 1, check_in: (Date.today+1).to_s, check_out: (Date.today+7).to_s, comentarios: "");

######
#Budget.create(reservation_request_id: 1,comfort_id: 3, check_in: (Date.today+1).to_s, check_out: (Date.today+7).to_s,comentario:"a",descuento: 10,total:10000);
#Budget.create(reservation_request_id: 2,comfort_id: 2, check_in: (Date.today+1).to_s, check_out: (Date.today+7).to_s,comentario:"a",descuento: 10,total:10000);

#ReservationRoom.create(reservation_id:1, room_id:1,budget_id:1,cantidad: 2,type_of_room_id:1,subtotal:10000,start:(Date.today+1).to_s,end: (Date.today+7).to_s,title: "Habitacion 1",color: "#33ff00",textColor: "#ffffff");
#ReservationRoom.create(reservation_id:2, room_id:4,budget_id:2,cantidad: 2,type_of_room_id:2,subtotal:10000,start:(Date.today+1).to_s,end: (Date.today+7).to_s,title: "Habitacion 4",color: "#80f442",textColor: "#ffffff");
######

TypeOfCashMovement.create(descripcion: "entrada");

Cash.create(descripcion: "Resturant&Bar");
OpeningCash.create(cash_id: 1,employee_id: 2,monto_efectivo: 100000,estado:"Abierta",fecha_apertura: (Date.today+1).to_s);
Client.create(nombre:"Franco",apellido:"Cardozo",telefono:"201258",email:"franco@gmail.com",direccion:"Barrio Pacu-Cua",cedula:"123456",ruc:"123456");




#Limpieza de Habitacion
CleaningRoom.create(employee_id: 1);
CleaningRoom.create(employee_id: 2);
Cleaning.create(cleaning_room_id: 1,employee_id: 1,room_id: 1,start: "2016-12-01",end: "2016-12-05" ,title: "Habitacion A1" ,color: "#d742f4",textColor: "#ffffff");
Cleaning.create(cleaning_room_id: 1,employee_id: 1,room_id: 1,start: "2016-12-06",end: "2016-12-08" ,title: "Habitacion A1" ,color: "#80f442",textColor: "#ffffff");
Cleaning.create(cleaning_room_id: 1,employee_id: 1,room_id: 1,start: "2016-12-03",end: "2016-12-10" ,title: "Habitacion A1" ,color: "#f45342",textColor: "#ffffff");
Cleaning.create(cleaning_room_id: 1,employee_id: 1,room_id: 1,start: "2016-12-12",end: "2016-12-20" ,title: "Habitacion A1" ,color: "#eef442",textColor: "#ffffff");
Cleaning.create(cleaning_room_id: 1,employee_id: 1,room_id: 1,start: "2016-12-02",end: "2016-12-15" ,title: "Habitacion A1" ,color: "#42f4d7",textColor: "#ffffff");
Cleaning.create(cleaning_room_id: 1,employee_id: 1,room_id: 1,start: "2016-12-14",end: "2016-12-16" ,title: "Habitacion A1" ,color: "#425cf4",textColor: "#ffffff");
Cleaning.create(cleaning_room_id: 1,employee_id: 1,room_id: 1,start: "2016-12-28",end: "2016-12-30" ,title: "Habitacion A1" ,color: "#d742f4",textColor: "#ffffff");
Cleaning.create(cleaning_room_id: 1,employee_id: 1,room_id: 1,start: "2016-12-03",end: "2016-12-14" ,title: "Habitacion A1" ,color: "#f44295",textColor: "#ffffff");
Cleaning.create(cleaning_room_id: 2,employee_id: 2,room_id: 2,start: "2017-01-03",end: "2017-01-14" ,title: "Habitacion" 	,color: "#33ff00",textColor: "#ffffff");
Cleaning.create(cleaning_room_id: 2,employee_id: 2,room_id: 3,start: "2017-01-07",end: "2017-01-14" ,title: "Habitacion" 	,color: "#f44295",textColor: "#ffffff");
Cleaning.create(cleaning_room_id: 2,employee_id: 2,room_id: 2,start: "2017-01-01",end: "2017-01-14" ,title: "Habitacion" 	,color: "#d742f4",textColor: "#ffffff");



PaymentValue.create(descripcion:"efectivo");
PaymentValue.create(descripcion:"cheque");
PaymentValue.create(descripcion:"tarjeta crédito");
PaymentValue.create(descripcion:"tarjeta dédito");

Invoice.create(nombre: "Marcelo Caceres", client_id: "1",fecha: "2016-11-20", ruc: "8001425-6", direccion: "Carlos A. Lopez 1020", celular: "0985658955", correo: "micorreo@gmail.com", numero: "9005", state: "pendiente", subtotal: 10000, descuento: 0, total: 10000, iva: 909);
InvoiceDetail.create(invoice_id: 1, service_id: 2, cantidad: 1, precio: 10000, subtotal: 10000);
InvoiceDetail.create(invoice_id: 1, service_id: 2, cantidad: 2, precio: 10000, subtotal: 20000);
Invoice.create(nombre: "Monica Riveros", client_id: "1", fecha: "2016-11-30", ruc: "1258745-0", direccion: "Mcal. Lopez 102", celular: "0971005258", correo: "correodemonica@gmail.com", numero: "9006", state: "pendiente", subtotal: 20000, descuento: 0, total: 20000, iva: 1818);
InvoiceDetail.create(invoice_id: 2, service_id: 2, cantidad: 2, precio: 10000, subtotal: 20000);
Invoice.create(nombre: "Angel Carreras", client_id: "1", fecha: "2016-10-31", ruc: "400808-6", direccion: "Juan Leon Mallorquin 201", celular: "0993506908", correo: "correodeAngel@gmail.com", numero: "9004", state: "pendiente", subtotal: 20000, descuento: 0, total: 20000, iva: 1818);
InvoiceDetail.create(invoice_id: 3, service_id: 1, cantidad: 1, precio: 20000, subtotal: 20000);
