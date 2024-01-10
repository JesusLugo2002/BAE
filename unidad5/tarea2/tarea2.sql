PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Propietarios (
id integer primary key autoincrement,
nombre text not null,
apellido text not null,
dni text unique);
CREATE TABLE Vehiculos (
id integer primary key autoincrement,
marca text not null,
modelo text not null,
anio integer not null,
id_propietario integer references Propietarios(id));
DELETE FROM sqlite_sequence;
COMMIT;
