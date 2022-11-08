--

-- PostgreSQL database dump

--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;

--

-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp

--

CREATE DATABASE universe
WITH
    TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';

ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe SET statement_timeout = 0;

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

-- Name: final; Type: TABLE; Schema: public; Owner: freecodecamp

--

CREATE TABLE
    public.final (
        final_id integer NOT NULL,
        name character varying(60) NOT NULL,
        date date
    );

ALTER TABLE public.final OWNER TO freecodecamp;

--

-- Name: final_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp

--

CREATE SEQUENCE public.final_id_seq AS integer START
WITH
    1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE public.final_id_seq OWNER TO freecodecamp;

--

-- Name: final_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp

--

ALTER SEQUENCE public.final_id_seq OWNED BY public.final.final_id;

--

-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp

--

CREATE TABLE
    public.galaxy (
        galaxy_id integer NOT NULL,
        name character varying(60) NOT NULL,
        age_in_millions_of_years numeric,
        has_life boolean,
        is_spherical boolean,
        description text,
        galaxy_type integer,
        age_discovered integer
    );

ALTER TABLE public.galaxy OWNER TO freecodecamp;

--

-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp

--

CREATE SEQUENCE public.galaxy_galaxy_id_seq AS integer START
WITH
    1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--

-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp

--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;

--

-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp

--

CREATE TABLE
    public.moon (
        moon_id integer NOT NULL,
        name character varying(60) NOT NULL,
        age_in_millions_of_years numeric,
        has_life boolean,
        is_spherical boolean,
        description text,
        moon_type integer,
        age_discovered integer,
        planet_id integer
    );

ALTER TABLE public.moon OWNER TO freecodecamp;

--

-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp

--

CREATE SEQUENCE public.moon_moon_id_seq AS integer START
WITH
    1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--

-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp

--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;

--

-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp

--

CREATE TABLE
    public.planet (
        planet_id integer NOT NULL,
        name character varying(60) NOT NULL,
        age_in_millions_of_years numeric,
        has_life boolean,
        is_spherical boolean,
        description text,
        planet_type integer,
        age_discovered integer,
        star_id integer
    );

ALTER TABLE public.planet OWNER TO freecodecamp;

--

-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp

--

CREATE SEQUENCE public.planet_planet_id_seq AS integer START
WITH
    1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--

-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp

--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;

--

-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp

--

CREATE TABLE
    public.star (
        star_id integer NOT NULL,
        name character varying(60) NOT NULL,
        age_in_millions_of_years numeric,
        has_life boolean,
        is_spherical boolean,
        description text,
        star_type integer,
        age_discovered integer,
        galaxy_id integer
    );

ALTER TABLE public.star OWNER TO freecodecamp;

--

-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp

--

CREATE SEQUENCE public.star_star_id_seq AS integer START
WITH
    1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--

-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp

--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;

--

-- Name: final final_id; Type: DEFAULT; Schema: public; Owner: freecodecamp

--

ALTER TABLE ONLY public.final
ALTER COLUMN final_id
SET
    DEFAULT nextval(
        'public.final_id_seq':: regclass
    );

--

-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp

--

ALTER TABLE ONLY public.galaxy
ALTER COLUMN galaxy_id
SET
    DEFAULT nextval(
        'public.galaxy_galaxy_id_seq':: regclass
    );

--

-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp

--

ALTER TABLE ONLY public.moon
ALTER COLUMN moon_id
SET
    DEFAULT nextval(
        'public.moon_moon_id_seq':: regclass
    );

--

-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp

--

ALTER TABLE ONLY public.planet
ALTER COLUMN planet_id
SET
    DEFAULT nextval(
        'public.planet_planet_id_seq':: regclass
    );

--

-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp

--

ALTER TABLE ONLY public.star
ALTER COLUMN star_id
SET
    DEFAULT nextval(
        'public.star_star_id_seq':: regclass
    );

--

-- Data for Name: final; Type: TABLE DATA; Schema: public; Owner: freecodecamp

--

INSERT INTO public.final VALUES (1, 'a', '2022-10-07');

INSERT INTO public.final VALUES (2, 'b', '2022-10-08');

INSERT INTO public.final VALUES (3, 'c', '2022-10-09');

--

-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp

--

INSERT INTO public.galaxy
VALUES (
        1,
        'a',
        1,
        true,
        false,
        'haha',
        1,
        1900
    );

INSERT INTO public.galaxy
VALUES (
        2,
        'b',
        2,
        true,
        false,
        'jijo',
        2,
        1991
    );

INSERT INTO public.galaxy
VALUES (
        3,
        'c',
        1.3,
        true,
        true,
        'jlj',
        1,
        1987
    );

