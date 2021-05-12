--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.10
-- Dumped by pg_dump version 9.5.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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
-- Name: angestellte; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE angestellte (
    aid integer NOT NULL,
    svnr character(11) NOT NULL,
    vorname character varying(30) NOT NULL,
    familienname character varying(50) NOT NULL,
    geschlecht character(1) NOT NULL,
    gebdat date NOT NULL,
    strasse character varying(100) NOT NULL,
    hausnr character varying(15) NOT NULL,
    plz integer NOT NULL,
    ort character varying(50) NOT NULL,
    account character varying(20) NOT NULL,
    passwd character(32),
    vorgesetzt integer,
    lokalid integer NOT NULL
);


ALTER TABLE angestellte OWNER TO postgres;

--
-- Name: angestellte_aid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE angestellte_aid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE angestellte_aid_seq OWNER TO postgres;

--
-- Name: angestellte_aid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE angestellte_aid_seq OWNED BY angestellte.aid;


--
-- Name: besteht; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE besteht (
    cid integer NOT NULL,
    zid integer NOT NULL,
    menge numeric(6,2) NOT NULL,
    einheit character varying(30) NOT NULL
);


ALTER TABLE besteht OWNER TO postgres;

--
-- Name: bestellt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE bestellt (
    kundid integer NOT NULL,
    cid integer NOT NULL,
    datum date NOT NULL,
    anzahl integer NOT NULL,
    lokalid integer NOT NULL
);


ALTER TABLE bestellt OWNER TO postgres;

--
-- Name: cocktail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cocktail (
    cid integer NOT NULL,
    cname character varying(40) NOT NULL,
    preis numeric(8,2) NOT NULL,
    zubereitung character varying(512) NOT NULL,
    kid integer NOT NULL,
    zgid integer NOT NULL,
    sgid integer NOT NULL
);


ALTER TABLE cocktail OWNER TO postgres;

--
-- Name: cocktail_cid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cocktail_cid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cocktail_cid_seq OWNER TO postgres;

--
-- Name: cocktail_cid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cocktail_cid_seq OWNED BY cocktail.cid;


--
-- Name: gefaess; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE gefaess (
    gid integer NOT NULL,
    gname character varying(20) NOT NULL
);


ALTER TABLE gefaess OWNER TO postgres;

--
-- Name: gefaess_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE gefaess_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gefaess_gid_seq OWNER TO postgres;

--
-- Name: gefaess_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE gefaess_gid_seq OWNED BY gefaess.gid;


--
-- Name: gehalt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE gehalt (
    aid integer NOT NULL,
    von date NOT NULL,
    bis date NOT NULL,
    gehalt numeric(10,2) NOT NULL
);


ALTER TABLE gehalt OWNER TO postgres;

--
-- Name: kategorie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE kategorie (
    kid integer NOT NULL,
    kbez character varying(25) NOT NULL
);


ALTER TABLE kategorie OWNER TO postgres;

--
-- Name: kategorie_kid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kategorie_kid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kategorie_kid_seq OWNER TO postgres;

--
-- Name: kategorie_kid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kategorie_kid_seq OWNED BY kategorie.kid;


--
-- Name: kunden; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE kunden (
    kundid integer NOT NULL,
    vorname character varying(30) NOT NULL,
    familienname character varying(50) NOT NULL,
    geschlecht character(1) NOT NULL,
    gebdat date,
    strasse character varying(100) NOT NULL,
    hausnr character varying(15) NOT NULL,
    plz integer NOT NULL,
    ort character varying(50) NOT NULL,
    email character varying(100)
);


ALTER TABLE kunden OWNER TO postgres;

--
-- Name: kunden_kundid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kunden_kundid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kunden_kundid_seq OWNER TO postgres;

--
-- Name: kunden_kundid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kunden_kundid_seq OWNED BY kunden.kundid;


--
-- Name: lieferant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE lieferant (
    lid integer NOT NULL,
    lname character varying(40) NOT NULL,
    ladresse character varying(80) NOT NULL
);


ALTER TABLE lieferant OWNER TO postgres;

--
-- Name: lieferant_lid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lieferant_lid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lieferant_lid_seq OWNER TO postgres;

--
-- Name: lieferant_lid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lieferant_lid_seq OWNED BY lieferant.lid;


--
-- Name: liefert; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE liefert (
    zid integer NOT NULL,
    lid integer NOT NULL,
    menge smallint NOT NULL,
    einheit character varying(30) NOT NULL,
    preis numeric(8,2) NOT NULL
);


ALTER TABLE liefert OWNER TO postgres;

--
-- Name: lokal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE lokal (
    lokalid integer NOT NULL,
    eroeffnung date NOT NULL,
    strasse character varying(100) NOT NULL,
    hausnr character varying(15) NOT NULL,
    plz integer NOT NULL,
    ort character varying(50) NOT NULL
);


ALTER TABLE lokal OWNER TO postgres;

--
-- Name: lokal_lokalid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lokal_lokalid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lokal_lokalid_seq OWNER TO postgres;

--
-- Name: lokal_lokalid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lokal_lokalid_seq OWNED BY lokal.lokalid;


--
-- Name: zutat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE zutat (
    zid integer NOT NULL,
    zbez character varying(40) NOT NULL
);


ALTER TABLE zutat OWNER TO postgres;

--
-- Name: zutat_zid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE zutat_zid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zutat_zid_seq OWNER TO postgres;

--
-- Name: zutat_zid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE zutat_zid_seq OWNED BY zutat.zid;


--
-- Name: aid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY angestellte ALTER COLUMN aid SET DEFAULT nextval('angestellte_aid_seq'::regclass);


--
-- Name: cid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cocktail ALTER COLUMN cid SET DEFAULT nextval('cocktail_cid_seq'::regclass);


--
-- Name: gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gefaess ALTER COLUMN gid SET DEFAULT nextval('gefaess_gid_seq'::regclass);


--
-- Name: kid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kategorie ALTER COLUMN kid SET DEFAULT nextval('kategorie_kid_seq'::regclass);


--
-- Name: kundid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kunden ALTER COLUMN kundid SET DEFAULT nextval('kunden_kundid_seq'::regclass);


--
-- Name: lid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lieferant ALTER COLUMN lid SET DEFAULT nextval('lieferant_lid_seq'::regclass);


--
-- Name: lokalid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lokal ALTER COLUMN lokalid SET DEFAULT nextval('lokal_lokalid_seq'::regclass);


--
-- Name: zid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY zutat ALTER COLUMN zid SET DEFAULT nextval('zutat_zid_seq'::regclass);


--
-- Data for Name: angestellte; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO angestellte VALUES (1, '4774 140482', 'Martin', 'Wimmer', 'm', '1982-04-14', 'Dreistücken', '26/2', 1150, 'Wien', 'wimmer.martin', 'e7dc750b88b2a23cd8f2dff9e30ef591', NULL, 1);
INSERT INTO angestellte VALUES (2, '2476 280582', 'Hans', 'Pichler', 'm', '1982-05-28', 'Basteistraße', '34', 1080, 'Wien', 'pichler.hans', 'a9685f75d6e61f1208e2351b731d8b22', 1, 1);
INSERT INTO angestellte VALUES (3, '3247 130879', 'Aleksandra', 'Hofer', 'w', '1979-08-13', 'Berkersheimer Weg', '86/5/13', 3002, 'Purkersdorf', 'hofer.aleksandra', '284b8e39d8b4cdfaea701a1d07bb8e26', 1, 1);
INSERT INTO angestellte VALUES (4, '2627 131170', 'Pia', 'Moser', 'w', '1970-11-13', 'Myliusstraße', '74a', 1060, 'Wien', 'moser.pia', 'c8550bb410d263170a57f58fe055d676', 2, 1);
INSERT INTO angestellte VALUES (5, '3918 070970', 'Oxana', 'Mayer', 'w', '1970-09-07', 'Landgraf-Philipp-Straße', '47/7', 1210, 'Wien', 'mayer.oxana', 'bfade05e94692ab1489457b812658e0c', 3, 1);
INSERT INTO angestellte VALUES (6, '5241 061284', 'Egon', 'Bauer', 'm', '1984-12-06', 'Leinpfadbrücke', '5/2', 1110, 'Wien', 'bauer.egon', 'bd0c08e41e923328003f3fed9b47637f', 2, 1);
INSERT INTO angestellte VALUES (7, '3981 270482', 'Elisabeth', 'Weber', 'w', '1982-04-27', 'Dringsheide', '25/21', 1070, 'Wien', 'weber.elisabeth', '06703f0e024be4ecee550665dab74ed5', NULL, 2);
INSERT INTO angestellte VALUES (8, '3994 240387', 'Moritz', 'Nikolic', 'm', '1987-03-24', 'Konrad-Glatt-Straße', '149', 1090, 'Wien', 'nikolic.moritz', '1fa887f43814fc13b61fd0fca4981953', 2, 1);
INSERT INTO angestellte VALUES (9, '3050 220793', 'Johann', 'Leitner', 'm', '1993-07-22', 'Holsteiner Straße', '139', 1040, 'Wien', 'leitner.johann', '2db1be754d9ed4f365075cac29294ed5', 7, 2);
INSERT INTO angestellte VALUES (12, '4162 090277', 'Machmud', 'Abdul', 'm', '1977-02-09', 'Adalbert-Stifter-Straße', '21', 1210, 'Wien', 'abdul.machmud', 'd352db9b340d084cd8731aab0b2dfb43', 3, 1);
INSERT INTO angestellte VALUES (13, '5298 250485', 'Ivana', 'Koch', 'w', '1985-04-25', 'Rubinsteinstraße', '69a', 1220, 'Wien', 'koch.ivana', '530c3ade1e8faffeef756c507ef90235', 7, 2);
INSERT INTO angestellte VALUES (14, '3023 070174', 'Carina', 'Kaiser', 'w', '1974-01-07', 'Sandweg', '11', 2381, 'Wolfsgraben', 'kaiser.carina', 'e61296e0fd76c16ee916ce533fa11d6d', 3, 1);
INSERT INTO angestellte VALUES (15, '2086 260967', 'Markus', 'Ziegler', 'm', '1967-09-26', 'Albrecht-Dürer-Str.', '61', 1130, 'Wien', 'ziegler.markus', '8c7b3d8576488645115a80c1e9c32d6c', 13, 2);
INSERT INTO angestellte VALUES (16, '3422 250480', 'Carolin', 'König', 'w', '1980-04-25', 'Robert-Bunsen-Straße', '13/2/8', 1220, 'Wien', 'könig.carolin', 'ca33af7d7d47d019c4908e66fbbfe18c', 13, 2);
INSERT INTO angestellte VALUES (17, '2137 050467', 'Sonja', 'Seidl', 'w', '1967-04-05', 'Auf der Scholle', '123/9', 2362, 'Biedermannsdorf', 'seidl.sonja', '03547ef4ee26e514dc353aa8ecd82e3a', 2, 1);
INSERT INTO angestellte VALUES (18, '2111 180584', 'Andrea', 'Holzer', 'w', '1984-05-18', 'Seefelder Weg', '57', 1210, 'Wien', 'holzer.andrea', 'a9ea57af46bc262463d5612a7f421249', 13, 2);
INSERT INTO angestellte VALUES (10, '4254 011169', 'Lisa', 'Hofbauer', 'w', '1969-11-01', 'Bürgeler Straße', '107/5/10', 1120, 'Wien', 'hofbauer.lisa', 'a644eca97625343b80241dd893091997', 9, 2);
INSERT INTO angestellte VALUES (11, '2019 280621', 'Jennifer', 'Novak', 'w', '1981-06-28', 'Hubertusplatz', '104/5', 1020, 'Wien', 'novak.jennifer', 'f9be1694a9f6546326843eb84ccbaf91', 9, 2);


--
-- Name: angestellte_aid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('angestellte_aid_seq', 12, false);


--
-- Data for Name: besteht; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO besteht VALUES (1, 1, 2.00, 'cl');
INSERT INTO besteht VALUES (1, 2, 2.00, 'cl');
INSERT INTO besteht VALUES (1, 3, 8.00, 'cl');
INSERT INTO besteht VALUES (1, 4, 8.00, 'cl');
INSERT INTO besteht VALUES (2, 1, 2.00, 'cl');
INSERT INTO besteht VALUES (2, 2, 1.00, 'cl');
INSERT INTO besteht VALUES (2, 3, 8.00, 'cl');
INSERT INTO besteht VALUES (2, 4, 8.00, 'cl');
INSERT INTO besteht VALUES (2, 5, 2.00, 'cl');
INSERT INTO besteht VALUES (3, 1, 3.00, 'cl');
INSERT INTO besteht VALUES (3, 2, 0.10, 'cl (1 dash)');
INSERT INTO besteht VALUES (3, 4, 4.00, 'cl');
INSERT INTO besteht VALUES (3, 5, 2.00, 'cl');
INSERT INTO besteht VALUES (3, 6, 4.00, 'cl');
INSERT INTO besteht VALUES (4, 2, 0.20, 'cl (2 dashes)');
INSERT INTO besteht VALUES (4, 3, 5.00, 'cl');
INSERT INTO besteht VALUES (4, 7, 5.00, 'cl');
INSERT INTO besteht VALUES (4, 8, 0.20, 'cl (2 dashes)');
INSERT INTO besteht VALUES (5, 4, 6.00, 'cl');
INSERT INTO besteht VALUES (5, 9, 0.50, 'piece');
INSERT INTO besteht VALUES (5, 10, 1.00, 'cl');
INSERT INTO besteht VALUES (5, 11, 0.20, 'piece (1 slice)');
INSERT INTO besteht VALUES (6, 4, 6.00, 'cl');
INSERT INTO besteht VALUES (6, 5, 4.00, 'cl');
INSERT INTO besteht VALUES (7, 2, 0.10, 'cl (1 dash)');
INSERT INTO besteht VALUES (7, 12, 10.00, 'cl');
INSERT INTO besteht VALUES (7, 13, 10.00, 'cl');
INSERT INTO besteht VALUES (8, 14, 0.20, 'cl (2 dashes)');
INSERT INTO besteht VALUES (8, 15, 3.00, 'cl');
INSERT INTO besteht VALUES (8, 16, 1.50, 'cl');
INSERT INTO besteht VALUES (8, 17, 1.50, 'cl');
INSERT INTO besteht VALUES (9, 7, 2.00, 'cl');
INSERT INTO besteht VALUES (9, 14, 0.20, 'cl (2 dashes)');
INSERT INTO besteht VALUES (9, 18, 5.00, 'cl');
INSERT INTO besteht VALUES (9, 19, 1.00, 'cl');
INSERT INTO besteht VALUES (10, 2, 0.10, 'cl (1 dash)');
INSERT INTO besteht VALUES (10, 17, 1.00, 'cl');
INSERT INTO besteht VALUES (10, 20, 1.00, 'cl');
INSERT INTO besteht VALUES (10, 21, 4.00, 'cl');
INSERT INTO besteht VALUES (10, 22, 2.00, 'cl');
INSERT INTO besteht VALUES (11, 22, 1.00, 'cl');
INSERT INTO besteht VALUES (11, 23, 5.00, 'cl');
INSERT INTO besteht VALUES (12, 4, 1.00, 'cl');
INSERT INTO besteht VALUES (12, 17, 1.00, 'cl');
INSERT INTO besteht VALUES (12, 20, 1.00, 'cl');
INSERT INTO besteht VALUES (12, 23, 3.00, 'cl');
INSERT INTO besteht VALUES (13, 17, 1.50, 'cl');
INSERT INTO besteht VALUES (13, 22, 1.50, 'cl');
INSERT INTO besteht VALUES (13, 24, 0.10, 'cl (1 dash)');
INSERT INTO besteht VALUES (13, 25, 3.00, 'cl');
INSERT INTO besteht VALUES (14, 12, 15.00, 'cl');
INSERT INTO besteht VALUES (14, 25, 5.00, 'cl');
INSERT INTO besteht VALUES (15, 3, 4.00, 'cl');
INSERT INTO besteht VALUES (15, 12, 12.00, 'cl');
INSERT INTO besteht VALUES (15, 23, 4.00, 'cl');
INSERT INTO besteht VALUES (16, 9, 0.25, 'piece');
INSERT INTO besteht VALUES (16, 12, 13.00, 'cl');
INSERT INTO besteht VALUES (16, 26, 2.00, 'cl');
INSERT INTO besteht VALUES (16, 27, 5.00, 'cl');
INSERT INTO besteht VALUES (17, 12, 15.00, 'cl');
INSERT INTO besteht VALUES (17, 21, 5.00, 'cl');
INSERT INTO besteht VALUES (18, 17, 3.00, 'cl');
INSERT INTO besteht VALUES (18, 28, 3.00, 'cl');
INSERT INTO besteht VALUES (19, 29, 2.00, 'cl');
INSERT INTO besteht VALUES (19, 30, 4.00, 'cl');
INSERT INTO besteht VALUES (20, 9, 0.25, 'piece');
INSERT INTO besteht VALUES (20, 31, 5.00, 'cl');
INSERT INTO besteht VALUES (20, 32, 12.00, 'g (2 spoons)');
INSERT INTO besteht VALUES (21, 7, 2.00, 'cl');
INSERT INTO besteht VALUES (21, 27, 4.00, 'cl');
INSERT INTO besteht VALUES (21, 33, 2.00, 'cl');
INSERT INTO besteht VALUES (22, 8, 4.00, 'cl');
INSERT INTO besteht VALUES (22, 9, 0.50, 'piece');
INSERT INTO besteht VALUES (22, 21, 6.00, 'cl');
INSERT INTO besteht VALUES (22, 34, 4.00, 'g (1 spoon)');
INSERT INTO besteht VALUES (22, 35, 3.00, 'piece');
INSERT INTO besteht VALUES (23, 4, 6.00, 'cl');
INSERT INTO besteht VALUES (23, 5, 4.00, 'cl');
INSERT INTO besteht VALUES (23, 21, 6.00, 'cl');
INSERT INTO besteht VALUES (24, 3, 10.00, 'cl');
INSERT INTO besteht VALUES (24, 30, 5.00, 'cl');
INSERT INTO besteht VALUES (25, 1, 2.00, 'cl');
INSERT INTO besteht VALUES (25, 4, 6.00, 'cl');
INSERT INTO besteht VALUES (25, 5, 2.00, 'cl');
INSERT INTO besteht VALUES (25, 21, 2.00, 'cl');
INSERT INTO besteht VALUES (25, 30, 2.00, 'cl');
INSERT INTO besteht VALUES (25, 36, 2.00, 'cl');
INSERT INTO besteht VALUES (26, 2, 0.20, 'cl (2 dashes)');
INSERT INTO besteht VALUES (26, 3, 10.00, 'cl');
INSERT INTO besteht VALUES (26, 9, 0.50, 'piece');
INSERT INTO besteht VALUES (26, 27, 6.00, 'cl');
INSERT INTO besteht VALUES (27, 7, 2.00, 'cl');
INSERT INTO besteht VALUES (27, 19, 1.00, 'cl');
INSERT INTO besteht VALUES (27, 25, 4.00, 'cl');
INSERT INTO besteht VALUES (27, 34, 4.00, 'g (1 spoon)');
INSERT INTO besteht VALUES (28, 1, 0.10, 'cl (1 dash)');
INSERT INTO besteht VALUES (28, 29, 2.00, 'cl');
INSERT INTO besteht VALUES (28, 30, 3.00, 'cl');
INSERT INTO besteht VALUES (29, 2, 0.20, 'cl (2 dashes)');
INSERT INTO besteht VALUES (29, 3, 2.00, 'cl');
INSERT INTO besteht VALUES (29, 7, 4.00, 'cl');
INSERT INTO besteht VALUES (29, 21, 2.00, 'cl');
INSERT INTO besteht VALUES (29, 37, 2.00, 'cl');
INSERT INTO besteht VALUES (29, 38, 2.00, 'cl');
INSERT INTO besteht VALUES (29, 39, 6.00, 'cl');
INSERT INTO besteht VALUES (30, 3, 8.00, 'cl');
INSERT INTO besteht VALUES (30, 30, 4.00, 'cl');
INSERT INTO besteht VALUES (30, 40, 4.00, 'cl');
INSERT INTO besteht VALUES (30, 41, 4.00, 'cl');
INSERT INTO besteht VALUES (31, 33, 2.00, 'cl');
INSERT INTO besteht VALUES (31, 38, 1.00, 'cl');
INSERT INTO besteht VALUES (31, 42, 2.00, 'cl');
INSERT INTO besteht VALUES (31, 43, 2.00, 'cl');
INSERT INTO besteht VALUES (32, 27, 1.00, 'cl');
INSERT INTO besteht VALUES (32, 30, 1.00, 'cl');
INSERT INTO besteht VALUES (32, 36, 1.00, 'cl');
INSERT INTO besteht VALUES (33, 42, 3.00, 'cl');
INSERT INTO besteht VALUES (33, 44, 3.00, 'cl');
INSERT INTO besteht VALUES (34, 29, 2.00, 'cl');
INSERT INTO besteht VALUES (34, 42, 2.00, 'cl');
INSERT INTO besteht VALUES (34, 44, 2.00, 'cl');
INSERT INTO besteht VALUES (35, 13, 3.50, 'cl');
INSERT INTO besteht VALUES (35, 27, 2.50, 'cl');
INSERT INTO besteht VALUES (36, 7, 2.00, 'cl');
INSERT INTO besteht VALUES (36, 19, 2.00, 'cl');
INSERT INTO besteht VALUES (36, 21, 4.00, 'cl');
INSERT INTO besteht VALUES (36, 39, 0.20, 'cl (2 dashes)');
INSERT INTO besteht VALUES (37, 4, 4.00, 'cl');
INSERT INTO besteht VALUES (37, 10, 1.00, 'cl');
INSERT INTO besteht VALUES (37, 25, 4.00, 'cl');
INSERT INTO besteht VALUES (37, 33, 1.00, 'cl');
INSERT INTO besteht VALUES (38, 3, 3.00, 'cl');
INSERT INTO besteht VALUES (38, 7, 3.00, 'cl');
INSERT INTO besteht VALUES (38, 45, 3.00, 'cl');
INSERT INTO besteht VALUES (39, 7, 3.00, 'cl');
INSERT INTO besteht VALUES (39, 19, 1.00, 'cl');
INSERT INTO besteht VALUES (39, 23, 4.00, 'cl');
INSERT INTO besteht VALUES (39, 34, 4.00, 'g (1 spoon)');
INSERT INTO besteht VALUES (40, 7, 2.00, 'cl');
INSERT INTO besteht VALUES (40, 19, 2.00, 'cl');
INSERT INTO besteht VALUES (40, 27, 4.00, 'cl');
INSERT INTO besteht VALUES (41, 7, 2.00, 'cl');
INSERT INTO besteht VALUES (41, 19, 2.00, 'cl');
INSERT INTO besteht VALUES (41, 30, 4.00, 'cl');
INSERT INTO besteht VALUES (42, 8, 2.00, 'cl');
INSERT INTO besteht VALUES (42, 22, 5.00, 'cl');
INSERT INTO besteht VALUES (42, 26, 1.00, 'cl');
INSERT INTO besteht VALUES (43, 14, 0.10, 'cl (1 dash)');
INSERT INTO besteht VALUES (43, 16, 2.00, 'cl');
INSERT INTO besteht VALUES (43, 22, 2.00, 'cl');
INSERT INTO besteht VALUES (44, 15, 3.00, 'cl');
INSERT INTO besteht VALUES (44, 22, 3.00, 'cl');
INSERT INTO besteht VALUES (44, 46, 2.00, 'cl');
INSERT INTO besteht VALUES (45, 21, 5.00, 'cl');
INSERT INTO besteht VALUES (45, 22, 1.00, 'cl');
INSERT INTO besteht VALUES (46, 7, 1.00, 'cl');
INSERT INTO besteht VALUES (46, 30, 4.00, 'cl');
INSERT INTO besteht VALUES (46, 47, 12.00, 'cl');
INSERT INTO besteht VALUES (47, 22, 2.00, 'cl');
INSERT INTO besteht VALUES (47, 23, 2.00, 'cl');
INSERT INTO besteht VALUES (47, 46, 0.20, 'cl (2 dashes)');
INSERT INTO besteht VALUES (48, 17, 1.00, 'cl');
INSERT INTO besteht VALUES (48, 22, 1.00, 'cl');
INSERT INTO besteht VALUES (48, 24, 0.20, 'cl (2 dashes)');
INSERT INTO besteht VALUES (48, 25, 4.00, 'cl');
INSERT INTO besteht VALUES (49, 2, 0.10, 'cl (1 dash)');
INSERT INTO besteht VALUES (49, 4, 4.00, 'cl');
INSERT INTO besteht VALUES (49, 21, 4.00, 'cl');
INSERT INTO besteht VALUES (49, 48, 0.10, 'cl (1 dash)');
INSERT INTO besteht VALUES (50, 2, 0.20, 'cl (2 dashes)');
INSERT INTO besteht VALUES (50, 9, 0.25, 'piece');
INSERT INTO besteht VALUES (50, 25, 4.00, 'cl');
INSERT INTO besteht VALUES (51, 2, 0.10, 'cl (1 dash)');
INSERT INTO besteht VALUES (51, 3, 5.00, 'cl');
INSERT INTO besteht VALUES (51, 7, 1.00, 'cl');
INSERT INTO besteht VALUES (51, 49, 5.00, 'cl');
INSERT INTO besteht VALUES (52, 25, 3.00, 'cl');
INSERT INTO besteht VALUES (52, 46, 2.00, 'cl');


