BEGIN;

CREATE TABLE public.customer
(
    customer_id integer NOT NULL,
    customer_name character varying(50),
    email character varying(50),
    reg_date date,
    card_number character varying(15),
    date_of_birth date,
    gender character(1),
    PRIMARY KEY (customer_id)
);

CREATE TABLE public.product
(
    product_id integer NOT NULL,
    product_name character varying(100),
    description character varying(250),
    product_price double precision,
    product_type_id integer,
    PRIMARY KEY (product_id)
);

CREATE TABLE public.product_type
(
    product_type_id integer NOT NULL,
    product_type character varying(50),
    product_category character varying(50),
    PRIMARY KEY (product_type_id)
);

CREATE TABLE public.sales_detail
(
    sales_detail_id integer NOT NULL,
    transaction_id integer,
    product_id integer,
    quantity integer,
    price double precision,
    PRIMARY KEY (sales_detail_id)
);

CREATE TABLE public.sales_outlet
(
    sales_outlet_id integer NOT NULL,
    sales_outlet_type character varying(20),
    address character varying(50),
    city character varying(40),
    telephone character varying(15),
    postal_code integer,
    manager integer,
    PRIMARY KEY (sales_outlet_id)
);

CREATE TABLE public.sales_transaction
(
    transaction_id integer NOT NULL,
    transaction_date date,
    transaction_time time without time zone,
    sales_outlet_id integer,
    staff_id integer,
    customer_id integer,
    PRIMARY KEY (transaction_id)
);

CREATE TABLE public.staff
(
    staff_id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    "position" character varying(50),
    start_date date,
    location character varying(5),
    PRIMARY KEY (staff_id)
);

ALTER TABLE public.product
    ADD FOREIGN KEY (product_type_id)
    REFERENCES public.product_type (product_type_id)
    NOT VALID;


ALTER TABLE public.sales_detail
    ADD FOREIGN KEY (product_id)
    REFERENCES public.product (product_id)
    NOT VALID;


ALTER TABLE public.sales_detail
    ADD FOREIGN KEY (transaction_id)
    REFERENCES public.sales_transaction (transaction_id)
    NOT VALID;


ALTER TABLE public.sales_transaction
    ADD FOREIGN KEY (customer_id)
    REFERENCES public.customer (customer_id)
    NOT VALID;


ALTER TABLE public.sales_transaction
    ADD FOREIGN KEY (sales_outlet_id)
    REFERENCES public.sales_outlet (sales_outlet_id)
    NOT VALID;


ALTER TABLE public.sales_transaction
    ADD FOREIGN KEY (staff_id)
    REFERENCES public.staff (staff_id)
    NOT VALID;

END;