INSERT INTO public.galaxy
VALUES (
        4,
        'd',
        1.3,
        false,
        false,
        'lll',
        2,
        1976
    );

INSERT INTO public.galaxy
VALUES (
        5,
        'e',
        1.7,
        false,
        false,
        'kkk',
        4,
        1992
    );

INSERT INTO public.galaxy
VALUES (
        6,
        'f',
        1.1,
        false,
        true,
        'ooo',
        9,
        1787
    );

INSERT INTO public.galaxy
VALUES (
        7,
        'g',
        0.6,
        false,
        true,
        'iii',
        7,
        1900
    );

--

-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp

--

INSERT INTO public.moon
VALUES (
        1,
        'a',
        1,
        true,
        false,
        'haha',
        1,
        1900,
        2
    );

INSERT INTO public.moon
VALUES (
        2,
        'b',
        2,
        true,
        false,
        'jijo',
        2,
        1991,
        1
    );

INSERT INTO public.moon
VALUES (
        3,
        'c',
        1.3,
        true,
        true,
        'jlj',
        1,
        1987,
        3
    );

INSERT INTO public.moon
VALUES (
        4,
        'd',
        1.3,
        false,
        false,
        'lll',
        2,
        1976,
        3
    );

INSERT INTO public.moon
VALUES (
        5,
        'e',
        1.7,
        false,
        false,
        'kkk',
        4,
        1992,
        1
    );

INSERT INTO public.moon
VALUES (
        6,
        'f',
        1.1,
        false,
        true,
        'ooo',
        9,
        1787,
        4
    );

INSERT INTO public.moon
VALUES (
        7,
        'g',
        0.6,
        false,
        true,
        'iii',
        7,
        1900,
        5
    );

INSERT INTO public.moon
VALUES (
        8,
        'h',
        1,
        true,
        false,
        'sshaha',
        1,
        1900,
        2
    );

INSERT INTO public.moon
VALUES (
        9,
        'i',
        2,
        true,
        false,
        'ddjijo',
        2,
        1991,
        1
    );

INSERT INTO public.moon
VALUES (
        10,
        'j',
        1.3,
        true,
        true,
        'jljs',
        1,
        1987,
        3
    );

INSERT INTO public.moon
VALUES (
        11,
        'k',
        1.3,
        false,
        false,
        'lllsg',
        2,
        1976,
        3
    );

INSERT INTO public.moon
VALUES (
        12,
        'l',
        1.7,
        false,
        false,
        'kkks',
        4,
        1992,
        1
    );

INSERT INTO public.moon
VALUES (
        13,
        'm',
        1.1,
        false,
        true,
        'ooos',
        9,
        1787,
        4
    );

INSERT INTO public.moon
VALUES (
        14,
        'n',
        0.6,
        false,
        true,
        'iiis',
        7,
        1900,
        5
    );

INSERT INTO public.moon
VALUES (
        15,
        'o',
        1,
        true,
        false,
        'sshahad',
        1,
        1900,
        9
    );

INSERT INTO public.moon
VALUES (
        16,
        'p',
        2,
        true,
        false,
        'dsdjijo',
        2,
        1991,
        1
    );

INSERT INTO public.moon
VALUES (
        17,
        'q',
        1.3,
        true,
        true,
        'asdfjljsq',
        1,
        1987,
        3
    );

INSERT INTO public.moon
VALUES (
        18,
        'r',
        1.3,
        false,
        false,
        'lllsgrrr',
        2,
        1976,
        10
    );

INSERT INTO public.moon
VALUES (
        19,
        's',
        1.7,
        false,
        false,
        'kkksdsf',
        4,
        1992,
        11
    );

INSERT INTO public.moon
VALUES (
        20,
        't',
        1.1,
        false,
        true,
        'ttttooos',
        9,
        1787,
        4
    );

INSERT INTO public.moon
VALUES (
        21,
        'u',
        0.6,
        false,
        true,
        'uuuiiis',
        7,
        1900,
        5
    );

--

-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp

--

INSERT INTO public.planet
VALUES (
        1,
        'a',
        1,
        true,
        false,
        'haha',
        1,
        1900,
        2
    );

INSERT INTO public.planet
VALUES (
        2,
        'b',
        2,
        true,
        false,
        'jijo',
        2,
        1991,
        1
    );

INSERT INTO public.planet
VALUES (
        3,
        'c',
        1.3,
        true,
        true,
        'jlj',
        1,
        1987,
        3
    );

INSERT INTO public.planet
VALUES (
        4,
        'd',
        1.3,
        false,
        false,
        'lll',
        2,
        1976,
        3
    );