--
-- Data for Name: bestellt; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO bestellt VALUES (27, 44, '2010-03-19', 2, 1);
INSERT INTO bestellt VALUES (89, 12, '2010-03-21', 2, 1);
INSERT INTO bestellt VALUES (82, 21, '2010-03-28', 2, 1);
INSERT INTO bestellt VALUES (6, 6, '2010-04-01', 1, 1);
INSERT INTO bestellt VALUES (59, 10, '2010-04-06', 1, 1);
INSERT INTO bestellt VALUES (123, 14, '2010-04-18', 2, 1);
INSERT INTO bestellt VALUES (58, 10, '2010-04-25', 1, 1);
INSERT INTO bestellt VALUES (52, 23, '2010-05-09', 2, 1);
INSERT INTO bestellt VALUES (29, 49, '2010-05-13', 1, 1);
INSERT INTO bestellt VALUES (95, 15, '2010-05-13', 2, 1);
INSERT INTO bestellt VALUES (106, 21, '2010-05-16', 2, 1);
INSERT INTO bestellt VALUES (38, 38, '2010-05-23', 2, 1);
INSERT INTO bestellt VALUES (19, 52, '2010-05-30', 2, 1);
INSERT INTO bestellt VALUES (8, 26, '2010-06-06', 1, 1);
INSERT INTO bestellt VALUES (118, 51, '2010-06-07', 1, 1);
INSERT INTO bestellt VALUES (64, 43, '2010-06-09', 2, 1);
INSERT INTO bestellt VALUES (60, 11, '2010-06-10', 1, 1);
INSERT INTO bestellt VALUES (109, 10, '2010-06-11', 1, 1);
INSERT INTO bestellt VALUES (1, 23, '2010-06-14', 1, 1);
INSERT INTO bestellt VALUES (116, 38, '2010-06-20', 2, 1);
INSERT INTO bestellt VALUES (31, 9, '2010-07-03', 2, 1);
INSERT INTO bestellt VALUES (61, 37, '2010-07-14', 1, 1);
INSERT INTO bestellt VALUES (24, 38, '2010-07-19', 1, 1);
INSERT INTO bestellt VALUES (32, 20, '2010-07-23', 1, 1);
INSERT INTO bestellt VALUES (46, 42, '2010-07-24', 2, 1);
INSERT INTO bestellt VALUES (60, 16, '2010-07-28', 2, 1);
INSERT INTO bestellt VALUES (55, 30, '2010-08-07', 2, 1);
INSERT INTO bestellt VALUES (8, 38, '2010-08-14', 2, 1);
INSERT INTO bestellt VALUES (71, 40, '2010-08-14', 2, 1);
INSERT INTO bestellt VALUES (56, 13, '2010-08-18', 2, 1);
INSERT INTO bestellt VALUES (119, 20, '2010-08-30', 2, 1);
INSERT INTO bestellt VALUES (13, 36, '2010-09-15', 1, 1);
INSERT INTO bestellt VALUES (110, 27, '2010-09-16', 2, 1);
INSERT INTO bestellt VALUES (33, 20, '2010-09-20', 2, 1);
INSERT INTO bestellt VALUES (92, 17, '2010-09-25', 2, 1);
INSERT INTO bestellt VALUES (39, 41, '2010-09-28', 1, 1);
INSERT INTO bestellt VALUES (33, 7, '2010-09-29', 2, 1);
INSERT INTO bestellt VALUES (40, 7, '2010-09-30', 1, 1);
INSERT INTO bestellt VALUES (40, 4, '2010-10-08', 2, 1);
INSERT INTO bestellt VALUES (40, 2, '2010-10-11', 1, 1);
INSERT INTO bestellt VALUES (100, 50, '2010-10-11', 2, 1);
INSERT INTO bestellt VALUES (18, 39, '2010-10-16', 1, 1);
INSERT INTO bestellt VALUES (12, 44, '2010-10-20', 2, 1);
INSERT INTO bestellt VALUES (102, 41, '2010-10-24', 1, 1);
INSERT INTO bestellt VALUES (44, 15, '2010-11-07', 1, 1);
INSERT INTO bestellt VALUES (56, 48, '2010-11-07', 1, 1);
INSERT INTO bestellt VALUES (32, 38, '2010-11-26', 2, 1);
INSERT INTO bestellt VALUES (92, 41, '2010-12-02', 1, 1);
INSERT INTO bestellt VALUES (60, 20, '2010-12-11', 1, 1);
INSERT INTO bestellt VALUES (62, 39, '2010-12-15', 1, 1);
INSERT INTO bestellt VALUES (15, 35, '2010-12-16', 1, 1);
INSERT INTO bestellt VALUES (10, 23, '2011-01-01', 1, 1);
INSERT INTO bestellt VALUES (87, 4, '2011-01-01', 2, 1);
INSERT INTO bestellt VALUES (103, 35, '2011-01-05', 1, 1);
INSERT INTO bestellt VALUES (98, 42, '2011-01-06', 2, 1);
INSERT INTO bestellt VALUES (59, 49, '2011-01-17', 2, 1);
INSERT INTO bestellt VALUES (117, 44, '2011-01-24', 2, 1);
INSERT INTO bestellt VALUES (117, 17, '2011-01-25', 1, 1);
INSERT INTO bestellt VALUES (89, 2, '2011-02-01', 1, 1);
INSERT INTO bestellt VALUES (114, 32, '2011-02-01', 2, 1);
INSERT INTO bestellt VALUES (12, 39, '2011-02-06', 1, 1);
INSERT INTO bestellt VALUES (103, 51, '2011-02-07', 2, 1);
INSERT INTO bestellt VALUES (73, 16, '2011-02-08', 1, 1);
INSERT INTO bestellt VALUES (81, 28, '2011-02-20', 2, 1);
INSERT INTO bestellt VALUES (36, 50, '2011-02-23', 1, 1);
INSERT INTO bestellt VALUES (84, 5, '2011-02-28', 1, 1);
INSERT INTO bestellt VALUES (108, 6, '2011-03-10', 1, 1);
INSERT INTO bestellt VALUES (16, 6, '2011-03-22', 2, 1);
INSERT INTO bestellt VALUES (23, 45, '2011-03-22', 1, 1);
INSERT INTO bestellt VALUES (36, 47, '2011-03-23', 1, 1);
INSERT INTO bestellt VALUES (118, 22, '2011-03-28', 1, 1);
INSERT INTO bestellt VALUES (5, 13, '2011-03-29', 2, 1);
INSERT INTO bestellt VALUES (46, 7, '2011-04-09', 2, 1);
INSERT INTO bestellt VALUES (9, 18, '2011-04-16', 2, 1);
INSERT INTO bestellt VALUES (16, 7, '2011-04-16', 2, 1);
INSERT INTO bestellt VALUES (118, 2, '2011-04-18', 2, 1);
INSERT INTO bestellt VALUES (8, 1, '2011-04-20', 1, 1);
INSERT INTO bestellt VALUES (47, 45, '2011-04-20', 1, 1);
INSERT INTO bestellt VALUES (31, 20, '2011-04-25', 2, 1);
INSERT INTO bestellt VALUES (121, 27, '2011-04-29', 2, 1);
INSERT INTO bestellt VALUES (76, 50, '2011-05-05', 1, 1);
INSERT INTO bestellt VALUES (53, 5, '2011-05-17', 2, 1);
INSERT INTO bestellt VALUES (7, 49, '2011-05-18', 2, 1);
INSERT INTO bestellt VALUES (95, 48, '2011-05-20', 1, 1);
INSERT INTO bestellt VALUES (44, 45, '2011-05-22', 1, 1);
INSERT INTO bestellt VALUES (115, 14, '2011-05-23', 1, 1);
INSERT INTO bestellt VALUES (95, 45, '2011-06-02', 2, 1);
INSERT INTO bestellt VALUES (16, 15, '2011-06-04', 2, 1);
INSERT INTO bestellt VALUES (102, 48, '2011-06-07', 2, 1);
INSERT INTO bestellt VALUES (62, 36, '2011-06-08', 2, 1);
INSERT INTO bestellt VALUES (75, 50, '2011-06-13', 1, 1);
INSERT INTO bestellt VALUES (5, 6, '2011-06-15', 2, 1);
INSERT INTO bestellt VALUES (122, 14, '2011-06-22', 1, 1);
INSERT INTO bestellt VALUES (13, 46, '2011-06-29', 2, 1);
INSERT INTO bestellt VALUES (4, 34, '2011-07-01', 1, 1);
INSERT INTO bestellt VALUES (76, 50, '2011-07-16', 1, 1);
INSERT INTO bestellt VALUES (47, 28, '2011-07-17', 1, 1);
INSERT INTO bestellt VALUES (68, 14, '2011-07-26', 2, 1);
INSERT INTO bestellt VALUES (101, 17, '2011-07-30', 2, 1);
INSERT INTO bestellt VALUES (11, 23, '2011-07-31', 1, 1);
INSERT INTO bestellt VALUES (17, 12, '2011-08-01', 2, 1);
INSERT INTO bestellt VALUES (81, 48, '2011-08-16', 2, 1);
INSERT INTO bestellt VALUES (118, 41, '2011-08-24', 1, 1);
INSERT INTO bestellt VALUES (30, 36, '2011-09-16', 2, 1);
INSERT INTO bestellt VALUES (60, 52, '2011-09-17', 2, 1);
INSERT INTO bestellt VALUES (96, 51, '2011-09-28', 1, 1);
INSERT INTO bestellt VALUES (78, 37, '2011-10-06', 2, 1);
INSERT INTO bestellt VALUES (101, 8, '2011-10-11', 1, 1);
INSERT INTO bestellt VALUES (42, 31, '2011-11-02', 2, 1);
INSERT INTO bestellt VALUES (112, 47, '2011-11-02', 1, 1);
INSERT INTO bestellt VALUES (10, 32, '2011-11-07', 2, 1);
INSERT INTO bestellt VALUES (5, 17, '2011-11-08', 2, 1);
INSERT INTO bestellt VALUES (108, 11, '2011-11-25', 1, 1);
INSERT INTO bestellt VALUES (84, 6, '2011-12-13', 1, 1);
INSERT INTO bestellt VALUES (43, 22, '2011-12-14', 1, 1);
INSERT INTO bestellt VALUES (9, 11, '2011-12-27', 1, 1);
INSERT INTO bestellt VALUES (93, 32, '2011-12-29', 2, 1);
INSERT INTO bestellt VALUES (35, 8, '2011-12-30', 1, 1);
INSERT INTO bestellt VALUES (45, 6, '2011-12-31', 1, 1);
INSERT INTO bestellt VALUES (123, 10, '2012-01-06', 1, 1);
INSERT INTO bestellt VALUES (27, 19, '2012-01-14', 1, 1);
INSERT INTO bestellt VALUES (88, 5, '2012-01-18', 1, 1);
INSERT INTO bestellt VALUES (36, 39, '2012-01-21', 2, 1);
INSERT INTO bestellt VALUES (22, 30, '2012-01-27', 1, 1);
INSERT INTO bestellt VALUES (119, 28, '2012-01-29', 2, 1);
INSERT INTO bestellt VALUES (35, 16, '2012-02-01', 1, 1);
INSERT INTO bestellt VALUES (83, 52, '2012-02-03', 1, 1);
INSERT INTO bestellt VALUES (112, 22, '2012-02-14', 1, 1);
INSERT INTO bestellt VALUES (65, 31, '2012-02-20', 1, 1);
INSERT INTO bestellt VALUES (32, 24, '2012-02-21', 2, 1);
INSERT INTO bestellt VALUES (33, 43, '2012-02-28', 1, 1);
INSERT INTO bestellt VALUES (58, 50, '2012-02-28', 2, 1);
INSERT INTO bestellt VALUES (55, 4, '2012-03-07', 2, 1);
INSERT INTO bestellt VALUES (29, 3, '2012-03-12', 1, 1);
INSERT INTO bestellt VALUES (114, 41, '2012-03-12', 1, 1);
INSERT INTO bestellt VALUES (122, 1, '2012-03-12', 1, 1);
INSERT INTO bestellt VALUES (46, 28, '2012-03-17', 1, 1);
INSERT INTO bestellt VALUES (45, 2, '2012-03-19', 2, 1);
INSERT INTO bestellt VALUES (65, 27, '2012-04-05', 1, 1);
INSERT INTO bestellt VALUES (102, 14, '2012-04-14', 2, 1);
INSERT INTO bestellt VALUES (105, 49, '2012-04-17', 2, 1);
INSERT INTO bestellt VALUES (96, 23, '2012-04-24', 2, 1);
INSERT INTO bestellt VALUES (88, 18, '2012-04-25', 1, 1);
INSERT INTO bestellt VALUES (18, 29, '2012-04-28', 2, 1);
INSERT INTO bestellt VALUES (28, 33, '2012-04-29', 1, 1);
INSERT INTO bestellt VALUES (49, 31, '2012-05-05', 1, 1);
INSERT INTO bestellt VALUES (28, 21, '2012-05-13', 2, 1);
INSERT INTO bestellt VALUES (102, 4, '2012-05-20', 1, 1);
INSERT INTO bestellt VALUES (57, 32, '2012-05-27', 2, 1);
INSERT INTO bestellt VALUES (72, 32, '2012-05-30', 2, 1);
INSERT INTO bestellt VALUES (54, 10, '2012-06-01', 2, 1);
INSERT INTO bestellt VALUES (80, 10, '2012-06-07', 2, 1);
INSERT INTO bestellt VALUES (99, 16, '2012-06-07', 1, 1);
INSERT INTO bestellt VALUES (45, 14, '2012-06-09', 1, 1);
INSERT INTO bestellt VALUES (8, 2, '2012-06-15', 2, 1);
INSERT INTO bestellt VALUES (51, 32, '2012-06-17', 2, 1);
INSERT INTO bestellt VALUES (123, 18, '2012-06-18', 1, 1);
INSERT INTO bestellt VALUES (86, 40, '2012-06-21', 1, 1);
INSERT INTO bestellt VALUES (37, 24, '2012-06-29', 1, 1);
INSERT INTO bestellt VALUES (12, 33, '2012-07-28', 1, 1);
INSERT INTO bestellt VALUES (6, 50, '2012-07-30', 1, 1);
INSERT INTO bestellt VALUES (80, 36, '2012-08-02', 2, 1);
INSERT INTO bestellt VALUES (52, 45, '2012-08-08', 1, 1);
INSERT INTO bestellt VALUES (46, 18, '2012-08-19', 2, 1);
INSERT INTO bestellt VALUES (57, 8, '2012-08-22', 2, 1);
INSERT INTO bestellt VALUES (73, 52, '2012-08-23', 1, 1);
INSERT INTO bestellt VALUES (34, 43, '2012-08-27', 1, 1);
INSERT INTO bestellt VALUES (13, 29, '2012-08-28', 1, 1);
INSERT INTO bestellt VALUES (18, 45, '2012-08-29', 2, 1);
INSERT INTO bestellt VALUES (29, 50, '2012-09-16', 1, 1);
INSERT INTO bestellt VALUES (47, 2, '2012-09-20', 1, 1);
INSERT INTO bestellt VALUES (53, 37, '2012-09-23', 1, 1);
INSERT INTO bestellt VALUES (61, 38, '2012-09-25', 1, 1);
INSERT INTO bestellt VALUES (78, 10, '2012-09-25', 2, 1);
INSERT INTO bestellt VALUES (45, 35, '2012-09-27', 1, 1);
INSERT INTO bestellt VALUES (72, 48, '2012-09-29', 2, 1);
INSERT INTO bestellt VALUES (111, 3, '2012-10-08', 2, 1);
INSERT INTO bestellt VALUES (38, 44, '2012-10-09', 1, 1);
INSERT INTO bestellt VALUES (106, 45, '2012-10-12', 2, 1);
INSERT INTO bestellt VALUES (97, 36, '2012-10-17', 2, 1);
INSERT INTO bestellt VALUES (106, 18, '2012-10-24', 2, 1);
INSERT INTO bestellt VALUES (109, 42, '2012-10-25', 1, 1);
INSERT INTO bestellt VALUES (2, 22, '2012-10-26', 1, 1);
INSERT INTO bestellt VALUES (40, 11, '2012-10-26', 1, 1);
INSERT INTO bestellt VALUES (3, 11, '2012-11-01', 1, 1);
INSERT INTO bestellt VALUES (53, 25, '2012-11-13', 1, 1);
INSERT INTO bestellt VALUES (19, 10, '2012-11-20', 1, 1);
INSERT INTO bestellt VALUES (53, 43, '2012-11-20', 1, 1);
INSERT INTO bestellt VALUES (113, 37, '2012-11-22', 2, 1);
INSERT INTO bestellt VALUES (29, 22, '2012-12-05', 2, 1);
INSERT INTO bestellt VALUES (105, 28, '2012-12-14', 1, 1);
INSERT INTO bestellt VALUES (46, 23, '2012-12-21', 1, 1);
INSERT INTO bestellt VALUES (68, 18, '2012-12-21', 2, 1);
INSERT INTO bestellt VALUES (30, 8, '2013-01-01', 1, 1);
INSERT INTO bestellt VALUES (40, 16, '2013-01-05', 1, 1);
INSERT INTO bestellt VALUES (14, 26, '2013-01-15', 1, 1);
INSERT INTO bestellt VALUES (51, 2, '2013-01-16', 2, 1);
INSERT INTO bestellt VALUES (8, 48, '2013-01-19', 1, 1);
INSERT INTO bestellt VALUES (116, 31, '2013-01-30', 2, 1);
INSERT INTO bestellt VALUES (27, 22, '2013-02-02', 1, 1);
INSERT INTO bestellt VALUES (73, 9, '2013-02-02', 1, 1);
INSERT INTO bestellt VALUES (11, 2, '2013-02-24', 2, 1);
INSERT INTO bestellt VALUES (33, 41, '2013-02-24', 1, 1);
INSERT INTO bestellt VALUES (84, 15, '2013-02-28', 1, 1);
INSERT INTO bestellt VALUES (97, 23, '2013-03-07', 2, 1);
INSERT INTO bestellt VALUES (114, 22, '2013-03-13', 2, 1);
INSERT INTO bestellt VALUES (46, 5, '2013-03-16', 2, 1);
INSERT INTO bestellt VALUES (85, 48, '2013-03-20', 2, 1);
INSERT INTO bestellt VALUES (2, 18, '2013-03-21', 2, 1);
INSERT INTO bestellt VALUES (62, 26, '2013-03-21', 1, 1);
INSERT INTO bestellt VALUES (86, 13, '2013-04-03', 1, 1);
INSERT INTO bestellt VALUES (107, 1, '2013-04-13', 2, 1);
INSERT INTO bestellt VALUES (25, 43, '2013-04-19', 1, 1);
INSERT INTO bestellt VALUES (83, 46, '2013-04-28', 2, 1);
INSERT INTO bestellt VALUES (58, 29, '2013-05-05', 2, 1);
INSERT INTO bestellt VALUES (77, 41, '2013-05-09', 1, 1);
INSERT INTO bestellt VALUES (81, 20, '2013-05-11', 2, 1);
INSERT INTO bestellt VALUES (58, 51, '2013-05-17', 1, 1);
INSERT INTO bestellt VALUES (94, 30, '2013-05-17', 1, 1);
INSERT INTO bestellt VALUES (56, 51, '2013-05-26', 2, 1);
INSERT INTO bestellt VALUES (111, 47, '2013-05-27', 2, 1);
INSERT INTO bestellt VALUES (98, 51, '2013-05-29', 1, 1);
INSERT INTO bestellt VALUES (97, 15, '2013-06-04', 2, 1);
INSERT INTO bestellt VALUES (8, 35, '2013-06-08', 2, 1);
INSERT INTO bestellt VALUES (114, 41, '2013-06-10', 2, 1);
INSERT INTO bestellt VALUES (122, 7, '2013-06-13', 2, 1);
INSERT INTO bestellt VALUES (78, 30, '2013-07-02', 2, 1);
INSERT INTO bestellt VALUES (85, 16, '2013-07-04', 2, 1);
INSERT INTO bestellt VALUES (82, 35, '2013-07-10', 2, 1);
INSERT INTO bestellt VALUES (109, 30, '2013-07-16', 2, 1);
INSERT INTO bestellt VALUES (68, 22, '2013-07-18', 2, 1);
INSERT INTO bestellt VALUES (111, 7, '2013-07-30', 2, 1);
INSERT INTO bestellt VALUES (120, 37, '2013-08-13', 1, 1);
INSERT INTO bestellt VALUES (65, 26, '2013-08-19', 1, 1);
INSERT INTO bestellt VALUES (100, 26, '2013-08-25', 1, 1);
INSERT INTO bestellt VALUES (74, 9, '2013-08-31', 2, 1);
INSERT INTO bestellt VALUES (65, 3, '2013-09-09', 2, 1);
INSERT INTO bestellt VALUES (77, 34, '2013-09-14', 2, 1);
INSERT INTO bestellt VALUES (31, 23, '2013-09-17', 2, 1);
INSERT INTO bestellt VALUES (32, 41, '2013-09-20', 1, 1);
INSERT INTO bestellt VALUES (111, 22, '2013-09-29', 2, 1);
INSERT INTO bestellt VALUES (61, 21, '2013-10-03', 2, 1);
INSERT INTO bestellt VALUES (96, 20, '2013-10-05', 1, 1);
INSERT INTO bestellt VALUES (18, 39, '2013-10-11', 1, 1);
INSERT INTO bestellt VALUES (122, 33, '2013-10-17', 2, 1);
INSERT INTO bestellt VALUES (95, 49, '2013-10-21', 1, 1);
INSERT INTO bestellt VALUES (66, 36, '2013-10-30', 2, 1);
INSERT INTO bestellt VALUES (120, 10, '2013-11-08', 1, 1);
INSERT INTO bestellt VALUES (100, 27, '2013-11-10', 2, 1);
INSERT INTO bestellt VALUES (36, 16, '2013-11-11', 1, 1);
INSERT INTO bestellt VALUES (26, 50, '2013-11-12', 1, 1);
INSERT INTO bestellt VALUES (6, 30, '2013-11-18', 2, 1);
INSERT INTO bestellt VALUES (107, 32, '2013-11-29', 2, 1);
INSERT INTO bestellt VALUES (15, 40, '2013-11-30', 2, 1);
INSERT INTO bestellt VALUES (43, 14, '2013-11-30', 2, 1);
INSERT INTO bestellt VALUES (90, 5, '2013-12-07', 1, 1);
INSERT INTO bestellt VALUES (57, 50, '2013-12-15', 2, 1);
INSERT INTO bestellt VALUES (18, 30, '2013-12-20', 2, 1);
INSERT INTO bestellt VALUES (111, 41, '2013-12-22', 1, 1);
INSERT INTO bestellt VALUES (29, 51, '2013-12-23', 1, 1);
INSERT INTO bestellt VALUES (81, 8, '2013-12-28', 1, 1);
INSERT INTO bestellt VALUES (74, 40, '2014-01-02', 1, 1);
INSERT INTO bestellt VALUES (8, 27, '2014-01-03', 1, 1);
INSERT INTO bestellt VALUES (41, 33, '2014-01-03', 2, 1);
INSERT INTO bestellt VALUES (95, 9, '2014-01-06', 1, 1);
INSERT INTO bestellt VALUES (41, 48, '2014-01-09', 1, 1);
INSERT INTO bestellt VALUES (44, 32, '2014-01-11', 2, 1);
INSERT INTO bestellt VALUES (61, 18, '2014-01-14', 2, 1);
INSERT INTO bestellt VALUES (62, 42, '2014-01-18', 1, 1);
INSERT INTO bestellt VALUES (104, 51, '2014-01-20', 2, 1);
INSERT INTO bestellt VALUES (98, 48, '2014-01-29', 1, 1);
INSERT INTO bestellt VALUES (94, 15, '2014-02-04', 2, 1);
INSERT INTO bestellt VALUES (11, 30, '2014-02-07', 1, 1);
INSERT INTO bestellt VALUES (71, 34, '2014-03-07', 1, 1);
INSERT INTO bestellt VALUES (122, 5, '2014-03-12', 1, 1);
INSERT INTO bestellt VALUES (66, 30, '2014-03-19', 2, 1);
INSERT INTO bestellt VALUES (57, 4, '2014-04-13', 1, 1);
INSERT INTO bestellt VALUES (102, 37, '2014-04-21', 2, 1);
INSERT INTO bestellt VALUES (53, 37, '2014-04-23', 1, 1);
INSERT INTO bestellt VALUES (67, 41, '2014-05-05', 2, 1);
INSERT INTO bestellt VALUES (26, 33, '2014-05-10', 1, 1);
INSERT INTO bestellt VALUES (56, 30, '2014-05-24', 2, 1);
INSERT INTO bestellt VALUES (59, 21, '2014-05-25', 1, 1);
INSERT INTO bestellt VALUES (43, 15, '2014-05-29', 2, 1);
INSERT INTO bestellt VALUES (32, 8, '2014-06-02', 2, 1);
INSERT INTO bestellt VALUES (40, 44, '2014-06-04', 1, 1);
INSERT INTO bestellt VALUES (75, 31, '2014-06-04', 1, 1);
INSERT INTO bestellt VALUES (41, 27, '2014-06-09', 1, 1);
INSERT INTO bestellt VALUES (115, 43, '2014-06-09', 1, 1);
INSERT INTO bestellt VALUES (43, 28, '2014-06-15', 1, 1);
INSERT INTO bestellt VALUES (45, 42, '2014-06-16', 1, 1);
INSERT INTO bestellt VALUES (28, 26, '2014-06-25', 2, 1);
INSERT INTO bestellt VALUES (75, 45, '2014-07-11', 1, 1);
INSERT INTO bestellt VALUES (102, 50, '2014-07-30', 2, 1);
INSERT INTO bestellt VALUES (91, 28, '2014-08-02', 1, 1);
INSERT INTO bestellt VALUES (37, 18, '2014-08-06', 1, 1);
INSERT INTO bestellt VALUES (50, 23, '2014-08-09', 1, 1);
INSERT INTO bestellt VALUES (51, 10, '2014-08-22', 1, 1);
INSERT INTO bestellt VALUES (89, 29, '2014-08-28', 2, 1);
INSERT INTO bestellt VALUES (91, 42, '2014-08-29', 2, 1);
INSERT INTO bestellt VALUES (34, 9, '2014-09-01', 2, 1);
INSERT INTO bestellt VALUES (9, 27, '2014-09-07', 1, 1);
INSERT INTO bestellt VALUES (14, 21, '2014-09-09', 2, 2);
INSERT INTO bestellt VALUES (8, 28, '2014-09-13', 2, 1);
INSERT INTO bestellt VALUES (46, 29, '2014-09-16', 1, 2);
INSERT INTO bestellt VALUES (51, 23, '2014-09-17', 1, 1);
INSERT INTO bestellt VALUES (34, 32, '2014-09-21', 1, 2);
INSERT INTO bestellt VALUES (119, 10, '2014-09-21', 1, 1);
INSERT INTO bestellt VALUES (104, 6, '2014-09-25', 2, 2);
INSERT INTO bestellt VALUES (12, 2, '2014-09-27', 1, 1);
INSERT INTO bestellt VALUES (105, 22, '2014-09-27', 2, 1);
INSERT INTO bestellt VALUES (122, 47, '2014-09-27', 2, 1);
INSERT INTO bestellt VALUES (81, 34, '2014-10-06', 2, 1);
INSERT INTO bestellt VALUES (94, 30, '2014-10-06', 2, 2);
INSERT INTO bestellt VALUES (23, 41, '2014-10-08', 2, 2);
INSERT INTO bestellt VALUES (118, 27, '2014-10-09', 1, 2);
INSERT INTO bestellt VALUES (74, 4, '2014-10-10', 1, 2);
INSERT INTO bestellt VALUES (111, 43, '2014-10-14', 2, 1);
INSERT INTO bestellt VALUES (64, 27, '2014-10-15', 2, 1);
INSERT INTO bestellt VALUES (115, 27, '2014-10-23', 1, 2);
INSERT INTO bestellt VALUES (22, 31, '2014-10-24', 1, 1);
INSERT INTO bestellt VALUES (99, 46, '2014-10-24', 1, 1);
INSERT INTO bestellt VALUES (93, 34, '2014-10-26', 2, 2);
INSERT INTO bestellt VALUES (85, 47, '2014-10-27', 2, 1);
INSERT INTO bestellt VALUES (39, 1, '2014-10-29', 1, 2);
INSERT INTO bestellt VALUES (46, 38, '2014-10-29', 2, 1);
INSERT INTO bestellt VALUES (32, 15, '2014-10-31', 2, 2);
INSERT INTO bestellt VALUES (34, 16, '2014-11-01', 2, 1);
INSERT INTO bestellt VALUES (66, 9, '2014-11-02', 1, 1);
INSERT INTO bestellt VALUES (6, 16, '2014-11-04', 2, 2);
INSERT INTO bestellt VALUES (82, 25, '2014-11-06', 1, 2);
INSERT INTO bestellt VALUES (122, 44, '2014-11-06', 2, 2);
INSERT INTO bestellt VALUES (68, 48, '2014-11-09', 1, 1);
INSERT INTO bestellt VALUES (24, 52, '2014-11-16', 2, 1);
INSERT INTO bestellt VALUES (26, 5, '2014-11-17', 2, 2);
INSERT INTO bestellt VALUES (48, 17, '2014-11-19', 1, 2);
INSERT INTO bestellt VALUES (21, 3, '2014-11-20', 2, 2);
INSERT INTO bestellt VALUES (103, 21, '2014-11-21', 1, 1);
INSERT INTO bestellt VALUES (68, 19, '2014-11-22', 1, 2);
INSERT INTO bestellt VALUES (48, 41, '2014-11-24', 2, 2);
INSERT INTO bestellt VALUES (61, 5, '2014-11-29', 2, 1);
INSERT INTO bestellt VALUES (99, 33, '2014-12-02', 2, 2);
INSERT INTO bestellt VALUES (49, 35, '2014-12-03', 2, 1);
INSERT INTO bestellt VALUES (93, 12, '2014-12-08', 1, 2);
INSERT INTO bestellt VALUES (109, 51, '2014-12-09', 2, 1);
INSERT INTO bestellt VALUES (59, 18, '2014-12-10', 1, 2);
INSERT INTO bestellt VALUES (50, 3, '2014-12-11', 2, 2);
INSERT INTO bestellt VALUES (50, 34, '2014-12-13', 1, 2);
INSERT INTO bestellt VALUES (65, 25, '2014-12-22', 1, 1);
INSERT INTO bestellt VALUES (35, 41, '2014-12-24', 2, 2);
INSERT INTO bestellt VALUES (33, 11, '2014-12-25', 2, 1);
INSERT INTO bestellt VALUES (15, 17, '2014-12-26', 2, 1);
INSERT INTO bestellt VALUES (18, 14, '2014-12-26', 2, 1);
INSERT INTO bestellt VALUES (87, 21, '2014-12-29', 1, 2);
INSERT INTO bestellt VALUES (63, 36, '2014-12-30', 2, 2);
INSERT INTO bestellt VALUES (124, 41, '2014-12-31', 2, 2);
INSERT INTO bestellt VALUES (43, 39, '2015-01-02', 1, 2);
INSERT INTO bestellt VALUES (3, 14, '2015-01-04', 2, 1);
INSERT INTO bestellt VALUES (56, 41, '2015-01-05', 1, 2);
INSERT INTO bestellt VALUES (96, 44, '2015-01-05', 1, 2);
INSERT INTO bestellt VALUES (82, 33, '2015-01-06', 1, 2);
INSERT INTO bestellt VALUES (43, 42, '2015-01-10', 2, 2);
INSERT INTO bestellt VALUES (111, 42, '2015-01-11', 1, 1);
INSERT INTO bestellt VALUES (41, 9, '2015-01-14', 2, 1);
INSERT INTO bestellt VALUES (55, 25, '2015-01-16', 2, 2);
INSERT INTO bestellt VALUES (19, 40, '2015-01-19', 1, 1);
INSERT INTO bestellt VALUES (121, 18, '2015-01-21', 2, 2);
INSERT INTO bestellt VALUES (26, 22, '2015-01-26', 1, 1);
INSERT INTO bestellt VALUES (57, 14, '2015-01-26', 1, 1);
INSERT INTO bestellt VALUES (97, 33, '2015-01-30', 2, 2);
INSERT INTO bestellt VALUES (3, 51, '2015-02-04', 2, 2);
INSERT INTO bestellt VALUES (31, 38, '2015-02-07', 1, 1);
INSERT INTO bestellt VALUES (89, 23, '2015-02-11', 1, 2);
INSERT INTO bestellt VALUES (93, 18, '2015-02-12', 2, 2);
INSERT INTO bestellt VALUES (33, 35, '2015-02-21', 2, 2);
INSERT INTO bestellt VALUES (80, 49, '2015-02-21', 2, 2);
INSERT INTO bestellt VALUES (17, 27, '2015-02-23', 2, 2);
INSERT INTO bestellt VALUES (108, 50, '2015-02-23', 2, 2);
INSERT INTO bestellt VALUES (17, 6, '2015-02-26', 2, 1);
INSERT INTO bestellt VALUES (51, 22, '2015-02-26', 1, 1);
INSERT INTO bestellt VALUES (77, 50, '2015-02-27', 1, 1);
INSERT INTO bestellt VALUES (98, 47, '2015-03-02', 1, 1);
INSERT INTO bestellt VALUES (75, 14, '2015-03-03', 1, 2);
INSERT INTO bestellt VALUES (94, 21, '2015-03-03', 1, 1);
INSERT INTO bestellt VALUES (62, 15, '2015-03-04', 2, 2);
INSERT INTO bestellt VALUES (84, 3, '2015-03-05', 1, 1);
INSERT INTO bestellt VALUES (16, 3, '2015-03-07', 1, 2);
INSERT INTO bestellt VALUES (2, 26, '2015-03-11', 2, 1);
INSERT INTO bestellt VALUES (93, 28, '2015-03-11', 1, 2);
INSERT INTO bestellt VALUES (96, 25, '2015-03-17', 2, 2);
INSERT INTO bestellt VALUES (50, 4, '2015-03-19', 2, 1);
INSERT INTO bestellt VALUES (1, 18, '2015-03-20', 2, 2);
INSERT INTO bestellt VALUES (109, 29, '2015-03-21', 1, 1);
INSERT INTO bestellt VALUES (84, 28, '2015-03-22', 1, 2);
INSERT INTO bestellt VALUES (108, 46, '2015-03-22', 2, 1);
INSERT INTO bestellt VALUES (71, 11, '2015-03-23', 1, 1);
INSERT INTO bestellt VALUES (92, 12, '2015-03-24', 2, 1);
INSERT INTO bestellt VALUES (78, 3, '2015-03-25', 1, 2);
INSERT INTO bestellt VALUES (71, 42, '2015-03-27', 1, 1);
INSERT INTO bestellt VALUES (109, 41, '2015-03-27', 1, 2);
INSERT INTO bestellt VALUES (5, 37, '2015-03-29', 1, 1);
INSERT INTO bestellt VALUES (44, 4, '2015-03-29', 2, 2);
INSERT INTO bestellt VALUES (33, 35, '2015-04-03', 1, 1);
INSERT INTO bestellt VALUES (68, 21, '2015-04-05', 1, 2);
INSERT INTO bestellt VALUES (99, 29, '2015-04-06', 2, 2);
INSERT INTO bestellt VALUES (85, 16, '2015-04-07', 1, 1);
INSERT INTO bestellt VALUES (106, 40, '2015-04-11', 1, 2);
INSERT INTO bestellt VALUES (115, 29, '2015-04-13', 1, 2);
INSERT INTO bestellt VALUES (2, 5, '2015-04-14', 2, 1);
INSERT INTO bestellt VALUES (5, 38, '2015-04-14', 1, 2);
INSERT INTO bestellt VALUES (59, 22, '2015-04-14', 1, 2);
INSERT INTO bestellt VALUES (116, 31, '2015-04-14', 1, 2);
INSERT INTO bestellt VALUES (124, 38, '2015-04-14', 1, 1);
INSERT INTO bestellt VALUES (93, 29, '2015-04-15', 1, 1);
INSERT INTO bestellt VALUES (21, 24, '2015-04-16', 2, 2);
INSERT INTO bestellt VALUES (63, 34, '2015-04-16', 1, 1);
INSERT INTO bestellt VALUES (119, 2, '2015-04-17', 1, 1);
INSERT INTO bestellt VALUES (109, 48, '2015-04-19', 1, 2);
INSERT INTO bestellt VALUES (75, 47, '2015-04-23', 2, 1);
INSERT INTO bestellt VALUES (102, 40, '2015-04-23', 2, 2);
INSERT INTO bestellt VALUES (13, 16, '2015-04-29', 2, 2);
INSERT INTO bestellt VALUES (68, 25, '2015-04-30', 2, 2);
INSERT INTO bestellt VALUES (41, 50, '2015-05-01', 1, 1);
INSERT INTO bestellt VALUES (79, 17, '2015-05-02', 1, 1);
INSERT INTO bestellt VALUES (75, 49, '2015-05-03', 2, 1);
INSERT INTO bestellt VALUES (94, 27, '2015-05-04', 2, 1);
INSERT INTO bestellt VALUES (56, 37, '2015-05-06', 2, 1);
INSERT INTO bestellt VALUES (96, 46, '2015-05-07', 1, 1);
INSERT INTO bestellt VALUES (119, 34, '2015-05-07', 2, 1);
INSERT INTO bestellt VALUES (116, 30, '2015-05-10', 1, 2);
INSERT INTO bestellt VALUES (34, 50, '2015-05-11', 2, 2);
INSERT INTO bestellt VALUES (88, 8, '2015-05-12', 2, 1);
INSERT INTO bestellt VALUES (48, 28, '2015-05-18', 1, 2);
INSERT INTO bestellt VALUES (43, 38, '2015-05-22', 1, 1);
INSERT INTO bestellt VALUES (75, 20, '2015-05-22', 1, 2);
INSERT INTO bestellt VALUES (124, 18, '2015-05-24', 2, 2);
INSERT INTO bestellt VALUES (11, 15, '2015-05-27', 2, 2);
INSERT INTO bestellt VALUES (25, 40, '2015-05-29', 2, 2);
INSERT INTO bestellt VALUES (35, 6, '2015-05-29', 2, 2);
INSERT INTO bestellt VALUES (88, 46, '2015-05-29', 1, 2);
INSERT INTO bestellt VALUES (41, 17, '2015-05-30', 1, 1);
INSERT INTO bestellt VALUES (100, 46, '2015-06-06', 1, 1);
INSERT INTO bestellt VALUES (14, 49, '2015-06-07', 1, 1);
INSERT INTO bestellt VALUES (87, 8, '2015-06-09', 2, 1);
INSERT INTO bestellt VALUES (123, 14, '2015-06-09', 2, 2);
INSERT INTO bestellt VALUES (91, 50, '2015-06-10', 2, 2);
INSERT INTO bestellt VALUES (95, 34, '2015-06-10', 2, 2);
INSERT INTO bestellt VALUES (57, 49, '2015-06-11', 1, 2);
INSERT INTO bestellt VALUES (98, 15, '2015-06-11', 2, 2);
INSERT INTO bestellt VALUES (93, 36, '2015-06-18', 1, 2);
INSERT INTO bestellt VALUES (107, 9, '2015-06-20', 2, 2);
INSERT INTO bestellt VALUES (77, 20, '2015-06-21', 1, 2);
INSERT INTO bestellt VALUES (95, 37, '2015-06-21', 1, 1);
INSERT INTO bestellt VALUES (93, 38, '2015-06-24', 2, 1);
INSERT INTO bestellt VALUES (120, 39, '2015-06-24', 1, 2);
INSERT INTO bestellt VALUES (72, 41, '2015-06-25', 2, 2);
INSERT INTO bestellt VALUES (44, 44, '2015-06-27', 1, 2);
INSERT INTO bestellt VALUES (114, 51, '2015-06-27', 1, 2);
INSERT INTO bestellt VALUES (25, 34, '2015-06-28', 2, 2);
INSERT INTO bestellt VALUES (40, 31, '2015-06-29', 1, 2);
INSERT INTO bestellt VALUES (50, 44, '2015-06-29', 1, 2);
INSERT INTO bestellt VALUES (80, 43, '2015-06-29', 2, 1);
INSERT INTO bestellt VALUES (124, 34, '2015-06-30', 1, 2);
INSERT INTO bestellt VALUES (97, 5, '2015-07-01', 2, 1);
INSERT INTO bestellt VALUES (63, 6, '2015-07-03', 1, 2);
INSERT INTO bestellt VALUES (89, 11, '2015-07-03', 1, 1);
INSERT INTO bestellt VALUES (15, 27, '2015-07-04', 1, 1);
INSERT INTO bestellt VALUES (15, 42, '2015-07-04', 1, 1);
INSERT INTO bestellt VALUES (121, 40, '2015-07-04', 2, 2);
INSERT INTO bestellt VALUES (37, 7, '2015-07-05', 1, 2);
INSERT INTO bestellt VALUES (59, 42, '2015-07-09', 2, 1);
INSERT INTO bestellt VALUES (49, 49, '2015-07-11', 2, 1);
INSERT INTO bestellt VALUES (67, 29, '2015-07-12', 1, 1);
INSERT INTO bestellt VALUES (76, 4, '2015-07-14', 1, 1);
INSERT INTO bestellt VALUES (94, 30, '2015-07-14', 2, 1);
INSERT INTO bestellt VALUES (58, 40, '2015-07-16', 2, 1);
INSERT INTO bestellt VALUES (6, 42, '2015-07-18', 1, 1);
INSERT INTO bestellt VALUES (88, 4, '2015-07-18', 1, 2);
INSERT INTO bestellt VALUES (66, 12, '2015-07-21', 1, 1);
INSERT INTO bestellt VALUES (78, 44, '2015-07-24', 1, 2);
INSERT INTO bestellt VALUES (76, 49, '2015-07-25', 1, 1);
INSERT INTO bestellt VALUES (101, 30, '2015-07-31', 1, 2);
INSERT INTO bestellt VALUES (18, 10, '2015-08-01', 1, 1);
INSERT INTO bestellt VALUES (82, 14, '2015-08-01', 1, 1);
INSERT INTO bestellt VALUES (62, 45, '2015-08-04', 2, 1);
INSERT INTO bestellt VALUES (99, 19, '2015-08-04', 1, 1);
INSERT INTO bestellt VALUES (59, 6, '2015-08-05', 1, 2);
INSERT INTO bestellt VALUES (76, 14, '2015-08-06', 2, 2);
INSERT INTO bestellt VALUES (82, 9, '2015-08-10', 2, 2);
INSERT INTO bestellt VALUES (61, 23, '2015-08-13', 2, 2);
INSERT INTO bestellt VALUES (62, 19, '2015-08-13', 2, 2);
INSERT INTO bestellt VALUES (45, 35, '2015-08-14', 2, 2);
INSERT INTO bestellt VALUES (35, 34, '2015-08-18', 1, 1);
INSERT INTO bestellt VALUES (14, 4, '2015-08-19', 1, 1);
INSERT INTO bestellt VALUES (102, 9, '2015-08-23', 1, 2);
INSERT INTO bestellt VALUES (47, 6, '2015-08-25', 2, 2);
INSERT INTO bestellt VALUES (51, 10, '2015-08-25', 2, 2);
INSERT INTO bestellt VALUES (108, 31, '2015-08-25', 1, 2);
INSERT INTO bestellt VALUES (17, 35, '2015-08-26', 2, 1);
INSERT INTO bestellt VALUES (121, 30, '2015-08-26', 1, 1);
INSERT INTO bestellt VALUES (19, 5, '2015-08-27', 2, 1);
INSERT INTO bestellt VALUES (66, 28, '2015-08-28', 2, 2);
INSERT INTO bestellt VALUES (50, 6, '2015-09-04', 2, 2);
INSERT INTO bestellt VALUES (70, 44, '2015-09-04', 2, 1);
INSERT INTO bestellt VALUES (7, 29, '2015-09-05', 2, 1);
INSERT INTO bestellt VALUES (10, 4, '2015-09-07', 1, 2);
INSERT INTO bestellt VALUES (14, 26, '2015-09-07', 1, 2);
INSERT INTO bestellt VALUES (19, 20, '2015-09-07', 2, 1);
INSERT INTO bestellt VALUES (27, 30, '2015-09-09', 2, 1);
INSERT INTO bestellt VALUES (28, 41, '2015-09-13', 2, 2);
INSERT INTO bestellt VALUES (10, 10, '2015-09-19', 1, 2);
INSERT INTO bestellt VALUES (107, 6, '2015-09-21', 1, 1);
INSERT INTO bestellt VALUES (111, 9, '2015-09-22', 1, 2);
INSERT INTO bestellt VALUES (119, 50, '2015-09-23', 2, 2);
INSERT INTO bestellt VALUES (97, 16, '2015-09-24', 1, 1);
INSERT INTO bestellt VALUES (111, 48, '2015-09-25', 2, 1);
INSERT INTO bestellt VALUES (23, 7, '2015-09-27', 1, 1);
INSERT INTO bestellt VALUES (93, 15, '2015-09-30', 1, 1);
INSERT INTO bestellt VALUES (118, 16, '2015-10-01', 1, 1);
INSERT INTO bestellt VALUES (87, 15, '2015-10-02', 1, 1);
INSERT INTO bestellt VALUES (23, 20, '2015-10-03', 2, 1);
INSERT INTO bestellt VALUES (94, 29, '2015-10-03', 2, 2);
INSERT INTO bestellt VALUES (109, 18, '2015-10-03', 2, 1);
INSERT INTO bestellt VALUES (98, 44, '2015-10-09', 1, 2);
INSERT INTO bestellt VALUES (114, 19, '2015-10-13', 1, 1);
INSERT INTO bestellt VALUES (94, 30, '2015-10-16', 2, 1);
INSERT INTO bestellt VALUES (57, 27, '2015-10-20', 2, 1);
INSERT INTO bestellt VALUES (88, 21, '2015-10-21', 2, 2);
INSERT INTO bestellt VALUES (94, 30, '2015-10-22', 2, 1);
INSERT INTO bestellt VALUES (110, 7, '2015-10-23', 1, 2);
INSERT INTO bestellt VALUES (5, 44, '2015-10-24', 1, 2);
INSERT INTO bestellt VALUES (114, 20, '2015-10-24', 2, 1);
INSERT INTO bestellt VALUES (68, 38, '2015-10-26', 2, 2);
INSERT INTO bestellt VALUES (33, 9, '2015-10-27', 1, 2);
INSERT INTO bestellt VALUES (108, 40, '2015-10-27', 1, 1);
INSERT INTO bestellt VALUES (15, 5, '2015-10-28', 1, 1);
INSERT INTO bestellt VALUES (32, 27, '2015-10-29', 1, 2);
INSERT INTO bestellt VALUES (41, 45, '2015-10-29', 2, 2);
INSERT INTO bestellt VALUES (96, 32, '2015-10-29', 2, 1);
INSERT INTO bestellt VALUES (25, 22, '2015-10-31', 1, 1);
INSERT INTO bestellt VALUES (117, 18, '2015-11-02', 2, 1);
INSERT INTO bestellt VALUES (71, 43, '2015-11-03', 1, 1);
INSERT INTO bestellt VALUES (75, 37, '2015-11-06', 1, 2);
INSERT INTO bestellt VALUES (99, 32, '2015-11-08', 2, 2);
INSERT INTO bestellt VALUES (105, 40, '2015-11-09', 2, 2);
INSERT INTO bestellt VALUES (74, 16, '2015-11-12', 1, 2);
INSERT INTO bestellt VALUES (7, 8, '2015-11-14', 1, 2);
INSERT INTO bestellt VALUES (39, 9, '2015-11-15', 2, 1);
INSERT INTO bestellt VALUES (66, 45, '2015-11-15', 1, 1);
INSERT INTO bestellt VALUES (97, 40, '2015-11-15', 2, 1);
INSERT INTO bestellt VALUES (35, 36, '2015-11-18', 1, 2);
INSERT INTO bestellt VALUES (97, 36, '2015-11-19', 2, 2);
INSERT INTO bestellt VALUES (4, 13, '2015-11-20', 1, 1);
INSERT INTO bestellt VALUES (14, 1, '2015-11-23', 1, 1);
INSERT INTO bestellt VALUES (24, 47, '2015-11-27', 2, 2);
INSERT INTO bestellt VALUES (86, 10, '2015-11-29', 1, 1);
INSERT INTO bestellt VALUES (18, 27, '2015-11-30', 1, 1);
INSERT INTO bestellt VALUES (58, 7, '2015-12-02', 1, 2);
INSERT INTO bestellt VALUES (89, 28, '2015-12-10', 1, 1);
INSERT INTO bestellt VALUES (115, 14, '2015-12-13', 2, 2);
INSERT INTO bestellt VALUES (123, 24, '2015-12-17', 2, 1);
INSERT INTO bestellt VALUES (46, 21, '2015-12-20', 2, 2);
INSERT INTO bestellt VALUES (11, 23, '2015-12-22', 2, 2);
INSERT INTO bestellt VALUES (96, 51, '2015-12-24', 2, 1);
INSERT INTO bestellt VALUES (26, 19, '2015-12-28', 2, 1);
INSERT INTO bestellt VALUES (95, 52, '2015-12-28', 2, 2);
INSERT INTO bestellt VALUES (58, 19, '2015-12-29', 1, 1);
INSERT INTO bestellt VALUES (74, 35, '2015-12-31', 1, 2);
INSERT INTO bestellt VALUES (50, 38, '2016-01-03', 1, 1);
INSERT INTO bestellt VALUES (86, 32, '2016-01-03', 2, 2);
INSERT INTO bestellt VALUES (114, 42, '2016-01-11', 2, 2);
INSERT INTO bestellt VALUES (68, 43, '2016-01-12', 2, 2);
INSERT INTO bestellt VALUES (93, 11, '2016-01-14', 2, 2);
INSERT INTO bestellt VALUES (22, 27, '2016-01-15', 2, 1);
INSERT INTO bestellt VALUES (78, 36, '2016-01-17', 1, 2);
INSERT INTO bestellt VALUES (22, 5, '2016-01-18', 2, 1);
INSERT INTO bestellt VALUES (59, 31, '2016-01-20', 1, 1);
INSERT INTO bestellt VALUES (62, 45, '2016-01-24', 1, 1);
INSERT INTO bestellt VALUES (108, 49, '2016-01-24', 1, 1);
INSERT INTO bestellt VALUES (108, 13, '2016-01-27', 2, 2);
INSERT INTO bestellt VALUES (121, 15, '2016-01-27', 1, 2);
INSERT INTO bestellt VALUES (32, 32, '2016-01-29', 1, 1);
INSERT INTO bestellt VALUES (73, 49, '2016-02-02', 2, 1);
INSERT INTO bestellt VALUES (13, 10, '2016-02-12', 2, 1);
INSERT INTO bestellt VALUES (63, 32, '2016-02-13', 1, 2);
INSERT INTO bestellt VALUES (104, 9, '2016-02-14', 2, 1);
INSERT INTO bestellt VALUES (123, 9, '2016-02-16', 1, 1);
INSERT INTO bestellt VALUES (80, 2, '2016-02-17', 1, 1);
INSERT INTO bestellt VALUES (83, 37, '2016-02-19', 1, 1);
INSERT INTO bestellt VALUES (120, 48, '2016-02-19', 1, 2);
INSERT INTO bestellt VALUES (111, 10, '2016-02-22', 2, 2);
INSERT INTO bestellt VALUES (58, 11, '2016-02-24', 1, 1);
INSERT INTO bestellt VALUES (4, 16, '2016-02-26', 2, 2);
INSERT INTO bestellt VALUES (38, 14, '2016-02-26', 1, 2);
INSERT INTO bestellt VALUES (31, 10, '2016-02-29', 2, 1);
INSERT INTO bestellt VALUES (41, 32, '2016-03-05', 2, 1);
INSERT INTO bestellt VALUES (54, 23, '2016-03-05', 2, 1);
INSERT INTO bestellt VALUES (117, 34, '2016-03-07', 1, 2);
INSERT INTO bestellt VALUES (38, 40, '2016-03-08', 2, 1);
INSERT INTO bestellt VALUES (39, 26, '2016-03-08', 2, 2);
INSERT INTO bestellt VALUES (116, 21, '2016-03-09', 1, 1);
INSERT INTO bestellt VALUES (60, 13, '2016-03-10', 2, 2);
INSERT INTO bestellt VALUES (19, 30, '2016-03-11', 1, 2);
INSERT INTO bestellt VALUES (101, 10, '2016-03-12', 2, 1);
INSERT INTO bestellt VALUES (18, 34, '2016-03-18', 1, 1);
INSERT INTO bestellt VALUES (107, 37, '2016-03-18', 2, 2);
INSERT INTO bestellt VALUES (97, 23, '2016-03-20', 2, 1);
INSERT INTO bestellt VALUES (113, 22, '2016-03-22', 2, 2);
INSERT INTO bestellt VALUES (96, 50, '2016-03-24', 1, 1);
INSERT INTO bestellt VALUES (109, 28, '2016-03-24', 2, 2);
INSERT INTO bestellt VALUES (66, 48, '2016-03-25', 2, 1);
INSERT INTO bestellt VALUES (54, 30, '2016-03-27', 2, 1);
INSERT INTO bestellt VALUES (96, 13, '2016-03-28', 2, 1);
INSERT INTO bestellt VALUES (57, 43, '2016-03-30', 1, 2);
INSERT INTO bestellt VALUES (51, 43, '2016-04-02', 2, 1);
INSERT INTO bestellt VALUES (117, 17, '2016-04-02', 2, 2);
INSERT INTO bestellt VALUES (48, 1, '2016-04-06', 2, 2);
INSERT INTO bestellt VALUES (68, 34, '2016-04-09', 2, 1);
INSERT INTO bestellt VALUES (118, 40, '2016-04-10', 1, 2);
INSERT INTO bestellt VALUES (75, 39, '2016-04-11', 1, 2);
INSERT INTO bestellt VALUES (97, 27, '2016-04-11', 2, 1);
INSERT INTO bestellt VALUES (42, 41, '2016-04-12', 2, 2);
INSERT INTO bestellt VALUES (38, 48, '2016-04-13', 1, 1);
INSERT INTO bestellt VALUES (115, 24, '2016-04-13', 2, 2);
INSERT INTO bestellt VALUES (57, 47, '2016-04-14', 2, 1);
INSERT INTO bestellt VALUES (19, 49, '2016-04-15', 2, 1);
INSERT INTO bestellt VALUES (63, 48, '2016-04-16', 1, 1);
INSERT INTO bestellt VALUES (107, 16, '2016-04-16', 1, 1);
INSERT INTO bestellt VALUES (35, 12, '2016-04-17', 1, 2);
INSERT INTO bestellt VALUES (62, 42, '2016-04-17', 2, 1);
INSERT INTO bestellt VALUES (55, 34, '2016-04-20', 1, 1);
INSERT INTO bestellt VALUES (6, 12, '2016-04-21', 1, 2);
INSERT INTO bestellt VALUES (4, 25, '2016-04-23', 1, 1);
INSERT INTO bestellt VALUES (26, 40, '2016-04-24', 2, 1);
INSERT INTO bestellt VALUES (6, 18, '2016-04-26', 2, 2);
INSERT INTO bestellt VALUES (27, 33, '2016-04-26', 2, 1);
INSERT INTO bestellt VALUES (52, 28, '2016-04-26', 1, 1);
INSERT INTO bestellt VALUES (10, 28, '2016-04-30', 1, 1);
INSERT INTO bestellt VALUES (114, 15, '2016-04-30', 2, 1);
INSERT INTO bestellt VALUES (92, 28, '2016-05-03', 1, 2);
INSERT INTO bestellt VALUES (39, 49, '2016-05-06', 1, 1);
INSERT INTO bestellt VALUES (20, 48, '2016-05-08', 1, 1);
INSERT INTO bestellt VALUES (107, 31, '2016-05-08', 2, 2);
INSERT INTO bestellt VALUES (5, 17, '2016-05-10', 1, 2);
INSERT INTO bestellt VALUES (23, 38, '2016-05-11', 2, 2);
INSERT INTO bestellt VALUES (7, 18, '2016-05-13', 2, 1);
INSERT INTO bestellt VALUES (56, 27, '2016-05-17', 1, 2);
INSERT INTO bestellt VALUES (21, 24, '2016-05-19', 1, 2);
INSERT INTO bestellt VALUES (86, 43, '2016-05-19', 2, 1);
INSERT INTO bestellt VALUES (28, 41, '2016-05-22', 2, 2);
INSERT INTO bestellt VALUES (124, 23, '2016-05-22', 2, 1);
INSERT INTO bestellt VALUES (41, 34, '2016-05-26', 2, 1);
INSERT INTO bestellt VALUES (102, 47, '2016-05-27', 1, 2);
INSERT INTO bestellt VALUES (50, 20, '2016-05-29', 1, 1);
INSERT INTO bestellt VALUES (60, 16, '2016-05-29', 2, 2);
INSERT INTO bestellt VALUES (72, 30, '2016-06-02', 2, 2);
INSERT INTO bestellt VALUES (113, 15, '2016-06-02', 1, 2);
INSERT INTO bestellt VALUES (119, 19, '2016-06-03', 2, 1);
INSERT INTO bestellt VALUES (78, 8, '2016-06-08', 1, 1);
INSERT INTO bestellt VALUES (38, 6, '2016-06-09', 1, 2);
INSERT INTO bestellt VALUES (73, 2, '2016-06-10', 1, 2);
INSERT INTO bestellt VALUES (43, 11, '2016-06-11', 1, 2);
INSERT INTO bestellt VALUES (63, 18, '2016-06-13', 1, 2);
INSERT INTO bestellt VALUES (116, 42, '2016-06-14', 1, 2);
INSERT INTO bestellt VALUES (114, 27, '2016-06-16', 2, 1);
INSERT INTO bestellt VALUES (39, 4, '2016-06-20', 2, 2);
INSERT INTO bestellt VALUES (53, 6, '2016-06-20', 2, 2);
INSERT INTO bestellt VALUES (6, 20, '2016-06-23', 1, 2);
INSERT INTO bestellt VALUES (47, 36, '2016-06-24', 2, 2);
INSERT INTO bestellt VALUES (5, 31, '2016-06-25', 2, 1);
INSERT INTO bestellt VALUES (17, 8, '2016-06-25', 1, 1);
INSERT INTO bestellt VALUES (22, 24, '2016-06-25', 1, 1);
INSERT INTO bestellt VALUES (53, 10, '2016-06-25', 2, 1);
INSERT INTO bestellt VALUES (23, 13, '2016-06-26', 1, 1);
INSERT INTO bestellt VALUES (81, 51, '2016-06-26', 2, 1);
INSERT INTO bestellt VALUES (78, 40, '2016-06-30', 2, 1);
INSERT INTO bestellt VALUES (50, 44, '2016-07-02', 1, 2);
INSERT INTO bestellt VALUES (82, 39, '2016-07-05', 1, 2);
INSERT INTO bestellt VALUES (107, 18, '2016-07-05', 1, 2);
INSERT INTO bestellt VALUES (3, 22, '2016-07-06', 2, 2);
INSERT INTO bestellt VALUES (37, 50, '2016-07-06', 2, 1);
INSERT INTO bestellt VALUES (61, 8, '2016-07-06', 2, 2);
INSERT INTO bestellt VALUES (42, 19, '2016-07-07', 2, 2);
INSERT INTO bestellt VALUES (98, 10, '2016-07-08', 1, 1);
INSERT INTO bestellt VALUES (88, 29, '2016-07-11', 2, 2);
INSERT INTO bestellt VALUES (112, 21, '2016-07-14', 2, 1);
INSERT INTO bestellt VALUES (93, 15, '2016-07-15', 2, 2);
INSERT INTO bestellt VALUES (48, 37, '2016-07-16', 1, 1);
INSERT INTO bestellt VALUES (90, 15, '2016-07-17', 2, 2);
INSERT INTO bestellt VALUES (6, 5, '2016-07-21', 1, 1);
INSERT INTO bestellt VALUES (13, 45, '2016-07-21', 1, 1);
INSERT INTO bestellt VALUES (123, 13, '2016-07-22', 1, 2);
INSERT INTO bestellt VALUES (12, 11, '2016-07-26', 1, 1);
INSERT INTO bestellt VALUES (80, 11, '2016-07-26', 2, 2);
INSERT INTO bestellt VALUES (33, 44, '2016-07-27', 1, 2);
INSERT INTO bestellt VALUES (117, 48, '2016-07-27', 1, 1);
INSERT INTO bestellt VALUES (36, 49, '2016-08-02', 1, 1);
INSERT INTO bestellt VALUES (112, 28, '2016-08-05', 2, 2);
INSERT INTO bestellt VALUES (53, 37, '2016-08-06', 1, 1);
INSERT INTO bestellt VALUES (34, 38, '2016-08-07', 1, 2);
INSERT INTO bestellt VALUES (72, 31, '2016-08-08', 1, 2);
INSERT INTO bestellt VALUES (49, 44, '2016-08-13', 1, 1);
INSERT INTO bestellt VALUES (73, 28, '2016-08-15', 1, 2);
INSERT INTO bestellt VALUES (74, 7, '2016-08-18', 1, 1);
INSERT INTO bestellt VALUES (20, 7, '2016-08-19', 1, 1);
INSERT INTO bestellt VALUES (17, 38, '2016-08-22', 1, 1);
INSERT INTO bestellt VALUES (57, 4, '2016-08-22', 1, 1);
INSERT INTO bestellt VALUES (79, 35, '2016-08-26', 1, 1);
INSERT INTO bestellt VALUES (65, 2, '2016-08-28', 2, 1);
INSERT INTO bestellt VALUES (103, 16, '2016-08-29', 1, 1);
INSERT INTO bestellt VALUES (57, 14, '2016-08-30', 1, 1);
INSERT INTO bestellt VALUES (103, 11, '2016-09-03', 2, 2);
INSERT INTO bestellt VALUES (109, 47, '2016-09-04', 2, 2);
INSERT INTO bestellt VALUES (2, 52, '2016-09-05', 2, 2);
INSERT INTO bestellt VALUES (47, 15, '2016-09-08', 2, 1);
INSERT INTO bestellt VALUES (74, 44, '2016-09-09', 1, 1);
INSERT INTO bestellt VALUES (2, 50, '2016-09-10', 1, 2);
INSERT INTO bestellt VALUES (80, 46, '2016-09-10', 1, 1);
INSERT INTO bestellt VALUES (57, 18, '2016-09-12', 2, 2);
INSERT INTO bestellt VALUES (6, 6, '2016-09-13', 1, 2);
INSERT INTO bestellt VALUES (115, 12, '2016-09-13', 1, 1);
INSERT INTO bestellt VALUES (63, 2, '2016-09-16', 2, 1);
INSERT INTO bestellt VALUES (122, 45, '2016-09-18', 2, 2);
INSERT INTO bestellt VALUES (81, 35, '2016-09-19', 2, 1);
INSERT INTO bestellt VALUES (6, 50, '2016-09-20', 1, 2);
INSERT INTO bestellt VALUES (78, 4, '2016-09-20', 2, 1);
INSERT INTO bestellt VALUES (22, 33, '2016-09-23', 2, 2);
INSERT INTO bestellt VALUES (24, 23, '2016-09-23', 1, 1);
INSERT INTO bestellt VALUES (25, 29, '2016-09-24', 2, 2);
INSERT INTO bestellt VALUES (87, 27, '2016-09-25', 2, 2);
INSERT INTO bestellt VALUES (67, 1, '2016-09-26', 2, 1);
INSERT INTO bestellt VALUES (105, 18, '2016-09-26', 2, 2);
INSERT INTO bestellt VALUES (84, 4, '2016-09-28', 2, 1);
INSERT INTO bestellt VALUES (56, 7, '2016-10-01', 1, 2);
INSERT INTO bestellt VALUES (81, 38, '2016-10-03', 2, 2);
INSERT INTO bestellt VALUES (97, 17, '2016-10-13', 1, 2);
INSERT INTO bestellt VALUES (36, 14, '2016-10-14', 1, 2);
INSERT INTO bestellt VALUES (48, 30, '2016-10-19', 1, 1);
INSERT INTO bestellt VALUES (68, 27, '2016-10-21', 2, 2);
INSERT INTO bestellt VALUES (115, 45, '2016-10-21', 2, 2);
INSERT INTO bestellt VALUES (103, 37, '2016-10-23', 1, 1);
INSERT INTO bestellt VALUES (54, 46, '2016-10-28', 1, 2);
INSERT INTO bestellt VALUES (80, 46, '2016-11-06', 1, 1);
INSERT INTO bestellt VALUES (74, 45, '2016-11-08', 2, 1);
INSERT INTO bestellt VALUES (99, 20, '2016-11-15', 1, 1);
INSERT INTO bestellt VALUES (4, 49, '2016-11-16', 2, 1);
INSERT INTO bestellt VALUES (118, 11, '2016-11-17', 1, 1);
INSERT INTO bestellt VALUES (94, 19, '2016-11-18', 1, 1);
INSERT INTO bestellt VALUES (15, 36, '2016-11-22', 1, 1);
INSERT INTO bestellt VALUES (125, 37, '2016-11-22', 2, 1);
INSERT INTO bestellt VALUES (58, 43, '2016-11-23', 1, 1);
INSERT INTO bestellt VALUES (59, 8, '2016-11-24', 1, 1);
INSERT INTO bestellt VALUES (7, 10, '2016-11-25', 1, 1);
INSERT INTO bestellt VALUES (48, 6, '2016-11-25', 2, 1);
INSERT INTO bestellt VALUES (16, 10, '2016-11-30', 2, 2);
INSERT INTO bestellt VALUES (13, 17, '2016-12-01', 2, 2);
INSERT INTO bestellt VALUES (68, 49, '2016-12-02', 1, 2);
INSERT INTO bestellt VALUES (43, 25, '2016-12-10', 2, 2);
INSERT INTO bestellt VALUES (64, 23, '2016-12-13', 1, 2);
INSERT INTO bestellt VALUES (9, 11, '2016-12-17', 2, 1);
INSERT INTO bestellt VALUES (39, 25, '2016-12-19', 2, 1);
INSERT INTO bestellt VALUES (67, 5, '2016-12-20', 1, 2);
INSERT INTO bestellt VALUES (113, 18, '2016-12-21', 1, 1);
INSERT INTO bestellt VALUES (31, 41, '2016-12-23', 2, 2);
INSERT INTO bestellt VALUES (44, 42, '2016-12-23', 2, 2);
INSERT INTO bestellt VALUES (40, 20, '2016-12-25', 1, 1);
INSERT INTO bestellt VALUES (7, 50, '2016-12-26', 1, 2);
INSERT INTO bestellt VALUES (70, 18, '2016-12-30', 2, 1);
INSERT INTO bestellt VALUES (36, 39, '2016-12-31', 1, 2);
INSERT INTO bestellt VALUES (22, 30, '2017-01-01', 2, 1);
INSERT INTO bestellt VALUES (89, 52, '2017-01-04', 2, 2);
INSERT INTO bestellt VALUES (80, 27, '2017-01-05', 1, 2);
INSERT INTO bestellt VALUES (4, 23, '2017-01-06', 1, 1);
INSERT INTO bestellt VALUES (108, 7, '2017-01-07', 2, 2);
INSERT INTO bestellt VALUES (102, 29, '2017-01-09', 2, 2);
INSERT INTO bestellt VALUES (67, 45, '2017-01-13', 1, 2);
INSERT INTO bestellt VALUES (103, 14, '2017-01-14', 1, 1);
INSERT INTO bestellt VALUES (2, 10, '2017-01-16', 2, 2);
INSERT INTO bestellt VALUES (40, 24, '2017-01-18', 2, 1);
INSERT INTO bestellt VALUES (101, 37, '2017-01-20', 2, 2);
INSERT INTO bestellt VALUES (65, 43, '2017-01-21', 2, 2);
INSERT INTO bestellt VALUES (13, 2, '2017-01-27', 1, 1);
INSERT INTO bestellt VALUES (15, 12, '2017-02-01', 1, 2);
INSERT INTO bestellt VALUES (57, 26, '2017-02-01', 2, 2);
INSERT INTO bestellt VALUES (121, 45, '2017-02-04', 2, 2);
INSERT INTO bestellt VALUES (103, 51, '2017-02-06', 2, 1);
INSERT INTO bestellt VALUES (123, 40, '2017-02-07', 2, 2);
INSERT INTO bestellt VALUES (53, 7, '2017-02-10', 1, 2);
INSERT INTO bestellt VALUES (123, 34, '2017-02-12', 2, 1);
INSERT INTO bestellt VALUES (47, 43, '2017-02-15', 1, 1);
INSERT INTO bestellt VALUES (76, 29, '2017-02-17', 2, 1);
INSERT INTO bestellt VALUES (37, 27, '2017-02-20', 1, 1);
INSERT INTO bestellt VALUES (3, 51, '2017-02-21', 1, 1);
INSERT INTO bestellt VALUES (33, 17, '2017-02-21', 1, 1);
INSERT INTO bestellt VALUES (5, 27, '2017-02-24', 2, 2);
INSERT INTO bestellt VALUES (10, 46, '2017-02-27', 2, 1);
INSERT INTO bestellt VALUES (104, 27, '2017-03-04', 2, 2);
INSERT INTO bestellt VALUES (37, 16, '2017-03-07', 2, 1);
INSERT INTO bestellt VALUES (111, 9, '2017-03-07', 1, 2);
INSERT INTO bestellt VALUES (34, 18, '2017-03-08', 2, 1);
INSERT INTO bestellt VALUES (60, 20, '2017-03-10', 2, 1);
INSERT INTO bestellt VALUES (3, 5, '2017-03-13', 1, 1);
INSERT INTO bestellt VALUES (80, 23, '2017-03-14', 2, 1);
INSERT INTO bestellt VALUES (16, 4, '2017-03-15', 2, 1);
INSERT INTO bestellt VALUES (102, 47, '2017-03-15', 2, 1);
INSERT INTO bestellt VALUES (49, 43, '2017-03-16', 2, 2);
INSERT INTO bestellt VALUES (84, 45, '2017-03-17', 2, 1);
INSERT INTO bestellt VALUES (29, 2, '2017-03-18', 1, 1);
INSERT INTO bestellt VALUES (64, 39, '2017-03-19', 2, 2);
INSERT INTO bestellt VALUES (107, 14, '2017-03-27', 1, 1);
INSERT INTO bestellt VALUES (78, 41, '2017-03-29', 2, 2);
INSERT INTO bestellt VALUES (83, 47, '2017-03-29', 2, 1);
INSERT INTO bestellt VALUES (26, 22, '2017-04-01', 2, 2);
INSERT INTO bestellt VALUES (12, 42, '2017-04-03', 2, 1);
INSERT INTO bestellt VALUES (119, 38, '2017-04-03', 1, 1);
INSERT INTO bestellt VALUES (30, 5, '2017-04-05', 1, 1);
INSERT INTO bestellt VALUES (7, 29, '2017-04-08', 2, 2);
INSERT INTO bestellt VALUES (3, 7, '2017-04-09', 1, 2);
INSERT INTO bestellt VALUES (103, 20, '2017-04-10', 2, 1);
INSERT INTO bestellt VALUES (67, 25, '2017-04-11', 1, 2);
INSERT INTO bestellt VALUES (5, 14, '2017-04-12', 1, 2);
INSERT INTO bestellt VALUES (80, 5, '2017-04-13', 1, 2);
INSERT INTO bestellt VALUES (53, 8, '2017-04-15', 1, 1);
INSERT INTO bestellt VALUES (115, 49, '2017-04-15', 1, 1);
INSERT INTO bestellt VALUES (49, 22, '2017-04-16', 1, 1);
INSERT INTO bestellt VALUES (47, 35, '2017-04-17', 1, 2);
INSERT INTO bestellt VALUES (58, 4, '2017-04-18', 2, 2);
INSERT INTO bestellt VALUES (52, 19, '2017-04-19', 1, 2);
INSERT INTO bestellt VALUES (67, 41, '2017-04-21', 1, 2);
INSERT INTO bestellt VALUES (61, 27, '2017-04-22', 2, 1);
INSERT INTO bestellt VALUES (11, 33, '2017-04-23', 2, 2);
INSERT INTO bestellt VALUES (46, 31, '2017-04-25', 2, 2);
INSERT INTO bestellt VALUES (40, 45, '2017-04-28', 2, 1);
INSERT INTO bestellt VALUES (14, 42, '2017-05-06', 1, 2);
INSERT INTO bestellt VALUES (30, 22, '2017-05-06', 1, 1);
INSERT INTO bestellt VALUES (28, 19, '2017-05-08', 1, 2);
INSERT INTO bestellt VALUES (64, 31, '2017-05-09', 1, 1);
INSERT INTO bestellt VALUES (101, 48, '2017-05-10', 2, 2);
INSERT INTO bestellt VALUES (96, 18, '2017-05-11', 2, 1);
INSERT INTO bestellt VALUES (105, 31, '2017-05-11', 1, 1);
INSERT INTO bestellt VALUES (121, 34, '2017-05-12', 2, 1);
INSERT INTO bestellt VALUES (64, 17, '2017-05-14', 2, 2);
INSERT INTO bestellt VALUES (40, 8, '2017-05-16', 1, 2);
INSERT INTO bestellt VALUES (71, 1, '2017-05-17', 2, 1);
INSERT INTO bestellt VALUES (72, 16, '2017-05-17', 1, 2);
INSERT INTO bestellt VALUES (61, 44, '2017-05-18', 2, 1);
INSERT INTO bestellt VALUES (91, 10, '2017-05-22', 2, 2);
INSERT INTO bestellt VALUES (113, 40, '2017-05-22', 2, 1);
INSERT INTO bestellt VALUES (91, 22, '2017-05-23', 1, 2);
INSERT INTO bestellt VALUES (25, 37, '2017-05-24', 2, 2);
INSERT INTO bestellt VALUES (28, 16, '2017-05-24', 1, 1);
INSERT INTO bestellt VALUES (108, 17, '2017-05-27', 2, 2);
INSERT INTO bestellt VALUES (81, 3, '2017-05-31', 1, 1);
INSERT INTO bestellt VALUES (112, 44, '2017-05-31', 1, 2);
INSERT INTO bestellt VALUES (51, 38, '2017-06-03', 2, 2);
INSERT INTO bestellt VALUES (72, 34, '2017-06-03', 1, 1);
INSERT INTO bestellt VALUES (67, 35, '2017-06-08', 2, 1);
INSERT INTO bestellt VALUES (86, 12, '2017-06-10', 2, 1);
INSERT INTO bestellt VALUES (11, 31, '2017-06-11', 1, 2);
INSERT INTO bestellt VALUES (39, 17, '2017-06-11', 1, 1);
INSERT INTO bestellt VALUES (20, 41, '2017-06-12', 2, 2);
INSERT INTO bestellt VALUES (122, 43, '2017-06-13', 2, 2);
INSERT INTO bestellt VALUES (49, 14, '2017-06-15', 2, 2);
INSERT INTO bestellt VALUES (101, 8, '2017-06-15', 2, 2);
INSERT INTO bestellt VALUES (113, 20, '2017-06-15', 2, 2);
INSERT INTO bestellt VALUES (122, 27, '2017-06-21', 2, 2);
INSERT INTO bestellt VALUES (26, 34, '2017-06-22', 2, 1);
INSERT INTO bestellt VALUES (44, 41, '2017-06-23', 2, 2);
INSERT INTO bestellt VALUES (34, 39, '2017-06-24', 2, 1);
INSERT INTO bestellt VALUES (100, 52, '2017-06-26', 2, 1);
INSERT INTO bestellt VALUES (31, 13, '2017-06-30', 1, 1);
INSERT INTO bestellt VALUES (26, 30, '2017-07-03', 1, 1);
INSERT INTO bestellt VALUES (51, 28, '2017-07-06', 1, 2);
INSERT INTO bestellt VALUES (12, 34, '2017-07-08', 1, 1);
INSERT INTO bestellt VALUES (30, 15, '2017-07-08', 2, 1);
INSERT INTO bestellt VALUES (58, 6, '2017-07-08', 1, 2);
INSERT INTO bestellt VALUES (9, 34, '2017-07-11', 1, 1);
INSERT INTO bestellt VALUES (62, 15, '2017-07-11', 2, 1);
INSERT INTO bestellt VALUES (19, 30, '2017-07-12', 2, 1);
INSERT INTO bestellt VALUES (54, 10, '2017-07-12', 1, 2);
INSERT INTO bestellt VALUES (23, 46, '2017-07-14', 2, 1);
INSERT INTO bestellt VALUES (42, 40, '2017-07-14', 1, 2);
INSERT INTO bestellt VALUES (35, 51, '2017-07-17', 2, 2);
INSERT INTO bestellt VALUES (53, 9, '2017-07-23', 2, 1);
INSERT INTO bestellt VALUES (90, 24, '2017-07-23', 1, 2);
INSERT INTO bestellt VALUES (92, 31, '2017-07-23', 1, 2);
INSERT INTO bestellt VALUES (51, 36, '2017-07-25', 1, 1);
INSERT INTO bestellt VALUES (23, 46, '2017-07-27', 1, 1);
INSERT INTO bestellt VALUES (58, 32, '2017-07-28', 2, 1);
INSERT INTO bestellt VALUES (68, 21, '2017-07-28', 2, 1);
INSERT INTO bestellt VALUES (13, 7, '2017-07-29', 1, 1);
INSERT INTO bestellt VALUES (25, 14, '2017-07-30', 1, 1);
INSERT INTO bestellt VALUES (84, 22, '2017-07-31', 2, 1);
INSERT INTO bestellt VALUES (90, 14, '2017-08-02', 2, 1);
INSERT INTO bestellt VALUES (124, 34, '2017-08-03', 1, 2);
INSERT INTO bestellt VALUES (1, 52, '2017-08-08', 2, 1);
INSERT INTO bestellt VALUES (52, 48, '2017-08-11', 2, 1);
INSERT INTO bestellt VALUES (104, 36, '2017-08-13', 2, 1);
INSERT INTO bestellt VALUES (107, 34, '2017-08-14', 1, 2);
INSERT INTO bestellt VALUES (72, 38, '2017-08-15', 2, 2);
INSERT INTO bestellt VALUES (58, 45, '2017-08-20', 2, 2);
INSERT INTO bestellt VALUES (70, 17, '2017-08-20', 1, 2);
INSERT INTO bestellt VALUES (93, 35, '2017-08-22', 2, 2);
INSERT INTO bestellt VALUES (113, 39, '2017-08-23', 2, 1);
INSERT INTO bestellt VALUES (23, 34, '2017-08-24', 1, 2);
INSERT INTO bestellt VALUES (93, 12, '2017-08-24', 2, 1);
INSERT INTO bestellt VALUES (80, 21, '2017-08-25', 2, 1);
INSERT INTO bestellt VALUES (5, 31, '2017-08-26', 1, 1);
INSERT INTO bestellt VALUES (71, 4, '2017-08-26', 1, 2);
INSERT INTO bestellt VALUES (105, 12, '2017-08-26', 2, 1);
INSERT INTO bestellt VALUES (5, 18, '2017-08-30', 2, 1);
INSERT INTO bestellt VALUES (18, 44, '2017-09-01', 1, 1);
INSERT INTO bestellt VALUES (103, 49, '2017-09-01', 2, 2);
INSERT INTO bestellt VALUES (3, 38, '2017-09-05', 1, 2);
INSERT INTO bestellt VALUES (19, 38, '2017-09-08', 2, 1);
INSERT INTO bestellt VALUES (49, 6, '2017-09-09', 2, 1);
INSERT INTO bestellt VALUES (63, 13, '2017-09-09', 2, 2);
INSERT INTO bestellt VALUES (26, 40, '2017-09-15', 2, 1);
INSERT INTO bestellt VALUES (16, 8, '2017-09-18', 1, 2);
INSERT INTO bestellt VALUES (39, 36, '2017-09-18', 1, 2);
INSERT INTO bestellt VALUES (68, 33, '2017-09-19', 1, 1);
INSERT INTO bestellt VALUES (50, 10, '2017-09-21', 1, 2);
INSERT INTO bestellt VALUES (11, 21, '2017-09-24', 2, 1);
INSERT INTO bestellt VALUES (106, 4, '2017-09-25', 1, 1);
INSERT INTO bestellt VALUES (12, 48, '2017-09-26', 2, 1);
INSERT INTO bestellt VALUES (56, 17, '2017-09-26', 2, 2);
INSERT INTO bestellt VALUES (100, 17, '2017-09-27', 2, 1);
INSERT INTO bestellt VALUES (37, 51, '2017-09-29', 1, 2);
INSERT INTO bestellt VALUES (67, 51, '2017-10-01', 1, 1);
INSERT INTO bestellt VALUES (81, 18, '2017-10-01', 1, 2);
INSERT INTO bestellt VALUES (101, 29, '2017-10-01', 1, 1);
INSERT INTO bestellt VALUES (43, 37, '2017-10-02', 2, 2);
INSERT INTO bestellt VALUES (31, 21, '2017-10-05', 1, 2);
INSERT INTO bestellt VALUES (31, 15, '2017-10-06', 1, 1);
INSERT INTO bestellt VALUES (68, 11, '2017-10-07', 2, 2);
INSERT INTO bestellt VALUES (14, 15, '2017-10-08', 2, 2);
INSERT INTO bestellt VALUES (115, 34, '2017-10-11', 1, 1);
INSERT INTO bestellt VALUES (8, 21, '2017-10-13', 2, 2);
INSERT INTO bestellt VALUES (44, 4, '2017-10-13', 1, 1);
INSERT INTO bestellt VALUES (2, 24, '2017-10-15', 2, 1);
INSERT INTO bestellt VALUES (19, 46, '2017-10-15', 2, 2);
INSERT INTO bestellt VALUES (3, 8, '2017-10-16', 1, 2);
INSERT INTO bestellt VALUES (7, 33, '2017-10-17', 1, 1);
INSERT INTO bestellt VALUES (13, 49, '2017-10-17', 2, 2);
INSERT INTO bestellt VALUES (12, 35, '2017-10-23', 1, 2);
INSERT INTO bestellt VALUES (62, 39, '2017-10-23', 1, 1);
INSERT INTO bestellt VALUES (72, 2, '2017-10-23', 1, 1);
INSERT INTO bestellt VALUES (85, 39, '2017-10-24', 1, 1);
INSERT INTO bestellt VALUES (105, 49, '2017-10-28', 1, 1);
INSERT INTO bestellt VALUES (72, 7, '2017-10-29', 1, 2);
INSERT INTO bestellt VALUES (7, 40, '2017-10-30', 1, 2);
INSERT INTO bestellt VALUES (32, 45, '2017-10-30', 1, 1);
INSERT INTO bestellt VALUES (66, 31, '2017-11-01', 1, 1);
INSERT INTO bestellt VALUES (29, 23, '2017-11-04', 2, 1);
INSERT INTO bestellt VALUES (60, 22, '2017-11-10', 1, 2);
INSERT INTO bestellt VALUES (110, 32, '2017-11-10', 1, 2);
INSERT INTO bestellt VALUES (6, 16, '2017-11-11', 1, 1);
INSERT INTO bestellt VALUES (50, 43, '2017-11-12', 2, 2);
INSERT INTO bestellt VALUES (100, 39, '2017-11-15', 2, 2);
INSERT INTO bestellt VALUES (93, 17, '2017-11-16', 2, 2);
INSERT INTO bestellt VALUES (55, 19, '2017-11-17', 1, 1);
INSERT INTO bestellt VALUES (100, 29, '2017-11-18', 2, 1);
INSERT INTO bestellt VALUES (104, 42, '2017-11-18', 2, 2);
INSERT INTO bestellt VALUES (123, 13, '2017-11-18', 2, 2);
INSERT INTO bestellt VALUES (11, 3, '2017-11-19', 1, 2);
INSERT INTO bestellt VALUES (79, 17, '2017-11-19', 2, 1);
INSERT INTO bestellt VALUES (88, 37, '2017-11-19', 2, 1);
INSERT INTO bestellt VALUES (110, 10, '2017-11-20', 1, 2);
INSERT INTO bestellt VALUES (47, 43, '2017-11-21', 2, 2);
INSERT INTO bestellt VALUES (72, 12, '2017-11-21', 2, 2);
INSERT INTO bestellt VALUES (29, 43, '2017-11-22', 1, 1);
INSERT INTO bestellt VALUES (20, 45, '2017-11-24', 2, 1);
INSERT INTO bestellt VALUES (99, 14, '2017-11-26', 1, 2);
INSERT INTO bestellt VALUES (94, 8, '2017-11-28', 2, 1);
INSERT INTO bestellt VALUES (121, 27, '2017-11-30', 2, 2);
INSERT INTO bestellt VALUES (119, 24, '2017-12-01', 2, 2);
INSERT INTO bestellt VALUES (31, 40, '2017-12-04', 2, 2);
INSERT INTO bestellt VALUES (32, 47, '2017-12-04', 1, 2);
INSERT INTO bestellt VALUES (95, 31, '2017-12-04', 1, 2);
INSERT INTO bestellt VALUES (121, 10, '2017-12-05', 1, 2);
INSERT INTO bestellt VALUES (26, 23, '2017-12-06', 2, 1);
INSERT INTO bestellt VALUES (120, 50, '2017-12-07', 2, 2);
INSERT INTO bestellt VALUES (7, 42, '2017-12-11', 1, 2);
INSERT INTO bestellt VALUES (88, 48, '2017-12-11', 1, 1);
INSERT INTO bestellt VALUES (76, 20, '2017-12-13', 2, 1);
INSERT INTO bestellt VALUES (37, 40, '2017-12-18', 2, 1);
INSERT INTO bestellt VALUES (105, 26, '2017-12-18', 2, 1);
INSERT INTO bestellt VALUES (19, 16, '2017-12-19', 1, 2);
INSERT INTO bestellt VALUES (80, 5, '2017-12-22', 2, 1);
INSERT INTO bestellt VALUES (49, 28, '2017-12-27', 1, 2);
INSERT INTO bestellt VALUES (100, 10, '2017-12-27', 2, 2);
INSERT INTO bestellt VALUES (33, 42, '2018-01-01', 2, 2);
INSERT INTO bestellt VALUES (57, 51, '2018-01-02', 2, 1);
INSERT INTO bestellt VALUES (49, 30, '2018-01-06', 2, 2);
INSERT INTO bestellt VALUES (51, 10, '2018-01-06', 2, 1);
INSERT INTO bestellt VALUES (40, 11, '2018-01-09', 1, 2);
INSERT INTO bestellt VALUES (30, 13, '2018-01-11', 1, 2);
INSERT INTO bestellt VALUES (40, 12, '2018-01-11', 2, 1);
INSERT INTO bestellt VALUES (107, 50, '2018-01-11', 2, 1);
INSERT INTO bestellt VALUES (39, 44, '2018-01-17', 2, 1);


