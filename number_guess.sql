--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE guessing_game;
--
-- Name: guessing_game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE guessing_game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE guessing_game OWNER TO freecodecamp;

\connect guessing_game

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_name character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (7, 'jOSH', 2, 2);
INSERT INTO public.users VALUES (8, 'Josh', 2, 1);
INSERT INTO public.users VALUES (18, 'user_1726603755779', 2, 25);
INSERT INTO public.users VALUES (10, 'user_1726603104486', 2, 198);
INSERT INTO public.users VALUES (17, 'user_1726603755780', 5, 25);
INSERT INTO public.users VALUES (9, 'user_1726603104487', 5, 206);
INSERT INTO public.users VALUES (12, 'user_1726603129378', 2, 234);
INSERT INTO public.users VALUES (20, 'user_1726603783297', 2, 18);
INSERT INTO public.users VALUES (11, 'user_1726603129379', 5, 442);
INSERT INTO public.users VALUES (19, 'user_1726603783298', 5, 467);
INSERT INTO public.users VALUES (14, 'user_1726603131335', 2, 719);
INSERT INTO public.users VALUES (13, 'user_1726603131336', 5, 501);
INSERT INTO public.users VALUES (16, 'user_1726603452728', 2, 81);
INSERT INTO public.users VALUES (15, 'user_1726603452729', 5, 255);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 20, true);


--
-- Name: users users_user_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_name_key UNIQUE (user_name);


--
-- PostgreSQL database dump complete
--

