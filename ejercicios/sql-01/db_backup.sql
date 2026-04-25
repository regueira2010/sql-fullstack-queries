--
-- PostgreSQL database dump
--

\restrict hWJwDWLqCmmhbj0R90tYnsxt5u4wDKVidHKMfvpSuKy2UkJGra4vZ8feqJBDoaF

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-04-25 18:34:23

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 219 (class 1259 OID 16408)
-- Name: clientes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.clientes (
    rut character varying(12) NOT NULL,
    nombre character varying(50) NOT NULL,
    edad integer
);


--
-- TOC entry 4903 (class 0 OID 16408)
-- Dependencies: 219
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.clientes (rut, nombre, edad) FROM stdin;
12122122-2	Pepa	33
13133133-3	Diego	21
13675924-7	Mario	85
14144251-1	Paula	35
16555444-1	Muriela	22
18188188-8	Pato	44
\.


--
-- TOC entry 4755 (class 2606 OID 16414)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (rut);


-- Completed on 2026-04-25 18:34:23

--
-- PostgreSQL database dump complete
--

\unrestrict hWJwDWLqCmmhbj0R90tYnsxt5u4wDKVidHKMfvpSuKy2UkJGra4vZ8feqJBDoaF