--
-- Data for Name: cocktail; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cocktail VALUES (1, 'Alice', 7.50, 'Auf Eiswürfeln kräftig schütteln, in Longdrinkglas auf Eiswürfeln abseihen. Orangenscheibe auf den Glasrand stecken.', 1, 1, 4);
INSERT INTO cocktail VALUES (2, 'Cinderella', 7.20, 'Auf Eiswürfeln schütteln, in Longdrinkglas auf Eiswürfeln gießen, mit Bananenscheiben und Cocktailkirschen auf einem Cocktailspieß garnieren.', 1, 1, 4);
INSERT INTO cocktail VALUES (3, 'Coconut Kiss', 7.20, 'Auf Eiswürfeln schütteln, in großes Becherglas auf crushed ice abseihen, Amarenakirsche dazugeben.', 1, 1, 6);
INSERT INTO cocktail VALUES (4, 'Florida Cocktail', 7.20, 'Auf Eiswürfeln kräftig schütteln, in ein Weinglas abseihen.', 1, 1, 10);
INSERT INTO cocktail VALUES (5, 'Long Distance Runner', 7.80, 'Auf crushed ice zubereiten, in großes Becherglas abseihen, mit crushed ice auffüllen.', 1, 2, 6);
INSERT INTO cocktail VALUES (6, 'Pina Colada Natural', 7.20, 'Auf Eiswürfeln gut verrühren und in hohes Glas gießen. Mit Cocktailkirsche garnieren.', 1, 3, 4);
INSERT INTO cocktail VALUES (7, 'Shirley Temple', 7.80, 'In Longdrinkglas eine halbe Flasche Seven up und eine Flasche Ginger Ale auf Eiswürfel gießen, Dash Grenadine, umrühren.', 1, 4, 4);
INSERT INTO cocktail VALUES (8, 'Adonis', 6.20, 'Auf viel Eiswürfeln kräftig verrühren, in vorgekühlte Cocktailschale abseihen.', 2, 3, 11);
INSERT INTO cocktail VALUES (9, 'Aperol Sour', 7.80, 'Auf Eiswürfeln kräftig schütteln, in Sourglas abseihen. Kann auch mit Soda aufgegossen werden.', 6, 1, 13);
INSERT INTO cocktail VALUES (10, 'El Presidente', 6.80, 'Auf viel Eiswürfeln verrühren, in vorgekühlte Cocktailschale abseihen.', 2, 1, 11);
INSERT INTO cocktail VALUES (11, 'Martini Cocktail', 6.50, 'Auf viel Eiswürfeln verrühren, in vorgekühltes Martiniglas abseihen, grüne Olive mit Stein dazugeben. Die Menge des Vermouth kann je nach gewünschter Trockenheit variiert werden. Für den dry Martini sollte Noilly Prat verwendet werden.', 2, 3, 12);
INSERT INTO cocktail VALUES (12, 'Park Avenue', 6.80, 'Auf Eiswürfeln gut verrühren, in vorgekühlte Cocktailschale abseihen.', 2, 3, 11);
INSERT INTO cocktail VALUES (13, 'Rob Roy', 6.50, 'Auf viel Eiswürfeln verrühren, in vorgekühlte Cocktailschale abseihen, Stielkirsche dazugeben.', 2, 3, 11);
INSERT INTO cocktail VALUES (14, 'Bourbon Highball', 7.60, 'Im Longdrinkglas auf Eiswürfel Ginger Ale (oder andere Sodas) gießen, Zitronenspirale dazugeben.', 3, 4, 4);
INSERT INTO cocktail VALUES (15, 'Bulldog Highball', 7.80, 'Im Longdrinkglas auf Eiswürfeln verrühren, mit Ginger Ale auffüllen.', 3, 4, 4);
INSERT INTO cocktail VALUES (16, 'El Diabolo', 7.80, 'Im Longdrinkglas auf Eiswürfel Tequila und Cassis verrühren, mit Ginger Ale auffüllen, mit Limettenviertel abspritzen und dieses dazugeben.', 3, 1, 4);
INSERT INTO cocktail VALUES (17, 'Rum Highball', 7.60, 'In Longdrinkglas Rum auf Eiswürfel gießen, mit Ginger Ale, Soda oder Seven Up auffüllen, Zitronenspirale dazugeben.', 3, 4, 4);
INSERT INTO cocktail VALUES (18, 'Americano', 7.80, 'Im Aperitifglas auf Eiswürfel gießen, verrühren, mit Zitronen- und Orangenschale abspritzen und diese dazugeben. Kann mit etwas Soda aufgespritzt werden.', 4, 5, 5);
INSERT INTO cocktail VALUES (19, 'Black Russian', 7.20, 'Im Tumbler auf Eiswürfeln verrühren. Statt Kahlúa kann auch Tia Maria verwendet werden.', 4, 8, 8);
INSERT INTO cocktail VALUES (20, 'Caipirinha', 7.20, 'In kleines Becherglas Limettenachtel und Zucker geben, mit Stößel gut zerdrücken, Spirituose dazugeben, umrühren. Mit crushed ice auffüllen und nochmals verrühren.', 4, 7, 7);
INSERT INTO cocktail VALUES (21, 'Margarita', 7.20, 'Auf viel Eiswürfeln kräftig schütteln, in vorgekühlte Cocktailschale mit Salzrand abseihen.', 4, 1, 11);
INSERT INTO cocktail VALUES (22, 'Mojito', 7.80, 'Im großen Becherglas Zucker und Lime Juice gut verrühren. Minzeblätter mit Stößel zerdrücken, ausgedrückte Limette dazugeben. Mit crushed ice auffüllen, Rum dazugießen, umrühren. Mit Soda abspritzen, mit Minzezweig dekorieren.', 4, 6, 6);
INSERT INTO cocktail VALUES (23, 'Pina Colada Classic', 7.80, 'Auf crushed ice zubereiten, in großes Becherglas füllen.', 4, 2, 6);
INSERT INTO cocktail VALUES (24, 'Screwdriver', 6.80, 'Im Longdrinkglas auf Eiswürfel gut verrühren.', 4, 4, 4);
INSERT INTO cocktail VALUES (25, 'Swimming Pool', 8.20, 'Auf crushed ice kräftig schütteln, in großes Becherglas auf crushed ice abseihen, Curacao darübergleiten lassen, mit Stielkirsche und Ananasstück dekorieren. Kann auch im Blender zubereitet werden.', 4, 1, 6);
INSERT INTO cocktail VALUES (26, 'Tequila Sunrise', 7.80, 'Großes Becherglas zur Hälfte mit crushed ice füllen, Limettenachtel hineinpressen und dazugeben, Tequila, Dashes Grenadine, dann langsam mit Orangensaft auffüllen.', 4, 6, 6);
INSERT INTO cocktail VALUES (27, 'Whiskey Sour', 7.60, 'Auf Eiswürfeln kräftig schütteln, in Sourglas abseihen, Stielkirsche dazugeben. Whiskey-Variationen möglich.', 6, 1, 13);
INSERT INTO cocktail VALUES (28, 'White Russian', 7.60, 'Spirituosen auf Eiswürfeln verrühren, in Südweinglas abseihen, leicht angeschlagenen Obers darüberheben.', 4, 3, 10);
INSERT INTO cocktail VALUES (29, 'Zombie', 8.20, 'Für den Orangensaft sollten Blutorangen verwendet werden. Auf Eiswürfeln kräftig schütteln, in großes Becherglas auf crushed ice abseihen.', 4, 1, 6);
INSERT INTO cocktail VALUES (30, 'Sex on the Beach', 8.20, 'Alle Zutaten zusammenmischen und shaken. In ein großes Becherglas füllen und servieren.', 4, 1, 6);
INSERT INTO cocktail VALUES (31, 'B 52', 4.50, 'In angegebener Reihenfolge vorsichtig in Shooterglas eingießen, sodaß Schichten entstehen.', 5, 9, 9);
INSERT INTO cocktail VALUES (32, 'Blue Shark', 4.50, 'Shake with ice and strain into a shot glass.', 5, 1, 9);
INSERT INTO cocktail VALUES (33, 'Golden Nipple', 4.20, 'Layer the ingredients in a shooter glass.', 5, 9, 9);
INSERT INTO cocktail VALUES (34, 'KGB', 4.50, 'Layer the ingredients in a shooter glass.', 5, 9, 9);
INSERT INTO cocktail VALUES (35, 'Tequila Popper', 4.20, 'Pour tequila into tall shot glass. Fill 3/4 full with 7-Up. Place napkin over top and bang on table. Drink inmediately.', 5, 9, 9);
INSERT INTO cocktail VALUES (36, 'Rum Sour', 7.20, 'Auf Eiswürfeln kräftig schütteln, in Sourglas abseihen, Stielkirsche dazugeben.', 6, 1, 13);
INSERT INTO cocktail VALUES (37, 'Louisiana Sour', 7.60, 'Auf Eiswürfeln schütteln, in Champagnertulpe abseihen, mit Limettenscheibe und Cocktailkirsche dekorieren.', 6, 1, 14);
INSERT INTO cocktail VALUES (38, 'Amaretto Sour', 7.20, 'Auf viel Eiswürfeln kräftig schütteln, in Sourglas abseihen, Stielkirsche dazugeben. Statt Orange Juice kann auch Soda verwendet werden.', 6, 1, 13);
INSERT INTO cocktail VALUES (39, 'Gin Sour', 7.20, 'Auf Eiswürfeln kräftig schütteln, in Sourglas abseihen, Stielkirsche dazugeben.', 6, 1, 13);
INSERT INTO cocktail VALUES (40, 'Tequila Sour', 7.20, 'Auf Eiswürfeln kräftig schütteln, in Sourglas abseihen, Kirsche dazugeben.', 6, 1, 13);
INSERT INTO cocktail VALUES (41, 'Vodka Sour', 7.20, 'Auf Eiswürfeln kräftig schütteln, in Sourglas abseihen, Stielkirsche dazugeben.', 6, 1, 13);
INSERT INTO cocktail VALUES (42, 'Vermouth Cassis', 6.50, 'Im Aperitifglas auf Eiswürfel Crème de Cassis und Vermouth gießen, verrühren, mit Soda auffüllen und mit Zitronenschale abspritzen.', 2, 5, 5);
INSERT INTO cocktail VALUES (43, 'Vermouth Cocktail', 6.20, 'Auf Eiswürfeln gut verrühren, in vorgekühlte Cocktailschale abseihen.', 2, 3, 11);
INSERT INTO cocktail VALUES (44, 'Brazil', 7.20, 'Auf Eiswürfeln kräftig verrühren, in vorgekühlte Cocktailschale abseihen.', 4, 3, 11);
INSERT INTO cocktail VALUES (45, 'Black Devil', 6.80, 'Im Rührglas auf viel Eiswürfeln verrühren, in vorgekühltes Martiniglas abseihen, schwarze Olive dazugeben.', 4, 3, 12);
INSERT INTO cocktail VALUES (46, 'Bloody Mary', 7.00, 'Mit Selleriesalz, Pfeffer, Worcestershire Sauce und Tabasco würzen, im Longdrinkglas auf Eiswürfeln gut verrühren. Mit Stangensellerie garnieren.', 4, 4, 4);
INSERT INTO cocktail VALUES (47, 'Opal', 6.20, 'Auf Eiswürfeln gut verrühren, in vorgekühlte Cocktailschale abseihen.', 2, 3, 11);
INSERT INTO cocktail VALUES (48, 'Manhattan Perfect', 7.40, 'Auf viel Eiswürfeln kräftig verrühren, in vorgekühlte Cocktailschale abseihen, Stielkirsche dazugeben.', 4, 3, 11);
INSERT INTO cocktail VALUES (49, 'Mary Pickford', 6.80, 'Auf Eiswürfeln schütteln, in vorgekühlte Cocktailschale abseihen, mit Limettenschale abspritzen und diese dazugeben.', 4, 1, 11);
INSERT INTO cocktail VALUES (50, 'New Yorker', 7.00, 'Im Tumbler Bourbon auf Eiswürfel gießen, Limettenviertel darüber ausdrücken und dazugeben, Dashes Grenadine, gut verrühren.', 4, 8, 8);
INSERT INTO cocktail VALUES (51, 'Pussy Foot', 7.00, 'Auf Eiswürfeln kräftig schütteln, in kleines Becherglas auf Eiswürfel abseihen, Stielkirsche dazugeben.', 4, 1, 7);
INSERT INTO cocktail VALUES (52, 'TNT', 7.60, 'Im Tumbler auf Eiswürfeln verrühren. Kann mit etwas Wasser oder Soda abgespritzt werden.', 4, 8, 8);


