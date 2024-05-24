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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_size integer NOT NULL,
    galaxy_weight integer,
    description text,
    distance_from_earth numeric,
    is_visible_to_naked_eye boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(64) NOT NULL,
    moon_size numeric,
    moon_weight numeric,
    planet_id integer NOT NULL,
    radius numeric,
    mass numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(64) NOT NULL,
    planet_color text,
    star_id integer,
    mass numeric,
    distance_from_star numeric,
    description text,
    has_life boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(64) NOT NULL,
    star_is_cool boolean NOT NULL,
    star_is_bright boolean,
    galaxy_id integer,
    age_in_millions_of_years numeric,
    distance_from_earth numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: super_galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.super_galaxy (
    super_galaxy_id integer NOT NULL,
    name character varying(64),
    super_galaxy_size integer,
    description text NOT NULL,
    is_visible boolean NOT NULL
);


ALTER TABLE public.super_galaxy OWNER TO freecodecamp;

--
-- Name: super_galaxy_super_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.super_galaxy_super_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.super_galaxy_super_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: super_galaxy_super_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.super_galaxy_super_galaxy_id_seq OWNED BY public.super_galaxy.super_galaxy_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: super_galaxy super_galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.super_galaxy ALTER COLUMN super_galaxy_id SET DEFAULT nextval('public.super_galaxy_super_galaxy_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky way', 0, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'twix', 0, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'snickers', 0, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'mars', 0, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'bounty', 0, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'kinderbon', 0, NULL, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'earthsmoon', NULL, NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'venusmoon', NULL, NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'plutosmoon', NULL, NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Moon 1', NULL, NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Moon 2', NULL, NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Moon 3', NULL, NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Moon 4', NULL, NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Moon 5', NULL, NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Moon 6', NULL, NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Moon 7', NULL, NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Moon 8', NULL, NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Moon 9', NULL, NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Moon 10', NULL, NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Moon 11', NULL, NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Moon 12', NULL, NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Moon 13', NULL, NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Moon 14', NULL, NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Moon 15', NULL, NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Moon 16', NULL, NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Moon 17', NULL, NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Moon 18', NULL, NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'Moon 19', NULL, NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (24, 'Moon 20', NULL, NULL, 2, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'earth', NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'pluto', NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'venus', NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'mercury', NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'jupiter', NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'saturn', NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'uranus', NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'neptune', NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'planet_1', NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'planet_2', NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'planet_3', NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (13, 'planet_4', NULL, 3, NULL, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'sun', false, NULL, 1, NULL, NULL);
INSERT INTO public.star VALUES (4, 'small_sun', false, NULL, 1, NULL, NULL);
INSERT INTO public.star VALUES (5, 'big_sun', false, NULL, 1, NULL, NULL);
INSERT INTO public.star VALUES (6, 'sun2', false, NULL, 1, NULL, NULL);
INSERT INTO public.star VALUES (7, 'sun3', false, NULL, 1, NULL, NULL);
INSERT INTO public.star VALUES (10, 'cool', true, NULL, 1, NULL, NULL);


--
-- Data for Name: super_galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.super_galaxy VALUES (1, 'alpha', NULL, 'No description available', false);
INSERT INTO public.super_galaxy VALUES (2, 'beta', NULL, 'No description available', false);
INSERT INTO public.super_galaxy VALUES (3, 'gamma', NULL, 'No description available', false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: super_galaxy_super_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.super_galaxy_super_galaxy_id_seq', 3, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: super_galaxy super_galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.super_galaxy
    ADD CONSTRAINT super_galaxy_pkey PRIMARY KEY (super_galaxy_id);


--
-- Name: super_galaxy super_galaxy_super_galaxy_size_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.super_galaxy
    ADD CONSTRAINT super_galaxy_super_galaxy_size_key UNIQUE (super_galaxy_size);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: star unique_star_name_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name_galaxy UNIQUE (name, galaxy_id);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

