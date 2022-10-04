create table "Train"
(
    "TrainNr" serial
        constraint "TrainNr"
            primary key,
    length    double precision
);

alter table "Train"
    owner to "NIGOGOSOVA_205";

create table "Station"
(
    "Name"    text not null
        constraint "Name"
            primary key,
    "#tracks" integer
);

alter table "Station"
    owner to "NIGOGOSOVA_205";

create table "City"
(
    "Name"   text not null,
    "Region" text not null,
    constraint "City_pk"
        primary key ("Name", "Region")
);

alter table "City"
    owner to "NIGOGOSOVA_205";

create table "Start"
(
    id      serial
        constraint id
            primary key,
    station text
        constraint station
            references "Station",
    train   integer
        constraint train
            references "Train"
);

alter table "Start"
    owner to "NIGOGOSOVA_205";

create table "End"
(
    id      serial
        constraint "End_pk"
            primary key,
    station text
        constraint station
            references "Station",
    train   integer
        constraint train
            references "Train"
);

alter table "End"
    owner to "NIGOGOSOVA_205";

create table "Connected"
(
    id        serial
        constraint "Connected_pk"
            primary key,
    departure date,
    arrival   date,
    station1  text
        constraint station1
            references "Station",
    station2  text
        constraint station2
            references "Station",
    train     integer
        constraint train
            references "Train"
);

alter table "Connected"
    owner to "NIGOGOSOVA_205";

create table "Lie in"
(
    id          serial
        constraint "Lie in_pk"
            primary key,
    station     text
        constraint station
            references "Station",
    city_region text,
    city_name   text,
    constraint city
        foreign key (city_region, city_name) references "City" ("Region", "Name")
);

alter table "Lie in"
    owner to "NIGOGOSOVA_205";