--
-- Name: cocktail_cid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cocktail_cid_seq', 53, false);


--
-- Data for Name: gefaess; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO gefaess VALUES (1, 'Shaker');
INSERT INTO gefaess VALUES (2, 'Blender');
INSERT INTO gefaess VALUES (3, 'Mixing Glas');
INSERT INTO gefaess VALUES (4, 'Longdrinkglas');
INSERT INTO gefaess VALUES (5, 'Aperitifglas');
INSERT INTO gefaess VALUES (6, 'Becherglas (groß)');
INSERT INTO gefaess VALUES (7, 'Becherglas (klein)');
INSERT INTO gefaess VALUES (8, 'Tumbler');
INSERT INTO gefaess VALUES (9, 'Shooter Glas');
INSERT INTO gefaess VALUES (10, 'Weinglas');
INSERT INTO gefaess VALUES (11, 'Cocktailschale');
INSERT INTO gefaess VALUES (12, 'Martiniglas');
INSERT INTO gefaess VALUES (13, 'Sourglas');
INSERT INTO gefaess VALUES (14, 'Champagnertulpe');


--
-- Name: gefaess_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('gefaess_gid_seq', 15, false);


--
-- Data for Name: gehalt; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO gehalt VALUES (1, '2010-03-15', '2014-12-31', 2560.00);
INSERT INTO gehalt VALUES (2, '2010-03-15', '2014-12-31', 2200.00);
INSERT INTO gehalt VALUES (3, '2010-03-15', '2014-12-31', 2175.00);
INSERT INTO gehalt VALUES (4, '2010-03-15', '2016-06-30', 1890.00);
INSERT INTO gehalt VALUES (5, '2010-03-15', '2012-10-31', 1670.00);
INSERT INTO gehalt VALUES (6, '2010-03-15', '2012-12-31', 1515.00);
INSERT INTO gehalt VALUES (8, '2011-06-01', '2015-05-31', 1770.00);
INSERT INTO gehalt VALUES (5, '2012-11-01', '2015-03-31', 1750.00);
INSERT INTO gehalt VALUES (6, '2013-01-01', '2016-08-31', 1650.00);
INSERT INTO gehalt VALUES (7, '2014-09-01', '2014-12-31', 2490.00);
INSERT INTO gehalt VALUES (9, '2014-09-01', '2014-12-31', 2240.00);
INSERT INTO gehalt VALUES (10, '2014-09-01', '2016-07-31', 1790.00);
INSERT INTO gehalt VALUES (11, '2014-09-01', '2015-10-31', 1685.00);
INSERT INTO gehalt VALUES (13, '2014-09-01', '2017-05-31', 2150.00);
INSERT INTO gehalt VALUES (15, '2014-09-01', '2017-04-30', 1480.00);
INSERT INTO gehalt VALUES (16, '2014-09-01', '2015-06-30', 1575.00);
INSERT INTO gehalt VALUES (12, '2014-11-01', '2017-01-31', 1610.00);
INSERT INTO gehalt VALUES (14, '2014-11-01', '2016-09-30', 1450.00);
INSERT INTO gehalt VALUES (1, '2015-01-01', '2017-05-31', 2750.00);
INSERT INTO gehalt VALUES (2, '2015-01-01', '9999-12-31', 2420.00);
INSERT INTO gehalt VALUES (3, '2015-01-01', '9999-12-31', 2400.00);
INSERT INTO gehalt VALUES (7, '2015-01-01', '2017-05-31', 2720.00);
INSERT INTO gehalt VALUES (9, '2015-01-01', '2017-05-31', 2450.00);
INSERT INTO gehalt VALUES (5, '2015-04-01', '9999-12-31', 1880.00);
INSERT INTO gehalt VALUES (8, '2015-06-01', '9999-12-31', 1905.00);
INSERT INTO gehalt VALUES (18, '2015-07-01', '9999-12-31', 1695.00);
INSERT INTO gehalt VALUES (11, '2015-11-01', '9999-12-31', 1810.00);
INSERT INTO gehalt VALUES (17, '2016-02-01', '9999-12-31', 1865.00);
INSERT INTO gehalt VALUES (4, '2016-07-01', '9999-12-31', 1980.00);
INSERT INTO gehalt VALUES (10, '2016-08-01', '9999-12-31', 1930.00);
INSERT INTO gehalt VALUES (14, '2016-10-01', '9999-12-31', 1670.00);
INSERT INTO gehalt VALUES (12, '2017-02-01', '2017-09-30', 1790.00);
INSERT INTO gehalt VALUES (15, '2017-05-01', '9999-12-31', 1678.00);
INSERT INTO gehalt VALUES (1, '2017-06-01', '9999-12-31', 3090.00);
INSERT INTO gehalt VALUES (7, '2017-06-01', '9999-12-31', 3050.00);
INSERT INTO gehalt VALUES (9, '2017-06-01', '9999-12-31', 2610.00);
INSERT INTO gehalt VALUES (13, '2017-06-01', '9999-12-31', 2520.00);


