--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    orbital_period_years numeric,
    is_periodic boolean,
    discovered_by text,
    mass_kg numeric
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    type text,
    stars_num numeric,
    has_black_hole boolean,
    distance_mly numeric,
    name character varying(40) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_id integer,
    radius_km integer,
    is_spherical boolean,
    has_atmosphere boolean,
    discovered_by text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    star_id integer,
    mass_earth numeric,
    has_life boolean,
    orbital_period_days integer,
    is_gas_giant boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    mass_solar numeric,
    is_supernova boolean,
    luminosity integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 75.3, true, 'Edmond Halley', 220000000000000);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 2533, false, 'Alan Hale', 22000000000000);
INSERT INTO public.comet VALUES (3, 'Encke', 3.3, true, 'Johann ncke', 12000000000000);
INSERT INTO public.comet VALUES (4, 'Tempel 1', 5.5, true, 'Ernst Tempel', 7000000000000);
INSERT INTO public.comet VALUES (5, 'Swift-Tuttle', 133, false, 'Lewis Swift', 1000000000000000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Spiral', 250000000000, true, 0, 'Milky Way');
INSERT INTO public.galaxy VALUES (2, 'Spiral', 1000000000000, true, 2.5, 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 'Spiral', 40000000000, false, 3, 'Triangulum');
INSERT INTO public.galaxy VALUES (4, 'Spiral', 100000000000, true, 23, 'Whirlpool');
INSERT INTO public.galaxy VALUES (5, 'Elliptical', 80000000000, true, 29, 'Sombrero');
INSERT INTO public.galaxy VALUES (6, 'Elliptical', 1200000000000, true, 53, 'Messier 87');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1737, true, false, 'N/A');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 11, true, false, 'Asaph Hall');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 6, true, false, 'Asaph Hall');
INSERT INTO public.moon VALUES (4, 'Europa', 4, 1560, true, false, 'Galileo Galilei');
INSERT INTO public.moon VALUES (5, 'Ganymede', 4, 2634, true, false, 'Galileo Galilei');
INSERT INTO public.moon VALUES (6, 'Callisto', 4, 2410, true, false, 'Galileo Galilei');
INSERT INTO public.moon VALUES (7, 'Io', 4, 1821, true, false, 'Galileo Galilei');
INSERT INTO public.moon VALUES (8, 'Titan', 5, 2575, true, true, 'Cassini');
INSERT INTO public.moon VALUES (9, 'Enceladus', 5, 252, true, false, 'Cassini');
INSERT INTO public.moon VALUES (10, 'Mimas', 5, 198, true, false, 'Cassini');
INSERT INTO public.moon VALUES (11, 'Miranda', 6, 235, true, false, 'Giovanni Cassini');
INSERT INTO public.moon VALUES (12, 'Ariel', 6, 578, true, false, 'William Herschel');
INSERT INTO public.moon VALUES (13, 'Umbriel', 6, 584, true, false, 'William Herschel');
INSERT INTO public.moon VALUES (14, 'Titania', 6, 788, true, false, 'William Herschel');
INSERT INTO public.moon VALUES (15, 'Oberon', 6, 761, true, false, 'William Herschel');
INSERT INTO public.moon VALUES (16, 'Nereid', 7, 170, true, false, 'Gerard Kuiper');
INSERT INTO public.moon VALUES (17, 'Triton', 7, 1353, true, true, 'William Lassell');
INSERT INTO public.moon VALUES (18, 'Proteus', 7, 210, true, false, 'Gerard Kuiper');
INSERT INTO public.moon VALUES (19, 'Haumea I', 9, 200, true, false, 'Unknown');
INSERT INTO public.moon VALUES (20, 'Haumea II', 9, 180, true, false, 'Unknown');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1, true, 365, false);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 0.107, false, 687, false);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 0.815, false, 225, false);
INSERT INTO public.planet VALUES (4, 'Jupiter', 1, 317.8, false, 4333, true);
INSERT INTO public.planet VALUES (5, 'Saturn', 1, 95.2, false, 10759, true);
INSERT INTO public.planet VALUES (6, 'Uranus', 1, 14.5, false, 30687, true);
INSERT INTO public.planet VALUES (7, 'Neptune', 1, 17.1, false, 60190, true);
INSERT INTO public.planet VALUES (8, 'Proxima b', 4, 1.27, false, 11, false);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 5, 36, false, 290, true);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 2, 3.1, false, 37, false);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1d', 3, 0.41, false, 4, false);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 3, 0.62, false, 6, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, false, 1, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1.1, false, 1, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 20, true, 126000, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 0.12, false, 0, 1);
INSERT INTO public.star VALUES (5, 'Sirius', 2.1, false, 25, 1);
INSERT INTO public.star VALUES (6, 'Rigel', 21, true, 120000, 2);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: comet unique_comet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT unique_comet_name UNIQUE (name);


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
-- Name: moon fk_planet_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_moon FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