INSERT INTO public.planet
VALUES (
        5,
        'e',
        1.7,
        false,
        false,
        'kkk',
        4,
        1992,
        1
    );

INSERT INTO public.planet
VALUES (
        6,
        'f',
        1.1,
        false,
        true,
        'ooo',
        9,
        1787,
        4
    );

INSERT INTO public.planet
VALUES (
        7,
        'g',
        0.6,
        false,
        true,
        'iii',
        7,
        1900,
        5
    );

INSERT INTO public.planet
VALUES (
        8,
        'h',
        1,
        true,
        false,
        'sshaha',
        1,
        1900,
        2
    );

INSERT INTO public.planet
VALUES (
        9,
        'i',
        2,
        true,
        false,
        'ddjijo',
        2,
        1991,
        1
    );

INSERT INTO public.planet
VALUES (
        10,
        'j',
        1.3,
        true,
        true,
        'jljs',
        1,
        1987,
        3
    );

INSERT INTO public.planet
VALUES (
        11,
        'k',
        1.3,
        false,
        false,
        'lllsg',
        2,
        1976,
        3
    );

INSERT INTO public.planet
VALUES (
        12,
        'l',
        1.7,
        false,
        false,
        'kkks',
        4,
        1992,
        1
    );

INSERT INTO public.planet
VALUES (
        13,
        'm',
        1.1,
        false,
        true,
        'ooos',
        9,
        1787,
        4
    );

INSERT INTO public.planet
VALUES (
        14,
        'n',
        0.6,
        false,
        true,
        'iiis',
        7,
        1900,
        5
    );

--

-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp

--

INSERT INTO public.star
VALUES (
        1,
        'a',
        1,
        true,
        false,
        'haha',
        1,
        1900,
        2
    );

INSERT INTO public.star
VALUES (
        2,
        'b',
        2,
        true,
        false,
        'jijo',
        2,
        1991,
        1
    );

INSERT INTO public.star
VALUES (
        3,
        'c',
        1.3,
        true,
        true,
        'jlj',
        1,
        1987,
        3
    );

INSERT INTO public.star
VALUES (
        4,
        'd',
        1.3,
        false,
        false,
        'lll',
        2,
        1976,
        3
    );

INSERT INTO public.star
VALUES (
        5,
        'e',
        1.7,
        false,
        false,
        'kkk',
        4,
        1992,
        1
    );

INSERT INTO public.star
VALUES (
        6,
        'f',
        1.1,
        false,
        true,
        'ooo',
        9,
        1787,
        4
    );

INSERT INTO public.star
VALUES (
        7,
        'g',
        0.6,
        false,
        true,
        'iii',
        7,
        1900,
        5
    );

--

-- Name: final_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp

--

SELECT pg_catalog.setval('public.final_id_seq', 3, true);

--

-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp

--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);

--

-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp

--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);

--

-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp

--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);

--

-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp

--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);

--

-- Name: final final_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

--

ALTER TABLE ONLY public.final
ADD
    CONSTRAINT final_name_key UNIQUE (name);

--

-- Name: final final_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

--

ALTER TABLE ONLY public.final
ADD
    CONSTRAINT final_pkey PRIMARY KEY (final_id);

--

-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

--

ALTER TABLE ONLY public.galaxy
ADD
    CONSTRAINT galaxy_description_key UNIQUE (description);

--

-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

--

ALTER TABLE ONLY public.galaxy
ADD
    CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);

--

-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

--

ALTER TABLE ONLY public.moon
ADD
    CONSTRAINT moon_description_key UNIQUE (description);

--

-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

--

ALTER TABLE ONLY public.moon
ADD
    CONSTRAINT moon_pkey PRIMARY KEY (moon_id);

--

-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

--

ALTER TABLE ONLY public.planet
ADD
    CONSTRAINT planet_description_key UNIQUE (description);

--

-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

--

ALTER TABLE ONLY public.planet
ADD
    CONSTRAINT planet_pkey PRIMARY KEY (planet_id);

--

-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

--

ALTER TABLE ONLY public.star
ADD
    CONSTRAINT star_description_key UNIQUE (description);

--

-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

--

ALTER TABLE ONLY public.star
ADD
    CONSTRAINT star_pkey PRIMARY KEY (star_id);

--

-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp

--

ALTER TABLE ONLY public.moon
ADD
    CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);

--

-- Name: planet planet_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp

--

ALTER TABLE ONLY public.planet
ADD
    CONSTRAINT planet_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);

--

-- Name: star star_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp

--

ALTER TABLE ONLY public.star
ADD
    CONSTRAINT star_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);

--

-- PostgreSQL database dump complete

--