--
-- Data for Name: kategorie; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO kategorie VALUES (1, 'Antialkoholisch');
INSERT INTO kategorie VALUES (2, 'Aperitif');
INSERT INTO kategorie VALUES (3, 'Highball');
INSERT INTO kategorie VALUES (4, 'Klassisch');
INSERT INTO kategorie VALUES (5, 'Schooter');
INSERT INTO kategorie VALUES (6, 'Sour');


--
-- Name: kategorie_kid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kategorie_kid_seq', 7, false);


--
-- Data for Name: kunden; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO kunden VALUES (1, 'Albina', 'Winter', 'w', '1954-03-09', 'Nedderndorfer Weg', '181', 1070, 'Wien', 'Albina.Winter@mailjunky.de');
INSERT INTO kunden VALUES (2, 'Hanife', 'Zimmermann', 'w', '1968-04-26', 'Röthelbachweg', '123/2', 1200, 'Wien', 'Hanife.Zimmermann@exox.de');
INSERT INTO kunden VALUES (3, 'Benedict', 'Schober', 'm', '1994-06-22', 'Zur Alten Ziegelei', '69', 1050, 'Wien', 'Benedict.Schober@spamfreemail.de');
INSERT INTO kunden VALUES (4, 'Erltrud', 'Mayer', 'w', '1971-02-09', 'Legienstraße', '117', 1150, 'Wien', 'Erltrud.Mayer@rediffmail.com');
INSERT INTO kunden VALUES (5, 'Gunthild', 'Auer', 'w', '1985-07-08', 'Kastanienweg', '46', 1090, 'Wien', 'Gunthild.Auer@eclipso.at');
INSERT INTO kunden VALUES (6, 'Sebald', 'Zimmermann', 'm', '1976-11-08', 'Am Hohen Stein', '1/3/15', 1210, 'Wien', 'Sebald.Zimmermann@gmx.de');
INSERT INTO kunden VALUES (7, 'Germo', 'Wieser', 'm', '1996-07-12', 'Max-Schwarze-Straße', '89', 1070, 'Wien', 'Germo.Wieser@mailjunky.de');
INSERT INTO kunden VALUES (8, 'Ekkardt', 'Pichler', 'm', '1988-10-10', 'Horner Berg', '180/5/2', 1140, 'Wien', 'Ekkardt.Pichler@outlook.com');
INSERT INTO kunden VALUES (9, 'Paulfried', 'Hofer', 'm', '1980-02-10', 'Egestraße', '143', 2345, 'Brunn am Gebirge', 'Paulfried.Hofer@spl.at');
INSERT INTO kunden VALUES (10, 'Didi', 'Strobl', 'm', '1958-05-01', 'Tostedenstraße', '181', 2381, 'Laab im Walde', 'Didi.Strobl@mc-free.com');
INSERT INTO kunden VALUES (11, 'Hannelore', 'Tichy', 'w', '1953-09-28', 'Keppgrundstraße', '87', 1120, 'Wien', 'Hannelore.Tichy@hotmail.de');
INSERT INTO kunden VALUES (12, 'York', 'Hoffmann', 'm', '1998-06-03', 'Am Grüngürtel', '42/3', 1020, 'Wien', 'York.Hoffmann@one.com');
INSERT INTO kunden VALUES (13, 'Eckehardt', 'Seidl', 'm', '1976-09-24', 'Wallstraße', '159', 1110, 'Wien', 'Eckehardt.Seidl@maili.de');
INSERT INTO kunden VALUES (14, 'Cordelia', 'Schneider', 'w', '1995-08-03', 'Beim Saaren', '111', 1210, 'Wien', 'Cordelia.Schneider@gmx.de');
INSERT INTO kunden VALUES (15, 'Heinolf', 'Müller', 'm', '1984-01-01', 'Auf der Brandshofer Schleuse', '68', 1060, 'Wien', 'Heinolf.Mueller@gmail.com');
INSERT INTO kunden VALUES (16, 'Kreszenz', 'Schober', 'w', '1992-01-08', 'Hallstadter Str.', '34', 3002, 'Purkersdorf', 'Kreszenz.Schober@k-bg.de');
INSERT INTO kunden VALUES (17, 'Hertraud', 'Graf', 'w', '1984-08-23', 'Schützenstr.', '74/3', 2381, 'Wolfsgraben', 'Hertraud.Graf@x-mail.net');
INSERT INTO kunden VALUES (18, 'Wilfrid', 'Bayer', 'm', '1971-07-21', 'Waldweg', '21', 1090, 'Wien', 'Wilfrid.Bayer@eclipso.at');
INSERT INTO kunden VALUES (19, 'Annalies', 'Petrovic', 'w', '1974-05-03', 'Theodor-W.-Adorno-Platz', '19', 2381, 'Laab im Walde', 'Annalies.Petrovic@mc-free.com');
INSERT INTO kunden VALUES (20, 'Jochen', 'Stadler', 'm', '1953-11-16', 'Obere Karolinenstr.', '78', 3003, 'Gablitz', 'Jochen.Stadler@overmail.de');
INSERT INTO kunden VALUES (21, 'Meta', 'Lehner', 'w', '1961-02-10', 'Rahewinkel', '20/10', 1090, 'Wien', 'Meta.Lehner@eclipso.at');
INSERT INTO kunden VALUES (22, 'Eva-Marie', 'Kaufmann', 'w', '1978-05-19', 'Kurt-Schumacher-Straße', '183', 1090, 'Wien', 'Eva-Marie.Kaufmann@eclipso.at');
INSERT INTO kunden VALUES (23, 'Karlpeter', 'Weber', 'm', '1950-10-19', 'Hohe Straße', '166', 1120, 'Wien', 'Karlpeter.Weber@hotmail.de');
INSERT INTO kunden VALUES (24, 'Hubertine', 'Frank', 'w', '1954-02-22', 'Am Wiesental', '23', 1020, 'Wien', 'Hubertine.Frank@one.com');
INSERT INTO kunden VALUES (25, 'Eckard', 'Ziegler', 'm', '1984-08-10', 'Dunantring', '141', 1230, 'Wien', 'Eckard.Ziegler@5x2.de');
INSERT INTO kunden VALUES (26, 'Ekkehard', 'Weiss', 'm', '1985-06-11', 'Altreick', '88', 1230, 'Wien', 'Ekkehard.Weiss@5x2.de');
INSERT INTO kunden VALUES (27, 'Marija', 'Müller', 'w', '1978-03-07', 'Tögelstraße', '123', 2381, 'Laab im Walde', 'Marija.Mueller@mc-free.com');
INSERT INTO kunden VALUES (28, 'Hansludwig', 'Varga', 'm', '1951-08-28', 'Carl-Meinelt-Str.', '53', 2361, 'Laxenburg', 'Hansludwig.Varga@t-online.de');
INSERT INTO kunden VALUES (29, 'Randolf', 'Neumann', 'm', '1982-08-02', 'Nelly-Sachs-Platz', '36', 2381, 'Laab im Walde', 'Randolf.Neumann@mc-free.com');
INSERT INTO kunden VALUES (30, 'Helmine', 'Hofbauer', 'w', '1992-08-02', 'Auf der Höhe', '43/2/3', 1210, 'Wien', 'Helmine.Hofbauer@gmx.de');
INSERT INTO kunden VALUES (31, 'Katrin', 'Leitner', 'w', '1977-10-01', 'Kleinhöfleiner Streusiedlung', '22', 1080, 'Wien', 'Katrin.Leitner@firemail.de');
INSERT INTO kunden VALUES (32, 'Jolanthe', 'Hofmann', 'w', '1965-03-13', 'Baltasar-Neumann-Str.', '131', 1140, 'Wien', 'Jolanthe.Hofmann@outlook.com');
INSERT INTO kunden VALUES (33, 'Oliver', 'Kraus', 'm', '1989-06-26', 'Cäsar-von-Hofacker-Straße', '138', 1040, 'Wien', 'Oliver.Kraus@aol.de');
INSERT INTO kunden VALUES (34, 'Alex', 'Langer', 'm', '1993-12-16', 'Bleiweißstraße', '174', 2381, 'Wolfsgraben', 'Alex.Langer@x-mail.net');
INSERT INTO kunden VALUES (35, 'Nordrun', 'Weiß', 'w', '1987-08-05', 'Riesserstraße', '136/7/1', 1200, 'Wien', 'Nordrun.Weiss@exox.de');
INSERT INTO kunden VALUES (36, 'Annika', 'Gruber', 'w', '1969-09-27', 'Hardenbergstraße', '95', 1140, 'Wien', 'Annika.Gruber@outlook.com');
INSERT INTO kunden VALUES (37, 'Hoimar', 'Kaiser', 'm', '1987-09-03', 'Duckwitzstraße', '169', 1230, 'Wien', 'Hoimar.Kaiser@5x2.de');
INSERT INTO kunden VALUES (38, 'Wiltraut', 'Urban', 'w', '1983-07-06', 'Abtstraße', '140', 1200, 'Wien', 'Wiltraut.Urban@exox.de');
INSERT INTO kunden VALUES (39, 'Viola', 'Richter', 'w', '1990-02-01', 'Am Rittergut', '130', 1200, 'Wien', 'Viola.Richter@exox.de');
INSERT INTO kunden VALUES (40, 'Nikodem', 'Zimmermann', 'm', '1972-09-04', 'Drei-Häuser-Weg', '50', 1120, 'Wien', 'Nikodem.Zimmermann@hotmail.de');
INSERT INTO kunden VALUES (41, 'Ehrentraud', 'Traxler', 'w', '1980-12-14', 'Zum Fruchthof', '75', 1020, 'Wien', 'Ehrentraud.Traxler@one.com');
INSERT INTO kunden VALUES (42, 'Jane', 'Müller', 'w', '1978-08-29', 'Kettelerallee', '48', 2331, 'Vösendorf', 'Jane.Mueller@smart-mail.de');
INSERT INTO kunden VALUES (43, 'Dorle', 'Binder', 'w', '1956-02-11', 'Burgwartstraße', '77', 1230, 'Wien', 'Dorle.Binder@5x2.de');
INSERT INTO kunden VALUES (44, 'Joscha', 'Neumann', 'm', '1976-11-29', 'Hellersiedlung Weg E', '64', 1190, 'Wien', 'Joscha.Neumann@directbox.com');
INSERT INTO kunden VALUES (45, 'Regine', 'Böhm', 'w', '1950-11-18', 'Wernerstraße', '149/5/4', 3002, 'Purkersdorf', 'Regine.Boehm@k-bg.de');
INSERT INTO kunden VALUES (46, 'Hermi', 'Hoffmann', 'w', '1995-12-19', 'Gönnsdorfer Straße', '101', 1110, 'Wien', 'Hermi.Hoffmann@maili.de');
INSERT INTO kunden VALUES (47, 'Siegenot', 'Schindler', 'm', '1982-04-29', 'Simrockstraße', '149', 2381, 'Laab im Walde', 'Siegenot.Schindler@mc-free.com');
INSERT INTO kunden VALUES (48, 'Elli', 'Huber', 'w', '1973-02-09', 'Wiesentorstraße', '69', 1180, 'Wien', 'Elli.Huber@simbamail.de');
INSERT INTO kunden VALUES (49, 'Ehrentrudis', 'Jovanovic', 'w', '1981-05-08', 'Hogenbarg', '182', 1090, 'Wien', 'Ehrentrudis.Jovanovic@eclipso.at');
INSERT INTO kunden VALUES (50, 'Helmtraut', 'Winter', 'w', '1998-01-11', 'Nickerner Straße', '76/21', 1050, 'Wien', 'Helmtraut.Winter@spamfreemail.de');
INSERT INTO kunden VALUES (51, 'Sylvia', 'Böhm', 'w', '1955-01-05', 'Hellbrookstraßenbrücke', '44', 1140, 'Wien', 'Sylvia.Boehm@outlook.com');
INSERT INTO kunden VALUES (52, 'Wilma', 'Müller', 'w', '1989-04-23', 'Keulenbergstraße', '140', 2362, 'Biedermannsdorf', 'Wilma.Mueller@compu-freemail.de');
INSERT INTO kunden VALUES (53, 'Susana', 'Ziegler', 'w', '1978-06-19', 'Heerstraße', '45', 2384, 'Breitenfurt', 'Susana.Ziegler@freenet.de');
INSERT INTO kunden VALUES (54, 'Giesbert', 'Weber', 'm', '1955-04-13', 'Prälat Gangl-Straße', '181', 1200, 'Wien', 'Giesbert.Weber@exox.de');
INSERT INTO kunden VALUES (55, 'Fatma', 'Pichler', 'w', '1983-02-01', 'Heideweg', '73', 2381, 'Laab im Walde', 'Fatma.Pichler@mc-free.com');
INSERT INTO kunden VALUES (56, 'Edelbert', 'Reiter', 'm', '1977-05-25', 'Karl-Blum-Allee', '55/4', 1030, 'Wien', 'Edelbert.Reiter@yahoo.de');
INSERT INTO kunden VALUES (57, 'Wunnibald', 'Hahn', 'm', '1990-02-24', 'Guiollettstraße', '88', 1080, 'Wien', 'Wunnibald.Hahn@firemail.de');
INSERT INTO kunden VALUES (58, 'Marjan', 'Seidl', 'w', '1950-12-13', 'Luftbadstraße', '172', 2384, 'Breitenfurt', 'Marjan.Seidl@freenet.de');
INSERT INTO kunden VALUES (59, 'Kaspar', 'Fischer', 'm', '1966-05-18', 'Pillnitzer Straße', '92', 1010, 'Wien', 'Kaspar.Fischer@mail.de');
INSERT INTO kunden VALUES (60, 'Altfried', 'Hofmann', 'm', '1991-01-20', 'Nagelstraße', '55', 1200, 'Wien', 'Altfried.Hofmann@exox.de');
INSERT INTO kunden VALUES (61, 'Rose', 'Schuster', 'w', '1996-02-10', 'Fährmannweg', '109', 1160, 'Wien', 'Rose.Schuster@lycos.com');
INSERT INTO kunden VALUES (62, 'Norwin', 'Djordjevic', 'm', '1993-10-14', 'Lorettostraße', '25', 2345, 'Brunn am Gebirge', 'Norwin.Djordjevic@spl.at');
INSERT INTO kunden VALUES (63, 'Burkhardt', 'Wimmer', 'm', '1988-10-10', 'Goetzplatz', '14/4/2', 1170, 'Wien', 'Burkhardt.Wimmer@skymail.at');
INSERT INTO kunden VALUES (64, 'Nuray', 'Wieser', 'w', '1956-01-29', 'Friedrich-List-Platz', '168', 1070, 'Wien', 'Nuray.Wieser@mailjunky.de');
INSERT INTO kunden VALUES (65, 'Ulli', 'Aigner', 'm', '1973-11-22', 'Hans-Otto-Weg', '88', 1060, 'Wien', 'Ulli.Aigner@gmail.com');
INSERT INTO kunden VALUES (66, 'Karin', 'Böhm', 'w', '1971-04-23', 'Dippelsdorfer Straße', '173', 3003, 'Gablitz', 'Karin.Boehm@overmail.de');
INSERT INTO kunden VALUES (67, 'Birke', 'Riedl', 'w', '1971-09-02', 'Runkeler Straße', '189', 1180, 'Wien', 'Birke.Riedl@simbamail.de');
INSERT INTO kunden VALUES (68, 'Hubertina', 'Schindler', 'w', '1959-01-13', 'Ohkamp', '79', 1070, 'Wien', 'Hubertina.Schindler@mailjunky.de');
INSERT INTO kunden VALUES (69, 'Bertl', 'Yilmaz', 'm', '1992-05-06', 'Zur Keppmühle', '92', 2331, 'Vösendorf', 'Bertl.Yilmaz@smart-mail.de');
INSERT INTO kunden VALUES (70, 'Henny', 'Pichler', 'w', '1951-08-03', 'Ellerstraße', '18', 1100, 'Wien', 'Henny.Pichler@24-mail.de');
INSERT INTO kunden VALUES (71, 'Freddy', 'Klein', 'm', '1997-09-13', 'Schlagfeldweg', '117/5', 2384, 'Breitenfurt', 'Freddy.Klein@freenet.de');
INSERT INTO kunden VALUES (72, 'Falkmar', 'Klein', 'm', '1971-12-01', 'Silcherstraße', '128', 1150, 'Wien', 'Falkmar.Klein@rediffmail.com');
INSERT INTO kunden VALUES (73, 'Cornell', 'Hofmann', 'm', '1975-12-22', 'Rohlederstraße', '12', 1230, 'Wien', 'Cornell.Hofmann@5x2.de');
INSERT INTO kunden VALUES (74, 'Dankhard', 'Braun', 'm', '1961-02-11', 'Kreutzerstraße', '189', 1130, 'Wien', 'Dankhard.Braun@emailn.de');
INSERT INTO kunden VALUES (75, 'Claire', 'Frank', 'w', '1984-11-10', 'Steinhausenstraße', '147/8/13', 2381, 'Wolfsgraben', 'Claire.Frank@x-mail.net');
INSERT INTO kunden VALUES (76, 'Sergius', 'Berger', 'm', '1951-10-05', 'Am Kaditzer Tännicht', '70', 2331, 'Vösendorf', 'Sergius.Berger@smart-mail.de');
INSERT INTO kunden VALUES (77, 'Ilona', 'Horvath', 'w', '1982-11-27', 'Bamberger Straße', '94', 3002, 'Purkersdorf', 'Ilona.Horvath@k-bg.de');
INSERT INTO kunden VALUES (78, 'Christhard', 'Gruber', 'm', '1992-02-08', 'Straußstraße', '10', 1190, 'Wien', 'Christhard.Gruber@directbox.com');
INSERT INTO kunden VALUES (79, 'Reinhardt', 'Novak', 'm', '1955-01-07', 'Rauensteinstraße', '79', 1210, 'Wien', 'Reinhardt.Novak@gmx.de');
INSERT INTO kunden VALUES (80, 'Georg', 'Varga', 'm', '1963-04-06', 'Else-Sander-Straße', '80', 1160, 'Wien', 'Georg.Varga@lycos.com');
INSERT INTO kunden VALUES (81, 'Ignatz', 'Ziegler', 'm', '1967-09-20', 'Louis-Pasteur-Straße', '88/2/4', 1230, 'Wien', 'Ignatz.Ziegler@5x2.de');
INSERT INTO kunden VALUES (82, 'Ernestine', 'Richter', 'w', '1963-01-01', 'Meerweinstraße', '145', 1020, 'Wien', 'Ernestine.Richter@one.com');
INSERT INTO kunden VALUES (83, 'Branka', 'Wolf', 'w', '1971-08-17', 'Dehnhardtstraße', '84', 2384, 'Breitenfurt', 'Branka.Wolf@freenet.de');
INSERT INTO kunden VALUES (84, 'Pascale', 'Hofmann', 'w', '1994-01-27', 'Immenhof', '179', 2361, 'Laxenburg', 'Pascale.Hofmann@t-online.de');
INSERT INTO kunden VALUES (85, 'Anne-Katrin', 'Maier', 'w', '1987-01-04', 'Rechte Steinzeile', '159', 1070, 'Wien', 'Anne-Katrin.Maier@mailjunky.de');
INSERT INTO kunden VALUES (86, 'Walda', 'Wimmer', 'w', '1962-02-17', 'Benzstraße', '32', 2345, 'Brunn am Gebirge', 'Walda.Wimmer@spl.at');
INSERT INTO kunden VALUES (87, 'Irlanda', 'Werner', 'w', '1970-05-05', 'Kernausteig', '80', 2381, 'Laab im Walde', 'Irlanda.Werner@mc-free.com');
INSERT INTO kunden VALUES (88, 'Michaela', 'Braun', 'w', '1969-10-19', 'Innere Löwenstr.', '157', 1090, 'Wien', 'Michaela.Braun@eclipso.at');
INSERT INTO kunden VALUES (89, 'Sigmar', 'Novak', 'm', '1968-11-05', 'Vierlinden', '37', 1220, 'Wien', 'Sigmar.Novak@slucia.com');
INSERT INTO kunden VALUES (90, 'Laurenz', 'Reiter', 'm', '1985-04-27', 'Kollwitzring', '90', 2384, 'Breitenfurt', 'Laurenz.Reiter@freenet.de');
INSERT INTO kunden VALUES (91, 'Elfriede', 'Schindler', 'w', '1951-05-03', 'Spitalgasse', '139/4', 1200, 'Wien', 'Elfriede.Schindler@exox.de');
INSERT INTO kunden VALUES (92, 'Selina', 'Wittmann', 'w', '1959-03-29', 'Moritzburger Landstraße', '11', 1110, 'Wien', 'Selina.Wittmann@maili.de');
INSERT INTO kunden VALUES (93, 'Brunhild', 'Strobl', 'w', '1958-01-10', 'Hopfferstr.', '106', 1140, 'Wien', 'Brunhild.Strobl@outlook.com');
INSERT INTO kunden VALUES (94, 'Hannelie', 'Haider', 'w', '1964-10-11', 'Auerspitzstr.', '141', 1150, 'Wien', 'Hannelie.Haider@rediffmail.com');
INSERT INTO kunden VALUES (95, 'Marko', 'Pfeiffer', 'm', '1957-04-24', 'Rodheimer Straße', '103', 1010, 'Wien', 'Marko.Pfeiffer@mail.de');
INSERT INTO kunden VALUES (96, 'Augustin', 'Schmidt', 'm', '1950-10-12', 'Stengeletwiete', '161/2', 1080, 'Wien', 'Augustin.Schmidt@firemail.de');
INSERT INTO kunden VALUES (97, 'Olinde', 'Werner', 'w', '1952-10-23', 'An der Kirschwiese', '175', 2361, 'Laxenburg', 'Olinde.Werner@t-online.de');
INSERT INTO kunden VALUES (98, 'Gottfried', 'Schuster', 'm', '1958-11-02', 'Am Schneckenberg', '48', 1120, 'Wien', 'Gottfried.Schuster@hotmail.de');
INSERT INTO kunden VALUES (99, 'Ernst', 'Lechner', 'm', '1966-12-03', 'Floriastraße', '32', 1020, 'Wien', 'Ernst.Lechner@one.com');
INSERT INTO kunden VALUES (100, 'Effi', 'Djordjevic', 'w', '1959-07-15', 'Meixstraße', '164', 1190, 'Wien', 'Effi.Djordjevic@directbox.com');
INSERT INTO kunden VALUES (101, 'Olli', 'Koch', 'm', '1960-07-12', 'Lattenkampstieg', '122', 2345, 'Brunn am Gebirge', 'Olli.Koch@spl.at');
INSERT INTO kunden VALUES (102, 'Marzel', 'Novak', 'm', '1959-08-21', 'Lindenstraße', '65', 3002, 'Purkersdorf', 'Marzel.Novak@k-bg.de');
INSERT INTO kunden VALUES (103, 'Ringo', 'Zach', 'm', '1973-05-05', 'Gasanstaltstraße', '29', 1090, 'Wien', 'Ringo.Zach@eclipso.at');
INSERT INTO kunden VALUES (104, 'Dorchen', 'Bauer', 'w', '1960-08-27', 'Teichplatz', '17', 1050, 'Wien', 'Dorchen.Bauer@spamfreemail.de');
INSERT INTO kunden VALUES (105, 'Aloisia', 'Kaufmann', 'w', '1953-10-05', 'Winterhuder Brücke', '161', 1120, 'Wien', 'Aloisia.Kaufmann@hotmail.de');
INSERT INTO kunden VALUES (106, 'Meinard', 'Riedl', 'm', '1989-09-15', 'Diakonissenweg', '184', 1130, 'Wien', 'Meinard.Riedl@emailn.de');
INSERT INTO kunden VALUES (107, 'Rainald', 'Klein', 'm', '1962-02-12', 'Roritzerstr.', '110/1', 3002, 'Purkersdorf', 'Rainald.Klein@k-bg.de');
INSERT INTO kunden VALUES (108, 'Edeltrud', 'Walter', 'w', '1991-10-07', 'Oppenheimer Landstraße', '158', 2362, 'Biedermannsdorf', 'Edeltrud.Walter@compu-freemail.de');
INSERT INTO kunden VALUES (109, 'Annik', 'Hofbauer', 'm', '1982-04-17', 'Voßweg', '92', 1160, 'Wien', 'Annik.Hofbauer@lycos.com');
INSERT INTO kunden VALUES (110, 'Brita', 'Müllner', 'w', '1981-01-25', 'Hinter der Linah', '114', 2361, 'Laxenburg', 'Brita.Muellner@t-online.de');
INSERT INTO kunden VALUES (111, 'Sonia', 'Tichy', 'w', '1978-03-16', 'Am Sonnenhang', '141', 1200, 'Wien', 'Sonia.Tichy@exox.de');
INSERT INTO kunden VALUES (112, 'Hubert', 'Langer', 'm', '1979-10-30', 'Jugenheimer Straße', '120/12', 2381, 'Wolfsgraben', 'Hubert.Langer@x-mail.net');
INSERT INTO kunden VALUES (113, 'Franzi', 'Lang', 'w', '1964-10-26', 'Ferdinand-Hofmann-Straße', '7', 1090, 'Wien', 'Franzi.Lang@eclipso.at');
INSERT INTO kunden VALUES (114, 'Burglind', 'Stadler', 'w', '1988-02-06', 'Vierhäusergasse', '26', 1180, 'Wien', 'Burglind.Stadler@simbamail.de');
INSERT INTO kunden VALUES (115, 'Friedl', 'Schneider', 'm', '1960-05-09', 'Eitzensweg', '150', 1210, 'Wien', 'Friedl.Schneider@gmx.de');
INSERT INTO kunden VALUES (116, 'Bianca', 'Weiß', 'w', '1966-05-26', 'Eduard-Stübler-Straße', '41', 2361, 'Laxenburg', 'Bianca.Weiss@t-online.de');
INSERT INTO kunden VALUES (117, 'Heidegunde', 'König', 'w', '1999-08-18', 'Sadisdorfer Weg', '138', 1020, 'Wien', 'Heidegunde.Koenig@one.com');
INSERT INTO kunden VALUES (118, 'Erk', 'Leitner', 'm', '1991-09-01', 'Urseler Weg', '178/2/11', 2331, 'Vösendorf', 'Erk.Leitner@smart-mail.de');
INSERT INTO kunden VALUES (119, 'Maximiliane', 'Traxler', 'w', '1987-05-03', 'Am Mittelwald', '136', 1100, 'Wien', 'Maximiliane.Traxler@24-mail.de');
INSERT INTO kunden VALUES (120, 'Siegfrieda', 'Holzer', 'w', '1954-04-07', 'Riegelhofgasse', '60', 3002, 'Purkersdorf', 'Siegfrieda.Holzer@k-bg.de');
INSERT INTO kunden VALUES (121, 'Juliana', 'Zach', 'w', '1997-06-03', 'Hirschleite', '123', 1150, 'Wien', 'Juliana.Zach@rediffmail.com');
INSERT INTO kunden VALUES (122, 'Swanhild', 'Wimmer', 'w', '1952-11-28', 'Fährmannweg', '162/4', 1190, 'Wien', 'Swanhild.Wimmer@directbox.com');
INSERT INTO kunden VALUES (123, 'Sidonius', 'Traxler', 'm', '1984-10-10', 'Rosenthaler Straße', '130', 1030, 'Wien', 'Sidonius.Traxler@yahoo.de');
INSERT INTO kunden VALUES (124, 'Bozena', 'Koller', 'w', '1976-03-01', 'Robert-Bunsen-Straße', '103/10', 1110, 'Wien', 'Bozena.Koller@maili.de');
INSERT INTO kunden VALUES (125, 'Annerike', 'Müllner', 'w', '1962-02-05', 'Rebstöcker Straße', '20', 1130, 'Wien', 'Annerike.Muellner@emailn.de');


