--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: client; Type: TABLE; Schema: public; Owner: locadora; Tablespace: 
--

CREATE TABLE client (
    user_id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.client OWNER TO locadora;

--
-- Name: client_sequence; Type: SEQUENCE; Schema: public; Owner: locadora
--

CREATE SEQUENCE client_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_sequence OWNER TO locadora;

--
-- Name: movie; Type: TABLE; Schema: public; Owner: locadora; Tablespace: 
--

CREATE TABLE movie (
    movie_id integer NOT NULL,
    title character varying(255) NOT NULL,
    director character varying(255) NOT NULL,
    number_of_copies integer
);


ALTER TABLE public.movie OWNER TO locadora;

--
-- Name: movie_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE movie_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movie_sequence OWNER TO postgres;

--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: locadora
--

COPY client (user_id, name, email, password) FROM stdin;
\.


--
-- Name: client_sequence; Type: SEQUENCE SET; Schema: public; Owner: locadora
--

SELECT pg_catalog.setval('client_sequence', 1, false);


--
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: locadora
--

COPY movie (movie_id, title, director, number_of_copies) FROM stdin;
\.


--
-- Name: movie_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('movie_sequence', 1, false);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

