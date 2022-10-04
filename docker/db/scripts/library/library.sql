create table "Publisher"
(
    name    text not null
        constraint name
            primary key,
    address text
);

alter table "Publisher"
    owner to "NIGOGOSOVA_205";

create table "Category"
(
    name            text not null
        primary key,
    parent_category text
        references "Category"
);

alter table "Category"
    owner to "NIGOGOSOVA_205";

create table "Book"
(
    isbn            serial
        constraint isbn
            primary key,
    author          text,
    year            integer,
    title           text,
    number_of_pages integer,
    publisher_name  text
        constraint publisher_name
            references "Publisher",
    category        text
        constraint category_name
            references "Category"
);

alter table "Book"
    owner to "NIGOGOSOVA_205";

create table "Book copy"
(
    copy_number serial
        constraint copy_number
            primary key,
    isbn        integer not null
        constraint isbn
            references "Book",
    position    integer
);

alter table "Book copy"
    owner to "NIGOGOSOVA_205";

create table "Reader"
(
    id             serial
        constraint id
            primary key,
    first_name     text,
    last_name      text,
    birth_date     date,
    address        text,
    publisher_name text
        constraint publisher_name
            references "Publisher"
);

alter table "Reader"
    owner to "NIGOGOSOVA_205";

create table "Book taking"
(
    "ID_reader"      integer
        constraint "ID_reader"
            references "Reader",
    book_copy_number integer
        constraint book_copy_number
            references "Book copy",
    date_of_return   date
);

alter table "Book taking"
    owner to "NIGOGOSOVA_205";

