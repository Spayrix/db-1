create table about_us
(
    id         bigint unsigned auto_increment
        primary key,
    title      varchar(255) not null,
    content    text         not null,
    image_url  varchar(255) null,
    created_at timestamp    null,
    updated_at timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table cache
(
    `key`      varchar(255) not null
        primary key,
    value      mediumtext   not null,
    expiration int          not null
)
    collate = utf8mb4_unicode_ci;

create table cache_locks
(
    `key`      varchar(255) not null
        primary key,
    owner      varchar(255) not null,
    expiration int          not null
)
    collate = utf8mb4_unicode_ci;

create table categories
(
    id          bigint unsigned auto_increment
        primary key,
    name        varchar(255) not null,
    description text         not null,
    created_at  timestamp    null,
    updated_at  timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table contacts
(
    id         bigint unsigned auto_increment
        primary key,
    name       varchar(255) not null,
    email      varchar(255) not null,
    message    text         not null,
    created_at timestamp    null,
    updated_at timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table coupons
(
    id          bigint unsigned auto_increment
        primary key,
    code        varchar(255) not null,
    discount    int          not null,
    expiry_date date         not null,
    created_at  timestamp    null,
    updated_at  timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table failed_jobs
(
    id         bigint unsigned auto_increment
        primary key,
    uuid       varchar(255)                          not null,
    connection text                                  not null,
    queue      text                                  not null,
    payload    longtext                              not null,
    exception  longtext                              not null,
    failed_at  timestamp default current_timestamp() not null,
    constraint failed_jobs_uuid_unique
        unique (uuid)
)
    collate = utf8mb4_unicode_ci;

create table job_batches
(
    id             varchar(255) not null
        primary key,
    name           varchar(255) not null,
    total_jobs     int          not null,
    pending_jobs   int          not null,
    failed_jobs    int          not null,
    failed_job_ids longtext     not null,
    options        mediumtext   null,
    cancelled_at   int          null,
    created_at     int          not null,
    finished_at    int          null
)
    collate = utf8mb4_unicode_ci;

create table jobs
(
    id           bigint unsigned auto_increment
        primary key,
    queue        varchar(255)     not null,
    payload      longtext         not null,
    attempts     tinyint unsigned not null,
    reserved_at  int unsigned     null,
    available_at int unsigned     not null,
    created_at   int unsigned     not null
)
    collate = utf8mb4_unicode_ci;

create index jobs_queue_index
    on jobs (queue);

create table migrations
(
    id        int unsigned auto_increment
        primary key,
    migration varchar(255) not null,
    batch     int          not null
)
    collate = utf8mb4_unicode_ci;

create table password_reset_tokens
(
    email      varchar(255) not null
        primary key,
    token      varchar(255) not null,
    created_at timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table products
(
    id          bigint unsigned auto_increment
        primary key,
    name        varchar(255)    not null,
    description text            not null,
    price       decimal(8, 2)   not null,
    stock       int             not null,
    image_url   varchar(255)    not null,
    category_id bigint unsigned not null,
    created_at  timestamp       null,
    updated_at  timestamp       null,
    constraint products_category_id_foreign
        foreign key (category_id) references categories (id)
            on delete cascade
)
    collate = utf8mb4_unicode_ci;

create table roles
(
    id         bigint unsigned auto_increment
        primary key,
    name       varchar(255) not null,
    created_at timestamp    null,
    updated_at timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table sessions
(
    id            varchar(255)    not null
        primary key,
    user_id       bigint unsigned null,
    ip_address    varchar(45)     null,
    user_agent    text            null,
    payload       longtext        not null,
    last_activity int             not null
)
    collate = utf8mb4_unicode_ci;

create index sessions_last_activity_index
    on sessions (last_activity);

create index sessions_user_id_index
    on sessions (user_id);

create table users
(
    id                      bigint unsigned auto_increment
        primary key,
    first_name              varchar(255)                     null,
    last_name               varchar(255)                     null,
    username                varchar(255)                     null,
    avatar                  varchar(255)                     null,
    email                   varchar(255)                     not null,
    email_verified_at       timestamp                        null,
    gender                  enum ('male', 'female', 'other') null,
    age                     int                              null,
    newsletter_subscription tinyint(1) default 0             not null,
    password                varchar(255)                     not null,
    remember_token          varchar(100)                     null,
    created_at              timestamp                        null,
    updated_at              timestamp                        null,
    constraint users_email_unique
        unique (email),
    constraint users_username_unique
        unique (username)
)
    collate = utf8mb4_unicode_ci;

create table addresses
(
    id           bigint unsigned auto_increment
        primary key,
    user_id      bigint unsigned not null,
    title        varchar(255)    not null,
    address_line text            not null,
    city         varchar(255)    not null,
    state        varchar(255)    not null,
    postal_code  varchar(255)    not null,
    created_at   timestamp       null,
    updated_at   timestamp       null,
    constraint addresses_user_id_foreign
        foreign key (user_id) references users (id)
            on delete cascade
)
    collate = utf8mb4_unicode_ci;

create table cart_items
(
    id         bigint unsigned auto_increment
        primary key,
    user_id    bigint unsigned not null,
    product_id bigint unsigned not null,
    quantity   int default 1   not null,
    created_at timestamp       null,
    updated_at timestamp       null,
    constraint cart_items_product_id_foreign
        foreign key (product_id) references products (id)
            on delete cascade,
    constraint cart_items_user_id_foreign
        foreign key (user_id) references users (id)
            on delete cascade
)
    collate = utf8mb4_unicode_ci;

create table favorites
(
    id         bigint unsigned auto_increment
        primary key,
    user_id    bigint unsigned not null,
    product_id bigint unsigned not null,
    created_at timestamp       null,
    updated_at timestamp       null,
    constraint favorites_product_id_foreign
        foreign key (product_id) references products (id)
            on delete cascade,
    constraint favorites_user_id_foreign
        foreign key (user_id) references users (id)
            on delete cascade
)
    collate = utf8mb4_unicode_ci;

create table orders
(
    id           bigint unsigned auto_increment
        primary key,
    user_id      bigint unsigned                            not null,
    order_number varchar(255)                               not null,
    total_amount decimal(10, 2)                             not null,
    status       enum ('pending', 'completed', 'cancelled') not null,
    created_at   timestamp                                  null,
    updated_at   timestamp                                  null,
    constraint orders_order_number_unique
        unique (order_number),
    constraint orders_user_id_foreign
        foreign key (user_id) references users (id)
            on delete cascade
)
    collate = utf8mb4_unicode_ci;

create table payments
(
    id             bigint unsigned auto_increment
        primary key,
    user_id        bigint unsigned not null,
    amount         decimal(10, 2)  not null,
    payment_method varchar(255)    not null,
    paid_at        timestamp       null,
    created_at     timestamp       null,
    updated_at     timestamp       null,
    constraint payments_user_id_foreign
        foreign key (user_id) references users (id)
            on delete cascade
)
    collate = utf8mb4_unicode_ci;

create table user_activities
(
    id           bigint unsigned auto_increment
        primary key,
    user_id      bigint unsigned                       not null,
    activity     varchar(255)                          not null,
    performed_at timestamp default current_timestamp() not null,
    constraint user_activities_user_id_foreign
        foreign key (user_id) references users (id)
            on delete cascade
)
    collate = utf8mb4_unicode_ci;


