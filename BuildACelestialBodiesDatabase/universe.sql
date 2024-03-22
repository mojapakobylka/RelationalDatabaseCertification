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
    name character varying(30) NOT NULL,
    in_research boolean NOT NULL,
    description text,
    galaxy_types character varying(30)
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
-- Name: made_from_jewel; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.made_from_jewel (
    made_from_jewel_id integer NOT NULL,
    star_id integer,
    planet_id integer,
    name character varying(30) NOT NULL
);


ALTER TABLE public.made_from_jewel OWNER TO freecodecamp;

--
-- Name: made_from_jewel_made_from_jewel_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.made_from_jewel_made_from_jewel_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.made_from_jewel_made_from_jewel_seq OWNER TO freecodecamp;

--
-- Name: made_from_jewel_made_from_jewel_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.made_from_jewel_made_from_jewel_seq OWNED BY public.made_from_jewel.made_from_jewel_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter integer NOT NULL,
    description text,
    planet_id integer
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
    name character varying(30) NOT NULL,
    diameter integer NOT NULL,
    distance_from_earth numeric,
    star_id integer
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
    name character varying(30) NOT NULL,
    in_research boolean NOT NULL,
    description text,
    galaxy_id integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: made_from_jewel made_from_jewel_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.made_from_jewel ALTER COLUMN made_from_jewel_id SET DEFAULT nextval('public.made_from_jewel_made_from_jewel_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', true, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Cigar Galaxy', true, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', false, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Milky Way', true, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'LMC', false, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'NGC 1300', false, NULL, NULL);


--
-- Data for Name: made_from_jewel; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.made_from_jewel VALUES (1, 3, 5, 'Plumbum');
INSERT INTO public.made_from_jewel VALUES (2, 1, 12, 'Gold');
INSERT INTO public.made_from_jewel VALUES (3, 6, 4, 'Silber');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'A', 545, NULL, 2);
INSERT INTO public.moon VALUES (2, 'B', 5405, NULL, 12);
INSERT INTO public.moon VALUES (3, 'C', 445, NULL, 1);
INSERT INTO public.moon VALUES (4, 'D', 45405, NULL, 4);
INSERT INTO public.moon VALUES (5, 'E', 705, NULL, 1);
INSERT INTO public.moon VALUES (6, 'F', 5, NULL, 11);
INSERT INTO public.moon VALUES (7, 'G', 605, NULL, 8);
INSERT INTO public.moon VALUES (8, 'H', 95, NULL, 7);
INSERT INTO public.moon VALUES (9, 'CH', 65, NULL, 7);
INSERT INTO public.moon VALUES (10, 'I', 99, NULL, 9);
INSERT INTO public.moon VALUES (11, 'J', 5, NULL, 5);
INSERT INTO public.moon VALUES (12, 'K', 5405, NULL, 6);
INSERT INTO public.moon VALUES (13, 'L', 88, NULL, 10);
INSERT INTO public.moon VALUES (14, 'M', 100, NULL, 5);
INSERT INTO public.moon VALUES (15, 'N', 11, NULL, 8);
INSERT INTO public.moon VALUES (16, 'O', 5405, NULL, 1);
INSERT INTO public.moon VALUES (17, 'P', 999, NULL, 3);
INSERT INTO public.moon VALUES (18, 'R', 5405, NULL, 11);
INSERT INTO public.moon VALUES (19, 'S', 55, NULL, 3);
INSERT INTO public.moon VALUES (20, 'T', 666, NULL, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 90000, NULL, 5);
INSERT INTO public.planet VALUES (2, 'Venus', 50000, NULL, 5);
INSERT INTO public.planet VALUES (3, 'Earth', 45000, NULL, 5);
INSERT INTO public.planet VALUES (4, 'Mars', 20000, NULL, 5);
INSERT INTO public.planet VALUES (5, 'Saturn', 120000, NULL, 5);
INSERT INTO public.planet VALUES (6, 'Uranus', 180000, NULL, 5);
INSERT INTO public.planet VALUES (7, 'Neptune', 220000, NULL, 5);
INSERT INTO public.planet VALUES (8, 'Pluto', 5000, NULL, 5);
INSERT INTO public.planet VALUES (9, 'Corot', 900000, NULL, 1);
INSERT INTO public.planet VALUES (10, 'Gliese', 8000, NULL, 3);
INSERT INTO public.planet VALUES (11, 'Kepler', 200, NULL, 2);
INSERT INTO public.planet VALUES (12, 'Hip', 8787, NULL, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Eridanus', false, NULL, 6);
INSERT INTO public.star VALUES (3, 'Scorpius', false, NULL, 1);
INSERT INTO public.star VALUES (4, 'Crux', true, NULL, 3);
INSERT INTO public.star VALUES (5, 'Cancer', true, NULL, 2);
INSERT INTO public.star VALUES (6, 'Leo', true, NULL, 4);
INSERT INTO public.star VALUES (1, 'Lynx', true, NULL, 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: made_from_jewel_made_from_jewel_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.made_from_jewel_made_from_jewel_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: made_from_jewel made_from_jewel_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.made_from_jewel
    ADD CONSTRAINT made_from_jewel_name_key UNIQUE (name);


--
-- Name: made_from_jewel made_from_jewel_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.made_from_jewel
    ADD CONSTRAINT made_from_jewel_pkey PRIMARY KEY (made_from_jewel_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: made_from_jewel made_from_jewel_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.made_from_jewel
    ADD CONSTRAINT made_from_jewel_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: made_from_jewel made_from_jewel_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.made_from_jewel
    ADD CONSTRAINT made_from_jewel_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

