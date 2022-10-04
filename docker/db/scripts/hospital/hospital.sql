create table "Room"
(
    "RoomNr" serial
        constraint "RoomNr"
            primary key,
    "#beds"  integer
);

alter table "Room"
    owner to "NIGOGOSOVA_205";

create table "Patient"
(
    "PatientNr" serial
        constraint "PatientNr"
            primary key,
    disease     text,
    name        text
);

alter table "Patient"
    owner to "NIGOGOSOVA_205";

create table "Station"
(
    "StatNr" serial
        constraint "StatNr"
            primary key,
    name     text
);

alter table "Station"
    owner to "NIGOGOSOVA_205";

create table "Caregiver"
(
    id            serial
        constraint id
            primary key,
    qualification text
);

alter table "Caregiver"
    owner to "NIGOGOSOVA_205";

create table "Doctor"
(
    id   serial
        primary key,
    area text,
    rank integer
);

alter table "Doctor"
    owner to "NIGOGOSOVA_205";

create table "StationPersonell"
(
    "PersNr"   serial
        constraint "PersNr"
            primary key,
    name       text,
    care_giver integer
        constraint care_giver
            references "Caregiver",
    doctor     integer
        constraint doctor
            references "Doctor"
);

alter table "StationPersonell"
    owner to "NIGOGOSOVA_205";

create table "Works_for"
(
    id                serial
        primary key,
    station_personell integer
        constraint station_personell
            references "Station",
    station           integer
        constraint station
            references "Station"
);

alter table "Works_for"
    owner to "NIGOGOSOVA_205";

create table "Treats"
(
    id      serial
        constraint "Treats_pk"
            primary key,
    doctor  integer
        constraint doctor
            references "Doctor",
    patient integer
        constraint patient
            references "Patient"
);

alter table "Treats"
    owner to "NIGOGOSOVA_205";

create table "Admission"
(
    id      serial
        constraint "Admission_pk"
            primary key,
    room    integer
        constraint room
            references "Room",
    patient integer
        constraint patient
            references "Patient"
);

alter table "Admission"
    owner to "NIGOGOSOVA_205";

create table "Has"
(
    id      serial
        constraint "Has_pk"
            primary key,
    room    integer
        constraint room
            references "Room",
    station integer
        constraint station
            references "Station"
);

alter table "Has"
    owner to "NIGOGOSOVA_205";