--
-- Name: kunden_kundid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kunden_kundid_seq', 126, false);


--
-- Data for Name: lieferant; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO lieferant VALUES (1, 'Del Fabro GmbH', 'A-1200 Wien; Nordwestbahnstraße 10');
INSERT INTO lieferant VALUES (2, 'Metropol Getränkegroßhandel', 'A-1050 Wien; Arbeitergasse 43');
INSERT INTO lieferant VALUES (3, 'Ammersin GmbH', 'A-2345 Brunn am Gebirge; Wiener Straße 131-133');
INSERT INTO lieferant VALUES (4, 'GEKO Großhandels GmbH', 'A-1230 Wien; Laxenburgerstraße 365 / Halle A4');
INSERT INTO lieferant VALUES (5, 'Getränkehaus Krause GmbH', 'A-2201 Gerasdorf/Wien; Wagramer Straße 259');
INSERT INTO lieferant VALUES (6, 'Killy''s Getränkehandel GmbH', 'A-1150 Wien; Fenzlgasse 9');
INSERT INTO lieferant VALUES (7, 'METRO Cash & Carry Österreich GmbH', 'A-2331 Wien/Vösendorf; Metro-Platz 1');
INSERT INTO lieferant VALUES (8, 'Frisch + Rasch Obst und Gemüse GmbH', 'A-1230 Wien; Laxenburger Straße 365/Stand C5/55-56 ');
INSERT INTO lieferant VALUES (9, 'Wiegert Obst und Gemüsegroßhandel GmbH', 'A-1220 Wien; Plattensteinergasse 29');


