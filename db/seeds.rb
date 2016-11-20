
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
Comfort.create(descripcion: "una estrella");
Comfort.create(descripcion: "dos estrellas");
Comfort.create(descripcion: "tres estrellas");



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



TypeOfRoom.create(tipo: "Simple",descripcion:"",precio: 10000);
TypeOfRoom.create(tipo: "Doble",descripcion:"",precio: 1000);
TypeOfRoom.create(tipo: "Matrimonial",descripcion:"Cama matrimonial y una cama para el baby",precio: 1000);
TypeOfRoom.create(tipo: "Suite",descripcion:"",precio: 1000);

State.create(descripcion: "libre");
State.create(descripcion: "ocupado");
State.create(descripcion: "reservado");
State.create(descripcion: "fuera de servicio");

Room.create(type_of_room_id: 1,state_id: 3, capacidad: 2, identificador:"A1",precio: 10000,comfort_id: 1);
Room.create(type_of_room_id: 1,state_id: 1,capacidad: 2,identificador: 'A2',precio: 10000,comfort_id: 1);
Room.create(type_of_room_id: 3,state_id: 2 ,capacidad: 2,identificador: 'C3',precio: 10000,comfort_id: 1);
Room.create(type_of_room_id: 2,state_id: 3, capacidad: 2, identificador:"B1",precio: 10000,comfort_id: 1);
Room.create(type_of_room_id: 2,state_id: 3 ,capacidad: 2,identificador: 'B2',precio: 10000,comfort_id: 1);
Room.create(type_of_room_id: 3,state_id: 4 ,capacidad: 2,identificador: 'D3',precio: 10000,comfort_id: 1);


Reservation.create(nombre: "Fabri",email: "fabri@gmail.com",dias: 1 ,check_in: (Date.today+1).to_s, check_out: (Date.today+7).to_s,type_of_room_id: 1,room_id: 1,total: 10000);
Reservation.create(nombre: "Fabri",email: "fabri@gmail.com",dias: 1 ,check_in: (Date.today+1).to_s, check_out: (Date.today+7).to_s,type_of_room_id: 1,room_id: 5,total: 10000);
Reservation.create(nombre: "Fabri",email: "fabri@gmail.com",dias: 1 ,check_in: (Date.today+8).to_s, check_out: (Date.today+9).to_s,type_of_room_id: 1,room_id: 5,total: 10000);
RoomComfort.create(room_id: 1 , comfort_id: 1);
RoomComfort.create(room_id: 1 , comfort_id: 2);

Photo.create(room_id: 1, my_file:"image/upload/v1477017980/dszqxru3husf5tv6toxg.jpg");


#Service.create(nombre: "TV cable",descripcion: "900 canales",precio: 20000);
#Service.create(nombre: "TV cable Nacionales",descripcion: "100 canales",precio: 10000);

TypesOfEmployee.create(tipo: "administrador", descripcion: "");
TypesOfEmployee.create(tipo: "limpiadora", descripcion: "");
TypesOfEmployee.create(tipo: "botones", descripcion: "");
TypesOfEmployee.create(tipo: "cajero", descripcion: "");
Employee.create(types_of_employee_id: 1, nombre: "Fernando", apellido:"Escurra",edad: 20, cedula: 4333333, telefono: 666, correo: "niko@gmail.com", direccion: "Capitan Miranda" , hijo: 3);



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

