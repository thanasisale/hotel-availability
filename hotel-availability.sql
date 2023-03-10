--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.7

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Name: bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings (
    id integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "checkinDate" timestamp(3) without time zone NOT NULL,
    "checkoutDate" timestamp(3) without time zone NOT NULL,
    "roomId" integer NOT NULL
);


ALTER TABLE public.bookings OWNER TO postgres;

--
-- Name: bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bookings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bookings_id_seq OWNER TO postgres;

--
-- Name: bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bookings_id_seq OWNED BY public.bookings.id;


--
-- Name: rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms (
    id integer NOT NULL,
    "bedsNumber" integer NOT NULL
);


ALTER TABLE public.rooms OWNER TO postgres;

--
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rooms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rooms_id_seq OWNER TO postgres;

--
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rooms_id_seq OWNED BY public.rooms.id;


--
-- Name: bookings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings ALTER COLUMN id SET DEFAULT nextval('public.bookings_id_seq'::regclass);


--
-- Name: rooms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms ALTER COLUMN id SET DEFAULT nextval('public.rooms_id_seq'::regclass);


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
25a3d7df-82c8-4c3b-a6cb-e53d8f20cd7c	2ba71209ba6664168ae0f7009f5917fe643e21193e8458f44f0344ba9d969efe	2023-02-13 21:15:09.080901+00	20230211141635_init	\N	\N	2023-02-13 21:15:09.035141+00	1
\.


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookings (id, "createdAt", "checkinDate", "checkoutDate", "roomId") FROM stdin;
1	2023-02-13 21:15:13.751	2023-10-01 13:09:58.336	2023-10-03 13:09:58.336	1
2	2023-02-13 21:15:13.751	2023-01-16 11:51:42.995	2023-01-18 11:51:42.995	1
3	2023-02-13 21:15:13.751	2023-05-10 03:17:15.286	2023-05-12 03:17:15.286	2
4	2023-02-13 21:15:13.751	2023-01-01 00:56:01.863	2023-01-03 00:56:01.863	3
5	2023-02-13 21:15:13.751	2023-09-29 02:39:24.956	2023-10-01 02:39:24.956	2
6	2023-02-13 21:15:13.751	2023-12-21 08:29:36.958	2023-12-23 08:29:36.958	4
7	2023-02-13 21:15:13.751	2023-05-17 11:02:30.45	2023-05-19 11:02:30.45	4
8	2023-02-13 21:15:13.751	2023-11-05 05:45:24.193	2023-11-07 05:45:24.193	6
9	2023-02-13 21:15:13.752	2023-08-27 10:43:22.351	2023-08-29 10:43:22.351	7
10	2023-02-13 21:15:13.752	2023-09-18 19:59:59.006	2023-09-20 19:59:59.006	7
11	2023-02-13 21:15:13.751	2023-12-20 23:25:02.176	2023-12-22 23:25:02.176	6
12	2023-02-13 21:15:13.751	2023-09-15 11:19:40.023	2023-09-17 11:19:40.023	6
13	2023-02-13 21:15:13.752	2023-10-12 18:22:57.665	2023-10-14 18:22:57.665	7
14	2023-02-13 21:15:13.752	2023-08-11 03:23:25.742	2023-08-13 03:23:25.742	10
15	2023-02-13 21:15:13.752	2023-03-02 14:49:36.407	2023-03-04 14:49:36.407	10
16	2023-02-13 21:15:13.752	2023-06-23 11:30:27.297	2023-06-25 11:30:27.297	10
\.


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms (id, "bedsNumber") FROM stdin;
1	2
2	2
3	2
4	2
5	3
6	2
7	3
8	2
9	3
10	3
\.


--
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookings_id_seq', 16, true);


--
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_id_seq', 10, true);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- Name: bookings bookings_roomId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT "bookings_roomId_fkey" FOREIGN KEY ("roomId") REFERENCES public.rooms(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