--
-- Name: lieferant_lid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('lieferant_lid_seq', 10, false);


--
-- Data for Name: liefert; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO liefert VALUES (1, 4, 50, 'cl', 1.98);
INSERT INTO liefert VALUES (1, 7, 75, 'cl', 3.05);
INSERT INTO liefert VALUES (2, 1, 75, 'cl', 6.01);
INSERT INTO liefert VALUES (2, 2, 70, 'cl', 5.49);
INSERT INTO liefert VALUES (2, 5, 75, 'cl', 5.50);
INSERT INTO liefert VALUES (2, 7, 70, 'cl', 5.39);
INSERT INTO liefert VALUES (3, 1, 200, 'cl', 2.59);
INSERT INTO liefert VALUES (3, 2, 600, 'cl', 9.13);
INSERT INTO liefert VALUES (3, 3, 100, 'cl', 2.99);
INSERT INTO liefert VALUES (3, 6, 100, 'cl', 0.95);
INSERT INTO liefert VALUES (3, 7, 1200, 'cl', 17.88);
INSERT INTO liefert VALUES (4, 2, 100, 'cl', 1.39);
INSERT INTO liefert VALUES (4, 3, 100, 'cl', 1.99);
INSERT INTO liefert VALUES (4, 4, 100, 'cl', 1.79);
INSERT INTO liefert VALUES (4, 5, 150, 'cl', 2.19);
INSERT INTO liefert VALUES (4, 6, 200, 'cl', 2.98);
INSERT INTO liefert VALUES (5, 1, 33, 'cl', 4.15);
INSERT INTO liefert VALUES (5, 3, 330, 'cl', 24.90);
INSERT INTO liefert VALUES (5, 5, 75, 'cl', 7.65);
INSERT INTO liefert VALUES (5, 7, 33, 'cl', 3.63);
INSERT INTO liefert VALUES (6, 1, 100, 'cl', 1.69);
INSERT INTO liefert VALUES (6, 2, 600, 'cl', 16.24);
INSERT INTO liefert VALUES (6, 4, 600, 'cl', 10.74);
INSERT INTO liefert VALUES (6, 6, 600, 'cl', 11.34);
INSERT INTO liefert VALUES (6, 7, 600, 'cl', 13.99);
INSERT INTO liefert VALUES (7, 1, 100, 'cl', 0.43);
INSERT INTO liefert VALUES (7, 2, 200, 'cl', 0.99);
INSERT INTO liefert VALUES (7, 3, 75, 'cl', 1.39);
INSERT INTO liefert VALUES (7, 4, 100, 'cl', 1.72);
INSERT INTO liefert VALUES (7, 5, 20, 'cl', 1.25);
INSERT INTO liefert VALUES (7, 6, 75, 'cl', 1.49);
INSERT INTO liefert VALUES (7, 7, 200, 'cl', 1.79);
INSERT INTO liefert VALUES (8, 1, 200, 'cl', 0.49);
INSERT INTO liefert VALUES (8, 2, 400, 'cl', 0.99);
INSERT INTO liefert VALUES (8, 3, 1200, 'cl', 7.32);
INSERT INTO liefert VALUES (8, 4, 200, 'cl', 0.52);
INSERT INTO liefert VALUES (8, 5, 150, 'cl', 0.33);
INSERT INTO liefert VALUES (8, 6, 1890, 'cl', 13.90);
INSERT INTO liefert VALUES (8, 7, 2000, 'cl', 14.60);
INSERT INTO liefert VALUES (9, 8, 4, 'piece', 1.99);
INSERT INTO liefert VALUES (9, 9, 6, 'piece', 2.22);
INSERT INTO liefert VALUES (10, 2, 150, 'cl', 30.79);
INSERT INTO liefert VALUES (10, 4, 70, 'cl', 5.59);
INSERT INTO liefert VALUES (10, 5, 50, 'cl', 4.99);
INSERT INTO liefert VALUES (10, 6, 70, 'cl', 5.49);
INSERT INTO liefert VALUES (10, 7, 300, 'cl', 27.60);
INSERT INTO liefert VALUES (11, 8, 1, 'piece', 1.23);
INSERT INTO liefert VALUES (11, 9, 1, 'piece', 0.99);
INSERT INTO liefert VALUES (12, 1, 125, 'cl', 1.89);
INSERT INTO liefert VALUES (12, 3, 100, 'cl', 1.29);
INSERT INTO liefert VALUES (12, 4, 125, 'cl', 1.79);
INSERT INTO liefert VALUES (12, 6, 600, 'cl', 6.89);
INSERT INTO liefert VALUES (12, 7, 600, 'cl', 8.49);
INSERT INTO liefert VALUES (13, 1, 792, 'cl', 16.97);
INSERT INTO liefert VALUES (13, 2, 150, 'cl', 1.19);
INSERT INTO liefert VALUES (13, 3, 200, 'cl', 1.29);
INSERT INTO liefert VALUES (13, 5, 150, 'cl', 1.29);
INSERT INTO liefert VALUES (13, 6, 200, 'cl', 1.31);
INSERT INTO liefert VALUES (14, 2, 20, 'cl', 10.98);
INSERT INTO liefert VALUES (14, 3, 10, 'cl', 8.00);
INSERT INTO liefert VALUES (14, 6, 20, 'cl', 15.80);
INSERT INTO liefert VALUES (15, 1, 75, 'cl', 11.26);
INSERT INTO liefert VALUES (15, 2, 75, 'cl', 11.18);
INSERT INTO liefert VALUES (15, 4, 75, 'cl', 9.95);
INSERT INTO liefert VALUES (15, 5, 75, 'cl', 14.60);
INSERT INTO liefert VALUES (15, 7, 75, 'cl', 9.32);
INSERT INTO liefert VALUES (16, 1, 100, 'cl', 1.99);
INSERT INTO liefert VALUES (16, 2, 75, 'cl', 5.49);
INSERT INTO liefert VALUES (16, 3, 75, 'cl', 4.98);
INSERT INTO liefert VALUES (16, 4, 75, 'cl', 8.99);
INSERT INTO liefert VALUES (16, 5, 100, 'cl', 6.99);
INSERT INTO liefert VALUES (16, 6, 100, 'cl', 6.49);
INSERT INTO liefert VALUES (16, 7, 100, 'cl', 7.69);
INSERT INTO liefert VALUES (17, 2, 75, 'cl', 4.95);
INSERT INTO liefert VALUES (17, 3, 75, 'cl', 5.49);
INSERT INTO liefert VALUES (17, 4, 75, 'cl', 4.99);
INSERT INTO liefert VALUES (17, 5, 75, 'cl', 5.99);
INSERT INTO liefert VALUES (17, 7, 100, 'cl', 5.99);
INSERT INTO liefert VALUES (18, 1, 100, 'cl', 14.39);
INSERT INTO liefert VALUES (18, 3, 70, 'cl', 11.99);
INSERT INTO liefert VALUES (18, 4, 100, 'cl', 11.99);
INSERT INTO liefert VALUES (18, 5, 100, 'cl', 10.49);
INSERT INTO liefert VALUES (18, 6, 300, 'cl', 59.42);
INSERT INTO liefert VALUES (18, 7, 100, 'cl', 8.99);
INSERT INTO liefert VALUES (19, 2, 25, 'cl', 3.49);
INSERT INTO liefert VALUES (19, 3, 70, 'cl', 7.06);
INSERT INTO liefert VALUES (19, 5, 70, 'cl', 8.96);
INSERT INTO liefert VALUES (19, 6, 70, 'cl', 5.50);
INSERT INTO liefert VALUES (19, 7, 50, 'cl', 2.19);
INSERT INTO liefert VALUES (20, 1, 70, 'cl', 15.86);
INSERT INTO liefert VALUES (20, 2, 70, 'cl', 11.99);
INSERT INTO liefert VALUES (20, 4, 70, 'cl', 10.21);
INSERT INTO liefert VALUES (20, 6, 70, 'cl', 9.72);
INSERT INTO liefert VALUES (21, 2, 100, 'cl', 16.90);
INSERT INTO liefert VALUES (21, 3, 70, 'cl', 9.82);
INSERT INTO liefert VALUES (21, 4, 100, 'cl', 17.90);
INSERT INTO liefert VALUES (21, 5, 70, 'cl', 12.59);
INSERT INTO liefert VALUES (21, 7, 100, 'cl', 12.90);
INSERT INTO liefert VALUES (22, 1, 100, 'cl', 12.32);
INSERT INTO liefert VALUES (22, 5, 75, 'cl', 6.99);
INSERT INTO liefert VALUES (22, 6, 100, 'cl', 5.99);
INSERT INTO liefert VALUES (23, 1, 70, 'cl', 11.99);
INSERT INTO liefert VALUES (23, 3, 70, 'cl', 29.90);
INSERT INTO liefert VALUES (23, 5, 70, 'cl', 5.99);
INSERT INTO liefert VALUES (23, 7, 100, 'cl', 12.58);
INSERT INTO liefert VALUES (24, 4, 70, 'cl', 20.90);
INSERT INTO liefert VALUES (25, 1, 70, 'cl', 12.90);
INSERT INTO liefert VALUES (25, 2, 70, 'cl', 11.90);
INSERT INTO liefert VALUES (25, 3, 100, 'cl', 17.90);
INSERT INTO liefert VALUES (25, 4, 70, 'cl', 13.90);
INSERT INTO liefert VALUES (25, 5, 70, 'cl', 11.99);
INSERT INTO liefert VALUES (25, 6, 100, 'cl', 18.90);
INSERT INTO liefert VALUES (25, 7, 100, 'cl', 17.90);
INSERT INTO liefert VALUES (26, 3, 70, 'cl', 8.80);
INSERT INTO liefert VALUES (26, 4, 70, 'cl', 16.90);
INSERT INTO liefert VALUES (27, 1, 70, 'cl', 15.99);
INSERT INTO liefert VALUES (27, 2, 70, 'cl', 16.49);
INSERT INTO liefert VALUES (27, 3, 70, 'cl', 15.99);
INSERT INTO liefert VALUES (27, 4, 100, 'cl', 16.00);
INSERT INTO liefert VALUES (27, 5, 100, 'cl', 17.15);
INSERT INTO liefert VALUES (27, 7, 100, 'cl', 14.38);
INSERT INTO liefert VALUES (28, 2, 70, 'cl', 11.49);
INSERT INTO liefert VALUES (28, 4, 100, 'cl', 16.47);
INSERT INTO liefert VALUES (28, 6, 70, 'cl', 16.86);
INSERT INTO liefert VALUES (28, 7, 100, 'cl', 12.99);
INSERT INTO liefert VALUES (29, 1, 70, 'cl', 16.49);
INSERT INTO liefert VALUES (29, 5, 70, 'cl', 12.90);
INSERT INTO liefert VALUES (29, 6, 70, 'cl', 13.01);
INSERT INTO liefert VALUES (30, 1, 70, 'cl', 12.96);
INSERT INTO liefert VALUES (30, 2, 20, 'cl', 12.89);
INSERT INTO liefert VALUES (30, 3, 70, 'cl', 12.99);
INSERT INTO liefert VALUES (30, 4, 70, 'cl', 11.99);
INSERT INTO liefert VALUES (30, 5, 100, 'cl', 14.90);
INSERT INTO liefert VALUES (30, 6, 600, 'cl', 298.90);
INSERT INTO liefert VALUES (30, 7, 150, 'cl', 64.91);
INSERT INTO liefert VALUES (31, 4, 100, 'cl', 14.90);
INSERT INTO liefert VALUES (31, 6, 70, 'cl', 14.99);
INSERT INTO liefert VALUES (32, 7, 1000, 'g', 1.89);
INSERT INTO liefert VALUES (33, 1, 70, 'cl', 17.99);
INSERT INTO liefert VALUES (33, 2, 70, 'cl', 19.99);
INSERT INTO liefert VALUES (33, 4, 70, 'cl', 18.80);
INSERT INTO liefert VALUES (33, 7, 70, 'cl', 15.40);
INSERT INTO liefert VALUES (34, 7, 500, 'g', 0.79);
INSERT INTO liefert VALUES (35, 4, 40, 'piece', 0.75);
INSERT INTO liefert VALUES (35, 7, 60, 'piece', 0.99);
INSERT INTO liefert VALUES (36, 1, 25, 'cl', 3.49);
INSERT INTO liefert VALUES (36, 3, 100, 'cl', 12.96);
INSERT INTO liefert VALUES (36, 4, 70, 'cl', 8.90);
INSERT INTO liefert VALUES (36, 5, 70, 'cl', 10.49);
INSERT INTO liefert VALUES (36, 6, 70, 'cl', 8.90);
INSERT INTO liefert VALUES (36, 7, 70, 'cl', 8.80);
INSERT INTO liefert VALUES (37, 2, 100, 'cl', 18.99);
INSERT INTO liefert VALUES (37, 3, 70, 'cl', 14.99);
INSERT INTO liefert VALUES (37, 4, 100, 'cl', 15.69);
INSERT INTO liefert VALUES (37, 5, 100, 'cl', 19.80);
INSERT INTO liefert VALUES (37, 7, 500, 'cl', 94.80);
INSERT INTO liefert VALUES (38, 1, 100, 'cl', 24.50);
INSERT INTO liefert VALUES (38, 2, 50, 'cl', 19.79);
INSERT INTO liefert VALUES (38, 3, 100, 'cl', 31.90);
INSERT INTO liefert VALUES (38, 4, 50, 'cl', 14.90);
INSERT INTO liefert VALUES (38, 5, 50, 'cl', 13.99);
INSERT INTO liefert VALUES (38, 6, 50, 'cl', 15.99);
INSERT INTO liefert VALUES (38, 7, 100, 'cl', 23.95);
INSERT INTO liefert VALUES (39, 2, 70, 'cl', 17.62);
INSERT INTO liefert VALUES (39, 4, 100, 'cl', 21.99);
INSERT INTO liefert VALUES (39, 6, 70, 'cl', 19.99);
INSERT INTO liefert VALUES (40, 2, 70, 'cl', 17.85);
INSERT INTO liefert VALUES (40, 3, 70, 'cl', 10.20);
INSERT INTO liefert VALUES (40, 5, 50, 'cl', 5.99);
INSERT INTO liefert VALUES (40, 7, 100, 'cl', 15.99);
INSERT INTO liefert VALUES (41, 1, 100, 'cl', 2.99);
INSERT INTO liefert VALUES (41, 3, 600, 'cl', 57.00);
INSERT INTO liefert VALUES (41, 4, 100, 'cl', 11.64);
INSERT INTO liefert VALUES (41, 5, 75, 'cl', 11.45);
INSERT INTO liefert VALUES (41, 6, 600, 'cl', 14.99);
INSERT INTO liefert VALUES (41, 7, 600, 'cl', 18.30);
INSERT INTO liefert VALUES (42, 1, 100, 'cl', 15.75);
INSERT INTO liefert VALUES (42, 2, 70, 'cl', 15.99);
INSERT INTO liefert VALUES (42, 3, 70, 'cl', 14.32);
INSERT INTO liefert VALUES (42, 4, 70, 'cl', 14.99);
INSERT INTO liefert VALUES (42, 5, 70, 'cl', 12.90);
INSERT INTO liefert VALUES (42, 6, 100, 'cl', 22.26);
INSERT INTO liefert VALUES (42, 7, 70, 'cl', 10.99);
INSERT INTO liefert VALUES (43, 2, 70, 'cl', 14.39);
INSERT INTO liefert VALUES (43, 4, 70, 'cl', 14.90);
INSERT INTO liefert VALUES (43, 5, 70, 'cl', 15.65);
INSERT INTO liefert VALUES (44, 2, 70, 'cl', 16.99);
INSERT INTO liefert VALUES (44, 6, 100, 'cl', 25.27);
INSERT INTO liefert VALUES (45, 1, 70, 'cl', 13.49);
INSERT INTO liefert VALUES (45, 2, 100, 'cl', 6.13);
INSERT INTO liefert VALUES (45, 3, 70, 'cl', 8.90);
INSERT INTO liefert VALUES (45, 4, 70, 'cl', 15.90);
INSERT INTO liefert VALUES (45, 5, 100, 'cl', 7.13);
INSERT INTO liefert VALUES (45, 6, 100, 'cl', 6.34);
INSERT INTO liefert VALUES (45, 7, 100, 'cl', 8.56);


