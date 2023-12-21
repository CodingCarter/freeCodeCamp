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
    description text,
    age_in_billions_of_years integer NOT NULL,
    has_life boolean,
    distance_from_earth numeric,
    galaxy_types character varying(60)
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
    name character varying(60) NOT NULL,
    planet_id integer,
    description text,
    is_spherical boolean,
    age_in_billions_of_years integer NOT NULL,
    distance_from_earth numeric
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
    name character varying(60) NOT NULL,
    star_id integer,
    description text,
    planet_types character varying(60),
    is_spherical boolean,
    has_life boolean,
    age_in_billions_of_years integer NOT NULL,
    distance_from_earth numeric
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
-- Name: space_ship; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_ship (
    space_ship_id integer NOT NULL,
    name character varying(60) NOT NULL,
    launch_date date,
    mission_type character varying(60),
    status character varying(60),
    description text,
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    moon_id integer
);


ALTER TABLE public.space_ship OWNER TO freecodecamp;

--
-- Name: space_ship_ship_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_ship_ship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_ship_ship_id_seq OWNER TO freecodecamp;

--
-- Name: space_ship_ship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_ship_ship_id_seq OWNED BY public.space_ship.space_ship_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer,
    description text,
    has_life boolean,
    is_spherical boolean,
    star_types character varying(60)
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: space_ship space_ship_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_ship ALTER COLUMN space_ship_id SET DEFAULT nextval('public.space_ship_ship_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy that contains our Solar System.', 13700, false, 0, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest spiral galaxy to the Milky Way.', 10000, false, 2537000, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'The third-largest galaxy.', 13000, false, 3000000, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Famous for its spiral arms.', 12000, false, 23000000, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Appears as a bright disk.', 8900, false, 29000000, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Noted for its spectacular arms and dust lanes.', 21000, false, 21000000, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 'The Earths only natural satellite.', true, 5, 0.384);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'One of Mars two moons, orbits very close to the planet.', true, 5, 1.524);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'The smaller and outermost of Mars two moons.', true, 5, 1.524);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'One of the four Galilean moons of Jupiter, volcanically active.', true, 5, 5.204);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'A Galilean moon of Jupiter, believed to have a subsurface ocean.', true, 5, 5.204);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'The largest moon in the Solar System, orbits Jupiter.', true, 5, 5.204);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'A Galilean moon of Jupiter, heavily cratered.', true, 5, 5.204);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 'The largest moon of Saturn, has a thick atmosphere.', true, 5, 9.582);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 'An icy moon of Saturn, has geysers of water.', true, 5, 9.582);
INSERT INTO public.moon VALUES (10, 'Miranda', 7, 'One of Uranus moons, known for its unique geology.', true, 5, 19.218);
INSERT INTO public.moon VALUES (11, 'Triton', 8, 'The largest moon of Neptune, has a retrograde orbit.', true, 5, 30.047);
INSERT INTO public.moon VALUES (12, 'Tuchanka I', 9, 'A barren moon orbiting Tuchanka.', true, 6, 25000);
INSERT INTO public.moon VALUES (13, 'Tuchanka II', 9, 'A rocky moon with significant volcanic activity.', true, 6, 25000);
INSERT INTO public.moon VALUES (14, 'Thessia I', 10, 'A beautiful moon with a view of Thessias auroras.', true, 4, 35000);
INSERT INTO public.moon VALUES (15, 'Palaven I', 11, 'A moon serving as a military outpost for Palaven.', true, 4, 29000);
INSERT INTO public.moon VALUES (16, 'Palaven II', 11, 'A strategic moon also used for Turian military purposes.', true, 4, 29000);
INSERT INTO public.moon VALUES (17, 'Sur Kesh I', 12, 'A lush moon with a similar biosphere to Sur Kesh.', true, 4, 31000);
INSERT INTO public.moon VALUES (18, 'Rannoch I', 13, 'A moon with remnants of ancient Quarian structures.', true, 4, 36000);
INSERT INTO public.moon VALUES (19, 'Ilium I', 14, 'A moon that is home to a high-tech research facility.', true, 5, 42000);
INSERT INTO public.moon VALUES (20, 'Ilium II', 14, 'Known for its luxury resorts and zero-gravity spas.', true, 5, 42000);
INSERT INTO public.moon VALUES (21, 'Ilium III', 14, 'An industrial moon with many factories and refineries.', true, 5, 42000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'The smallest planet in the Solar System.', 'Terrestrial', true, false, 5, 0.39);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Second planet from the Sun with a toxic atmosphere.', 'Terrestrial', true, false, 5, 0.72);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Our home planet, rich with life.', 'Terrestrial', true, true, 5, 1.0);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'The red planet with potential signs of past water.', 'Terrestrial', true, false, 5, 1.52);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'The largest planet in our Solar System.', 'Gas Giant', true, false, 5, 5.20);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Known for its impressive ring system.', 'Gas Giant', true, false, 5, 9.58);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'The ice giant with a unique rotation axis.', 'Ice Giant', true, false, 5, 19.22);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'The farthest known planet in the Solar System.', 'Ice Giant', true, false, 5, 30.05);
INSERT INTO public.planet VALUES (9, 'Tuchanka', 5, 'Home planet of the Krogan, known for its harsh environments.', 'Terrestrial', true, true, 6, 25000);
INSERT INTO public.planet VALUES (10, 'Thessia', 5, 'A prosperous planet with advanced technology, home to the Asari.', 'Terrestrial', true, true, 4, 35000);
INSERT INTO public.planet VALUES (11, 'Palaven', 4, 'Home world of the Turian race, known for its military strength.', 'Terrestrial', true, true, 5, 29000);
INSERT INTO public.planet VALUES (12, 'Sur Kesh', 4, 'A lush tropical planet, home of the scientific Salarian species.', 'Terrestrial', true, true, 4, 31000);
INSERT INTO public.planet VALUES (13, 'Rannoch', 5, 'The original home of the Quarians, known for its beautiful landscapes.', 'Terrestrial', true, false, 4, 36000);
INSERT INTO public.planet VALUES (14, 'Ilium', 6, 'A hub for trade and commerce, with a free-wheeling capitalist society.', 'Terrestrial', true, true, 5, 42000);