Rol.create(role: "Admin");
#Roles para Movimientos
Rol.create(role: "Ver Movimiento");
Rol.create(role: "Crear Movimiento");
Rol.create(role: "Editar Movimiento");
Rol.create(role: "Eliminar Movimiento");
#Roles para Caja
Rol.create(role: "Ver Caja");
Rol.create(role: "Crear Caja");
Rol.create(role: "Editar Caja");
Rol.create(role: "Eliminar Caja");
#Roles para Apertura
Rol.create(role: "Ver Apertura");
Rol.create(role: "Crear Apertura");
Rol.create(role: "Editar Apertura");
Rol.create(role: "Eliminar Apertura");
#Roles para Cierre
Rol.create(role: "Ver Cierre");
Rol.create(role: "Crear Cierre");
Rol.create(role: "Editar Cierre");
Rol.create(role: "Eliminar Cierre");
#Roles para Arqueo
Rol.create(role: "Ver Arqueo");
Rol.create(role: "Crear Arqueo");
Rol.create(role: "Editar Arqueo");
Rol.create(role: "Eliminar Arqueo");
#Roles para Pedidos de Reservaciones
Rol.create(role: "Ver Pedido");
Rol.create(role: "Crear Pedido");
Rol.create(role: "Editar Pedido");
Rol.create(role: "Eliminar Pedido");
#Roles para Reservaciones
Rol.create(role: "Ver Reservacion");
Rol.create(role: "Crear Reservacion");
Rol.create(role: "Editar Reservacion");
Rol.create(role: "Eliminar Reservacion");
#Roles para Facturas
Rol.create(role: "Ver Factura");
Rol.create(role: "Crear Factura");
Rol.create(role: "Editar Factura");
Rol.create(role: "Eliminar Factura");
#Roles para Cuentas
Rol.create(role: "Ver Cuenta");
Rol.create(role: "Crear Cuenta");
Rol.create(role: "Editar Cuenta");
Rol.create(role: "Eliminar Cuenta");
#Roles para Clientes
Rol.create(role: "Ver Cliente");
Rol.create(role: "Crear Cliente");
Rol.create(role: "Editar Cliente");
Rol.create(role: "Eliminar Cliente");
#Roles para Servicios
Rol.create(role: "Ver Servicio");
Rol.create(role: "Crear Servicio");
Rol.create(role: "Editar Servicio");
Rol.create(role: "Eliminar Servicio");
#Roles para Contabilidad
Rol.create(role: "Control de Asientos");
Rol.create(role: "Control de Cuentas");
Rol.create(role: "Control de Planes de Cuentas");


User.create(:username => "Ariel", :numero_ci => "4384512", :celular => "0983433454", :apellido => "Sanabria", :email => "admin@gmail.com", :password => '123456', :password_confirmation => '123456', :rol_ids => 1);

ReservationRequest.create(nombre: "Leo", apellido: "Messi", email: "messi@gmail.com", telefono: "0012", comfort_id: 3, cantidad_de_adultos: 1, cantidad_de_ninhos: 1, cantidad_de_familias: 1, check_in: (Date.today+1).to_s, check_out: (Date.today+7).to_s, comentarios: "");
ReservationRequest.create(nombre: "Matias", apellido: "Gonzalez", email: "maedgoro@gmail.com", telefono: "0012", comfort_id: 3, cantidad_de_adultos: 1, cantidad_de_ninhos: 1, cantidad_de_familias: 1, check_in: (Date.today+1).to_s, check_out: (Date.today+7).to_s, comentarios: "");
ReservationRequest.create(nombre: "Matias", apellido: "Gonzalez", email: "maedgoro@gmail.com", telefono: "0012", comfort_id: 3, cantidad_de_adultos: 1, cantidad_de_ninhos: 1, cantidad_de_familias: 1, check_in: (Date.today+1).to_s, check_out: (Date.today+7).to_s, comentarios: "");
ReservationRequest.create(nombre: "Mirta", apellido: "Arambulo", email: "mirtambulo@gmail.com", telefono: "0012", comfort_id: 1, cantidad_de_adultos: 1, cantidad_de_ninhos: 1, cantidad_de_familias: 1, check_in: (Date.today+1).to_s, check_out: (Date.today+3).to_s, comentarios: "");
ReservationRequest.create(nombre: "Katya", apellido: "Chaparro", email: "katya.chaparro.2010@gmail.com", telefono: "0012", comfort_id: 2, cantidad_de_adultos: 1, cantidad_de_ninhos: 1, cantidad_de_familias: 1, check_in: (Date.today+1).to_s, check_out: (Date.today+5).to_s, comentarios: "");
ReservationRequest.create(nombre: "Matias", apellido: "Gonzalez", email: "maedgoro@gmail.com", telefono: "0012", comfort_id: 3, cantidad_de_adultos: 1, cantidad_de_ninhos: 1, cantidad_de_familias: 1, check_in: (Date.today+1).to_s, check_out: (Date.today+7).to_s, comentarios: "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
ReservationRequest.create(nombre: "Mirta", apellido: "Arambulo", email: "mirtambulo@gmail.com", telefono: "0012", comfort_id: 3, cantidad_de_adultos: 1, cantidad_de_ninhos: 1, cantidad_de_familias: 1, check_in: (Date.today+1).to_s, check_out: (Date.today+7).to_s, comentarios: "");


PaymentType.create(descripcion: "efectivo");
PaymentType.create(descripcion: "cheque");
PaymentType.create(descripcion: "tarjeta credito");
PaymentType.create(descripcion: "tarjeta debito");