--
-- Data for Name: lokal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO lokal VALUES (1, '2010-03-15', 'Wiedner Hauptstraße', '112', 1040, 'Wien');
INSERT INTO lokal VALUES (2, '2014-09-01', 'Mariahilfer Straße', '147', 1150, 'Wien');


--
-- Name: lokal_lokalid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('lokal_lokalid_seq', 3, false);


--
-- Data for Name: zutat; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO zutat VALUES (1, 'Obers');
INSERT INTO zutat VALUES (2, 'Grenadine');
INSERT INTO zutat VALUES (3, 'Orangensaft');
INSERT INTO zutat VALUES (4, 'Ananassaft');
INSERT INTO zutat VALUES (5, 'Cream of Coconut (Kokossirup)');
INSERT INTO zutat VALUES (6, 'Kirschsaft');
INSERT INTO zutat VALUES (7, 'Zitronensaft');
INSERT INTO zutat VALUES (8, 'Soda');
INSERT INTO zutat VALUES (9, 'Limette');
INSERT INTO zutat VALUES (10, 'Maracujasirup');
INSERT INTO zutat VALUES (11, 'Ananas');
INSERT INTO zutat VALUES (12, 'Ginger Ale');
INSERT INTO zutat VALUES (13, '7-Up');
INSERT INTO zutat VALUES (14, 'Orange-Bitter');
INSERT INTO zutat VALUES (15, 'Sherry dry');
INSERT INTO zutat VALUES (16, 'Vermouth bianco');
INSERT INTO zutat VALUES (17, 'Vermouth rosso');
INSERT INTO zutat VALUES (18, 'Aperol');
INSERT INTO zutat VALUES (19, 'Zuckersirup');
INSERT INTO zutat VALUES (20, 'Curacao triple sec');
INSERT INTO zutat VALUES (21, 'Rum');
INSERT INTO zutat VALUES (22, 'Vermouth dry');
INSERT INTO zutat VALUES (23, 'Gin');
INSERT INTO zutat VALUES (24, 'Angostura');
INSERT INTO zutat VALUES (25, 'Whiskey');
INSERT INTO zutat VALUES (26, 'Creme de Cassis');
INSERT INTO zutat VALUES (27, 'Tequila');
INSERT INTO zutat VALUES (28, 'Campari');
INSERT INTO zutat VALUES (29, 'Kahlua');
INSERT INTO zutat VALUES (30, 'Wodka');
INSERT INTO zutat VALUES (31, 'Cachaca');
INSERT INTO zutat VALUES (32, 'Zucker (braun)');
INSERT INTO zutat VALUES (33, 'Cointreau');
INSERT INTO zutat VALUES (34, 'Zucker (Staubzucker)');
INSERT INTO zutat VALUES (35, 'Minzblatt');
INSERT INTO zutat VALUES (36, 'Curacao blue');
INSERT INTO zutat VALUES (37, 'Kirschschnaps');
INSERT INTO zutat VALUES (38, 'Rum (>70%)');
INSERT INTO zutat VALUES (39, 'Rum (dunkel)');
INSERT INTO zutat VALUES (40, 'Pfirsichlikör');
INSERT INTO zutat VALUES (41, 'Cranberrysaft');
INSERT INTO zutat VALUES (42, 'Baileys');
INSERT INTO zutat VALUES (43, 'Tia Maria');
INSERT INTO zutat VALUES (44, 'Galliano');
INSERT INTO zutat VALUES (45, 'Amaretto');
INSERT INTO zutat VALUES (46, 'Pernod');
INSERT INTO zutat VALUES (47, 'Tomatensaft');
INSERT INTO zutat VALUES (48, 'Maraschino');
INSERT INTO zutat VALUES (49, 'Grapefruitsaft');


--
-- Name: zutat_zid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('zutat_zid_seq', 50, false);


--
-- Name: angestellte_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY angestellte
    ADD CONSTRAINT angestellte_pkey PRIMARY KEY (aid);


--
-- Name: besteht_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY besteht
    ADD CONSTRAINT besteht_pkey PRIMARY KEY (cid, zid);


--
-- Name: bestellt_kundid_cid_datum_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bestellt
    ADD CONSTRAINT bestellt_kundid_cid_datum_pk PRIMARY KEY (kundid, cid, datum);


--
-- Name: cocktail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cocktail
    ADD CONSTRAINT cocktail_pkey PRIMARY KEY (cid);


--
-- Name: gefaess_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gefaess
    ADD CONSTRAINT gefaess_pkey PRIMARY KEY (gid);


--
-- Name: gehalt_aid_von_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gehalt
    ADD CONSTRAINT gehalt_aid_von_pk PRIMARY KEY (aid, von);


--
-- Name: kategorie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kategorie
    ADD CONSTRAINT kategorie_pkey PRIMARY KEY (kid);


--
-- Name: kunden_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kunden
    ADD CONSTRAINT kunden_pkey PRIMARY KEY (kundid);


--
-- Name: lieferant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lieferant
    ADD CONSTRAINT lieferant_pkey PRIMARY KEY (lid);


--
-- Name: liefert_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY liefert
    ADD CONSTRAINT liefert_pkey PRIMARY KEY (zid, lid);


--
-- Name: lokal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lokal
    ADD CONSTRAINT lokal_pkey PRIMARY KEY (lokalid);


--
-- Name: zutat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY zutat
    ADD CONSTRAINT zutat_pkey PRIMARY KEY (zid);


--
-- Name: angestellte_account_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX angestellte_account_uindex ON angestellte USING btree (account);


--
-- Name: angestellte_svnr_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX angestellte_svnr_uindex ON angestellte USING btree (svnr);


--
-- Name: angestellte_angestellte_aid_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY angestellte
    ADD CONSTRAINT angestellte_angestellte_aid_fk FOREIGN KEY (vorgesetzt) REFERENCES angestellte(aid);


--
-- Name: angestellte_lokal_lokalid_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY angestellte
    ADD CONSTRAINT angestellte_lokal_lokalid_fk FOREIGN KEY (lokalid) REFERENCES lokal(lokalid) ON UPDATE CASCADE;


--
-- Name: besteht_cocktail_cid_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY besteht
    ADD CONSTRAINT besteht_cocktail_cid_fk FOREIGN KEY (cid) REFERENCES cocktail(cid) ON UPDATE CASCADE;


--
-- Name: besteht_zutat_zid_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY besteht
    ADD CONSTRAINT besteht_zutat_zid_fk FOREIGN KEY (zid) REFERENCES zutat(zid) ON UPDATE CASCADE;


--
-- Name: bestellt_cocktail_cid_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bestellt
    ADD CONSTRAINT bestellt_cocktail_cid_fk FOREIGN KEY (cid) REFERENCES cocktail(cid) ON UPDATE CASCADE;


--
-- Name: bestellt_kunden_kundid_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bestellt
    ADD CONSTRAINT bestellt_kunden_kundid_fk FOREIGN KEY (kundid) REFERENCES kunden(kundid) ON UPDATE CASCADE;


--
-- Name: bestellt_lokal_lokalid_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bestellt
    ADD CONSTRAINT bestellt_lokal_lokalid_fk FOREIGN KEY (lokalid) REFERENCES lokal(lokalid) ON UPDATE CASCADE;


--
-- Name: cocktail_gefaess_sgid_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cocktail
    ADD CONSTRAINT cocktail_gefaess_sgid_fk FOREIGN KEY (sgid) REFERENCES gefaess(gid) ON UPDATE CASCADE;


--
-- Name: cocktail_gefaess_zgid_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cocktail
    ADD CONSTRAINT cocktail_gefaess_zgid_fk FOREIGN KEY (zgid) REFERENCES gefaess(gid) ON UPDATE CASCADE;


--
-- Name: cocktail_kategorie_kid_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cocktail
    ADD CONSTRAINT cocktail_kategorie_kid_fk FOREIGN KEY (kid) REFERENCES kategorie(kid) ON UPDATE CASCADE;


--
-- Name: gehalt_angestellte_aid_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gehalt
    ADD CONSTRAINT gehalt_angestellte_aid_fk FOREIGN KEY (aid) REFERENCES angestellte(aid) ON UPDATE CASCADE;


--
-- Name: liefert_lieferant_lid_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY liefert
    ADD CONSTRAINT liefert_lieferant_lid_fk FOREIGN KEY (lid) REFERENCES lieferant(lid) ON UPDATE CASCADE;


--
-- Name: liefert_zutat_zid_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY liefert
    ADD CONSTRAINT liefert_zutat_zid_fk FOREIGN KEY (zid) REFERENCES zutat(zid) ON UPDATE CASCADE;


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