--
-- Data for Name: space_ship; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_ship VALUES (1, 'Endeavor', '2045-06-22', 'Exploration', 'Active', 'Designed to explore the outer reaches of the Andromeda galaxy.', 2, NULL, NULL, NULL);
INSERT INTO public.space_ship VALUES (2, 'Horizon', '2050-01-15', 'Research', 'En Route', 'A research vessel sent to study the anomalies in the Horsehead Nebula.', NULL, 5, NULL, NULL);
INSERT INTO public.space_ship VALUES (3, 'Odyssey', '2061-11-05', 'Colonization', 'Active', 'Carries the first colonists to Rannoch.', NULL, NULL, 13, NULL);
INSERT INTO public.space_ship VALUES (4, 'Pioneer', '2060-03-27', 'Resource Mining', 'Docked', 'Mining ship extracting resources from asteroid 16 Psyche.', NULL, 3, NULL, NULL);
INSERT INTO public.space_ship VALUES (5, 'Voyager III', '2072-07-08', 'Deep Space', 'Lost Contact', 'Sent on a mission to exit the Milky Way, contact was lost.', NULL, NULL, NULL, NULL);
INSERT INTO public.space_ship VALUES (6, 'Galactic Surveyor', '2080-09-17', 'Mapping', 'Active', 'Mapping the uncharted territories of the Triangulum galaxy.', 3, NULL, NULL, NULL);
INSERT INTO public.space_ship VALUES (7, 'Nova Seeker', '2091-05-30', 'Scientific', 'Damaged', 'Studying the supernova remnants in the Cygnus constellation.', NULL, 4, NULL, NULL);
INSERT INTO public.space_ship VALUES (8, 'Eclipse', '2100-12-21', 'Stealth', 'Operational', 'Stealth ship on a covert mission in the Laniakea supercluster.', 4, NULL, NULL, NULL);
INSERT INTO public.space_ship VALUES (9, 'Star Drifter', '2110-06-18', 'Tourism', 'Operational', 'Luxury cruise spaceship offering tours around the Orion Arm.', NULL, 6, NULL, NULL);
INSERT INTO public.space_ship VALUES (10, 'Quantum Leap', '2122-08-25', 'Experimental', 'Testing', 'Testing new quantum drive technology in a nearby star cluster.', NULL, 1, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 'The star at the center of the Solar System.', false, true, 'G-type main-sequence');
INSERT INTO public.star VALUES (2, 'Andromedae Alpha', 2, 'The brightest star in the Andromeda Galaxy.', false, true, 'Blue supergiant');
INSERT INTO public.star VALUES (3, 'Triangulum Alpha', 3, 'A notable star in the Triangulum Galaxy.', false, true, 'Binary star');
INSERT INTO public.star VALUES (4, 'Whirlpool Alpha', 4, 'A massive star in the Whirlpool Galaxy.', false, true, 'Wolf-Rayet star');
INSERT INTO public.star VALUES (5, 'Sombrero Lambda', 5, 'One of the larger stars in the Sombrero Galaxy.', false, true, 'Red giant');
INSERT INTO public.star VALUES (6, 'Pinwheel Sigma', 6, 'A significant star in the Pinwheel Galaxy.', false, true, 'Supergiant');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: space_ship_ship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_ship_ship_id_seq', 10, true);


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
-- Name: space_ship space_ship_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_ship
    ADD CONSTRAINT space_ship_name_key UNIQUE (name);


--
-- Name: space_ship space_ship_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_ship
    ADD CONSTRAINT space_ship_pkey PRIMARY KEY (space_ship_id);


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
-- Name: space_ship space_ship_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_ship
    ADD CONSTRAINT space_ship_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: space_ship space_ship_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_ship
    ADD CONSTRAINT space_ship_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: space_ship space_ship_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_ship
    ADD CONSTRAINT space_ship_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: space_ship space_ship_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_ship
    ADD CONSTRAINT space_ship_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galax_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galax_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

