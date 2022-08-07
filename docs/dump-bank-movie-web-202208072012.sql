--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2022-08-07 20:12:21 +07

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

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: phamthainb
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO phamthainb;

--
-- TOC entry 3712 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: phamthainb
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 841 (class 1247 OID 33642)
-- Name: account_role_enum; Type: TYPE; Schema: public; Owner: phamthainb
--

CREATE TYPE public.account_role_enum AS ENUM (
    'ADMIN',
    'USER'
);


ALTER TYPE public.account_role_enum OWNER TO phamthainb;

--
-- TOC entry 844 (class 1247 OID 33648)
-- Name: account_type_enum; Type: TYPE; Schema: public; Owner: phamthainb
--

CREATE TYPE public.account_type_enum AS ENUM (
    'gg',
    'normal'
);


ALTER TYPE public.account_type_enum OWNER TO phamthainb;

--
-- TOC entry 862 (class 1247 OID 33712)
-- Name: collection_type_enum; Type: TYPE; Schema: public; Owner: phamthainb
--

CREATE TYPE public.collection_type_enum AS ENUM (
    'slide'
);


ALTER TYPE public.collection_type_enum OWNER TO phamthainb;

--
-- TOC entry 871 (class 1247 OID 33737)
-- Name: history_type_enum; Type: TYPE; Schema: public; Owner: phamthainb
--

CREATE TYPE public.history_type_enum AS ENUM (
    'search',
    'view'
);


ALTER TYPE public.history_type_enum OWNER TO phamthainb;

--
-- TOC entry 856 (class 1247 OID 33691)
-- Name: movie_status_enum; Type: TYPE; Schema: public; Owner: phamthainb
--

CREATE TYPE public.movie_status_enum AS ENUM (
    'new',
    'uploading',
    'done'
);


ALTER TYPE public.movie_status_enum OWNER TO phamthainb;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 211 (class 1259 OID 33654)
-- Name: account; Type: TABLE; Schema: public; Owner: phamthainb
--

CREATE TABLE public.account (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone,
    username character varying NOT NULL,
    password character varying,
    role public.account_role_enum DEFAULT 'USER'::public.account_role_enum NOT NULL,
    type public.account_type_enum DEFAULT 'normal'::public.account_type_enum NOT NULL,
    "ggAccessToken" character varying
);


ALTER TABLE public.account OWNER TO phamthainb;

--
-- TOC entry 210 (class 1259 OID 33653)
-- Name: account_id_seq; Type: SEQUENCE; Schema: public; Owner: phamthainb
--

CREATE SEQUENCE public.account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_id_seq OWNER TO phamthainb;

--
-- TOC entry 3713 (class 0 OID 0)
-- Dependencies: 210
-- Name: account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phamthainb
--

ALTER SEQUENCE public.account_id_seq OWNED BY public.account.id;


--
-- TOC entry 213 (class 1259 OID 33669)
-- Name: actor; Type: TABLE; Schema: public; Owner: phamthainb
--

CREATE TABLE public.actor (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone,
    name character varying NOT NULL
);


ALTER TABLE public.actor OWNER TO phamthainb;

--
-- TOC entry 212 (class 1259 OID 33668)
-- Name: actor_id_seq; Type: SEQUENCE; Schema: public; Owner: phamthainb
--

CREATE SEQUENCE public.actor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actor_id_seq OWNER TO phamthainb;

--
-- TOC entry 3714 (class 0 OID 0)
-- Dependencies: 212
-- Name: actor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phamthainb
--

ALTER SEQUENCE public.actor_id_seq OWNED BY public.actor.id;


--
-- TOC entry 219 (class 1259 OID 33716)
-- Name: collection; Type: TABLE; Schema: public; Owner: phamthainb
--

CREATE TABLE public.collection (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone,
    type public.collection_type_enum NOT NULL,
    "movieId" integer
);


ALTER TABLE public.collection OWNER TO phamthainb;

--
-- TOC entry 218 (class 1259 OID 33715)
-- Name: collection_id_seq; Type: SEQUENCE; Schema: public; Owner: phamthainb
--

CREATE SEQUENCE public.collection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collection_id_seq OWNER TO phamthainb;

--
-- TOC entry 3715 (class 0 OID 0)
-- Dependencies: 218
-- Name: collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phamthainb
--

ALTER SEQUENCE public.collection_id_seq OWNED BY public.collection.id;


--
-- TOC entry 221 (class 1259 OID 33725)
-- Name: comment; Type: TABLE; Schema: public; Owner: phamthainb
--

CREATE TABLE public.comment (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone,
    status boolean DEFAULT true NOT NULL,
    content character varying,
    "accountId" integer,
    "movieId" integer
);


ALTER TABLE public.comment OWNER TO phamthainb;

--
-- TOC entry 220 (class 1259 OID 33724)
-- Name: comment_id_seq; Type: SEQUENCE; Schema: public; Owner: phamthainb
--

CREATE SEQUENCE public.comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_id_seq OWNER TO phamthainb;

--
-- TOC entry 3716 (class 0 OID 0)
-- Dependencies: 220
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phamthainb
--

ALTER SEQUENCE public.comment_id_seq OWNED BY public.comment.id;


--
-- TOC entry 223 (class 1259 OID 33742)
-- Name: history; Type: TABLE; Schema: public; Owner: phamthainb
--

CREATE TABLE public.history (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone,
    type public.history_type_enum DEFAULT 'view'::public.history_type_enum NOT NULL,
    "accountId" integer,
    "movieId" integer
);


ALTER TABLE public.history OWNER TO phamthainb;

--
-- TOC entry 222 (class 1259 OID 33741)
-- Name: history_id_seq; Type: SEQUENCE; Schema: public; Owner: phamthainb
--

CREATE SEQUENCE public.history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_id_seq OWNER TO phamthainb;

--
-- TOC entry 3717 (class 0 OID 0)
-- Dependencies: 222
-- Name: history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phamthainb
--

ALTER SEQUENCE public.history_id_seq OWNED BY public.history.id;


--
-- TOC entry 217 (class 1259 OID 33698)
-- Name: movie; Type: TABLE; Schema: public; Owner: phamthainb
--

CREATE TABLE public.movie (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone,
    imdb character varying NOT NULL,
    "originalTitle" character varying NOT NULL,
    year integer NOT NULL,
    duration integer NOT NULL,
    director character varying NOT NULL,
    writer character varying NOT NULL,
    "productionCompany" character varying NOT NULL,
    description character varying NOT NULL,
    "avgVote" double precision DEFAULT '0'::double precision NOT NULL,
    votes double precision DEFAULT '0'::double precision NOT NULL,
    url character varying,
    image character varying,
    status public.movie_status_enum DEFAULT 'new'::public.movie_status_enum NOT NULL
);


ALTER TABLE public.movie OWNER TO phamthainb;

--
-- TOC entry 225 (class 1259 OID 33758)
-- Name: movie_actor; Type: TABLE; Schema: public; Owner: phamthainb
--

CREATE TABLE public.movie_actor (
    "movieId" integer NOT NULL,
    "actorId" integer NOT NULL
);


ALTER TABLE public.movie_actor OWNER TO phamthainb;

--
-- TOC entry 216 (class 1259 OID 33697)
-- Name: movie_id_seq; Type: SEQUENCE; Schema: public; Owner: phamthainb
--

CREATE SEQUENCE public.movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movie_id_seq OWNER TO phamthainb;

--
-- TOC entry 3718 (class 0 OID 0)
-- Dependencies: 216
-- Name: movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phamthainb
--

ALTER SEQUENCE public.movie_id_seq OWNED BY public.movie.id;


--
-- TOC entry 224 (class 1259 OID 33751)
-- Name: movie_tag; Type: TABLE; Schema: public; Owner: phamthainb
--

CREATE TABLE public.movie_tag (
    "movieId" integer NOT NULL,
    "tagId" integer NOT NULL
);


ALTER TABLE public.movie_tag OWNER TO phamthainb;

--
-- TOC entry 215 (class 1259 OID 33680)
-- Name: tag; Type: TABLE; Schema: public; Owner: phamthainb
--

CREATE TABLE public.tag (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone,
    name character varying NOT NULL
);


ALTER TABLE public.tag OWNER TO phamthainb;

--
-- TOC entry 214 (class 1259 OID 33679)
-- Name: tag_id_seq; Type: SEQUENCE; Schema: public; Owner: phamthainb
--

CREATE SEQUENCE public.tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_id_seq OWNER TO phamthainb;

--
-- TOC entry 3719 (class 0 OID 0)
-- Dependencies: 214
-- Name: tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phamthainb
--

ALTER SEQUENCE public.tag_id_seq OWNED BY public.tag.id;


--
-- TOC entry 209 (class 1259 OID 33636)
-- Name: typeorm_metadata; Type: TABLE; Schema: public; Owner: phamthainb
--

CREATE TABLE public.typeorm_metadata (
    type character varying NOT NULL,
    database character varying,
    schema character varying,
    "table" character varying,
    name character varying,
    value text
);


ALTER TABLE public.typeorm_metadata OWNER TO phamthainb;

--
-- TOC entry 3490 (class 2604 OID 33657)
-- Name: account id; Type: DEFAULT; Schema: public; Owner: phamthainb
--

ALTER TABLE ONLY public.account ALTER COLUMN id SET DEFAULT nextval('public.account_id_seq'::regclass);


--
-- TOC entry 3495 (class 2604 OID 33672)
-- Name: actor id; Type: DEFAULT; Schema: public; Owner: phamthainb
--

ALTER TABLE ONLY public.actor ALTER COLUMN id SET DEFAULT nextval('public.actor_id_seq'::regclass);


--
-- TOC entry 3507 (class 2604 OID 33719)
-- Name: collection id; Type: DEFAULT; Schema: public; Owner: phamthainb
--

ALTER TABLE ONLY public.collection ALTER COLUMN id SET DEFAULT nextval('public.collection_id_seq'::regclass);


--
-- TOC entry 3510 (class 2604 OID 33728)
-- Name: comment id; Type: DEFAULT; Schema: public; Owner: phamthainb
--

ALTER TABLE ONLY public.comment ALTER COLUMN id SET DEFAULT nextval('public.comment_id_seq'::regclass);


--
-- TOC entry 3514 (class 2604 OID 33745)
-- Name: history id; Type: DEFAULT; Schema: public; Owner: phamthainb
--

ALTER TABLE ONLY public.history ALTER COLUMN id SET DEFAULT nextval('public.history_id_seq'::regclass);


--
-- TOC entry 3501 (class 2604 OID 33701)
-- Name: movie id; Type: DEFAULT; Schema: public; Owner: phamthainb
--

ALTER TABLE ONLY public.movie ALTER COLUMN id SET DEFAULT nextval('public.movie_id_seq'::regclass);


--
-- TOC entry 3498 (class 2604 OID 33683)
-- Name: tag id; Type: DEFAULT; Schema: public; Owner: phamthainb
--

ALTER TABLE ONLY public.tag ALTER COLUMN id SET DEFAULT nextval('public.tag_id_seq'::regclass);


--
-- TOC entry 3692 (class 0 OID 33654)
-- Dependencies: 211
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: phamthainb
--

COPY public.account (id, "createdAt", "updatedAt", "deletedAt", username, password, role, type, "ggAccessToken") FROM stdin;
1	2022-08-07 03:17:10.87039	2022-08-07 03:17:10.87039	\N	user@gmail.com	$2b$12$uE9OF6WWG3REzC8IkCBn2.F5BkxfE5n48N5UnS3nxDKdycM3p5Rye	USER	normal	\N
2	2022-08-07 03:17:10.87039	2022-08-07 03:17:10.87039	\N	phamthainb	$2b$12$UpSrVUkX84.INEazb4Z\\/KeFPNFdlqRDPTqz1S1uClVjslhHJQI.XC	ADMIN	normal	\N
\.


--
-- TOC entry 3694 (class 0 OID 33669)
-- Dependencies: 213
-- Data for Name: actor; Type: TABLE DATA; Schema: public; Owner: phamthainb
--

COPY public.actor (id, "createdAt", "updatedAt", "deletedAt", name) FROM stdin;
1	2022-08-07 03:06:24.538433	2022-08-07 03:06:24.538433	\N	Tim Robbins
2	2022-08-07 03:06:24.542236	2022-08-07 03:06:24.542236	\N	Morgan Freeman
3	2022-08-07 03:06:24.546404	2022-08-07 03:06:24.546404	\N	Bob Gunton
4	2022-08-07 03:06:24.55046	2022-08-07 03:06:24.55046	\N	William Sadler
5	2022-08-07 03:06:24.553059	2022-08-07 03:06:24.553059	\N	Clancy Brown
6	2022-08-07 03:06:24.555444	2022-08-07 03:06:24.555444	\N	Gil Bellows
7	2022-08-07 03:06:24.55829	2022-08-07 03:06:24.55829	\N	Mark Rolston
8	2022-08-07 03:06:24.561363	2022-08-07 03:06:24.561363	\N	James Whitmore
9	2022-08-07 03:06:24.563708	2022-08-07 03:06:24.563708	\N	Jeffrey DeMunn
10	2022-08-07 03:06:24.56556	2022-08-07 03:06:24.56556	\N	Larry Brandenburg
11	2022-08-07 03:06:24.568062	2022-08-07 03:06:24.568062	\N	Neil Giuntoli
12	2022-08-07 03:06:24.570151	2022-08-07 03:06:24.570151	\N	Brian Libby
13	2022-08-07 03:06:24.571869	2022-08-07 03:06:24.571869	\N	David Proval
14	2022-08-07 03:06:24.574492	2022-08-07 03:06:24.574492	\N	Joseph Ragno
15	2022-08-07 03:06:24.577618	2022-08-07 03:06:24.577618	\N	Jude Ciccolella
16	2022-08-07 03:06:24.596377	2022-08-07 03:06:24.596377	\N	Marlon Brando
17	2022-08-07 03:06:24.597702	2022-08-07 03:06:24.597702	\N	Al Pacino
18	2022-08-07 03:06:24.599119	2022-08-07 03:06:24.599119	\N	James Caan
19	2022-08-07 03:06:24.603008	2022-08-07 03:06:24.603008	\N	Richard S. Castellano
20	2022-08-07 03:06:24.605283	2022-08-07 03:06:24.605283	\N	Robert Duvall
21	2022-08-07 03:06:24.606284	2022-08-07 03:06:24.606284	\N	Sterling Hayden
22	2022-08-07 03:06:24.607338	2022-08-07 03:06:24.607338	\N	John Marley
23	2022-08-07 03:06:24.608665	2022-08-07 03:06:24.608665	\N	Richard Conte
24	2022-08-07 03:06:24.610944	2022-08-07 03:06:24.610944	\N	Al Lettieri
25	2022-08-07 03:06:24.612079	2022-08-07 03:06:24.612079	\N	Diane Keaton
26	2022-08-07 03:06:24.613192	2022-08-07 03:06:24.613192	\N	Abe Vigoda
27	2022-08-07 03:06:24.614293	2022-08-07 03:06:24.614293	\N	Talia Shire
28	2022-08-07 03:06:24.615699	2022-08-07 03:06:24.615699	\N	Gianni Russo
29	2022-08-07 03:06:24.617007	2022-08-07 03:06:24.617007	\N	John Cazale
30	2022-08-07 03:06:24.618286	2022-08-07 03:06:24.618286	\N	Rudy Bond
31	2022-08-07 03:06:24.62766	2022-08-07 03:06:24.62766	\N	Robert De Niro
32	2022-08-07 03:06:24.630044	2022-08-07 03:06:24.630044	\N	Lee Strasberg
33	2022-08-07 03:06:24.631194	2022-08-07 03:06:24.631194	\N	Michael V. Gazzo
34	2022-08-07 03:06:24.63372	2022-08-07 03:06:24.63372	\N	G.D. Spradlin
35	2022-08-07 03:06:24.634985	2022-08-07 03:06:24.634985	\N	Richard Bright
36	2022-08-07 03:06:24.635892	2022-08-07 03:06:24.635892	\N	Gastone Moschin
37	2022-08-07 03:06:24.636798	2022-08-07 03:06:24.636798	\N	Tom Rosqui
38	2022-08-07 03:06:24.637797	2022-08-07 03:06:24.637797	\N	Bruno Kirby
39	2022-08-07 03:06:24.638992	2022-08-07 03:06:24.638992	\N	Frank Sivero
40	2022-08-07 03:06:24.640216	2022-08-07 03:06:24.640216	\N	Francesca De Sapio
41	2022-08-07 03:06:24.647695	2022-08-07 03:06:24.647695	\N	Christian Bale
42	2022-08-07 03:06:24.652939	2022-08-07 03:06:24.652939	\N	Heath Ledger
43	2022-08-07 03:06:24.653898	2022-08-07 03:06:24.653898	\N	Aaron Eckhart
44	2022-08-07 03:06:24.654928	2022-08-07 03:06:24.654928	\N	Michael Caine
45	2022-08-07 03:06:24.656189	2022-08-07 03:06:24.656189	\N	Maggie Gyllenhaal
46	2022-08-07 03:06:24.657228	2022-08-07 03:06:24.657228	\N	Gary Oldman
47	2022-08-07 03:06:24.660076	2022-08-07 03:06:24.660076	\N	Monique Gabriela Curnen
48	2022-08-07 03:06:24.661389	2022-08-07 03:06:24.661389	\N	Ron Dean
49	2022-08-07 03:06:24.662511	2022-08-07 03:06:24.662511	\N	Cillian Murphy
50	2022-08-07 03:06:24.663386	2022-08-07 03:06:24.663386	\N	Chin Han
51	2022-08-07 03:06:24.664337	2022-08-07 03:06:24.664337	\N	Nestor Carbonell
52	2022-08-07 03:06:24.665406	2022-08-07 03:06:24.665406	\N	Eric Roberts
53	2022-08-07 03:06:24.666339	2022-08-07 03:06:24.666339	\N	Ritchie Coster
54	2022-08-07 03:06:24.667181	2022-08-07 03:06:24.667181	\N	Anthony Michael Hall
55	2022-08-07 03:06:24.671661	2022-08-07 03:06:24.671661	\N	Martin Balsam
56	2022-08-07 03:06:24.672866	2022-08-07 03:06:24.672866	\N	John Fiedler
57	2022-08-07 03:06:24.673988	2022-08-07 03:06:24.673988	\N	Lee J. Cobb
58	2022-08-07 03:06:24.675442	2022-08-07 03:06:24.675442	\N	E.G. Marshall
59	2022-08-07 03:06:24.676906	2022-08-07 03:06:24.676906	\N	Jack Klugman
60	2022-08-07 03:06:24.677999	2022-08-07 03:06:24.677999	\N	Edward Binns
61	2022-08-07 03:06:24.679182	2022-08-07 03:06:24.679182	\N	Jack Warden
62	2022-08-07 03:06:24.680292	2022-08-07 03:06:24.680292	\N	Henry Fonda
63	2022-08-07 03:06:24.681185	2022-08-07 03:06:24.681185	\N	Joseph Sweeney
64	2022-08-07 03:06:24.681989	2022-08-07 03:06:24.681989	\N	Ed Begley
65	2022-08-07 03:06:24.682793	2022-08-07 03:06:24.682793	\N	George Voskovec
66	2022-08-07 03:06:24.683597	2022-08-07 03:06:24.683597	\N	Robert Webber
67	2022-08-07 03:06:24.689137	2022-08-07 03:06:24.689137	\N	Liam Neeson
68	2022-08-07 03:06:24.69017	2022-08-07 03:06:24.69017	\N	Ben Kingsley
69	2022-08-07 03:06:24.691143	2022-08-07 03:06:24.691143	\N	Ralph Fiennes
70	2022-08-07 03:06:24.692563	2022-08-07 03:06:24.692563	\N	Caroline Goodall
71	2022-08-07 03:06:24.69483	2022-08-07 03:06:24.69483	\N	Jonathan Sagall
72	2022-08-07 03:06:24.696046	2022-08-07 03:06:24.696046	\N	Embeth Davidtz
73	2022-08-07 03:06:24.697236	2022-08-07 03:06:24.697236	\N	Malgorzata Gebel
74	2022-08-07 03:06:24.698416	2022-08-07 03:06:24.698416	\N	Shmuel Levy
75	2022-08-07 03:06:24.699398	2022-08-07 03:06:24.699398	\N	Mark Ivanir
76	2022-08-07 03:06:24.700286	2022-08-07 03:06:24.700286	\N	Béatrice Macola
77	2022-08-07 03:06:24.701173	2022-08-07 03:06:24.701173	\N	Andrzej Seweryn
78	2022-08-07 03:06:24.702116	2022-08-07 03:06:24.702116	\N	Friedrich von Thun
79	2022-08-07 03:06:24.703015	2022-08-07 03:06:24.703015	\N	Krzysztof Luft
80	2022-08-07 03:06:24.703903	2022-08-07 03:06:24.703903	\N	Harry Nehring
81	2022-08-07 03:06:24.704888	2022-08-07 03:06:24.704888	\N	Norbert Weisser
82	2022-08-07 03:06:24.710781	2022-08-07 03:06:24.710781	\N	Tim Roth
83	2022-08-07 03:06:24.711788	2022-08-07 03:06:24.711788	\N	Amanda Plummer
84	2022-08-07 03:06:24.712711	2022-08-07 03:06:24.712711	\N	Laura Lovelace
85	2022-08-07 03:06:24.713584	2022-08-07 03:06:24.713584	\N	John Travolta
86	2022-08-07 03:06:24.714527	2022-08-07 03:06:24.714527	\N	Samuel L. Jackson
87	2022-08-07 03:06:24.715469	2022-08-07 03:06:24.715469	\N	Phil LaMarr
88	2022-08-07 03:06:24.716357	2022-08-07 03:06:24.716357	\N	Frank Whaley
89	2022-08-07 03:06:24.717214	2022-08-07 03:06:24.717214	\N	Burr Steers
90	2022-08-07 03:06:24.718094	2022-08-07 03:06:24.718094	\N	Bruce Willis
91	2022-08-07 03:06:24.719185	2022-08-07 03:06:24.719185	\N	Ving Rhames
92	2022-08-07 03:06:24.720159	2022-08-07 03:06:24.720159	\N	Paul Calderon
93	2022-08-07 03:06:24.72129	2022-08-07 03:06:24.72129	\N	Bronagh Gallagher
94	2022-08-07 03:06:24.722349	2022-08-07 03:06:24.722349	\N	Rosanna Arquette
95	2022-08-07 03:06:24.723401	2022-08-07 03:06:24.723401	\N	Eric Stoltz
96	2022-08-07 03:06:24.724345	2022-08-07 03:06:24.724345	\N	Uma Thurman
97	2022-08-07 03:06:24.750086	2022-08-07 03:06:24.750086	\N	Noel Appleby
98	2022-08-07 03:06:24.751143	2022-08-07 03:06:24.751143	\N	Ali Astin
99	2022-08-07 03:06:24.752051	2022-08-07 03:06:24.752051	\N	Sean Astin
100	2022-08-07 03:06:24.754435	2022-08-07 03:06:24.754435	\N	David Aston
101	2022-08-07 03:06:24.755701	2022-08-07 03:06:24.755701	\N	John Bach
102	2022-08-07 03:06:24.756904	2022-08-07 03:06:24.756904	\N	Sean Bean
103	2022-08-07 03:06:24.758791	2022-08-07 03:06:24.758791	\N	Cate Blanchett
104	2022-08-07 03:06:24.765453	2022-08-07 03:06:24.765453	\N	Orlando Bloom
105	2022-08-07 03:06:24.767698	2022-08-07 03:06:24.767698	\N	Billy Boyd
106	2022-08-07 03:06:24.771586	2022-08-07 03:06:24.771586	\N	Sadwyn Brophy
107	2022-08-07 03:06:24.781315	2022-08-07 03:06:24.781315	\N	Alistair Browning
108	2022-08-07 03:06:24.785703	2022-08-07 03:06:24.785703	\N	Marton Csokas
109	2022-08-07 03:06:24.787408	2022-08-07 03:06:24.787408	\N	Richard Edge
110	2022-08-07 03:06:24.788507	2022-08-07 03:06:24.788507	\N	Jason Fitch
111	2022-08-07 03:06:24.790731	2022-08-07 03:06:24.790731	\N	Bernard Hill
112	2022-08-07 03:06:24.799209	2022-08-07 03:06:24.799209	\N	Eli Wallach
113	2022-08-07 03:06:24.800054	2022-08-07 03:06:24.800054	\N	Clint Eastwood
114	2022-08-07 03:06:24.800805	2022-08-07 03:06:24.800805	\N	Lee Van Cleef
115	2022-08-07 03:06:24.801542	2022-08-07 03:06:24.801542	\N	Aldo Giuffrè
116	2022-08-07 03:06:24.802291	2022-08-07 03:06:24.802291	\N	Luigi Pistilli
117	2022-08-07 03:06:24.803089	2022-08-07 03:06:24.803089	\N	Rada Rassimov
118	2022-08-07 03:06:24.804024	2022-08-07 03:06:24.804024	\N	Enzo Petito
119	2022-08-07 03:06:24.805286	2022-08-07 03:06:24.805286	\N	Claudio Scarchilli
120	2022-08-07 03:06:24.811577	2022-08-07 03:06:24.811577	\N	John Bartha
121	2022-08-07 03:06:24.81306	2022-08-07 03:06:24.81306	\N	Livio Lorenzon
122	2022-08-07 03:06:24.814907	2022-08-07 03:06:24.814907	\N	Antonio Casale
123	2022-08-07 03:06:24.815857	2022-08-07 03:06:24.815857	\N	Sandro Scarchilli
124	2022-08-07 03:06:24.817509	2022-08-07 03:06:24.817509	\N	Benito Stefanelli
125	2022-08-07 03:06:24.818587	2022-08-07 03:06:24.818587	\N	Angelo Novi
126	2022-08-07 03:06:24.819939	2022-08-07 03:06:24.819939	\N	Antonio Casas
127	2022-08-07 03:06:24.83014	2022-08-07 03:06:24.83014	\N	Tom Hanks
128	2022-08-07 03:06:24.831284	2022-08-07 03:06:24.831284	\N	Rebecca Williams
129	2022-08-07 03:06:24.832253	2022-08-07 03:06:24.832253	\N	Sally Field
130	2022-08-07 03:06:24.83299	2022-08-07 03:06:24.83299	\N	Michael Conner Humphreys
131	2022-08-07 03:06:24.833767	2022-08-07 03:06:24.833767	\N	Harold G. Herthum
132	2022-08-07 03:06:24.834498	2022-08-07 03:06:24.834498	\N	George Kelly
133	2022-08-07 03:06:24.835227	2022-08-07 03:06:24.835227	\N	Bob Penny
134	2022-08-07 03:06:24.835938	2022-08-07 03:06:24.835938	\N	John Randall
135	2022-08-07 03:06:24.837479	2022-08-07 03:06:24.837479	\N	Sam Anderson
136	2022-08-07 03:06:24.838304	2022-08-07 03:06:24.838304	\N	Margo Moorer
137	2022-08-07 03:06:24.839069	2022-08-07 03:06:24.839069	\N	Ione M. Telech
138	2022-08-07 03:06:24.840254	2022-08-07 03:06:24.840254	\N	Christine Seabrook
139	2022-08-07 03:06:24.842261	2022-08-07 03:06:24.842261	\N	John Worsham
140	2022-08-07 03:06:24.843867	2022-08-07 03:06:24.843867	\N	Peter Dobson
141	2022-08-07 03:06:24.845574	2022-08-07 03:06:24.845574	\N	Siobhan Fallon Hogan
142	2022-08-07 03:06:24.851538	2022-08-07 03:06:24.851538	\N	Alan Howard
143	2022-08-07 03:06:24.85451	2022-08-07 03:06:24.85451	\N	Sala Baker
144	2022-08-07 03:06:24.861301	2022-08-07 03:06:24.861301	\N	Megan Edwards
145	2022-08-07 03:06:24.862977	2022-08-07 03:06:24.862977	\N	Michael Elsworth
146	2022-08-07 03:06:24.864543	2022-08-07 03:06:24.864543	\N	Mark Ferguson
147	2022-08-07 03:06:24.866395	2022-08-07 03:06:24.866395	\N	Ian Holm
148	2022-08-07 03:06:24.867327	2022-08-07 03:06:24.867327	\N	Christopher Lee
149	2022-08-07 03:06:24.868099	2022-08-07 03:06:24.868099	\N	Lawrence Makoare
150	2022-08-07 03:06:24.871933	2022-08-07 03:06:24.871933	\N	Edward Norton
151	2022-08-07 03:06:24.872964	2022-08-07 03:06:24.872964	\N	Brad Pitt
152	2022-08-07 03:06:24.873823	2022-08-07 03:06:24.873823	\N	Meat Loaf
153	2022-08-07 03:06:24.874689	2022-08-07 03:06:24.874689	\N	Zach Grenier
154	2022-08-07 03:06:24.876244	2022-08-07 03:06:24.876244	\N	Richmond Arquette
155	2022-08-07 03:06:24.877861	2022-08-07 03:06:24.877861	\N	David Andrews
156	2022-08-07 03:06:24.879818	2022-08-07 03:06:24.879818	\N	George Maguire
157	2022-08-07 03:06:24.881301	2022-08-07 03:06:24.881301	\N	Eugenie Bondurant
158	2022-08-07 03:06:24.882106	2022-08-07 03:06:24.882106	\N	Helena Bonham Carter
159	2022-08-07 03:06:24.882844	2022-08-07 03:06:24.882844	\N	Christina Cabot
160	2022-08-07 03:06:24.883639	2022-08-07 03:06:24.883639	\N	Sydney 'Big Dawg' Colston
161	2022-08-07 03:06:24.884615	2022-08-07 03:06:24.884615	\N	Rachel Singer
162	2022-08-07 03:06:24.885345	2022-08-07 03:06:24.885345	\N	Christie Cronenweth
163	2022-08-07 03:06:24.88603	2022-08-07 03:06:24.88603	\N	Tim DeZarn
164	2022-08-07 03:06:24.886783	2022-08-07 03:06:24.886783	\N	Ezra Buzzington
165	2022-08-07 03:06:24.894457	2022-08-07 03:06:24.894457	\N	Leonardo DiCaprio
166	2022-08-07 03:06:24.895963	2022-08-07 03:06:24.895963	\N	Joseph Gordon-Levitt
167	2022-08-07 03:06:24.896843	2022-08-07 03:06:24.896843	\N	Ellen Page
168	2022-08-07 03:06:24.898176	2022-08-07 03:06:24.898176	\N	Tom Hardy
169	2022-08-07 03:06:24.899169	2022-08-07 03:06:24.899169	\N	Ken Watanabe
170	2022-08-07 03:06:24.900186	2022-08-07 03:06:24.900186	\N	Dileep Rao
171	2022-08-07 03:06:24.901822	2022-08-07 03:06:24.901822	\N	Tom Berenger
172	2022-08-07 03:06:24.903023	2022-08-07 03:06:24.903023	\N	Marion Cotillard
173	2022-08-07 03:06:24.904114	2022-08-07 03:06:24.904114	\N	Pete Postlethwaite
174	2022-08-07 03:06:24.905862	2022-08-07 03:06:24.905862	\N	Lukas Haas
175	2022-08-07 03:06:24.907089	2022-08-07 03:06:24.907089	\N	Tai-Li Lee
176	2022-08-07 03:06:24.910555	2022-08-07 03:06:24.910555	\N	Claire Geare
177	2022-08-07 03:06:24.911638	2022-08-07 03:06:24.911638	\N	Magnus Nolan
178	2022-08-07 03:06:24.947075	2022-08-07 03:06:24.947075	\N	Caglar Ertugrul
179	2022-08-07 03:06:24.948811	2022-08-07 03:06:24.948811	\N	Ufuk Bayraktar
180	2022-08-07 03:06:24.95035	2022-08-07 03:06:24.95035	\N	Ahu Türkpençe
181	2022-08-07 03:06:24.951716	2022-08-07 03:06:24.951716	\N	Murat Serezli
182	2022-08-07 03:06:24.953049	2022-08-07 03:06:24.953049	\N	Atilgan Gümüs
183	2022-08-07 03:06:24.958673	2022-08-07 03:06:24.958673	\N	Murat Arkin
184	2022-08-07 03:06:24.960785	2022-08-07 03:06:24.960785	\N	Armagan Oguz
185	2022-08-07 03:06:24.964641	2022-08-07 03:06:24.964641	\N	Ahmet Pinar
186	2022-08-07 03:06:24.969032	2022-08-07 03:06:24.969032	\N	Açelya Özcan
187	2022-08-07 03:06:24.973627	2022-08-07 03:06:24.973627	\N	Bedii Akin
188	2022-08-07 03:06:24.978335	2022-08-07 03:06:24.978335	\N	Eylül Arular
189	2022-08-07 03:06:24.985829	2022-08-07 03:06:24.985829	\N	Buse Varol
190	2022-08-07 03:06:24.987681	2022-08-07 03:06:24.987681	\N	Ozan Agaç
191	2022-08-07 03:06:24.988953	2022-08-07 03:06:24.988953	\N	Emir Benderlioglu
192	2022-08-07 03:06:24.99018	2022-08-07 03:06:24.99018	\N	Ender Arular
193	2022-08-07 03:06:25.013099	2022-08-07 03:06:25.013099	\N	Sushant Singh Rajput
194	2022-08-07 03:06:25.017342	2022-08-07 03:06:25.017342	\N	Sanjana Sanghi
195	2022-08-07 03:06:25.031204	2022-08-07 03:06:25.031204	\N	Sahil Vaid
196	2022-08-07 03:06:25.034742	2022-08-07 03:06:25.034742	\N	Saswata Chatterjee
197	2022-08-07 03:06:25.037278	2022-08-07 03:06:25.037278	\N	Swastika Mukherjee
198	2022-08-07 03:06:25.038659	2022-08-07 03:06:25.038659	\N	Sunit Tandon
199	2022-08-07 03:06:25.040443	2022-08-07 03:06:25.040443	\N	Saif Ali Khan
200	2022-08-07 03:06:25.041718	2022-08-07 03:06:25.041718	\N	Michael Muthu
201	2022-08-07 03:06:25.042954	2022-08-07 03:06:25.042954	\N	Rajie Vijay Sarathi
202	2022-08-07 03:06:25.045105	2022-08-07 03:06:25.045105	\N	Subbalakshmi
203	2022-08-07 03:06:25.048437	2022-08-07 03:06:25.048437	\N	Franaita Jijana
204	2022-08-07 03:06:25.05403	2022-08-07 03:06:25.05403	\N	Durgesh Kumar
205	2022-08-07 03:06:25.057621	2022-08-07 03:06:25.057621	\N	Salone Mehta
206	2022-08-07 03:06:25.063938	2022-08-07 03:06:25.063938	\N	Anandita Sarkar
207	2022-08-07 03:06:25.065053	2022-08-07 03:06:25.065053	\N	Nimisha Dean
208	2022-08-07 03:06:25.069147	2022-08-07 03:06:25.069147	\N	Jack Nicholson
209	2022-08-07 03:06:25.070119	2022-08-07 03:06:25.070119	\N	Louise Fletcher
210	2022-08-07 03:06:25.071208	2022-08-07 03:06:25.071208	\N	Will Sampson
211	2022-08-07 03:06:25.072056	2022-08-07 03:06:25.072056	\N	Michael Berryman
212	2022-08-07 03:06:25.072942	2022-08-07 03:06:25.072942	\N	Alonzo Brown
213	2022-08-07 03:06:25.074085	2022-08-07 03:06:25.074085	\N	Peter Brocco
214	2022-08-07 03:06:25.076833	2022-08-07 03:06:25.076833	\N	Scatman Crothers
215	2022-08-07 03:06:25.078079	2022-08-07 03:06:25.078079	\N	Dean R. Brooks
216	2022-08-07 03:06:25.079241	2022-08-07 03:06:25.079241	\N	Mwako Cumbuka
217	2022-08-07 03:06:25.080423	2022-08-07 03:06:25.080423	\N	Danny DeVito
218	2022-08-07 03:06:25.081171	2022-08-07 03:06:25.081171	\N	William Duell
219	2022-08-07 03:06:25.081847	2022-08-07 03:06:25.081847	\N	Josip Elic
220	2022-08-07 03:06:25.082531	2022-08-07 03:06:25.082531	\N	Lan Fendors
221	2022-08-07 03:06:25.083204	2022-08-07 03:06:25.083204	\N	Nathan George
222	2022-08-07 03:06:25.083856	2022-08-07 03:06:25.083856	\N	Ken Kenny
223	2022-08-07 03:06:25.089647	2022-08-07 03:06:25.089647	\N	Mark Hamill
224	2022-08-07 03:06:25.09086	2022-08-07 03:06:25.09086	\N	Harrison Ford
225	2022-08-07 03:06:25.093664	2022-08-07 03:06:25.093664	\N	Carrie Fisher
226	2022-08-07 03:06:25.097994	2022-08-07 03:06:25.097994	\N	Billy Dee Williams
227	2022-08-07 03:06:25.099659	2022-08-07 03:06:25.099659	\N	Anthony Daniels
228	2022-08-07 03:06:25.100654	2022-08-07 03:06:25.100654	\N	David Prowse
229	2022-08-07 03:06:25.1016	2022-08-07 03:06:25.1016	\N	Peter Mayhew
230	2022-08-07 03:06:25.102508	2022-08-07 03:06:25.102508	\N	Kenny Baker
231	2022-08-07 03:06:25.103424	2022-08-07 03:06:25.103424	\N	Frank Oz
232	2022-08-07 03:06:25.104327	2022-08-07 03:06:25.104327	\N	Alec Guinness
233	2022-08-07 03:06:25.105214	2022-08-07 03:06:25.105214	\N	Jeremy Bulloch
234	2022-08-07 03:06:25.106236	2022-08-07 03:06:25.106236	\N	John Hollis
235	2022-08-07 03:06:25.107185	2022-08-07 03:06:25.107185	\N	Jack Purvis
236	2022-08-07 03:06:25.109892	2022-08-07 03:06:25.109892	\N	Des Webb
237	2022-08-07 03:06:25.111164	2022-08-07 03:06:25.111164	\N	Clive Revill
238	2022-08-07 03:06:25.11782	2022-08-07 03:06:25.11782	\N	Ray Liotta
239	2022-08-07 03:06:25.118866	2022-08-07 03:06:25.118866	\N	Joe Pesci
240	2022-08-07 03:06:25.119783	2022-08-07 03:06:25.119783	\N	Lorraine Bracco
241	2022-08-07 03:06:25.120733	2022-08-07 03:06:25.120733	\N	Paul Sorvino
242	2022-08-07 03:06:25.122403	2022-08-07 03:06:25.122403	\N	Tony Darrow
243	2022-08-07 03:06:25.123549	2022-08-07 03:06:25.123549	\N	Mike Starr
244	2022-08-07 03:06:25.124489	2022-08-07 03:06:25.124489	\N	Frank Vincent
245	2022-08-07 03:06:25.127476	2022-08-07 03:06:25.127476	\N	Chuck Low
246	2022-08-07 03:06:25.12915	2022-08-07 03:06:25.12915	\N	Frank DiLeo
247	2022-08-07 03:06:25.132674	2022-08-07 03:06:25.132674	\N	Henny Youngman
248	2022-08-07 03:06:25.13379	2022-08-07 03:06:25.13379	\N	Gina Mastrogiacomo
249	2022-08-07 03:06:25.134713	2022-08-07 03:06:25.134713	\N	Catherine Scorsese
250	2022-08-07 03:06:25.135691	2022-08-07 03:06:25.135691	\N	Charles Scorsese
251	2022-08-07 03:06:25.143332	2022-08-07 03:06:25.143332	\N	Keanu Reeves
252	2022-08-07 03:06:25.144784	2022-08-07 03:06:25.144784	\N	Laurence Fishburne
253	2022-08-07 03:06:25.146305	2022-08-07 03:06:25.146305	\N	Carrie-Anne Moss
254	2022-08-07 03:06:25.147798	2022-08-07 03:06:25.147798	\N	Hugo Weaving
255	2022-08-07 03:06:25.148687	2022-08-07 03:06:25.148687	\N	Gloria Foster
256	2022-08-07 03:06:25.149666	2022-08-07 03:06:25.149666	\N	Joe Pantoliano
257	2022-08-07 03:06:25.150564	2022-08-07 03:06:25.150564	\N	Marcus Chong
258	2022-08-07 03:06:25.151427	2022-08-07 03:06:25.151427	\N	Julian Arahanga
259	2022-08-07 03:06:25.15229	2022-08-07 03:06:25.15229	\N	Matt Doran
260	2022-08-07 03:06:25.153128	2022-08-07 03:06:25.153128	\N	Belinda McClory
261	2022-08-07 03:06:25.15396	2022-08-07 03:06:25.15396	\N	Anthony Ray Parker
262	2022-08-07 03:06:25.154784	2022-08-07 03:06:25.154784	\N	Paul Goddard
263	2022-08-07 03:06:25.155609	2022-08-07 03:06:25.155609	\N	Robert Taylor
264	2022-08-07 03:06:25.157102	2022-08-07 03:06:25.157102	\N	Marc Aden Gray
265	2022-08-07 03:06:25.164788	2022-08-07 03:06:25.164788	\N	Bruce Allpress
266	2022-08-07 03:06:25.170533	2022-08-07 03:06:25.170533	\N	Jed Brophy
267	2022-08-07 03:06:25.171417	2022-08-07 03:06:25.171417	\N	Sam Comery
268	2022-08-07 03:06:25.172239	2022-08-07 03:06:25.172239	\N	Brad Dourif
269	2022-08-07 03:06:25.17311	2022-08-07 03:06:25.17311	\N	Calum Gittins
270	2022-08-07 03:06:25.17712	2022-08-07 03:06:25.17712	\N	Bruce Hopkins
271	2022-08-07 03:06:25.178402	2022-08-07 03:06:25.178402	\N	Paris Howe Strewe
272	2022-08-07 03:06:25.186652	2022-08-07 03:06:25.186652	\N	James Stewart
273	2022-08-07 03:06:25.187567	2022-08-07 03:06:25.187567	\N	Donna Reed
274	2022-08-07 03:06:25.188476	2022-08-07 03:06:25.188476	\N	Lionel Barrymore
275	2022-08-07 03:06:25.189735	2022-08-07 03:06:25.189735	\N	Thomas Mitchell
276	2022-08-07 03:06:25.194362	2022-08-07 03:06:25.194362	\N	Henry Travers
277	2022-08-07 03:06:25.195778	2022-08-07 03:06:25.195778	\N	Beulah Bondi
278	2022-08-07 03:06:25.19689	2022-08-07 03:06:25.19689	\N	Frank Faylen
279	2022-08-07 03:06:25.198168	2022-08-07 03:06:25.198168	\N	Ward Bond
280	2022-08-07 03:06:25.199079	2022-08-07 03:06:25.199079	\N	Gloria Grahame
281	2022-08-07 03:06:25.199949	2022-08-07 03:06:25.199949	\N	H.B. Warner
282	2022-08-07 03:06:25.200816	2022-08-07 03:06:25.200816	\N	Frank Albertson
283	2022-08-07 03:06:25.201685	2022-08-07 03:06:25.201685	\N	Todd Karns
284	2022-08-07 03:06:25.202531	2022-08-07 03:06:25.202531	\N	Samuel S. Hinds
285	2022-08-07 03:06:25.203319	2022-08-07 03:06:25.203319	\N	Mary Treen
286	2022-08-07 03:06:25.204211	2022-08-07 03:06:25.204211	\N	Virginia Patton
287	2022-08-07 03:06:25.219389	2022-08-07 03:06:25.219389	\N	Toshirô Mifune
288	2022-08-07 03:06:25.220389	2022-08-07 03:06:25.220389	\N	Takashi Shimura
289	2022-08-07 03:06:25.22144	2022-08-07 03:06:25.22144	\N	Keiko Tsushima
290	2022-08-07 03:06:25.227129	2022-08-07 03:06:25.227129	\N	Yukiko Shimazaki
291	2022-08-07 03:06:25.231699	2022-08-07 03:06:25.231699	\N	Kamatari Fujiwara
292	2022-08-07 03:06:25.236335	2022-08-07 03:06:25.236335	\N	Daisuke Katô
293	2022-08-07 03:06:25.240623	2022-08-07 03:06:25.240623	\N	Isao Kimura
294	2022-08-07 03:06:25.245327	2022-08-07 03:06:25.245327	\N	Minoru Chiaki
295	2022-08-07 03:06:25.246725	2022-08-07 03:06:25.246725	\N	Seiji Miyaguchi
296	2022-08-07 03:06:25.248974	2022-08-07 03:06:25.248974	\N	Yoshio Kosugi
297	2022-08-07 03:06:25.252409	2022-08-07 03:06:25.252409	\N	Bokuzen Hidari
298	2022-08-07 03:06:25.254503	2022-08-07 03:06:25.254503	\N	Yoshio Inaba
299	2022-08-07 03:06:25.255395	2022-08-07 03:06:25.255395	\N	Yoshio Tsuchiya
300	2022-08-07 03:06:25.258634	2022-08-07 03:06:25.258634	\N	Kokuten Kôdô
301	2022-08-07 03:06:25.27653	2022-08-07 03:06:25.27653	\N	Eijirô Tôno
302	2022-08-07 03:06:25.328368	2022-08-07 03:06:25.328368	\N	Peter Cushing
303	2022-08-07 03:06:25.344166	2022-08-07 03:06:25.344166	\N	Phil Brown
304	2022-08-07 03:06:25.346265	2022-08-07 03:06:25.346265	\N	Shelagh Fraser
305	2022-08-07 03:06:25.348049	2022-08-07 03:06:25.348049	\N	Alex McCrindle
306	2022-08-07 03:06:25.348957	2022-08-07 03:06:25.348957	\N	Eddie Byrne
307	2022-08-07 03:06:25.349877	2022-08-07 03:06:25.349877	\N	Drewe Henley
308	2022-08-07 03:06:25.355278	2022-08-07 03:06:25.355278	\N	Jodie Foster
309	2022-08-07 03:06:25.356301	2022-08-07 03:06:25.356301	\N	Lawrence A. Bonney
310	2022-08-07 03:06:25.357245	2022-08-07 03:06:25.357245	\N	Kasi Lemmons
311	2022-08-07 03:06:25.358253	2022-08-07 03:06:25.358253	\N	Lawrence T. Wrentz
312	2022-08-07 03:06:25.359942	2022-08-07 03:06:25.359942	\N	Scott Glenn
313	2022-08-07 03:06:25.361532	2022-08-07 03:06:25.361532	\N	Anthony Heald
314	2022-08-07 03:06:25.363548	2022-08-07 03:06:25.363548	\N	Frankie Faison
315	2022-08-07 03:06:25.365323	2022-08-07 03:06:25.365323	\N	Don Brockett
316	2022-08-07 03:06:25.366755	2022-08-07 03:06:25.366755	\N	Frank Seals Jr.
317	2022-08-07 03:06:25.367605	2022-08-07 03:06:25.367605	\N	Stuart Rudin
318	2022-08-07 03:06:25.368325	2022-08-07 03:06:25.368325	\N	Anthony Hopkins
319	2022-08-07 03:06:25.369242	2022-08-07 03:06:25.369242	\N	Maria Skorobogatov
320	2022-08-07 03:06:25.370168	2022-08-07 03:06:25.370168	\N	Jeffrie Lane
321	2022-08-07 03:06:25.371567	2022-08-07 03:06:25.371567	\N	Leib Lensky
322	2022-08-07 03:06:25.372711	2022-08-07 03:06:25.372711	\N	George 'Red' Schwartz
323	2022-08-07 03:06:25.383067	2022-08-07 03:06:25.383067	\N	Andrew Kevin Walker
324	2022-08-07 03:06:25.383966	2022-08-07 03:06:25.383966	\N	Daniel Zacapa
325	2022-08-07 03:06:25.38549	2022-08-07 03:06:25.38549	\N	Gwyneth Paltrow
326	2022-08-07 03:06:25.386403	2022-08-07 03:06:25.386403	\N	John Cassini
327	2022-08-07 03:06:25.387274	2022-08-07 03:06:25.387274	\N	Bob Mack
328	2022-08-07 03:06:25.388119	2022-08-07 03:06:25.388119	\N	Peter Crombie
329	2022-08-07 03:06:25.389183	2022-08-07 03:06:25.389183	\N	Reg E. Cathey
330	2022-08-07 03:06:25.390237	2022-08-07 03:06:25.390237	\N	R. Lee Ermey
331	2022-08-07 03:06:25.391244	2022-08-07 03:06:25.391244	\N	George Christy
332	2022-08-07 03:06:25.393047	2022-08-07 03:06:25.393047	\N	Endre Hules
333	2022-08-07 03:06:25.394836	2022-08-07 03:06:25.394836	\N	Hawthorne James
334	2022-08-07 03:06:25.396791	2022-08-07 03:06:25.396791	\N	William Davidson
335	2022-08-07 03:06:25.398084	2022-08-07 03:06:25.398084	\N	Bob Collins
336	2022-08-07 03:06:25.403768	2022-08-07 03:06:25.403768	\N	Roberto Benigni
337	2022-08-07 03:06:25.404829	2022-08-07 03:06:25.404829	\N	Nicoletta Braschi
338	2022-08-07 03:06:25.405991	2022-08-07 03:06:25.405991	\N	Giorgio Cantarini
339	2022-08-07 03:06:25.407002	2022-08-07 03:06:25.407002	\N	Giustino Durano
340	2022-08-07 03:06:25.409834	2022-08-07 03:06:25.409834	\N	Sergio Bini Bustric
341	2022-08-07 03:06:25.411038	2022-08-07 03:06:25.411038	\N	Marisa Paredes
342	2022-08-07 03:06:25.412252	2022-08-07 03:06:25.412252	\N	Horst Buchholz
343	2022-08-07 03:06:25.413924	2022-08-07 03:06:25.413924	\N	Lidia Alfonsi
344	2022-08-07 03:06:25.415026	2022-08-07 03:06:25.415026	\N	Giuliana Lojodice
345	2022-08-07 03:06:25.415939	2022-08-07 03:06:25.415939	\N	Amerigo Fontani
346	2022-08-07 03:06:25.416799	2022-08-07 03:06:25.416799	\N	Pietro De Silva
347	2022-08-07 03:06:25.417639	2022-08-07 03:06:25.417639	\N	Francesco Guzzo
348	2022-08-07 03:06:25.4185	2022-08-07 03:06:25.4185	\N	Raffaella Lebboroni
349	2022-08-07 03:06:25.421072	2022-08-07 03:06:25.421072	\N	Claudio Alfonsi
350	2022-08-07 03:06:25.422042	2022-08-07 03:06:25.422042	\N	Gil Baroni
351	2022-08-07 03:06:25.430534	2022-08-07 03:06:25.430534	\N	David Morse
352	2022-08-07 03:06:25.431647	2022-08-07 03:06:25.431647	\N	Bonnie Hunt
353	2022-08-07 03:06:25.433198	2022-08-07 03:06:25.433198	\N	Michael Clarke Duncan
354	2022-08-07 03:06:25.434136	2022-08-07 03:06:25.434136	\N	James Cromwell
355	2022-08-07 03:06:25.435725	2022-08-07 03:06:25.435725	\N	Michael Jeter
356	2022-08-07 03:06:25.436637	2022-08-07 03:06:25.436637	\N	Graham Greene
357	2022-08-07 03:06:25.437531	2022-08-07 03:06:25.437531	\N	Doug Hutchison
358	2022-08-07 03:06:25.438425	2022-08-07 03:06:25.438425	\N	Sam Rockwell
359	2022-08-07 03:06:25.439393	2022-08-07 03:06:25.439393	\N	Barry Pepper
360	2022-08-07 03:06:25.441227	2022-08-07 03:06:25.441227	\N	Patricia Clarkson
361	2022-08-07 03:06:25.443895	2022-08-07 03:06:25.443895	\N	Harry Dean Stanton
362	2022-08-07 03:06:25.445219	2022-08-07 03:06:25.445219	\N	Dabbs Greer
363	2022-08-07 03:06:25.446176	2022-08-07 03:06:25.446176	\N	Eve Brent
364	2022-08-07 03:06:25.450829	2022-08-07 03:06:25.450829	\N	Tom Sizemore
365	2022-08-07 03:06:25.45164	2022-08-07 03:06:25.45164	\N	Edward Burns
366	2022-08-07 03:06:25.452962	2022-08-07 03:06:25.452962	\N	Adam Goldberg
367	2022-08-07 03:06:25.453729	2022-08-07 03:06:25.453729	\N	Vin Diesel
368	2022-08-07 03:06:25.455234	2022-08-07 03:06:25.455234	\N	Giovanni Ribisi
369	2022-08-07 03:06:25.456237	2022-08-07 03:06:25.456237	\N	Jeremy Davies
370	2022-08-07 03:06:25.457079	2022-08-07 03:06:25.457079	\N	Matt Damon
371	2022-08-07 03:06:25.457979	2022-08-07 03:06:25.457979	\N	Ted Danson
372	2022-08-07 03:06:25.459695	2022-08-07 03:06:25.459695	\N	Paul Giamatti
373	2022-08-07 03:06:25.460963	2022-08-07 03:06:25.460963	\N	Dennis Farina
374	2022-08-07 03:06:25.462308	2022-08-07 03:06:25.462308	\N	Joerg Stadler
375	2022-08-07 03:06:25.463353	2022-08-07 03:06:25.463353	\N	Max Martini
376	2022-08-07 03:06:25.464141	2022-08-07 03:06:25.464141	\N	Dylan Bruno
377	2022-08-07 03:06:25.469257	2022-08-07 03:06:25.469257	\N	Rumi Hiiragi
378	2022-08-07 03:06:25.470105	2022-08-07 03:06:25.470105	\N	Miyu Irino
379	2022-08-07 03:06:25.470928	2022-08-07 03:06:25.470928	\N	Mari Natsuki
380	2022-08-07 03:06:25.47174	2022-08-07 03:06:25.47174	\N	Takashi Naitô
381	2022-08-07 03:06:25.472914	2022-08-07 03:06:25.472914	\N	Yasuko Sawaguchi
382	2022-08-07 03:06:25.474034	2022-08-07 03:06:25.474034	\N	Tatsuya Gashûin
383	2022-08-07 03:06:25.477546	2022-08-07 03:06:25.477546	\N	Ryûnosuke Kamiki
384	2022-08-07 03:06:25.479207	2022-08-07 03:06:25.479207	\N	Yumi Tamai
385	2022-08-07 03:06:25.480092	2022-08-07 03:06:25.480092	\N	Yô Ôizumi
386	2022-08-07 03:06:25.480776	2022-08-07 03:06:25.480776	\N	Koba Hayashi
387	2022-08-07 03:06:25.481385	2022-08-07 03:06:25.481385	\N	Tsunehiko Kamijô
388	2022-08-07 03:06:25.482025	2022-08-07 03:06:25.482025	\N	Takehiko Ono
389	2022-08-07 03:06:25.482644	2022-08-07 03:06:25.482644	\N	Bunta Sugawara
390	2022-08-07 03:06:25.483191	2022-08-07 03:06:25.483191	\N	Shigeru Wakita
391	2022-08-07 03:06:25.483714	2022-08-07 03:06:25.483714	\N	Shirô Saitô
392	2022-08-07 03:06:25.488042	2022-08-07 03:06:25.488042	\N	Alexandre Rodrigues
393	2022-08-07 03:06:25.489231	2022-08-07 03:06:25.489231	\N	Leandro Firmino
394	2022-08-07 03:06:25.489805	2022-08-07 03:06:25.489805	\N	Phellipe Haagensen
395	2022-08-07 03:06:25.490388	2022-08-07 03:06:25.490388	\N	Douglas Silva
396	2022-08-07 03:06:25.4923	2022-08-07 03:06:25.4923	\N	Jonathan Haagensen
397	2022-08-07 03:06:25.493916	2022-08-07 03:06:25.493916	\N	Matheus Nachtergaele
398	2022-08-07 03:06:25.495312	2022-08-07 03:06:25.495312	\N	Seu Jorge
399	2022-08-07 03:06:25.496329	2022-08-07 03:06:25.496329	\N	Jefechander Suplino
400	2022-08-07 03:06:25.497138	2022-08-07 03:06:25.497138	\N	Alice Braga
401	2022-08-07 03:06:25.497902	2022-08-07 03:06:25.497902	\N	Emerson Gomes
402	2022-08-07 03:06:25.498598	2022-08-07 03:06:25.498598	\N	Edson Oliveira
403	2022-08-07 03:06:25.499151	2022-08-07 03:06:25.499151	\N	Michel Gomes
404	2022-08-07 03:06:25.49968	2022-08-07 03:06:25.49968	\N	Roberta Rodrigues
405	2022-08-07 03:06:25.500187	2022-08-07 03:06:25.500187	\N	Luis Otávio
406	2022-08-07 03:06:25.50068	2022-08-07 03:06:25.50068	\N	Kiko Marques
407	2022-08-07 03:06:25.503519	2022-08-07 03:06:25.503519	\N	Ellen Burstyn
408	2022-08-07 03:06:25.504049	2022-08-07 03:06:25.504049	\N	Matthew McConaughey
409	2022-08-07 03:06:25.504638	2022-08-07 03:06:25.504638	\N	Mackenzie Foy
410	2022-08-07 03:06:25.505127	2022-08-07 03:06:25.505127	\N	John Lithgow
411	2022-08-07 03:06:25.505603	2022-08-07 03:06:25.505603	\N	Timothée Chalamet
412	2022-08-07 03:06:25.506116	2022-08-07 03:06:25.506116	\N	David Oyelowo
413	2022-08-07 03:06:25.50663	2022-08-07 03:06:25.50663	\N	Collette Wolfe
414	2022-08-07 03:06:25.507182	2022-08-07 03:06:25.507182	\N	Francis X. McCarthy
415	2022-08-07 03:06:25.509011	2022-08-07 03:06:25.509011	\N	Bill Irwin
416	2022-08-07 03:06:25.509872	2022-08-07 03:06:25.509872	\N	Anne Hathaway
417	2022-08-07 03:06:25.510466	2022-08-07 03:06:25.510466	\N	Andrew Borba
418	2022-08-07 03:06:25.511084	2022-08-07 03:06:25.511084	\N	Wes Bentley
419	2022-08-07 03:06:25.513355	2022-08-07 03:06:25.513355	\N	William Devane
420	2022-08-07 03:06:25.516682	2022-08-07 03:06:25.516682	\N	David Gyasi
421	2022-08-07 03:06:25.526168	2022-08-07 03:06:25.526168	\N	Kang-ho Song
422	2022-08-07 03:06:25.527258	2022-08-07 03:06:25.527258	\N	Sun-kyun Lee
423	2022-08-07 03:06:25.527881	2022-08-07 03:06:25.527881	\N	Yeo-jeong Jo
424	2022-08-07 03:06:25.528618	2022-08-07 03:06:25.528618	\N	Woo-sik Choi
425	2022-08-07 03:06:25.529785	2022-08-07 03:06:25.529785	\N	So-dam Park
426	2022-08-07 03:06:25.530711	2022-08-07 03:06:25.530711	\N	Jeong-eun Lee
427	2022-08-07 03:06:25.531305	2022-08-07 03:06:25.531305	\N	Hye-jin Jang
428	2022-08-07 03:06:25.531856	2022-08-07 03:06:25.531856	\N	Myeong-hoon Park
429	2022-08-07 03:06:25.532617	2022-08-07 03:06:25.532617	\N	Ji-so Jung
430	2022-08-07 03:06:25.533196	2022-08-07 03:06:25.533196	\N	Hyun-jun Jung
431	2022-08-07 03:06:25.533858	2022-08-07 03:06:25.533858	\N	Keun-rok Park
432	2022-08-07 03:06:25.534449	2022-08-07 03:06:25.534449	\N	Jeong Esuz
433	2022-08-07 03:06:25.53504	2022-08-07 03:06:25.53504	\N	Jo Jae-Myeong
434	2022-08-07 03:06:25.535591	2022-08-07 03:06:25.535591	\N	Ik-han Jung
435	2022-08-07 03:06:25.536086	2022-08-07 03:06:25.536086	\N	Kim Gyu Baek
436	2022-08-07 03:06:25.540374	2022-08-07 03:06:25.540374	\N	Virginia Cherrill
437	2022-08-07 03:06:25.541458	2022-08-07 03:06:25.541458	\N	Florence Lee
438	2022-08-07 03:06:25.545209	2022-08-07 03:06:25.545209	\N	Harry Myers
439	2022-08-07 03:06:25.546613	2022-08-07 03:06:25.546613	\N	Al Ernest Garcia
440	2022-08-07 03:06:25.547516	2022-08-07 03:06:25.547516	\N	Hank Mann
441	2022-08-07 03:06:25.548091	2022-08-07 03:06:25.548091	\N	Charles Chaplin
442	2022-08-07 03:06:25.563257	2022-08-07 03:06:25.563257	\N	Paulette Goddard
443	2022-08-07 03:06:25.563968	2022-08-07 03:06:25.563968	\N	Henry Bergman
444	2022-08-07 03:06:25.564863	2022-08-07 03:06:25.564863	\N	Tiny Sandford
445	2022-08-07 03:06:25.565427	2022-08-07 03:06:25.565427	\N	Chester Conklin
446	2022-08-07 03:06:25.566571	2022-08-07 03:06:25.566571	\N	Stanley Blystone
447	2022-08-07 03:06:25.567604	2022-08-07 03:06:25.567604	\N	Richard Alexander
448	2022-08-07 03:06:25.568167	2022-08-07 03:06:25.568167	\N	Cecil Reynolds
449	2022-08-07 03:06:25.568684	2022-08-07 03:06:25.568684	\N	Mira McKinney
450	2022-08-07 03:06:25.56917	2022-08-07 03:06:25.56917	\N	Murdock MacQuarrie
451	2022-08-07 03:06:25.569646	2022-08-07 03:06:25.569646	\N	Wilfred Lucas
452	2022-08-07 03:06:25.570136	2022-08-07 03:06:25.570136	\N	Edward LeSaint
453	2022-08-07 03:06:25.570628	2022-08-07 03:06:25.570628	\N	Fred Malatesta
454	2022-08-07 03:06:25.57467	2022-08-07 03:06:25.57467	\N	Humphrey Bogart
455	2022-08-07 03:06:25.575799	2022-08-07 03:06:25.575799	\N	Ingrid Bergman
456	2022-08-07 03:06:25.576646	2022-08-07 03:06:25.576646	\N	Paul Henreid
457	2022-08-07 03:06:25.577327	2022-08-07 03:06:25.577327	\N	Claude Rains
458	2022-08-07 03:06:25.57801	2022-08-07 03:06:25.57801	\N	Conrad Veidt
459	2022-08-07 03:06:25.578909	2022-08-07 03:06:25.578909	\N	Sydney Greenstreet
460	2022-08-07 03:06:25.579939	2022-08-07 03:06:25.579939	\N	Peter Lorre
461	2022-08-07 03:06:25.580884	2022-08-07 03:06:25.580884	\N	S.Z. Sakall
462	2022-08-07 03:06:25.581527	2022-08-07 03:06:25.581527	\N	Madeleine Lebeau
463	2022-08-07 03:06:25.582068	2022-08-07 03:06:25.582068	\N	Dooley Wilson
464	2022-08-07 03:06:25.582601	2022-08-07 03:06:25.582601	\N	Joy Page
465	2022-08-07 03:06:25.583135	2022-08-07 03:06:25.583135	\N	John Qualen
466	2022-08-07 03:06:25.583637	2022-08-07 03:06:25.583637	\N	Leonid Kinskey
467	2022-08-07 03:06:25.58418	2022-08-07 03:06:25.58418	\N	Curt Bois
468	2022-08-07 03:06:25.588559	2022-08-07 03:06:25.588559	\N	Anthony Perkins
469	2022-08-07 03:06:25.589222	2022-08-07 03:06:25.589222	\N	Vera Miles
470	2022-08-07 03:06:25.589985	2022-08-07 03:06:25.589985	\N	John Gavin
471	2022-08-07 03:06:25.590788	2022-08-07 03:06:25.590788	\N	Janet Leigh
472	2022-08-07 03:06:25.593574	2022-08-07 03:06:25.593574	\N	John McIntire
473	2022-08-07 03:06:25.594744	2022-08-07 03:06:25.594744	\N	Simon Oakland
474	2022-08-07 03:06:25.596064	2022-08-07 03:06:25.596064	\N	Patricia Hitchcock
475	2022-08-07 03:06:25.596757	2022-08-07 03:06:25.596757	\N	Vaughn Taylor
476	2022-08-07 03:06:25.597504	2022-08-07 03:06:25.597504	\N	Lurene Tuttle
477	2022-08-07 03:06:25.598764	2022-08-07 03:06:25.598764	\N	John Anderson
478	2022-08-07 03:06:25.59964	2022-08-07 03:06:25.59964	\N	Mort Mills
479	2022-08-07 03:06:25.604303	2022-08-07 03:06:25.604303	\N	Claudia Cardinale
480	2022-08-07 03:06:25.605383	2022-08-07 03:06:25.605383	\N	Jason Robards
481	2022-08-07 03:06:25.606035	2022-08-07 03:06:25.606035	\N	Charles Bronson
482	2022-08-07 03:06:25.606695	2022-08-07 03:06:25.606695	\N	Gabriele Ferzetti
483	2022-08-07 03:06:25.607499	2022-08-07 03:06:25.607499	\N	Paolo Stoppa
484	2022-08-07 03:06:25.608374	2022-08-07 03:06:25.608374	\N	Woody Strode
485	2022-08-07 03:06:25.609417	2022-08-07 03:06:25.609417	\N	Jack Elam
486	2022-08-07 03:06:25.610438	2022-08-07 03:06:25.610438	\N	Keenan Wynn
487	2022-08-07 03:06:25.61114	2022-08-07 03:06:25.61114	\N	Frank Wolff
488	2022-08-07 03:06:25.612313	2022-08-07 03:06:25.612313	\N	Lionel Stander
489	2022-08-07 03:06:25.616623	2022-08-07 03:06:25.616623	\N	Michael J. Fox
490	2022-08-07 03:06:25.617462	2022-08-07 03:06:25.617462	\N	Christopher Lloyd
491	2022-08-07 03:06:25.618099	2022-08-07 03:06:25.618099	\N	Lea Thompson
492	2022-08-07 03:06:25.618625	2022-08-07 03:06:25.618625	\N	Crispin Glover
493	2022-08-07 03:06:25.619182	2022-08-07 03:06:25.619182	\N	Thomas F. Wilson
494	2022-08-07 03:06:25.619755	2022-08-07 03:06:25.619755	\N	Claudia Wells
495	2022-08-07 03:06:25.620317	2022-08-07 03:06:25.620317	\N	Marc McClure
496	2022-08-07 03:06:25.620861	2022-08-07 03:06:25.620861	\N	Wendie Jo Sperber
497	2022-08-07 03:06:25.621397	2022-08-07 03:06:25.621397	\N	George DiCenzo
498	2022-08-07 03:06:25.621966	2022-08-07 03:06:25.621966	\N	Frances Lee McCain
499	2022-08-07 03:06:25.622491	2022-08-07 03:06:25.622491	\N	James Tolkan
500	2022-08-07 03:06:25.623087	2022-08-07 03:06:25.623087	\N	J.J. Cohen
501	2022-08-07 03:06:25.623665	2022-08-07 03:06:25.623665	\N	Casey Siemaszko
502	2022-08-07 03:06:25.624236	2022-08-07 03:06:25.624236	\N	Billy Zane
503	2022-08-07 03:06:25.624897	2022-08-07 03:06:25.624897	\N	Harry Waters Jr.
504	2022-08-07 03:06:25.631766	2022-08-07 03:06:25.631766	\N	Tsutomu Tatsumi
505	2022-08-07 03:06:25.632801	2022-08-07 03:06:25.632801	\N	Ayano Shiraishi
506	2022-08-07 03:06:25.633379	2022-08-07 03:06:25.633379	\N	Yoshiko Shinohara
507	2022-08-07 03:06:25.633923	2022-08-07 03:06:25.633923	\N	Akemi Yamaguchi
508	2022-08-07 03:06:25.636058	2022-08-07 03:06:25.636058	\N	Tadashi Nakamura
509	2022-08-07 03:06:25.63665	2022-08-07 03:06:25.63665	\N	Marcy Bannor
510	2022-08-07 03:06:25.637184	2022-08-07 03:06:25.637184	\N	Shelley Calene-Black
511	2022-08-07 03:06:25.637993	2022-08-07 03:06:25.637993	\N	Luci Christian
512	2022-08-07 03:06:25.638756	2022-08-07 03:06:25.638756	\N	Shannon Conley
513	2022-08-07 03:06:25.639902	2022-08-07 03:06:25.639902	\N	Justin Doran
514	2022-08-07 03:06:25.640674	2022-08-07 03:06:25.640674	\N	Crispin Freeman
515	2022-08-07 03:06:25.641575	2022-08-07 03:06:25.641575	\N	Adam Gibbs
516	2022-08-07 03:06:25.642397	2022-08-07 03:06:25.642397	\N	Dan Green
517	2022-08-07 03:06:25.643171	2022-08-07 03:06:25.643171	\N	Amy Jones
518	2022-08-07 03:06:25.643821	2022-08-07 03:06:25.643821	\N	Susan O. Koozin
519	2022-08-07 03:06:25.648437	2022-08-07 03:06:25.648437	\N	Antonella Attili
520	2022-08-07 03:06:25.649568	2022-08-07 03:06:25.649568	\N	Enzo Cannavale
521	2022-08-07 03:06:25.650163	2022-08-07 03:06:25.650163	\N	Isa Danieli
522	2022-08-07 03:06:25.650734	2022-08-07 03:06:25.650734	\N	Leo Gullotta
523	2022-08-07 03:06:25.651367	2022-08-07 03:06:25.651367	\N	Marco Leonardi
524	2022-08-07 03:06:25.651945	2022-08-07 03:06:25.651945	\N	Pupella Maggio
525	2022-08-07 03:06:25.652477	2022-08-07 03:06:25.652477	\N	Agnese Nano
526	2022-08-07 03:06:25.653133	2022-08-07 03:06:25.653133	\N	Leopoldo Trieste
527	2022-08-07 03:06:25.654118	2022-08-07 03:06:25.654118	\N	Salvatore Cascio
528	2022-08-07 03:06:25.65485	2022-08-07 03:06:25.65485	\N	Tano Cimarosa
529	2022-08-07 03:06:25.655744	2022-08-07 03:06:25.655744	\N	Nicola Di Pinto
530	2022-08-07 03:06:25.65659	2022-08-07 03:06:25.65659	\N	Roberta Lena
531	2022-08-07 03:06:25.657238	2022-08-07 03:06:25.657238	\N	Nino Terzo
532	2022-08-07 03:06:25.658575	2022-08-07 03:06:25.658575	\N	Jacques Perrin
533	2022-08-07 03:06:25.659435	2022-08-07 03:06:25.659435	\N	Philippe Noiret
534	2022-08-07 03:06:25.664618	2022-08-07 03:06:25.664618	\N	Arnold Schwarzenegger
535	2022-08-07 03:06:25.665681	2022-08-07 03:06:25.665681	\N	Linda Hamilton
536	2022-08-07 03:06:25.666737	2022-08-07 03:06:25.666737	\N	Edward Furlong
537	2022-08-07 03:06:25.667348	2022-08-07 03:06:25.667348	\N	Robert Patrick
538	2022-08-07 03:06:25.667912	2022-08-07 03:06:25.667912	\N	Earl Boen
539	2022-08-07 03:06:25.668458	2022-08-07 03:06:25.668458	\N	Joe Morton
540	2022-08-07 03:06:25.669005	2022-08-07 03:06:25.669005	\N	S. Epatha Merkerson
541	2022-08-07 03:06:25.669537	2022-08-07 03:06:25.669537	\N	Castulo Guerra
542	2022-08-07 03:06:25.670044	2022-08-07 03:06:25.670044	\N	Danny Cooksey
543	2022-08-07 03:06:25.670567	2022-08-07 03:06:25.670567	\N	Jenette Goldstein
544	2022-08-07 03:06:25.671076	2022-08-07 03:06:25.671076	\N	Xander Berkeley
545	2022-08-07 03:06:25.671569	2022-08-07 03:06:25.671569	\N	Leslie Hamilton Gearren
546	2022-08-07 03:06:25.672063	2022-08-07 03:06:25.672063	\N	Ken Gibbel
547	2022-08-07 03:06:25.672603	2022-08-07 03:06:25.672603	\N	Robert Winley
548	2022-08-07 03:06:25.673122	2022-08-07 03:06:25.673122	\N	Peter Schrum
549	2022-08-07 03:06:25.678673	2022-08-07 03:06:25.678673	\N	Rowan Atkinson
550	2022-08-07 03:06:25.679425	2022-08-07 03:06:25.679425	\N	Matthew Broderick
551	2022-08-07 03:06:25.679996	2022-08-07 03:06:25.679996	\N	Niketa Calame-Harris
552	2022-08-07 03:06:25.680661	2022-08-07 03:06:25.680661	\N	Jim Cummings
553	2022-08-07 03:06:25.681765	2022-08-07 03:06:25.681765	\N	Whoopi Goldberg
554	2022-08-07 03:06:25.682888	2022-08-07 03:06:25.682888	\N	Robert Guillaume
555	2022-08-07 03:06:25.683406	2022-08-07 03:06:25.683406	\N	Jeremy Irons
556	2022-08-07 03:06:25.683912	2022-08-07 03:06:25.683912	\N	James Earl Jones
557	2022-08-07 03:06:25.684475	2022-08-07 03:06:25.684475	\N	Moira Kelly
558	2022-08-07 03:06:25.685385	2022-08-07 03:06:25.685385	\N	Nathan Lane
559	2022-08-07 03:06:25.686296	2022-08-07 03:06:25.686296	\N	Zoe Leader
560	2022-08-07 03:06:25.686882	2022-08-07 03:06:25.686882	\N	Cheech Marin
561	2022-08-07 03:06:25.687499	2022-08-07 03:06:25.687499	\N	Ernie Sabella
562	2022-08-07 03:06:25.688187	2022-08-07 03:06:25.688187	\N	Madge Sinclair
563	2022-08-07 03:06:25.688985	2022-08-07 03:06:25.688985	\N	Jonathan Taylor Thomas
564	2022-08-07 03:06:25.693952	2022-08-07 03:06:25.693952	\N	Jean Reno
565	2022-08-07 03:06:25.695619	2022-08-07 03:06:25.695619	\N	Natalie Portman
566	2022-08-07 03:06:25.696368	2022-08-07 03:06:25.696368	\N	Danny Aiello
567	2022-08-07 03:06:25.697204	2022-08-07 03:06:25.697204	\N	Peter Appel
568	2022-08-07 03:06:25.698439	2022-08-07 03:06:25.698439	\N	Willi One Blood
569	2022-08-07 03:06:25.699496	2022-08-07 03:06:25.699496	\N	Don Creech
570	2022-08-07 03:06:25.701545	2022-08-07 03:06:25.701545	\N	Keith A. Glascoe
571	2022-08-07 03:06:25.702203	2022-08-07 03:06:25.702203	\N	Randolph Scott
572	2022-08-07 03:06:25.703502	2022-08-07 03:06:25.703502	\N	Michael Badalucco
573	2022-08-07 03:06:25.704191	2022-08-07 03:06:25.704191	\N	Ellen Greene
574	2022-08-07 03:06:25.704927	2022-08-07 03:06:25.704927	\N	Elizabeth Regen
575	2022-08-07 03:06:25.705662	2022-08-07 03:06:25.705662	\N	Carl J. Matusovich
576	2022-08-07 03:06:25.706541	2022-08-07 03:06:25.706541	\N	Frank Senger
577	2022-08-07 03:06:25.70751	2022-08-07 03:06:25.70751	\N	Lucius Wyatt Cherokee
578	2022-08-07 03:06:25.711748	2022-08-07 03:06:25.711748	\N	Stephen Baldwin
579	2022-08-07 03:06:25.712822	2022-08-07 03:06:25.712822	\N	Gabriel Byrne
580	2022-08-07 03:06:25.713783	2022-08-07 03:06:25.713783	\N	Benicio Del Toro
581	2022-08-07 03:06:25.714674	2022-08-07 03:06:25.714674	\N	Kevin Pollak
582	2022-08-07 03:06:25.715261	2022-08-07 03:06:25.715261	\N	Kevin Spacey
583	2022-08-07 03:06:25.715829	2022-08-07 03:06:25.715829	\N	Chazz Palminteri
584	2022-08-07 03:06:25.716747	2022-08-07 03:06:25.716747	\N	Suzy Amis
585	2022-08-07 03:06:25.717269	2022-08-07 03:06:25.717269	\N	Giancarlo Esposito
586	2022-08-07 03:06:25.717814	2022-08-07 03:06:25.717814	\N	Dan Hedaya
587	2022-08-07 03:06:25.718381	2022-08-07 03:06:25.718381	\N	Paul Bartel
588	2022-08-07 03:06:25.718899	2022-08-07 03:06:25.718899	\N	Carl Bressler
589	2022-08-07 03:06:25.719421	2022-08-07 03:06:25.719421	\N	Phillipe Simon
590	2022-08-07 03:06:25.719941	2022-08-07 03:06:25.719941	\N	Jack Shearer
591	2022-08-07 03:06:25.72044	2022-08-07 03:06:25.72044	\N	Christine Estabrook
592	2022-08-07 03:06:25.724199	2022-08-07 03:06:25.724199	\N	Beverly D'Angelo
593	2022-08-07 03:06:25.726498	2022-08-07 03:06:25.726498	\N	Jennifer Lien
594	2022-08-07 03:06:25.72718	2022-08-07 03:06:25.72718	\N	Ethan Suplee
595	2022-08-07 03:06:25.727702	2022-08-07 03:06:25.727702	\N	Fairuza Balk
596	2022-08-07 03:06:25.728441	2022-08-07 03:06:25.728441	\N	Avery Brooks
597	2022-08-07 03:06:25.729136	2022-08-07 03:06:25.729136	\N	Elliott Gould
598	2022-08-07 03:06:25.729902	2022-08-07 03:06:25.729902	\N	Stacy Keach
599	2022-08-07 03:06:25.731058	2022-08-07 03:06:25.731058	\N	William Russ
600	2022-08-07 03:06:25.731597	2022-08-07 03:06:25.731597	\N	Guy Torry
601	2022-08-07 03:06:25.732109	2022-08-07 03:06:25.732109	\N	Joe Cortese
602	2022-08-07 03:06:25.732598	2022-08-07 03:06:25.732598	\N	Jason Bose Smith
603	2022-08-07 03:06:25.733154	2022-08-07 03:06:25.733154	\N	Antonio David Lyons
604	2022-08-07 03:06:25.733737	2022-08-07 03:06:25.733737	\N	Alex Sol
605	2022-08-07 03:06:25.737889	2022-08-07 03:06:25.737889	\N	Russell Crowe
606	2022-08-07 03:06:25.739261	2022-08-07 03:06:25.739261	\N	Joaquin Phoenix
607	2022-08-07 03:06:25.739909	2022-08-07 03:06:25.739909	\N	Connie Nielsen
608	2022-08-07 03:06:25.740592	2022-08-07 03:06:25.740592	\N	Oliver Reed
609	2022-08-07 03:06:25.74125	2022-08-07 03:06:25.74125	\N	Richard Harris
610	2022-08-07 03:06:25.742221	2022-08-07 03:06:25.742221	\N	Derek Jacobi
611	2022-08-07 03:06:25.743063	2022-08-07 03:06:25.743063	\N	Djimon Hounsou
612	2022-08-07 03:06:25.743725	2022-08-07 03:06:25.743725	\N	David Schofield
613	2022-08-07 03:06:25.744627	2022-08-07 03:06:25.744627	\N	John Shrapnel
614	2022-08-07 03:06:25.745511	2022-08-07 03:06:25.745511	\N	Tomas Arana
615	2022-08-07 03:06:25.746347	2022-08-07 03:06:25.746347	\N	Ralf Moeller
616	2022-08-07 03:06:25.746915	2022-08-07 03:06:25.746915	\N	Spencer Treat Clark
617	2022-08-07 03:06:25.747414	2022-08-07 03:06:25.747414	\N	David Hemmings
618	2022-08-07 03:06:25.747911	2022-08-07 03:06:25.747911	\N	Tommy Flanagan
619	2022-08-07 03:06:25.748496	2022-08-07 03:06:25.748496	\N	Sven-Ole Thorsen
620	2022-08-07 03:06:25.751923	2022-08-07 03:06:25.751923	\N	Adrien Brody
621	2022-08-07 03:06:25.752418	2022-08-07 03:06:25.752418	\N	Emilia Fox
622	2022-08-07 03:06:25.75289	2022-08-07 03:06:25.75289	\N	Michal Zebrowski
623	2022-08-07 03:06:25.753329	2022-08-07 03:06:25.753329	\N	Ed Stoppard
624	2022-08-07 03:06:25.753826	2022-08-07 03:06:25.753826	\N	Maureen Lipman
625	2022-08-07 03:06:25.754275	2022-08-07 03:06:25.754275	\N	Frank Finlay
626	2022-08-07 03:06:25.754688	2022-08-07 03:06:25.754688	\N	Jessica Kate Meyer
627	2022-08-07 03:06:25.755135	2022-08-07 03:06:25.755135	\N	Julia Rayner
628	2022-08-07 03:06:25.755571	2022-08-07 03:06:25.755571	\N	Wanja Mues
629	2022-08-07 03:06:25.756081	2022-08-07 03:06:25.756081	\N	Richard Ridings
630	2022-08-07 03:06:25.75653	2022-08-07 03:06:25.75653	\N	Nomi Sharron
631	2022-08-07 03:06:25.757	2022-08-07 03:06:25.757	\N	Anthony Milner
632	2022-08-07 03:06:25.75754	2022-08-07 03:06:25.75754	\N	Lucy Skeaping
633	2022-08-07 03:06:25.758056	2022-08-07 03:06:25.758056	\N	Roddy Skeaping
634	2022-08-07 03:06:25.759686	2022-08-07 03:06:25.759686	\N	Ben Harlan
635	2022-08-07 03:06:25.766534	2022-08-07 03:06:25.766534	\N	Mark Wahlberg
636	2022-08-07 03:06:25.767199	2022-08-07 03:06:25.767199	\N	Martin Sheen
637	2022-08-07 03:06:25.767722	2022-08-07 03:06:25.767722	\N	Ray Winstone
638	2022-08-07 03:06:25.768237	2022-08-07 03:06:25.768237	\N	Vera Farmiga
639	2022-08-07 03:06:25.768678	2022-08-07 03:06:25.768678	\N	Anthony Anderson
640	2022-08-07 03:06:25.769203	2022-08-07 03:06:25.769203	\N	Alec Baldwin
641	2022-08-07 03:06:25.769665	2022-08-07 03:06:25.769665	\N	Kevin Corrigan
642	2022-08-07 03:06:25.770126	2022-08-07 03:06:25.770126	\N	James Badge Dale
643	2022-08-07 03:06:25.770693	2022-08-07 03:06:25.770693	\N	David O'Hara
644	2022-08-07 03:06:25.771556	2022-08-07 03:06:25.771556	\N	Robert Wahlberg
645	2022-08-07 03:06:25.77203	2022-08-07 03:06:25.77203	\N	Kristen Dalton
646	2022-08-07 03:06:25.777897	2022-08-07 03:06:25.777897	\N	Hugh Jackman
647	2022-08-07 03:06:25.779567	2022-08-07 03:06:25.779567	\N	Piper Perabo
648	2022-08-07 03:06:25.780318	2022-08-07 03:06:25.780318	\N	Rebecca Hall
649	2022-08-07 03:06:25.780871	2022-08-07 03:06:25.780871	\N	Scarlett Johansson
650	2022-08-07 03:06:25.781377	2022-08-07 03:06:25.781377	\N	Samantha Mahurin
651	2022-08-07 03:06:25.781839	2022-08-07 03:06:25.781839	\N	David Bowie
652	2022-08-07 03:06:25.782328	2022-08-07 03:06:25.782328	\N	Andy Serkis
653	2022-08-07 03:06:25.78279	2022-08-07 03:06:25.78279	\N	Daniel Davis
654	2022-08-07 03:06:25.783264	2022-08-07 03:06:25.783264	\N	Jim Piddock
655	2022-08-07 03:06:25.783735	2022-08-07 03:06:25.783735	\N	Christopher Neame
656	2022-08-07 03:06:25.784205	2022-08-07 03:06:25.784205	\N	Mark Ryan
657	2022-08-07 03:06:25.786209	2022-08-07 03:06:25.786209	\N	Roger Rees
658	2022-08-07 03:06:25.787345	2022-08-07 03:06:25.787345	\N	Jamie Harris
659	2022-08-07 03:06:25.790461	2022-08-07 03:06:25.790461	\N	François Cluzet
660	2022-08-07 03:06:25.791071	2022-08-07 03:06:25.791071	\N	Omar Sy
661	2022-08-07 03:06:25.791676	2022-08-07 03:06:25.791676	\N	Anne Le Ny
662	2022-08-07 03:06:25.793215	2022-08-07 03:06:25.793215	\N	Audrey Fleurot
663	2022-08-07 03:06:25.793931	2022-08-07 03:06:25.793931	\N	Joséphine de Meaux
664	2022-08-07 03:06:25.794587	2022-08-07 03:06:25.794587	\N	Clotilde Mollet
665	2022-08-07 03:06:25.795151	2022-08-07 03:06:25.795151	\N	Alba Gaïa Bellugi
666	2022-08-07 03:06:25.79618	2022-08-07 03:06:25.79618	\N	Cyril Mendy
667	2022-08-07 03:06:25.797149	2022-08-07 03:06:25.797149	\N	Salimata Kamate
668	2022-08-07 03:06:25.798125	2022-08-07 03:06:25.798125	\N	Absa Diatou Toure
669	2022-08-07 03:06:25.798863	2022-08-07 03:06:25.798863	\N	Grégoire Oestermann
670	2022-08-07 03:06:25.799469	2022-08-07 03:06:25.799469	\N	Dominique Daguier
671	2022-08-07 03:06:25.800009	2022-08-07 03:06:25.800009	\N	François Caron
672	2022-08-07 03:06:25.800556	2022-08-07 03:06:25.800556	\N	Christian Ameri
673	2022-08-07 03:06:25.801025	2022-08-07 03:06:25.801025	\N	Thomas Solivérès
674	2022-08-07 03:06:25.80415	2022-08-07 03:06:25.80415	\N	Miles Teller
675	2022-08-07 03:06:25.804707	2022-08-07 03:06:25.804707	\N	J.K. Simmons
676	2022-08-07 03:06:25.805224	2022-08-07 03:06:25.805224	\N	Paul Reiser
677	2022-08-07 03:06:25.80574	2022-08-07 03:06:25.80574	\N	Melissa Benoist
678	2022-08-07 03:06:25.806283	2022-08-07 03:06:25.806283	\N	Austin Stowell
679	2022-08-07 03:06:25.806757	2022-08-07 03:06:25.806757	\N	Nate Lang
680	2022-08-07 03:06:25.807243	2022-08-07 03:06:25.807243	\N	Chris Mulkey
681	2022-08-07 03:06:25.807709	2022-08-07 03:06:25.807709	\N	Damon Gupton
682	2022-08-07 03:06:25.80832	2022-08-07 03:06:25.80832	\N	Suanne Spoke
683	2022-08-07 03:06:25.808891	2022-08-07 03:06:25.808891	\N	Max Kasch
684	2022-08-07 03:06:25.809416	2022-08-07 03:06:25.809416	\N	Charlie Ian
685	2022-08-07 03:06:25.809945	2022-08-07 03:06:25.809945	\N	Jayson Blair
686	2022-08-07 03:06:25.81067	2022-08-07 03:06:25.81067	\N	Kofi Siriboe
687	2022-08-07 03:06:25.811503	2022-08-07 03:06:25.811503	\N	Kavita Patil
688	2022-08-07 03:06:25.81212	2022-08-07 03:06:25.81212	\N	C.J. Vana
689	2022-08-07 03:06:25.816052	2022-08-07 03:06:25.816052	\N	Zazie Beetz
690	2022-08-07 03:06:25.816619	2022-08-07 03:06:25.816619	\N	Frances Conroy
691	2022-08-07 03:06:25.817091	2022-08-07 03:06:25.817091	\N	Brett Cullen
692	2022-08-07 03:06:25.817557	2022-08-07 03:06:25.817557	\N	Shea Whigham
693	2022-08-07 03:06:25.818001	2022-08-07 03:06:25.818001	\N	Bill Camp
694	2022-08-07 03:06:25.818481	2022-08-07 03:06:25.818481	\N	Glenn Fleshler
695	2022-08-07 03:06:25.81893	2022-08-07 03:06:25.81893	\N	Leigh Gill
696	2022-08-07 03:06:25.819358	2022-08-07 03:06:25.819358	\N	Josh Pais
697	2022-08-07 03:06:25.819836	2022-08-07 03:06:25.819836	\N	Rocco Luna
698	2022-08-07 03:06:25.820288	2022-08-07 03:06:25.820288	\N	Marc Maron
699	2022-08-07 03:06:25.820725	2022-08-07 03:06:25.820725	\N	Sondra James
700	2022-08-07 03:06:25.821166	2022-08-07 03:06:25.821166	\N	Murphy Guyer
701	2022-08-07 03:06:25.821598	2022-08-07 03:06:25.821598	\N	Douglas Hodge
702	2022-08-07 03:06:25.826401	2022-08-07 03:06:25.826401	\N	Jack Oakie
703	2022-08-07 03:06:25.827076	2022-08-07 03:06:25.827076	\N	Reginald Gardiner
704	2022-08-07 03:06:25.827586	2022-08-07 03:06:25.827586	\N	Henry Daniell
705	2022-08-07 03:06:25.828172	2022-08-07 03:06:25.828172	\N	Billy Gilbert
706	2022-08-07 03:06:25.828836	2022-08-07 03:06:25.828836	\N	Grace Hayle
707	2022-08-07 03:06:25.829538	2022-08-07 03:06:25.829538	\N	Carter DeHaven
708	2022-08-07 03:06:25.830735	2022-08-07 03:06:25.830735	\N	Maurice Moscovitch
709	2022-08-07 03:06:25.831276	2022-08-07 03:06:25.831276	\N	Emma Dunn
710	2022-08-07 03:06:25.831776	2022-08-07 03:06:25.831776	\N	Bernard Gorcey
711	2022-08-07 03:06:25.832267	2022-08-07 03:06:25.832267	\N	Paul Weigel
712	2022-08-07 03:06:25.833089	2022-08-07 03:06:25.833089	\N	Esther Michelson
713	2022-08-07 03:06:25.836453	2022-08-07 03:06:25.836453	\N	William Holden
714	2022-08-07 03:06:25.837031	2022-08-07 03:06:25.837031	\N	Gloria Swanson
715	2022-08-07 03:06:25.837557	2022-08-07 03:06:25.837557	\N	Erich von Stroheim
716	2022-08-07 03:06:25.838074	2022-08-07 03:06:25.838074	\N	Nancy Olson
717	2022-08-07 03:06:25.838629	2022-08-07 03:06:25.838629	\N	Fred Clark
718	2022-08-07 03:06:25.83912	2022-08-07 03:06:25.83912	\N	Lloyd Gough
719	2022-08-07 03:06:25.839709	2022-08-07 03:06:25.839709	\N	Jack Webb
720	2022-08-07 03:06:25.84018	2022-08-07 03:06:25.84018	\N	Franklyn Farnum
721	2022-08-07 03:06:25.840666	2022-08-07 03:06:25.840666	\N	Larry J. Blake
722	2022-08-07 03:06:25.841195	2022-08-07 03:06:25.841195	\N	Charles Dayton
723	2022-08-07 03:06:25.841766	2022-08-07 03:06:25.841766	\N	Cecil B. DeMille
724	2022-08-07 03:06:25.842399	2022-08-07 03:06:25.842399	\N	Hedda Hopper
725	2022-08-07 03:06:25.842929	2022-08-07 03:06:25.842929	\N	Buster Keaton
726	2022-08-07 03:06:25.843422	2022-08-07 03:06:25.843422	\N	Anna Q. Nilsson
727	2022-08-07 03:06:25.847472	2022-08-07 03:06:25.847472	\N	Grace Kelly
728	2022-08-07 03:06:25.848021	2022-08-07 03:06:25.848021	\N	Wendell Corey
729	2022-08-07 03:06:25.848477	2022-08-07 03:06:25.848477	\N	Thelma Ritter
730	2022-08-07 03:06:25.848924	2022-08-07 03:06:25.848924	\N	Raymond Burr
731	2022-08-07 03:06:25.849368	2022-08-07 03:06:25.849368	\N	Judith Evelyn
732	2022-08-07 03:06:25.849804	2022-08-07 03:06:25.849804	\N	Ross Bagdasarian
733	2022-08-07 03:06:25.850229	2022-08-07 03:06:25.850229	\N	Georgine Darcy
734	2022-08-07 03:06:25.850664	2022-08-07 03:06:25.850664	\N	Sara Berner
735	2022-08-07 03:06:25.851087	2022-08-07 03:06:25.851087	\N	Frank Cady
736	2022-08-07 03:06:25.852061	2022-08-07 03:06:25.852061	\N	Jesslyn Fax
737	2022-08-07 03:06:25.852544	2022-08-07 03:06:25.852544	\N	Rand Harper
738	2022-08-07 03:06:25.853008	2022-08-07 03:06:25.853008	\N	Irene Winston
739	2022-08-07 03:06:25.85358	2022-08-07 03:06:25.85358	\N	Havis Davenport
740	2022-08-07 03:06:25.855791	2022-08-07 03:06:25.855791	\N	Kirk Douglas
741	2022-08-07 03:06:25.856334	2022-08-07 03:06:25.856334	\N	Ralph Meeker
742	2022-08-07 03:06:25.856874	2022-08-07 03:06:25.856874	\N	Adolphe Menjou
743	2022-08-07 03:06:25.857369	2022-08-07 03:06:25.857369	\N	George Macready
744	2022-08-07 03:06:25.858973	2022-08-07 03:06:25.858973	\N	Wayne Morris
745	2022-08-07 03:06:25.860741	2022-08-07 03:06:25.860741	\N	Richard Anderson
746	2022-08-07 03:06:25.861397	2022-08-07 03:06:25.861397	\N	Joe Turkel
747	2022-08-07 03:06:25.861957	2022-08-07 03:06:25.861957	\N	Christiane Kubrick
748	2022-08-07 03:06:25.862646	2022-08-07 03:06:25.862646	\N	Jerry Hausner
749	2022-08-07 03:06:25.863358	2022-08-07 03:06:25.863358	\N	Peter Capell
750	2022-08-07 03:06:25.863838	2022-08-07 03:06:25.863838	\N	Emile Meyer
751	2022-08-07 03:06:25.864291	2022-08-07 03:06:25.864291	\N	Bert Freed
752	2022-08-07 03:06:25.864746	2022-08-07 03:06:25.864746	\N	Kem Dibbs
753	2022-08-07 03:06:25.865202	2022-08-07 03:06:25.865202	\N	Timothy Carey
754	2022-08-07 03:06:25.865649	2022-08-07 03:06:25.865649	\N	Fred Bell
755	2022-08-07 03:06:25.86829	2022-08-07 03:06:25.86829	\N	Tyrone Power
756	2022-08-07 03:06:25.868787	2022-08-07 03:06:25.868787	\N	Marlene Dietrich
757	2022-08-07 03:06:25.869269	2022-08-07 03:06:25.869269	\N	Charles Laughton
758	2022-08-07 03:06:25.869727	2022-08-07 03:06:25.869727	\N	Elsa Lanchester
759	2022-08-07 03:06:25.870167	2022-08-07 03:06:25.870167	\N	John Williams
760	2022-08-07 03:06:25.870944	2022-08-07 03:06:25.870944	\N	Ian Wolfe
761	2022-08-07 03:06:25.871379	2022-08-07 03:06:25.871379	\N	Torin Thatcher
762	2022-08-07 03:06:25.87182	2022-08-07 03:06:25.87182	\N	Norma Varden
763	2022-08-07 03:06:25.872256	2022-08-07 03:06:25.872256	\N	Una O'Connor
764	2022-08-07 03:06:25.872768	2022-08-07 03:06:25.872768	\N	Francis Compton
765	2022-08-07 03:06:25.873231	2022-08-07 03:06:25.873231	\N	Philip Tonge
766	2022-08-07 03:06:25.873659	2022-08-07 03:06:25.873659	\N	Ruta Lee
767	2022-08-07 03:06:25.875772	2022-08-07 03:06:25.875772	\N	Peter Sellers
768	2022-08-07 03:06:25.876438	2022-08-07 03:06:25.876438	\N	George C. Scott
769	2022-08-07 03:06:25.878489	2022-08-07 03:06:25.878489	\N	Slim Pickens
770	2022-08-07 03:06:25.87943	2022-08-07 03:06:25.87943	\N	Peter Bull
771	2022-08-07 03:06:25.880502	2022-08-07 03:06:25.880502	\N	Tracy Reed
772	2022-08-07 03:06:25.881079	2022-08-07 03:06:25.881079	\N	Jack Creley
773	2022-08-07 03:06:25.881585	2022-08-07 03:06:25.881585	\N	Frank Berry
774	2022-08-07 03:06:25.88205	2022-08-07 03:06:25.88205	\N	Robert O'Neil
775	2022-08-07 03:06:25.882578	2022-08-07 03:06:25.882578	\N	Glenn Beck
776	2022-08-07 03:06:25.883033	2022-08-07 03:06:25.883033	\N	Roy Stephens
777	2022-08-07 03:06:25.883911	2022-08-07 03:06:25.883911	\N	Shane Rimmer
778	2022-08-07 03:06:25.884426	2022-08-07 03:06:25.884426	\N	Hal Galili
779	2022-08-07 03:06:25.886915	2022-08-07 03:06:25.886915	\N	Tom Skerritt
780	2022-08-07 03:06:25.887483	2022-08-07 03:06:25.887483	\N	Sigourney Weaver
781	2022-08-07 03:06:25.888042	2022-08-07 03:06:25.888042	\N	Veronica Cartwright
782	2022-08-07 03:06:25.888866	2022-08-07 03:06:25.888866	\N	John Hurt
783	2022-08-07 03:06:25.889607	2022-08-07 03:06:25.889607	\N	Yaphet Kotto
784	2022-08-07 03:06:25.890017	2022-08-07 03:06:25.890017	\N	Bolaji Badejo
785	2022-08-07 03:06:25.890443	2022-08-07 03:06:25.890443	\N	Helen Horton
786	2022-08-07 03:06:25.897306	2022-08-07 03:06:25.897306	\N	Frederic Forrest
787	2022-08-07 03:06:25.898518	2022-08-07 03:06:25.898518	\N	Sam Bottoms
788	2022-08-07 03:06:25.899501	2022-08-07 03:06:25.899501	\N	Albert Hall
789	2022-08-07 03:06:25.900491	2022-08-07 03:06:25.900491	\N	Dennis Hopper
790	2022-08-07 03:06:25.901341	2022-08-07 03:06:25.901341	\N	Jerry Ziesmer
791	2022-08-07 03:06:25.902187	2022-08-07 03:06:25.902187	\N	Bo Byers
792	2022-08-07 03:06:25.903735	2022-08-07 03:06:25.903735	\N	James Keane
793	2022-08-07 03:06:25.904267	2022-08-07 03:06:25.904267	\N	Kerry Rossall
794	2022-08-07 03:06:25.908386	2022-08-07 03:06:25.908386	\N	Shelley Duvall
795	2022-08-07 03:06:25.909504	2022-08-07 03:06:25.909504	\N	Danny Lloyd
796	2022-08-07 03:06:25.910879	2022-08-07 03:06:25.910879	\N	Barry Nelson
797	2022-08-07 03:06:25.911614	2022-08-07 03:06:25.911614	\N	Philip Stone
798	2022-08-07 03:06:25.943707	2022-08-07 03:06:25.943707	\N	Anne Jackson
799	2022-08-07 03:06:25.982241	2022-08-07 03:06:25.982241	\N	Tony Burton
800	2022-08-07 03:06:25.983191	2022-08-07 03:06:25.983191	\N	Lia Beldam
801	2022-08-07 03:06:25.983811	2022-08-07 03:06:25.983811	\N	Billie Gibson
802	2022-08-07 03:06:25.984386	2022-08-07 03:06:25.984386	\N	Barry Dennen
803	2022-08-07 03:06:25.985071	2022-08-07 03:06:25.985071	\N	David Baxt
804	2022-08-07 03:06:25.986245	2022-08-07 03:06:25.986245	\N	Manning Redwood
805	2022-08-07 03:06:25.987048	2022-08-07 03:06:25.987048	\N	Lisa Burns
806	2022-08-07 03:06:25.991465	2022-08-07 03:06:25.991465	\N	Karen Allen
807	2022-08-07 03:06:25.993615	2022-08-07 03:06:25.993615	\N	Paul Freeman
808	2022-08-07 03:06:25.99473	2022-08-07 03:06:25.99473	\N	Ronald Lacey
809	2022-08-07 03:06:25.996399	2022-08-07 03:06:25.996399	\N	John Rhys-Davies
810	2022-08-07 03:06:25.997826	2022-08-07 03:06:25.997826	\N	Denholm Elliott
811	2022-08-07 03:06:26.000051	2022-08-07 03:06:26.000051	\N	Alfred Molina
812	2022-08-07 03:06:26.001691	2022-08-07 03:06:26.001691	\N	Wolf Kahler
813	2022-08-07 03:06:26.002822	2022-08-07 03:06:26.002822	\N	Anthony Higgins
814	2022-08-07 03:06:26.003954	2022-08-07 03:06:26.003954	\N	Vic Tablian
815	2022-08-07 03:06:26.004614	2022-08-07 03:06:26.004614	\N	Don Fellows
816	2022-08-07 03:06:26.00521	2022-08-07 03:06:26.00521	\N	William Hootkins
817	2022-08-07 03:06:26.005819	2022-08-07 03:06:26.005819	\N	Bill Reimbold
818	2022-08-07 03:06:26.008376	2022-08-07 03:06:26.008376	\N	Fred Sorenson
819	2022-08-07 03:06:26.010802	2022-08-07 03:06:26.010802	\N	Patrick Durkin
820	2022-08-07 03:06:26.018305	2022-08-07 03:06:26.018305	\N	James Woods
821	2022-08-07 03:06:26.01901	2022-08-07 03:06:26.01901	\N	Elizabeth McGovern
822	2022-08-07 03:06:26.019509	2022-08-07 03:06:26.019509	\N	Treat Williams
823	2022-08-07 03:06:26.019993	2022-08-07 03:06:26.019993	\N	Tuesday Weld
824	2022-08-07 03:06:26.020459	2022-08-07 03:06:26.020459	\N	Burt Young
825	2022-08-07 03:06:26.022051	2022-08-07 03:06:26.022051	\N	William Forsythe
826	2022-08-07 03:06:26.023153	2022-08-07 03:06:26.023153	\N	James Hayden
827	2022-08-07 03:06:26.024335	2022-08-07 03:06:26.024335	\N	Darlanne Fluegel
828	2022-08-07 03:06:26.025935	2022-08-07 03:06:26.025935	\N	Larry Rapp
829	2022-08-07 03:06:26.026577	2022-08-07 03:06:26.026577	\N	Dutch Miller
830	2022-08-07 03:06:26.027206	2022-08-07 03:06:26.027206	\N	Robert Harper
831	2022-08-07 03:06:26.031147	2022-08-07 03:06:26.031147	\N	Billy Crudup
832	2022-08-07 03:06:26.03171	2022-08-07 03:06:26.03171	\N	Billy Bob Thornton
833	2022-08-07 03:06:26.032168	2022-08-07 03:06:26.032168	\N	Minnie Driver
834	2022-08-07 03:06:26.032638	2022-08-07 03:06:26.032638	\N	John DiMaggio
835	2022-08-07 03:06:26.033085	2022-08-07 03:06:26.033085	\N	Claire Danes
836	2022-08-07 03:06:26.033522	2022-08-07 03:06:26.033522	\N	John DeMita
837	2022-08-07 03:06:26.033981	2022-08-07 03:06:26.033981	\N	Jada Pinkett Smith
838	2022-08-07 03:06:26.034433	2022-08-07 03:06:26.034433	\N	Gillian Anderson
839	2022-08-07 03:06:26.035135	2022-08-07 03:06:26.035135	\N	Keith David
840	2022-08-07 03:06:26.035659	2022-08-07 03:06:26.035659	\N	Corey Burton
841	2022-08-07 03:06:26.036157	2022-08-07 03:06:26.036157	\N	Tara Strong
842	2022-08-07 03:06:26.036701	2022-08-07 03:06:26.036701	\N	Julia Fletcher
843	2022-08-07 03:06:26.037355	2022-08-07 03:06:26.037355	\N	Debi Derryberry
844	2022-08-07 03:06:26.037789	2022-08-07 03:06:26.037789	\N	Alex Fernandez
845	2022-08-07 03:06:26.038229	2022-08-07 03:06:26.038229	\N	Jack Fletcher
846	2022-08-07 03:06:26.04065	2022-08-07 03:06:26.04065	\N	Guy Pearce
847	2022-08-07 03:06:26.042817	2022-08-07 03:06:26.042817	\N	Mark Boone Junior
848	2022-08-07 03:06:26.043475	2022-08-07 03:06:26.043475	\N	Russ Fega
849	2022-08-07 03:06:26.04436	2022-08-07 03:06:26.04436	\N	Jorja Fox
850	2022-08-07 03:06:26.044972	2022-08-07 03:06:26.044972	\N	Stephen Tobolowsky
851	2022-08-07 03:06:26.045873	2022-08-07 03:06:26.045873	\N	Harriet Sansom Harris
852	2022-08-07 03:06:26.046617	2022-08-07 03:06:26.046617	\N	Thomas Lennon
853	2022-08-07 03:06:26.047163	2022-08-07 03:06:26.047163	\N	Callum Keith Rennie
854	2022-08-07 03:06:26.047575	2022-08-07 03:06:26.047575	\N	Kimberly Campbell
855	2022-08-07 03:06:26.047949	2022-08-07 03:06:26.047949	\N	Marianne Muellerleile
856	2022-08-07 03:06:26.048325	2022-08-07 03:06:26.048325	\N	Larry Holden
857	2022-08-07 03:06:26.050964	2022-08-07 03:06:26.050964	\N	Min-sik Choi
858	2022-08-07 03:06:26.051453	2022-08-07 03:06:26.051453	\N	Ji-Tae Yoo
859	2022-08-07 03:06:26.051892	2022-08-07 03:06:26.051892	\N	Hye-jeong Kang
860	2022-08-07 03:06:26.052349	2022-08-07 03:06:26.052349	\N	Dae-han Ji
861	2022-08-07 03:06:26.052796	2022-08-07 03:06:26.052796	\N	Dal-su Oh
862	2022-08-07 03:06:26.05329	2022-08-07 03:06:26.05329	\N	Byeong-ok Kim
863	2022-08-07 03:06:26.053795	2022-08-07 03:06:26.053795	\N	Seung-shin Lee
864	2022-08-07 03:06:26.054277	2022-08-07 03:06:26.054277	\N	Jin-Seo Yoon
865	2022-08-07 03:06:26.054718	2022-08-07 03:06:26.054718	\N	Dae-yeon Lee
866	2022-08-07 03:06:26.055603	2022-08-07 03:06:26.055603	\N	Kwang-rok Oh
867	2022-08-07 03:06:26.056443	2022-08-07 03:06:26.056443	\N	Tae-kyung Oh
868	2022-08-07 03:06:26.056992	2022-08-07 03:06:26.056992	\N	Yeon-Seok Yoo
869	2022-08-07 03:06:26.057529	2022-08-07 03:06:26.057529	\N	Il-han Oo
870	2022-08-07 03:06:26.058101	2022-08-07 03:06:26.058101	\N	Su-hyeon Kim
871	2022-08-07 03:06:26.058704	2022-08-07 03:06:26.058704	\N	Seung-jin Lee
872	2022-08-07 03:06:26.064694	2022-08-07 03:06:26.064694	\N	Martina Gedeck
873	2022-08-07 03:06:26.065331	2022-08-07 03:06:26.065331	\N	Ulrich Mühe
874	2022-08-07 03:06:26.065838	2022-08-07 03:06:26.065838	\N	Sebastian Koch
875	2022-08-07 03:06:26.066347	2022-08-07 03:06:26.066347	\N	Ulrich Tukur
876	2022-08-07 03:06:26.066833	2022-08-07 03:06:26.066833	\N	Thomas Thieme
877	2022-08-07 03:06:26.067342	2022-08-07 03:06:26.067342	\N	Hans-Uwe Bauer
878	2022-08-07 03:06:26.067906	2022-08-07 03:06:26.067906	\N	Volkmar Kleinert
879	2022-08-07 03:06:26.068364	2022-08-07 03:06:26.068364	\N	Matthias Brenner
880	2022-08-07 03:06:26.068824	2022-08-07 03:06:26.068824	\N	Charly Hübner
881	2022-08-07 03:06:26.069276	2022-08-07 03:06:26.069276	\N	Herbert Knaup
882	2022-08-07 03:06:26.069728	2022-08-07 03:06:26.069728	\N	Bastian Trost
883	2022-08-07 03:06:26.070688	2022-08-07 03:06:26.070688	\N	Marie Gruber
884	2022-08-07 03:06:26.071755	2022-08-07 03:06:26.071755	\N	Volker Michalowski
885	2022-08-07 03:06:26.072234	2022-08-07 03:06:26.072234	\N	Werner Daehn
886	2022-08-07 03:06:26.072818	2022-08-07 03:06:26.072818	\N	Martin Brambach
887	2022-08-07 03:06:26.077271	2022-08-07 03:06:26.077271	\N	Ben Burtt
888	2022-08-07 03:06:26.078121	2022-08-07 03:06:26.078121	\N	Elissa Knight
889	2022-08-07 03:06:26.078878	2022-08-07 03:06:26.078878	\N	Jeff Garlin
890	2022-08-07 03:06:26.079498	2022-08-07 03:06:26.079498	\N	Fred Willard
891	2022-08-07 03:06:26.079931	2022-08-07 03:06:26.079931	\N	MacInTalk
892	2022-08-07 03:06:26.081177	2022-08-07 03:06:26.081177	\N	John Ratzenberger
893	2022-08-07 03:06:26.081602	2022-08-07 03:06:26.081602	\N	Kathy Najimy
894	2022-08-07 03:06:26.082365	2022-08-07 03:06:26.082365	\N	Teddy Newton
895	2022-08-07 03:06:26.082841	2022-08-07 03:06:26.082841	\N	Bob Bergen
896	2022-08-07 03:06:26.083316	2022-08-07 03:06:26.083316	\N	John Cygan
897	2022-08-07 03:06:26.083782	2022-08-07 03:06:26.083782	\N	Pete Docter
898	2022-08-07 03:06:26.084327	2022-08-07 03:06:26.084327	\N	Paul Eiding
899	2022-08-07 03:06:26.084801	2022-08-07 03:06:26.084801	\N	Donald Fullilove
900	2022-08-07 03:06:26.08525	2022-08-07 03:06:26.08525	\N	Teresa Ganzel
901	2022-08-07 03:06:26.087835	2022-08-07 03:06:26.087835	\N	Darsheel Safary
902	2022-08-07 03:06:26.088339	2022-08-07 03:06:26.088339	\N	Aamir Khan
903	2022-08-07 03:06:26.088974	2022-08-07 03:06:26.088974	\N	Tisca Chopra
904	2022-08-07 03:06:26.089531	2022-08-07 03:06:26.089531	\N	Vipin Sharma
905	2022-08-07 03:06:26.090057	2022-08-07 03:06:26.090057	\N	Sachet Engineer
906	2022-08-07 03:06:26.090532	2022-08-07 03:06:26.090532	\N	Tanay Chheda
907	2022-08-07 03:06:26.091015	2022-08-07 03:06:26.091015	\N	Lalitha Lajmi
908	2022-08-07 03:06:26.091534	2022-08-07 03:06:26.091534	\N	Girija Oak
909	2022-08-07 03:06:26.09202	2022-08-07 03:06:26.09202	\N	Ravi Khanvilkar
910	2022-08-07 03:06:26.092527	2022-08-07 03:06:26.092527	\N	Pratima Kulkarni
911	2022-08-07 03:06:26.093059	2022-08-07 03:06:26.093059	\N	Meghna Malik
912	2022-08-07 03:06:26.094904	2022-08-07 03:06:26.094904	\N	Sonali Sachdev
913	2022-08-07 03:06:26.096015	2022-08-07 03:06:26.096015	\N	Sanjay Dadich
914	2022-08-07 03:06:26.096527	2022-08-07 03:06:26.096527	\N	Raaj Gopal Iyer
915	2022-08-07 03:06:26.097015	2022-08-07 03:06:26.097015	\N	Bugs Bhargava
916	2022-08-07 03:06:26.100363	2022-08-07 03:06:26.100363	\N	Madhavan
917	2022-08-07 03:06:26.100818	2022-08-07 03:06:26.100818	\N	Sharman Joshi
918	2022-08-07 03:06:26.101264	2022-08-07 03:06:26.101264	\N	Kareena Kapoor
919	2022-08-07 03:06:26.101677	2022-08-07 03:06:26.101677	\N	Boman Irani
920	2022-08-07 03:06:26.102087	2022-08-07 03:06:26.102087	\N	Omi Vaidya
921	2022-08-07 03:06:26.102599	2022-08-07 03:06:26.102599	\N	Mona Singh
922	2022-08-07 03:06:26.103012	2022-08-07 03:06:26.103012	\N	Olivier Lafont
923	2022-08-07 03:06:26.103403	2022-08-07 03:06:26.103403	\N	Rahul Kumar
924	2022-08-07 03:06:26.103798	2022-08-07 03:06:26.103798	\N	Parikshit Sahni
925	2022-08-07 03:06:26.104232	2022-08-07 03:06:26.104232	\N	Farida Dadi
926	2022-08-07 03:06:26.104657	2022-08-07 03:06:26.104657	\N	Amardeep Jha
927	2022-08-07 03:06:26.105052	2022-08-07 03:06:26.105052	\N	Mukund Bhatt
928	2022-08-07 03:06:26.105451	2022-08-07 03:06:26.105451	\N	Chaitali Bose
929	2022-08-07 03:06:26.105912	2022-08-07 03:06:26.105912	\N	Javed Jaffrey
930	2022-08-07 03:06:26.11089	2022-08-07 03:06:26.11089	\N	Matthew Modine
931	2022-08-07 03:06:26.111605	2022-08-07 03:06:26.111605	\N	Alon Aboutboul
932	2022-08-07 03:06:26.112289	2022-08-07 03:06:26.112289	\N	Ben Mendelsohn
933	2022-08-07 03:06:26.112764	2022-08-07 03:06:26.112764	\N	Burn Gorman
934	2022-08-07 03:06:26.113202	2022-08-07 03:06:26.113202	\N	Daniel Sunjata
935	2022-08-07 03:06:26.113632	2022-08-07 03:06:26.113632	\N	Aidan Gillen
936	2022-08-07 03:06:26.114089	2022-08-07 03:06:26.114089	\N	Sam Kennard
937	2022-08-07 03:06:26.116956	2022-08-07 03:06:26.116956	\N	Jamie Foxx
938	2022-08-07 03:06:26.117544	2022-08-07 03:06:26.117544	\N	Christoph Waltz
939	2022-08-07 03:06:26.118424	2022-08-07 03:06:26.118424	\N	Kerry Washington
940	2022-08-07 03:06:26.119156	2022-08-07 03:06:26.119156	\N	Walton Goggins
941	2022-08-07 03:06:26.119579	2022-08-07 03:06:26.119579	\N	Dennis Christopher
942	2022-08-07 03:06:26.119993	2022-08-07 03:06:26.119993	\N	James Remar
943	2022-08-07 03:06:26.120378	2022-08-07 03:06:26.120378	\N	David Steen
944	2022-08-07 03:06:26.120996	2022-08-07 03:06:26.120996	\N	Dana Gourrier
945	2022-08-07 03:06:26.121443	2022-08-07 03:06:26.121443	\N	Nichole Galicia
946	2022-08-07 03:06:26.121865	2022-08-07 03:06:26.121865	\N	Laura Cayouette
947	2022-08-07 03:06:26.122356	2022-08-07 03:06:26.122356	\N	Ato Essandoh
948	2022-08-07 03:06:26.122866	2022-08-07 03:06:26.122866	\N	Sammi Rotibi
949	2022-08-07 03:06:26.123292	2022-08-07 03:06:26.123292	\N	Clay Donahue Fontenot
950	2022-08-07 03:06:26.127282	2022-08-07 03:06:26.127282	\N	Anthony Gonzalez
951	2022-08-07 03:06:26.127934	2022-08-07 03:06:26.127934	\N	Gael García Bernal
952	2022-08-07 03:06:26.12846	2022-08-07 03:06:26.12846	\N	Benjamin Bratt
953	2022-08-07 03:06:26.129011	2022-08-07 03:06:26.129011	\N	Alanna Ubach
954	2022-08-07 03:06:26.129519	2022-08-07 03:06:26.129519	\N	Renee Victor
955	2022-08-07 03:06:26.13037	2022-08-07 03:06:26.13037	\N	Jaime Camil
956	2022-08-07 03:06:26.131151	2022-08-07 03:06:26.131151	\N	Alfonso Arau
957	2022-08-07 03:06:26.131672	2022-08-07 03:06:26.131672	\N	Herbert Siguenza
958	2022-08-07 03:06:26.132156	2022-08-07 03:06:26.132156	\N	Gabriel Iglesias
959	2022-08-07 03:06:26.132602	2022-08-07 03:06:26.132602	\N	Lombardo Boyar
960	2022-08-07 03:06:26.13305	2022-08-07 03:06:26.13305	\N	Ana Ofelia Murguía
961	2022-08-07 03:06:26.133502	2022-08-07 03:06:26.133502	\N	Natalia Cordova-Buckley
962	2022-08-07 03:06:26.133948	2022-08-07 03:06:26.133948	\N	Selene Luna
963	2022-08-07 03:06:26.134398	2022-08-07 03:06:26.134398	\N	Edward James Olmos
964	2022-08-07 03:06:26.134832	2022-08-07 03:06:26.134832	\N	Sofía Espinosa
965	2022-08-07 03:06:26.13757	2022-08-07 03:06:26.13757	\N	Robert Downey Jr.
966	2022-08-07 03:06:26.138045	2022-08-07 03:06:26.138045	\N	Chris Hemsworth
967	2022-08-07 03:06:26.138491	2022-08-07 03:06:26.138491	\N	Mark Ruffalo
968	2022-08-07 03:06:26.138931	2022-08-07 03:06:26.138931	\N	Chris Evans
969	2022-08-07 03:06:26.139749	2022-08-07 03:06:26.139749	\N	Don Cheadle
970	2022-08-07 03:06:26.140235	2022-08-07 03:06:26.140235	\N	Benedict Cumberbatch
971	2022-08-07 03:06:26.140708	2022-08-07 03:06:26.140708	\N	Tom Holland
972	2022-08-07 03:06:26.141213	2022-08-07 03:06:26.141213	\N	Chadwick Boseman
973	2022-08-07 03:06:26.14189	2022-08-07 03:06:26.14189	\N	Zoe Saldana
974	2022-08-07 03:06:26.142438	2022-08-07 03:06:26.142438	\N	Karen Gillan
975	2022-08-07 03:06:26.142922	2022-08-07 03:06:26.142922	\N	Tom Hiddleston
976	2022-08-07 03:06:26.143437	2022-08-07 03:06:26.143437	\N	Paul Bettany
977	2022-08-07 03:06:26.143945	2022-08-07 03:06:26.143945	\N	Elizabeth Olsen
978	2022-08-07 03:06:26.144605	2022-08-07 03:06:26.144605	\N	Anthony Mackie
979	2022-08-07 03:06:26.149767	2022-08-07 03:06:26.149767	\N	Jeremy Renner
980	2022-08-07 03:06:26.150863	2022-08-07 03:06:26.150863	\N	Paul Rudd
981	2022-08-07 03:06:26.151955	2022-08-07 03:06:26.151955	\N	Brie Larson
982	2022-08-07 03:06:26.153351	2022-08-07 03:06:26.153351	\N	Evangeline Lilly
983	2022-08-07 03:06:26.156229	2022-08-07 03:06:26.156229	\N	Shameik Moore
984	2022-08-07 03:06:26.156868	2022-08-07 03:06:26.156868	\N	Jake Johnson
985	2022-08-07 03:06:26.157456	2022-08-07 03:06:26.157456	\N	Hailee Steinfeld
986	2022-08-07 03:06:26.157963	2022-08-07 03:06:26.157963	\N	Mahershala Ali
987	2022-08-07 03:06:26.159854	2022-08-07 03:06:26.159854	\N	Brian Tyree Henry
988	2022-08-07 03:06:26.16045	2022-08-07 03:06:26.16045	\N	Lily Tomlin
989	2022-08-07 03:06:26.161034	2022-08-07 03:06:26.161034	\N	Luna Lauren Velez
990	2022-08-07 03:06:26.161518	2022-08-07 03:06:26.161518	\N	Zoë Kravitz
991	2022-08-07 03:06:26.162014	2022-08-07 03:06:26.162014	\N	John Mulaney
992	2022-08-07 03:06:26.162608	2022-08-07 03:06:26.162608	\N	Kimiko Glenn
993	2022-08-07 03:06:26.163271	2022-08-07 03:06:26.163271	\N	Nicolas Cage
994	2022-08-07 03:06:26.16391	2022-08-07 03:06:26.16391	\N	Kathryn Hahn
995	2022-08-07 03:06:26.164364	2022-08-07 03:06:26.164364	\N	Liev Schreiber
996	2022-08-07 03:06:26.165121	2022-08-07 03:06:26.165121	\N	Chris Pine
997	2022-08-07 03:06:26.16563	2022-08-07 03:06:26.16563	\N	Natalie Morales
998	2022-08-07 03:06:26.169004	2022-08-07 03:06:26.169004	\N	Fatima Sana Shaikh
999	2022-08-07 03:06:26.169526	2022-08-07 03:06:26.169526	\N	Sanya Malhotra
1000	2022-08-07 03:06:26.170046	2022-08-07 03:06:26.170046	\N	Sakshi Tanwar
1001	2022-08-07 03:06:26.170568	2022-08-07 03:06:26.170568	\N	Aparshakti Khurana
1002	2022-08-07 03:06:26.171137	2022-08-07 03:06:26.171137	\N	Zaira Wasim
1003	2022-08-07 03:06:26.171596	2022-08-07 03:06:26.171596	\N	Suhani Bhatnagar
1004	2022-08-07 03:06:26.17203	2022-08-07 03:06:26.17203	\N	Ritvik Sahore
1005	2022-08-07 03:06:26.172472	2022-08-07 03:06:26.172472	\N	Girish Kulkarni
1006	2022-08-07 03:06:26.172995	2022-08-07 03:06:26.172995	\N	Ravi Aneja
1007	2022-08-07 03:06:26.173668	2022-08-07 03:06:26.173668	\N	Anurag Arora
1008	2022-08-07 03:06:26.174224	2022-08-07 03:06:26.174224	\N	Mahesh Balraj
1009	2022-08-07 03:06:26.17482	2022-08-07 03:06:26.17482	\N	Vivan Bhatena
1010	2022-08-07 03:06:26.175385	2022-08-07 03:06:26.175385	\N	Anmol Charan
1011	2022-08-07 03:06:26.175919	2022-08-07 03:06:26.175919	\N	Karamveer Choudhary
1012	2022-08-07 03:06:26.180378	2022-08-07 03:06:26.180378	\N	Mone Kamishiraishi
1013	2022-08-07 03:06:26.180967	2022-08-07 03:06:26.180967	\N	Ryô Narita
1014	2022-08-07 03:06:26.181423	2022-08-07 03:06:26.181423	\N	Aoi Yûki
1015	2022-08-07 03:06:26.18188	2022-08-07 03:06:26.18188	\N	Nobunaga Shimazaki
1016	2022-08-07 03:06:26.182338	2022-08-07 03:06:26.182338	\N	Kaito Ishikawa
1017	2022-08-07 03:06:26.182779	2022-08-07 03:06:26.182779	\N	Kanon Tani
1018	2022-08-07 03:06:26.183234	2022-08-07 03:06:26.183234	\N	Masaki Terasoma
1019	2022-08-07 03:06:26.183661	2022-08-07 03:06:26.183661	\N	Sayaka Ôhara
1020	2022-08-07 03:06:26.184127	2022-08-07 03:06:26.184127	\N	Kazuhiko Inoue
1021	2022-08-07 03:06:26.18461	2022-08-07 03:06:26.18461	\N	Chafûrin
1022	2022-08-07 03:06:26.185068	2022-08-07 03:06:26.185068	\N	Kana Hanazawa
1023	2022-08-07 03:06:26.18549	2022-08-07 03:06:26.18549	\N	Yuka Terasaki
1024	2022-08-07 03:06:26.185899	2022-08-07 03:06:26.185899	\N	Takashi Onozuka
1025	2022-08-07 03:06:26.18632	2022-08-07 03:06:26.18632	\N	Yôhei Namekawa
1026	2022-08-07 03:06:26.188365	2022-08-07 03:06:26.188365	\N	Zain Al Rafeea
1027	2022-08-07 03:06:26.188866	2022-08-07 03:06:26.188866	\N	Yordanos Shiferaw
1028	2022-08-07 03:06:26.189401	2022-08-07 03:06:26.189401	\N	Boluwatife Treasure Bankole
1029	2022-08-07 03:06:26.189901	2022-08-07 03:06:26.189901	\N	Kawsar Al Haddad
1030	2022-08-07 03:06:26.190894	2022-08-07 03:06:26.190894	\N	Fadi Yousef
1031	2022-08-07 03:06:26.191431	2022-08-07 03:06:26.191431	\N	Cedra Izzam
1032	2022-08-07 03:06:26.191969	2022-08-07 03:06:26.191969	\N	Alaa Chouchnieh
1033	2022-08-07 03:06:26.192498	2022-08-07 03:06:26.192498	\N	Elias Khoury
1034	2022-08-07 03:06:26.19445	2022-08-07 03:06:26.19445	\N	Mohammad Al Abdallah
1035	2022-08-07 03:06:26.195038	2022-08-07 03:06:26.195038	\N	Mohamad Abdellatif
1036	2022-08-07 03:06:26.195588	2022-08-07 03:06:26.195588	\N	Abdo Abdo
1037	2022-08-07 03:06:26.196101	2022-08-07 03:06:26.196101	\N	Hampig Abraham
1038	2022-08-07 03:06:26.196567	2022-08-07 03:06:26.196567	\N	Jamil Ahmad
1039	2022-08-07 03:06:26.197028	2022-08-07 03:06:26.197028	\N	Mohamad Akkar
1040	2022-08-07 03:06:26.198315	2022-08-07 03:06:26.198315	\N	Elias Akobegia
1041	2022-08-07 03:06:26.201198	2022-08-07 03:06:26.201198	\N	Carl Miller
1042	2022-08-07 03:06:26.20171	2022-08-07 03:06:26.20171	\N	Edna Purviance
1043	2022-08-07 03:06:26.20228	2022-08-07 03:06:26.20228	\N	Jackie Coogan
1044	2022-08-07 03:06:26.204533	2022-08-07 03:06:26.204533	\N	Alfred Abel
1045	2022-08-07 03:06:26.204996	2022-08-07 03:06:26.204996	\N	Gustav Fröhlich
1046	2022-08-07 03:06:26.20548	2022-08-07 03:06:26.20548	\N	Rudolf Klein-Rogge
1047	2022-08-07 03:06:26.205949	2022-08-07 03:06:26.205949	\N	Fritz Rasp
1048	2022-08-07 03:06:26.206384	2022-08-07 03:06:26.206384	\N	Theodor Loos
1049	2022-08-07 03:06:26.206813	2022-08-07 03:06:26.206813	\N	Erwin Biswanger
1050	2022-08-07 03:06:26.207251	2022-08-07 03:06:26.207251	\N	Heinrich George
1051	2022-08-07 03:06:26.20769	2022-08-07 03:06:26.20769	\N	Brigitte Helm
1052	2022-08-07 03:06:26.211066	2022-08-07 03:06:26.211066	\N	Ellen Widmann
1053	2022-08-07 03:06:26.211678	2022-08-07 03:06:26.211678	\N	Inge Landgut
1054	2022-08-07 03:06:26.212276	2022-08-07 03:06:26.212276	\N	Otto Wernicke
1055	2022-08-07 03:06:26.213534	2022-08-07 03:06:26.213534	\N	Gustaf Gründgens
1056	2022-08-07 03:06:26.21471	2022-08-07 03:06:26.21471	\N	Friedrich Gnaß
1057	2022-08-07 03:06:26.215231	2022-08-07 03:06:26.215231	\N	Fritz Odemar
1058	2022-08-07 03:06:26.215728	2022-08-07 03:06:26.215728	\N	Paul Kemp
1059	2022-08-07 03:06:26.216238	2022-08-07 03:06:26.216238	\N	Theo Lingen
1060	2022-08-07 03:06:26.216739	2022-08-07 03:06:26.216739	\N	Rudolf Blümner
1061	2022-08-07 03:06:26.21725	2022-08-07 03:06:26.21725	\N	Georg John
1062	2022-08-07 03:06:26.217841	2022-08-07 03:06:26.217841	\N	Franz Stein
1063	2022-08-07 03:06:26.218315	2022-08-07 03:06:26.218315	\N	Ernst Stahl-Nachbaur
1064	2022-08-07 03:06:26.218842	2022-08-07 03:06:26.218842	\N	Gerhard Bienert
1065	2022-08-07 03:06:26.220991	2022-08-07 03:06:26.220991	\N	Joseph Cotten
1066	2022-08-07 03:06:26.221467	2022-08-07 03:06:26.221467	\N	Dorothy Comingore
1067	2022-08-07 03:06:26.221905	2022-08-07 03:06:26.221905	\N	Agnes Moorehead
1068	2022-08-07 03:06:26.222319	2022-08-07 03:06:26.222319	\N	Ruth Warrick
1069	2022-08-07 03:06:26.222772	2022-08-07 03:06:26.222772	\N	Ray Collins
1070	2022-08-07 03:06:26.223194	2022-08-07 03:06:26.223194	\N	Erskine Sanford
1071	2022-08-07 03:06:26.223647	2022-08-07 03:06:26.223647	\N	Everett Sloane
1072	2022-08-07 03:06:26.224166	2022-08-07 03:06:26.224166	\N	William Alland
1073	2022-08-07 03:06:26.224658	2022-08-07 03:06:26.224658	\N	Paul Stewart
1074	2022-08-07 03:06:26.225913	2022-08-07 03:06:26.225913	\N	George Coulouris
1075	2022-08-07 03:06:26.226646	2022-08-07 03:06:26.226646	\N	Fortunio Bonanova
1076	2022-08-07 03:06:26.227206	2022-08-07 03:06:26.227206	\N	Gus Schilling
1077	2022-08-07 03:06:26.227718	2022-08-07 03:06:26.227718	\N	Philip Van Zandt
1078	2022-08-07 03:06:26.228229	2022-08-07 03:06:26.228229	\N	Georgia Backus
1079	2022-08-07 03:06:26.228757	2022-08-07 03:06:26.228757	\N	Harry Shannon
1080	2022-08-07 03:06:26.232003	2022-08-07 03:06:26.232003	\N	Fred MacMurray
1081	2022-08-07 03:06:26.232541	2022-08-07 03:06:26.232541	\N	Barbara Stanwyck
1082	2022-08-07 03:06:26.233025	2022-08-07 03:06:26.233025	\N	Edward G. Robinson
1083	2022-08-07 03:06:26.233501	2022-08-07 03:06:26.233501	\N	Porter Hall
1084	2022-08-07 03:06:26.233971	2022-08-07 03:06:26.233971	\N	Jean Heather
1085	2022-08-07 03:06:26.234393	2022-08-07 03:06:26.234393	\N	Tom Powers
1086	2022-08-07 03:06:26.234837	2022-08-07 03:06:26.234837	\N	Byron Barr
1087	2022-08-07 03:06:26.235721	2022-08-07 03:06:26.235721	\N	Richard Gaines
1088	2022-08-07 03:06:26.236543	2022-08-07 03:06:26.236543	\N	John Philliber
1089	2022-08-07 03:06:26.238504	2022-08-07 03:06:26.238504	\N	Lamberto Maggiorani
1090	2022-08-07 03:06:26.239057	2022-08-07 03:06:26.239057	\N	Enzo Staiola
1091	2022-08-07 03:06:26.239602	2022-08-07 03:06:26.239602	\N	Lianella Carell
1092	2022-08-07 03:06:26.240028	2022-08-07 03:06:26.240028	\N	Elena Altieri
1093	2022-08-07 03:06:26.240512	2022-08-07 03:06:26.240512	\N	Gino Saltamerenda
1094	2022-08-07 03:06:26.241005	2022-08-07 03:06:26.241005	\N	Giulio Chiari
1095	2022-08-07 03:06:26.241539	2022-08-07 03:06:26.241539	\N	Vittorio Antonucci
1096	2022-08-07 03:06:26.242163	2022-08-07 03:06:26.242163	\N	Michele Sakara
1097	2022-08-07 03:06:26.242722	2022-08-07 03:06:26.242722	\N	Fausto Guerzoni
1098	2022-08-07 03:06:26.243257	2022-08-07 03:06:26.243257	\N	Emma Druetti
1099	2022-08-07 03:06:26.243748	2022-08-07 03:06:26.243748	\N	Carlo Jachino
1100	2022-08-07 03:06:26.246722	2022-08-07 03:06:26.246722	\N	Shin'ichi Himori
1101	2022-08-07 03:06:26.247313	2022-08-07 03:06:26.247313	\N	Haruo Tanaka
1102	2022-08-07 03:06:26.248155	2022-08-07 03:06:26.248155	\N	Miki Odagiri
1103	2022-08-07 03:06:26.248922	2022-08-07 03:06:26.248922	\N	Minosuke Yamada
1104	2022-08-07 03:06:26.249698	2022-08-07 03:06:26.249698	\N	Makoto Kobori
1105	2022-08-07 03:06:26.250151	2022-08-07 03:06:26.250151	\N	Nobuo Kaneko
1106	2022-08-07 03:06:26.250863	2022-08-07 03:06:26.250863	\N	Nobuo Nakamura
1107	2022-08-07 03:06:26.251298	2022-08-07 03:06:26.251298	\N	Atsushi Watanabe
1108	2022-08-07 03:06:26.252347	2022-08-07 03:06:26.252347	\N	Masao Shimizu
1109	2022-08-07 03:06:26.252875	2022-08-07 03:06:26.252875	\N	Yûnosuke Itô
1110	2022-08-07 03:06:26.25611	2022-08-07 03:06:26.25611	\N	Gene Kelly
1111	2022-08-07 03:06:26.256717	2022-08-07 03:06:26.256717	\N	Donald O'Connor
1112	2022-08-07 03:06:26.25724	2022-08-07 03:06:26.25724	\N	Debbie Reynolds
1113	2022-08-07 03:06:26.258984	2022-08-07 03:06:26.258984	\N	Jean Hagen
1114	2022-08-07 03:06:26.259794	2022-08-07 03:06:26.259794	\N	Millard Mitchell
1115	2022-08-07 03:06:26.260338	2022-08-07 03:06:26.260338	\N	Cyd Charisse
1116	2022-08-07 03:06:26.260869	2022-08-07 03:06:26.260869	\N	Douglas Fowley
1117	2022-08-07 03:06:26.261436	2022-08-07 03:06:26.261436	\N	Rita Moreno
1118	2022-08-07 03:06:26.26505	2022-08-07 03:06:26.26505	\N	Kim Novak
1119	2022-08-07 03:06:26.266399	2022-08-07 03:06:26.266399	\N	Barbara Bel Geddes
1120	2022-08-07 03:06:26.267273	2022-08-07 03:06:26.267273	\N	Tom Helmore
1121	2022-08-07 03:06:26.267901	2022-08-07 03:06:26.267901	\N	Henry Jones
1122	2022-08-07 03:06:26.268381	2022-08-07 03:06:26.268381	\N	Raymond Bailey
1123	2022-08-07 03:06:26.26883	2022-08-07 03:06:26.26883	\N	Ellen Corby
1124	2022-08-07 03:06:26.269286	2022-08-07 03:06:26.269286	\N	Konstantin Shayne
1125	2022-08-07 03:06:26.269735	2022-08-07 03:06:26.269735	\N	Lee Patrick
1126	2022-08-07 03:06:26.27688	2022-08-07 03:06:26.27688	\N	Cary Grant
1127	2022-08-07 03:06:26.277909	2022-08-07 03:06:26.277909	\N	Eva Marie Saint
1128	2022-08-07 03:06:26.278712	2022-08-07 03:06:26.278712	\N	James Mason
1129	2022-08-07 03:06:26.279244	2022-08-07 03:06:26.279244	\N	Jessie Royce Landis
1130	2022-08-07 03:06:26.279818	2022-08-07 03:06:26.279818	\N	Leo G. Carroll
1131	2022-08-07 03:06:26.280273	2022-08-07 03:06:26.280273	\N	Josephine Hutchinson
1132	2022-08-07 03:06:26.281799	2022-08-07 03:06:26.281799	\N	Philip Ober
1133	2022-08-07 03:06:26.28232	2022-08-07 03:06:26.28232	\N	Martin Landau
1134	2022-08-07 03:06:26.282879	2022-08-07 03:06:26.282879	\N	Adam Williams
1135	2022-08-07 03:06:26.283414	2022-08-07 03:06:26.283414	\N	Edward Platt
1136	2022-08-07 03:06:26.283907	2022-08-07 03:06:26.283907	\N	Robert Ellenstein
1137	2022-08-07 03:06:26.28453	2022-08-07 03:06:26.28453	\N	Les Tremayne
1138	2022-08-07 03:06:26.285096	2022-08-07 03:06:26.285096	\N	Philip Coolidge
1139	2022-08-07 03:06:26.285608	2022-08-07 03:06:26.285608	\N	Patrick McVey
1140	2022-08-07 03:06:26.28915	2022-08-07 03:06:26.28915	\N	Jack Lemmon
1141	2022-08-07 03:06:26.289888	2022-08-07 03:06:26.289888	\N	Shirley MacLaine
1142	2022-08-07 03:06:26.29097	2022-08-07 03:06:26.29097	\N	Ray Walston
1143	2022-08-07 03:06:26.292977	2022-08-07 03:06:26.292977	\N	Jack Kruschen
1144	2022-08-07 03:06:26.293846	2022-08-07 03:06:26.293846	\N	David Lewis
1145	2022-08-07 03:06:26.294902	2022-08-07 03:06:26.294902	\N	Hope Holiday
1146	2022-08-07 03:06:26.295605	2022-08-07 03:06:26.295605	\N	Joan Shawlee
1147	2022-08-07 03:06:26.296272	2022-08-07 03:06:26.296272	\N	Naomi Stevens
1148	2022-08-07 03:06:26.297034	2022-08-07 03:06:26.297034	\N	Johnny Seven
1149	2022-08-07 03:06:26.297799	2022-08-07 03:06:26.297799	\N	Joyce Jameson
1150	2022-08-07 03:06:26.298284	2022-08-07 03:06:26.298284	\N	Willard Waterman
1151	2022-08-07 03:06:26.298773	2022-08-07 03:06:26.298773	\N	David White
1152	2022-08-07 03:06:26.299219	2022-08-07 03:06:26.299219	\N	Edie Adams
1153	2022-08-07 03:06:26.302788	2022-08-07 03:06:26.302788	\N	Peter O'Toole
1154	2022-08-07 03:06:26.304577	2022-08-07 03:06:26.304577	\N	Anthony Quinn
1155	2022-08-07 03:06:26.305066	2022-08-07 03:06:26.305066	\N	Jack Hawkins
1156	2022-08-07 03:06:26.305545	2022-08-07 03:06:26.305545	\N	Omar Sharif
1157	2022-08-07 03:06:26.306068	2022-08-07 03:06:26.306068	\N	José Ferrer
1158	2022-08-07 03:06:26.306681	2022-08-07 03:06:26.306681	\N	Anthony Quayle
1159	2022-08-07 03:06:26.307523	2022-08-07 03:06:26.307523	\N	Arthur Kennedy
1160	2022-08-07 03:06:26.308134	2022-08-07 03:06:26.308134	\N	Donald Wolfit
1161	2022-08-07 03:06:26.308702	2022-08-07 03:06:26.308702	\N	I.S. Johar
1162	2022-08-07 03:06:26.309211	2022-08-07 03:06:26.309211	\N	Gamil Ratib
1163	2022-08-07 03:06:26.309725	2022-08-07 03:06:26.309725	\N	Michel Ray
1164	2022-08-07 03:06:26.310258	2022-08-07 03:06:26.310258	\N	John Dimech
1165	2022-08-07 03:06:26.310972	2022-08-07 03:06:26.310972	\N	Zia Mohyeddin
1166	2022-08-07 03:06:26.314637	2022-08-07 03:06:26.314637	\N	Gian Maria Volontè
1167	2022-08-07 03:06:26.315178	2022-08-07 03:06:26.315178	\N	Mara Krupp
1168	2022-08-07 03:06:26.316066	2022-08-07 03:06:26.316066	\N	Klaus Kinski
1169	2022-08-07 03:06:26.316506	2022-08-07 03:06:26.316506	\N	Luis Rodríguez
1170	2022-08-07 03:06:26.31721	2022-08-07 03:06:26.31721	\N	Panos Papadopulos
1171	2022-08-07 03:06:26.318121	2022-08-07 03:06:26.318121	\N	Aldo Sambrell
1172	2022-08-07 03:06:26.318562	2022-08-07 03:06:26.318562	\N	Roberto Camardiel
1173	2022-08-07 03:06:26.318979	2022-08-07 03:06:26.318979	\N	Joseph Egger
1174	2022-08-07 03:06:26.319379	2022-08-07 03:06:26.319379	\N	Tomás Blanco
1175	2022-08-07 03:06:26.319777	2022-08-07 03:06:26.319777	\N	Lorenzo Robledo
1176	2022-08-07 03:06:26.32021	2022-08-07 03:06:26.32021	\N	Dante Maggio
1177	2022-08-07 03:06:26.322449	2022-08-07 03:06:26.322449	\N	Keir Dullea
1178	2022-08-07 03:06:26.322967	2022-08-07 03:06:26.322967	\N	Gary Lockwood
1179	2022-08-07 03:06:26.323564	2022-08-07 03:06:26.323564	\N	William Sylvester
1180	2022-08-07 03:06:26.324083	2022-08-07 03:06:26.324083	\N	Daniel Richter
1181	2022-08-07 03:06:26.325723	2022-08-07 03:06:26.325723	\N	Leonard Rossiter
1182	2022-08-07 03:06:26.326636	2022-08-07 03:06:26.326636	\N	Margaret Tyzack
1183	2022-08-07 03:06:26.327183	2022-08-07 03:06:26.327183	\N	Robert Beatty
1184	2022-08-07 03:06:26.32766	2022-08-07 03:06:26.32766	\N	Sean Sullivan
1185	2022-08-07 03:06:26.3282	2022-08-07 03:06:26.3282	\N	Douglas Rain
1186	2022-08-07 03:06:26.328733	2022-08-07 03:06:26.328733	\N	Frank Miller
1187	2022-08-07 03:06:26.32933	2022-08-07 03:06:26.32933	\N	Bill Weston
1188	2022-08-07 03:06:26.329963	2022-08-07 03:06:26.329963	\N	Ed Bishop
1189	2022-08-07 03:06:26.330935	2022-08-07 03:06:26.330935	\N	Alan Gifford
1190	2022-08-07 03:06:26.331376	2022-08-07 03:06:26.331376	\N	Ann Gillis
1191	2022-08-07 03:06:26.334007	2022-08-07 03:06:26.334007	\N	Malcolm McDowell
1192	2022-08-07 03:06:26.334603	2022-08-07 03:06:26.334603	\N	Patrick Magee
1193	2022-08-07 03:06:26.335119	2022-08-07 03:06:26.335119	\N	Michael Bates
1194	2022-08-07 03:06:26.335618	2022-08-07 03:06:26.335618	\N	Warren Clarke
1195	2022-08-07 03:06:26.336327	2022-08-07 03:06:26.336327	\N	John Clive
1196	2022-08-07 03:06:26.336839	2022-08-07 03:06:26.336839	\N	Adrienne Corri
1197	2022-08-07 03:06:26.337435	2022-08-07 03:06:26.337435	\N	Carl Duering
1198	2022-08-07 03:06:26.337935	2022-08-07 03:06:26.337935	\N	Paul Farrell
1199	2022-08-07 03:06:26.338449	2022-08-07 03:06:26.338449	\N	Clive Francis
1200	2022-08-07 03:06:26.338937	2022-08-07 03:06:26.338937	\N	Michael Gover
1201	2022-08-07 03:06:26.339474	2022-08-07 03:06:26.339474	\N	Miriam Karlin
1202	2022-08-07 03:06:26.340023	2022-08-07 03:06:26.340023	\N	James Marcus
1203	2022-08-07 03:06:26.340583	2022-08-07 03:06:26.340583	\N	Aubrey Morris
1204	2022-08-07 03:06:26.341678	2022-08-07 03:06:26.341678	\N	Godfrey Quigley
1205	2022-08-07 03:06:26.342385	2022-08-07 03:06:26.342385	\N	Sheila Raynor
1206	2022-08-07 03:06:26.346699	2022-08-07 03:06:26.346699	\N	Paul Newman
1207	2022-08-07 03:06:26.347387	2022-08-07 03:06:26.347387	\N	Robert Redford
1208	2022-08-07 03:06:26.347924	2022-08-07 03:06:26.347924	\N	Robert Shaw
1209	2022-08-07 03:06:26.348441	2022-08-07 03:06:26.348441	\N	Charles Durning
1210	2022-08-07 03:06:26.349333	2022-08-07 03:06:26.349333	\N	Eileen Brennan
1211	2022-08-07 03:06:26.349835	2022-08-07 03:06:26.349835	\N	Harold Gould
1212	2022-08-07 03:06:26.350374	2022-08-07 03:06:26.350374	\N	John Heffernan
1213	2022-08-07 03:06:26.350852	2022-08-07 03:06:26.350852	\N	Dana Elcar
1214	2022-08-07 03:06:26.351334	2022-08-07 03:06:26.351334	\N	Jack Kehoe
1215	2022-08-07 03:06:26.351804	2022-08-07 03:06:26.351804	\N	Dimitra Arliss
1216	2022-08-07 03:06:26.352279	2022-08-07 03:06:26.352279	\N	Robert Earl Jones
1217	2022-08-07 03:06:26.352732	2022-08-07 03:06:26.352732	\N	James Sloyan
1218	2022-08-07 03:06:26.353201	2022-08-07 03:06:26.353201	\N	Charles Dierkop
1219	2022-08-07 03:06:26.353681	2022-08-07 03:06:26.353681	\N	Lee Paul
1220	2022-08-07 03:06:26.356683	2022-08-07 03:06:26.356683	\N	Diahnne Abbott
1221	2022-08-07 03:06:26.35749	2022-08-07 03:06:26.35749	\N	Frank Adu
1222	2022-08-07 03:06:26.358299	2022-08-07 03:06:26.358299	\N	Victor Argo
1223	2022-08-07 03:06:26.360756	2022-08-07 03:06:26.360756	\N	Gino Ardito
1224	2022-08-07 03:06:26.36142	2022-08-07 03:06:26.36142	\N	Garth Avery
1225	2022-08-07 03:06:26.36205	2022-08-07 03:06:26.36205	\N	Peter Boyle
1226	2022-08-07 03:06:26.362603	2022-08-07 03:06:26.362603	\N	Albert Brooks
1227	2022-08-07 03:06:26.363094	2022-08-07 03:06:26.363094	\N	Harry Cohn
1228	2022-08-07 03:06:26.364412	2022-08-07 03:06:26.364412	\N	Copper Cunningham
1229	2022-08-07 03:06:26.365911	2022-08-07 03:06:26.365911	\N	Brenda Dickson
1230	2022-08-07 03:06:26.366459	2022-08-07 03:06:26.366459	\N	Harry Fischler
1231	2022-08-07 03:06:26.367862	2022-08-07 03:06:26.367862	\N	Nat Grant
1232	2022-08-07 03:06:26.368371	2022-08-07 03:06:26.368371	\N	Leonard Harris
1233	2022-08-07 03:06:26.371114	2022-08-07 03:06:26.371114	\N	Jürgen Prochnow
1234	2022-08-07 03:06:26.371703	2022-08-07 03:06:26.371703	\N	Herbert Grönemeyer
1235	2022-08-07 03:06:26.372274	2022-08-07 03:06:26.372274	\N	Klaus Wennemann
1236	2022-08-07 03:06:26.372819	2022-08-07 03:06:26.372819	\N	Hubertus Bengsch
1237	2022-08-07 03:06:26.373304	2022-08-07 03:06:26.373304	\N	Martin Semmelrogge
1238	2022-08-07 03:06:26.373782	2022-08-07 03:06:26.373782	\N	Bernd Tauber
1239	2022-08-07 03:06:26.374251	2022-08-07 03:06:26.374251	\N	Erwin Leder
1240	2022-08-07 03:06:26.374917	2022-08-07 03:06:26.374917	\N	Martin May
1241	2022-08-07 03:06:26.375499	2022-08-07 03:06:26.375499	\N	Heinz Hoenig
1242	2022-08-07 03:06:26.376527	2022-08-07 03:06:26.376527	\N	Uwe Ochsenknecht
1243	2022-08-07 03:06:26.377164	2022-08-07 03:06:26.377164	\N	Claude-Oliver Rudolph
1244	2022-08-07 03:06:26.37765	2022-08-07 03:06:26.37765	\N	Jan Fedder
1245	2022-08-07 03:06:26.378187	2022-08-07 03:06:26.378187	\N	Ralf Richter
1246	2022-08-07 03:06:26.378713	2022-08-07 03:06:26.378713	\N	Joachim Bernhard
1247	2022-08-07 03:06:26.379704	2022-08-07 03:06:26.379704	\N	Oliver Stritzel
1248	2022-08-07 03:06:26.385574	2022-08-07 03:06:26.385574	\N	Sebastian Shaw
1249	2022-08-07 03:06:26.386175	2022-08-07 03:06:26.386175	\N	Ian McDiarmid
1250	2022-08-07 03:06:26.38826	2022-08-07 03:06:26.38826	\N	Michael Pennington
1251	2022-08-07 03:06:26.38908	2022-08-07 03:06:26.38908	\N	Kenneth Colley
1252	2022-08-07 03:06:26.394984	2022-08-07 03:06:26.394984	\N	Steven Bauer
1253	2022-08-07 03:06:26.395829	2022-08-07 03:06:26.395829	\N	Michelle Pfeiffer
1254	2022-08-07 03:06:26.396906	2022-08-07 03:06:26.396906	\N	Mary Elizabeth Mastrantonio
1255	2022-08-07 03:06:26.398113	2022-08-07 03:06:26.398113	\N	Robert Loggia
1256	2022-08-07 03:06:26.400052	2022-08-07 03:06:26.400052	\N	Miriam Colon
1257	2022-08-07 03:06:26.400768	2022-08-07 03:06:26.400768	\N	F. Murray Abraham
1258	2022-08-07 03:06:26.40176	2022-08-07 03:06:26.40176	\N	Paul Shenar
1259	2022-08-07 03:06:26.40234	2022-08-07 03:06:26.40234	\N	Harris Yulin
1260	2022-08-07 03:06:26.402955	2022-08-07 03:06:26.402955	\N	Ángel Salazar
1261	2022-08-07 03:06:26.403496	2022-08-07 03:06:26.403496	\N	Arnaldo Santana
1262	2022-08-07 03:06:26.403999	2022-08-07 03:06:26.403999	\N	Pepe Serna
1263	2022-08-07 03:06:26.404536	2022-08-07 03:06:26.404536	\N	Michael P. Moran
1264	2022-08-07 03:06:26.405053	2022-08-07 03:06:26.405053	\N	Al Israel
1265	2022-08-07 03:06:26.405627	2022-08-07 03:06:26.405627	\N	Dennis Holahan
1266	2022-08-07 03:06:26.41027	2022-08-07 03:06:26.41027	\N	Tom Hulce
1267	2022-08-07 03:06:26.411081	2022-08-07 03:06:26.411081	\N	Elizabeth Berridge
1268	2022-08-07 03:06:26.4123	2022-08-07 03:06:26.4123	\N	Roy Dotrice
1269	2022-08-07 03:06:26.41333	2022-08-07 03:06:26.41333	\N	Simon Callow
1270	2022-08-07 03:06:26.413994	2022-08-07 03:06:26.413994	\N	Christine Ebersole
1271	2022-08-07 03:06:26.414524	2022-08-07 03:06:26.414524	\N	Jeffrey Jones
1272	2022-08-07 03:06:26.415256	2022-08-07 03:06:26.415256	\N	Charles Kay
1273	2022-08-07 03:06:26.41574	2022-08-07 03:06:26.41574	\N	Kenneth McMillan
1274	2022-08-07 03:06:26.416557	2022-08-07 03:06:26.416557	\N	Lisbeth Bartlett
1275	2022-08-07 03:06:26.417043	2022-08-07 03:06:26.417043	\N	Barbara Bryne
1276	2022-08-07 03:06:26.417555	2022-08-07 03:06:26.417555	\N	Martin Cavina
1277	2022-08-07 03:06:26.418034	2022-08-07 03:06:26.418034	\N	Roderick Cook
1278	2022-08-07 03:06:26.418527	2022-08-07 03:06:26.418527	\N	Milan Demjanenko
\.


--
-- TOC entry 3700 (class 0 OID 33716)
-- Dependencies: 219
-- Data for Name: collection; Type: TABLE DATA; Schema: public; Owner: phamthainb
--

COPY public.collection (id, "createdAt", "updatedAt", "deletedAt", type, "movieId") FROM stdin;
1	2022-08-07 03:10:49.026435	2022-08-07 03:10:49.026435	\N	slide	3
2	2022-08-07 03:10:49.034237	2022-08-07 03:10:49.034237	\N	slide	34
3	2022-08-07 03:10:49.035022	2022-08-07 03:10:49.035022	\N	slide	5
4	2022-08-07 03:10:49.035951	2022-08-07 03:10:49.035951	\N	slide	56
5	2022-08-07 03:10:49.036838	2022-08-07 03:10:49.036838	\N	slide	86
6	2022-08-07 03:10:49.037509	2022-08-07 03:10:49.037509	\N	slide	6
7	2022-08-07 03:10:49.038008	2022-08-07 03:10:49.038008	\N	slide	12
\.


--
-- TOC entry 3702 (class 0 OID 33725)
-- Dependencies: 221
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: phamthainb
--

COPY public.comment (id, "createdAt", "updatedAt", "deletedAt", status, content, "accountId", "movieId") FROM stdin;
1	2022-08-07 20:01:31.78723	2022-08-07 20:01:31.78723	\N	t	123	1	1
\.


--
-- TOC entry 3704 (class 0 OID 33742)
-- Dependencies: 223
-- Data for Name: history; Type: TABLE DATA; Schema: public; Owner: phamthainb
--

COPY public.history (id, "createdAt", "updatedAt", "deletedAt", type, "accountId", "movieId") FROM stdin;
\.


--
-- TOC entry 3698 (class 0 OID 33698)
-- Dependencies: 217
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: phamthainb
--

COPY public.movie (id, "createdAt", "updatedAt", "deletedAt", imdb, "originalTitle", year, duration, director, writer, "productionCompany", description, "avgVote", votes, url, image, status) FROM stdin;
1	2022-08-07 03:06:24.580281	2022-08-07 03:06:24.580281	\N	tt0111161	The Shawshank Redemption	1994	142	Frank Darabont	Stephen King, Frank Darabont	Castle Rock Entertainment	Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.	9.3	2278845	\N	\N	new
2	2022-08-07 03:06:24.619053	2022-08-07 03:06:24.619053	\N	tt0068646	The Godfather	1972	175	Francis Ford Coppola	Mario Puzo, Francis Ford Coppola	Paramount Pictures	The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.	9.2	1572674	\N	\N	new
3	2022-08-07 03:06:24.641025	2022-08-07 03:06:24.641025	\N	tt0071562	The Godfather: Part II	1974	202	Francis Ford Coppola	Francis Ford Coppola, Mario Puzo	Paramount Pictures	The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.	9	1098714	\N	\N	new
4	2022-08-07 03:06:24.66786	2022-08-07 03:06:24.66786	\N	tt0468569	The Dark Knight	2008	152	Christopher Nolan	Jonathan Nolan, Christopher Nolan	Warner Bros.	When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.	9	2241615	\N	\N	new
5	2022-08-07 03:06:24.684228	2022-08-07 03:06:24.684228	\N	tt0050083	12 Angry Men	1957	96	Sidney Lumet	Reginald Rose, Reginald Rose	Orion-Nova Productions	A jury holdout attempts to prevent a miscarriage of justice by forcing his colleagues to reconsider the evidence.	8.9	668473	\N	\N	new
6	2022-08-07 03:06:24.705736	2022-08-07 03:06:24.705736	\N	tt0108052	Schindler's List	1993	195	Steven Spielberg	Thomas Keneally, Steven Zaillian	Universal Pictures	In German-occupied Poland during World War II, industrialist	8.9	1183248	\N	\N	new
7	2022-08-07 03:06:24.725284	2022-08-07 03:06:24.725284	\N	tt0110912	Pulp Fiction	1994	154	Quentin Tarantino	Quentin Tarantino, Roger Avary	Miramax	The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.	8.9	1780147	\N	\N	new
8	2022-08-07 03:06:24.792599	2022-08-07 03:06:24.792599	\N	tt0167260	The Lord of the Rings: The Return of the King	2003	201	Peter Jackson	J.R.R. Tolkien, Fran Walsh	New Line Cinema	Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.	8.9	1604280	\N	\N	new
9	2022-08-07 03:06:24.820787	2022-08-07 03:06:24.820787	\N	tt0060196	Il buono, il brutto, il cattivo	1966	161	Sergio Leone	Luciano Vincenzoni, Sergio Leone	Produzioni Europee Associate (PEA)	A bounty hunting scam joins two men in an uneasy alliance against a third in a race to find a fortune in gold buried in a remote cemetery.	8.8	672499	\N	\N	new
10	2022-08-07 03:06:24.847027	2022-08-07 03:06:24.847027	\N	tt0109830	Forrest Gump	1994	142	Robert Zemeckis	Winston Groom, Eric Roth	Paramount Pictures	The presidencies of Kennedy and Johnson, the events of Vietnam, Watergate and other historical events unfold through the perspective of an Alabama man with an IQ of 75, whose only desire is to be reunited with his childhood sweetheart.	8.8	1755490	\N	\N	new
11	2022-08-07 03:06:24.868694	2022-08-07 03:06:24.868694	\N	tt0120737	The Lord of the Rings: The Fellowship of the Ring	2001	178	Peter Jackson	J.R.R. Tolkien, Fran Walsh	New Line Cinema	A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.	8.8	1619920	\N	\N	new
12	2022-08-07 03:06:24.887495	2022-08-07 03:06:24.887495	\N	tt0137523	Fight Club	1999	139	David Fincher	Chuck Palahniuk, Jim Uhls	Fox 2000 Pictures	An insomniac office worker and a devil-may-care soapmaker form an underground fight club that evolves into something much, much more.	8.8	1807440	\N	\N	new
13	2022-08-07 03:06:24.91233	2022-08-07 03:06:24.91233	\N	tt1375666	Inception	2010	148	Christopher Nolan	Christopher Nolan	Warner Bros.	A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.	8.8	2002816	\N	\N	new
14	2022-08-07 03:06:24.995136	2022-08-07 03:06:24.995136	\N	tt5813916	Dag II	2016	135	Alper Caglar	Alper Caglar	3leven	In a desolate war zone where screams of the innocent echo, seven Maroon Berets will dance with death on the very line between disaster and valor.	8.8	103949	\N	\N	new
15	2022-08-07 03:06:25.06631	2022-08-07 03:06:25.06631	\N	tt8110330	Dil Bechara	2020	101	Mukesh Chhabra	Shashank Khaitan, Suprotim Sengupta	Fox STAR Studios	The emotional journey of two hopelessly in love youngsters, a young girl, Kizie, suffering from cancer, and a boy, Manny, whom she meets at a support group.	8.8	101686	\N	\N	new
16	2022-08-07 03:06:25.08435	2022-08-07 03:06:25.08435	\N	tt0073486	One Flew Over the Cuckoo's Nest	1975	133	Milos Forman	Lawrence Hauben, Bo Goldman	Fantasy Films	A criminal pleads insanity and is admitted to a mental institution, where he rebels against the oppressive nurse and rallies up the scared patients.	8.7	891071	\N	\N	new
17	2022-08-07 03:06:25.112406	2022-08-07 03:06:25.112406	\N	tt0080684	Star Wars: Episode V - The Empire Strikes Back	1980	124	Irvin Kershner	Leigh Brackett, Lawrence Kasdan	Lucasfilm	After the Rebels are brutally overpowered by the Empire on the ice planet Hoth, Luke Skywalker begins Jedi training with Yoda, while his friends are pursued by Darth Vader and a bounty hunter named Boba Fett all over the galaxy.	8.7	1132073	\N	\N	new
18	2022-08-07 03:06:25.1364	2022-08-07 03:06:25.1364	\N	tt0099685	Goodfellas	1990	146	Martin Scorsese	Nicholas Pileggi, Nicholas Pileggi	Warner Bros.	The story of	8.7	991505	\N	\N	new
19	2022-08-07 03:06:25.158203	2022-08-07 03:06:25.158203	\N	tt0133093	The Matrix	1999	136	Lana Wachowski, Lilly Wachowski	Lilly Wachowski, Lana Wachowski	Warner Bros.	A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.	8.7	1632315	\N	\N	new
20	2022-08-07 03:06:25.181658	2022-08-07 03:06:25.181658	\N	tt0167261	The Lord of the Rings: The Two Towers	2002	179	Peter Jackson	J.R.R. Tolkien, Fran Walsh	New Line Cinema	While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum, the divided fellowship makes a stand against Sauron's new ally, Saruman, and his hordes of Isengard.	8.7	1449778	\N	\N	new
21	2022-08-07 03:06:25.204837	2022-08-07 03:06:25.204837	\N	tt0038650	It's a Wonderful Life	1946	130	Frank Capra	Frances Goodrich, Albert Hackett	Liberty Films (II)	An angel is sent from Heaven to help a desperately frustrated businessman by showing him what life would have been like if he had never existed.	8.6	388310	\N	\N	new
22	2022-08-07 03:06:25.286034	2022-08-07 03:06:25.286034	\N	tt0047478	Shichinin no samurai	1954	207	Akira Kurosawa	Akira Kurosawa, Shinobu Hashimoto	Toho Company	A poor village under attack by bandits recruits seven unemployed samurai to help them defend themselves.	8.6	307958	\N	\N	new
23	2022-08-07 03:06:25.350617	2022-08-07 03:06:25.350617	\N	tt0076759	Star Wars	1977	121	George Lucas	George Lucas	Lucasfilm	Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a Wookiee and two droids to save the galaxy from the Empire's world-destroying battle station, while also attempting to rescue Princess Leia from the mysterious Darth Vader.	8.6	1204107	\N	\N	new
48	2022-08-07 03:06:25.772663	2022-08-07 03:06:25.772663	\N	tt0407887	The Departed	2006	151	Martin Scorsese	William Monahan, Alan Mak	Warner Bros.	An undercover cop and a mole in the police attempt to identify each other while infiltrating an Irish gang in South Boston.	8.5	1159703	\N	\N	new
24	2022-08-07 03:06:25.373478	2022-08-07 03:06:25.373478	\N	tt0102926	The Silence of the Lambs	1991	118	Jonathan Demme	Thomas Harris, Ted Tally	Strong Heart/Demme Production	A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.	8.6	1234134	\N	\N	new
25	2022-08-07 03:06:25.398981	2022-08-07 03:06:25.398981	\N	tt0114369	Se7en	1995	127	David Fincher	Andrew Kevin Walker	Cecchi Gori Pictures	Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his motives.	8.6	1402015	\N	\N	new
26	2022-08-07 03:06:25.422728	2022-08-07 03:06:25.422728	\N	tt0118799	La vita è bella	1997	116	Roberto Benigni	Vincenzo Cerami, Roberto Benigni	Melampo Cinematografica	When an open-minded Jewish librarian and his son become victims of the Holocaust, he uses a perfect mixture of will, humor, and imagination to protect his son from the dangers around their camp.	8.6	605648	\N	\N	new
27	2022-08-07 03:06:25.447057	2022-08-07 03:06:25.447057	\N	tt0120689	The Green Mile	1999	189	Frank Darabont	Stephen King, Frank Darabont	Castle Rock Entertainment	The lives of guards on Death Row are affected by one of their charges: a black man accused of child murder and rape, yet who has a mysterious gift.	8.6	1112336	\N	\N	new
28	2022-08-07 03:06:25.464762	2022-08-07 03:06:25.464762	\N	tt0120815	Saving Private Ryan	1998	169	Steven Spielberg	Robert Rodat	DreamWorks	Following the Normandy Landings, a group of U.S. soldiers go behind enemy lines to retrieve a paratrooper whose brothers have been killed in action.	8.6	1203825	\N	\N	new
29	2022-08-07 03:06:25.484134	2022-08-07 03:06:25.484134	\N	tt0245429	Sen to Chihiro no kamikakushi	2001	125	Hayao Miyazaki	Hayao Miyazaki	Tokuma Shoten	During her family's move to the suburbs, a sullen 10-year-old girl wanders into a world ruled by gods, witches, and spirits, and where humans are changed into beasts.	8.6	626693	\N	\N	new
30	2022-08-07 03:06:25.501081	2022-08-07 03:06:25.501081	\N	tt0317248	Cidade de Deus	2002	130	Fernando Meirelles, Kátia Lund	Paulo Lins, Bráulio Mantovani	O2 Filmes	In the slums of Rio, two kids' paths diverge as one struggles to become a photographer and the other a kingpin.	8.6	685856	\N	\N	new
31	2022-08-07 03:06:25.517154	2022-08-07 03:06:25.517154	\N	tt0816692	Interstellar	2014	169	Christopher Nolan	Jonathan Nolan, Christopher Nolan	Paramount Pictures	A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.	8.6	1449256	\N	\N	new
32	2022-08-07 03:06:25.536528	2022-08-07 03:06:25.536528	\N	tt6751668	Gisaengchung	2019	132	Bong Joon Ho	Bong Joon Ho, Bong Joon Ho	Barunson E&A	Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan.	8.6	470931	\N	\N	new
33	2022-08-07 03:06:25.54845	2022-08-07 03:06:25.54845	\N	tt0021749	City Lights	1931	87	Charles Chaplin	Charles Chaplin	Charles Chaplin Productions	With the aid of a wealthy erratic tippler, a dewy-eyed tramp who has fallen in love with a sightless flower girl accumulates money to be able to help her medically.	8.5	162668	\N	\N	new
34	2022-08-07 03:06:25.571046	2022-08-07 03:06:25.571046	\N	tt0027977	Modern Times	1936	87	Charles Chaplin	Charles Chaplin	Charles Chaplin Productions	The Tramp struggles to live in modern industrial society with the help of a young homeless woman.	8.5	211250	\N	\N	new
35	2022-08-07 03:06:25.584625	2022-08-07 03:06:25.584625	\N	tt0034583	Casablanca	1942	102	Michael Curtiz	Julius J. Epstein, Philip G. Epstein	Warner Bros.	A cynical American expatriate struggles to decide whether or not he should help his former lover and her fugitive husband escape French Morocco.	8.5	509953	\N	\N	new
36	2022-08-07 03:06:25.60142	2022-08-07 03:06:25.60142	\N	tt0054215	Psycho	1960	109	Alfred Hitchcock	Joseph Stefano, Robert Bloch	Shamley Productions	A Phoenix secretary embezzles $40,000 from her employer's client, goes on the run, and checks into a remote motel run by a young man under the domination of his mother.	8.5	586765	\N	\N	new
37	2022-08-07 03:06:25.612937	2022-08-07 03:06:25.612937	\N	tt0064116	C'era una volta il West	1968	165	Sergio Leone	Sergio Donati, Sergio Leone	Rafran Cinematografica	A mysterious stranger with a harmonica joins forces with a notorious desperado to protect a beautiful widow from a ruthless assassin working for the railroad.	8.5	295220	\N	\N	new
38	2022-08-07 03:06:25.627372	2022-08-07 03:06:25.627372	\N	tt0088763	Back to the Future	1985	116	Robert Zemeckis	Robert Zemeckis, Bob Gale	Universal Pictures	Marty McFly, a 17-year-old high school student, is accidentally sent thirty years into the past in a time-traveling DeLorean invented by his close friend, the eccentric scientist Doc Brown.	8.5	1027330	\N	\N	new
39	2022-08-07 03:06:25.644343	2022-08-07 03:06:25.644343	\N	tt0095327	Hotaru no haka	1988	89	Isao Takahata	Akiyuki Nosaka, Isao Takahata	Shinchosha Company	A young boy and his little sister struggle to survive in Japan during World War II.	8.5	225438	\N	\N	new
40	2022-08-07 03:06:25.661097	2022-08-07 03:06:25.661097	\N	tt0095765	Nuovo Cinema Paradiso	1988	155	Giuseppe Tornatore	Giuseppe Tornatore, Giuseppe Tornatore	Cristaldifilm	A filmmaker recalls his childhood when falling in love with the pictures at the cinema of his home village and forms a deep friendship with the cinema's projectionist.	8.5	223050	\N	\N	new
41	2022-08-07 03:06:25.673535	2022-08-07 03:06:25.673535	\N	tt0103064	Terminator 2: Judgment Day	1991	137	James Cameron	James Cameron, William Wisher	Carolco Pictures	A cyborg, identical to the one who failed to kill Sarah Connor, must now protect her teenage son, John Connor, from a more advanced and powerful cyborg.	8.5	974970	\N	\N	new
42	2022-08-07 03:06:25.689492	2022-08-07 03:06:25.689492	\N	tt0110357	The Lion King	1994	88	Roger Allers, Rob Minkoff	Irene Mecchi, Jonathan Roberts	Walt Disney Pictures	Lion prince Simba and his father are targeted by his bitter uncle, who wants to ascend the throne himself.	8.5	917248	\N	\N	new
43	2022-08-07 03:06:25.708308	2022-08-07 03:06:25.708308	\N	tt0110413	Léon	1994	110	Luc Besson	Luc Besson	Gaumont	Mathilda, a 12-year-old girl, is reluctantly taken in by Léon, a professional assassin, after her family is murdered. An unusual relationship forms as she becomes his protégée and learns the assassin's trade.	8.5	1007598	\N	\N	new
44	2022-08-07 03:06:25.72087	2022-08-07 03:06:25.72087	\N	tt0114814	The Usual Suspects	1995	106	Bryan Singer	Christopher McQuarrie	PolyGram Filmed Entertainment	A sole survivor tells of the twisty events leading up to a horrific gun battle on a boat, which began when five criminals met at a seemingly random police lineup.	8.5	968947	\N	\N	new
45	2022-08-07 03:06:25.734143	2022-08-07 03:06:25.734143	\N	tt0120586	American History X	1998	119	Tony Kaye	David McKenna	New Line Cinema	A former neo-nazi skinhead tries to prevent his younger brother from going down the same wrong path that he did.	8.5	1014218	\N	\N	new
46	2022-08-07 03:06:25.749039	2022-08-07 03:06:25.749039	\N	tt0172495	Gladiator	2000	155	Ridley Scott	David Franzoni, David Franzoni	DreamWorks	A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.	8.5	1308193	\N	\N	new
47	2022-08-07 03:06:25.760125	2022-08-07 03:06:25.760125	\N	tt0253474	The Pianist	2002	150	Roman Polanski	Ronald Harwood, Wladyslaw Szpilman	R.P. Productions	A Polish Jewish musician struggles to survive the destruction of the Warsaw ghetto of World War II.	8.5	707942	\N	\N	new
49	2022-08-07 03:06:25.787778	2022-08-07 03:06:25.787778	\N	tt0482571	The Prestige	2006	130	Christopher Nolan	Jonathan Nolan, Christopher Nolan	Touchstone Pictures	After a tragic accident, two stage magicians engage in a battle to create the ultimate illusion while sacrificing everything they have to outwit each other.	8.5	1155723	\N	\N	new
50	2022-08-07 03:06:25.801652	2022-08-07 03:06:25.801652	\N	tt1675434	Intouchables	2011	112	Olivier Nakache, Éric Toledano	Olivier Nakache, Philippe Pozzo di Borgo	Quad Productions	After he becomes a quadriplegic from a paragliding accident, an aristocrat hires a young man from the projects to be his caregiver.	8.5	736691	\N	\N	new
51	2022-08-07 03:06:25.812652	2022-08-07 03:06:25.812652	\N	tt2582802	Whiplash	2014	106	Damien Chazelle	Damien Chazelle	Bold Films	A promising young drummer enrolls at a cut-throat music conservatory where his dreams of greatness are mentored by an instructor who will stop at nothing to realize a student's potential.	8.5	690732	\N	\N	new
52	2022-08-07 03:06:25.821966	2022-08-07 03:06:25.821966	\N	tt7286456	Joker	2019	122	Todd Phillips	Todd Phillips, Scott Silver	Warner Bros.	In Gotham City, mentally troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime. This path brings him face-to-face with his alter-ego: the Joker.	8.5	855097	\N	\N	new
53	2022-08-07 03:06:25.833803	2022-08-07 03:06:25.833803	\N	tt0032553	The Great Dictator	1940	125	Charles Chaplin	Charles Chaplin	Charles Chaplin Productions	Dictator Adenoid Hynkel tries to expand his empire while a poor Jewish barber tries to avoid persecution from Hynkel's regime.	8.4	197381	\N	\N	new
54	2022-08-07 03:06:25.844228	2022-08-07 03:06:25.844228	\N	tt0043014	Sunset Blvd.	1950	110	Billy Wilder	Charles Brackett, Billy Wilder	Paramount Pictures	A screenwriter develops a dangerous relationship with a faded film star determined to make a triumphant return.	8.4	195789	\N	\N	new
55	2022-08-07 03:06:25.853937	2022-08-07 03:06:25.853937	\N	tt0047396	Rear Window	1954	112	Alfred Hitchcock	John Michael Hayes, Cornell Woolrich	Alfred J. Hitchcock Productions	A wheelchair-bound photographer spies on his neighbors from his apartment window and becomes convinced one of them has committed murder.	8.4	432390	\N	\N	new
56	2022-08-07 03:06:25.866026	2022-08-07 03:06:25.866026	\N	tt0050825	Paths of Glory	1957	88	Stanley Kubrick	Stanley Kubrick, Calder Willingham	Bryna Productions	After refusing to attack an enemy position, a general accuses the soldiers of cowardice and their commanding officer must defend them.	8.4	172671	\N	\N	new
57	2022-08-07 03:06:25.874016	2022-08-07 03:06:25.874016	\N	tt0051201	Witness for the Prosecution	1957	116	Billy Wilder	Agatha Christie, Billy Wilder	Edward Small Productions	A veteran British barrister must defend his client in a murder trial that has surprise after surprise.	8.4	104524	\N	\N	new
58	2022-08-07 03:06:25.884836	2022-08-07 03:06:25.884836	\N	tt0057012	Dr. Strangelove or: How I Learned to Stop Worrying and Love the Bomb	1964	95	Stanley Kubrick	Stanley Kubrick, Terry Southern	Columbia Pictures	An insane general triggers a path to nuclear holocaust that a War Room full of politicians and generals frantically tries to stop.	8.4	441115	\N	\N	new
59	2022-08-07 03:06:25.890773	2022-08-07 03:06:25.890773	\N	tt0078748	Alien	1979	117	Ridley Scott	Dan O'Bannon, Dan O'Bannon	Brandywine Productions	After a space merchant vessel receives an unknown transmission as a distress call, one of the crew is attacked by a mysterious life form and they soon realize that its life cycle has merely begun.	8.4	768874	\N	\N	new
60	2022-08-07 03:06:25.90468	2022-08-07 03:06:25.90468	\N	tt0078788	Apocalypse Now	1979	147	Francis Ford Coppola	John Milius, Francis Ford Coppola	American Zoetrope	A U.S. Army officer serving in Vietnam is tasked with assassinating a renegade Special Forces Colonel who sees himself as a god.	8.4	591251	\N	\N	new
61	2022-08-07 03:06:25.98753	2022-08-07 03:06:25.98753	\N	tt0081505	The Shining	1980	146	Stanley Kubrick	Stephen King, Stanley Kubrick	Warner Bros.	A family heads to an isolated hotel for the winter where a sinister presence influences the father into violence, while his psychic son sees horrific forebodings from both past and future.	8.4	869480	\N	\N	new
62	2022-08-07 03:06:26.012134	2022-08-07 03:06:26.012134	\N	tt0082971	Raiders of the Lost Ark	1981	115	Steven Spielberg	Lawrence Kasdan, George Lucas	Paramount Pictures	In 1936, archaeologist and adventurer Indiana Jones is hired by the U.S. government to find the Ark of the Covenant before	8.4	865510	\N	\N	new
63	2022-08-07 03:06:26.027968	2022-08-07 03:06:26.027968	\N	tt0087843	Once Upon a Time in America	1984	229	Sergio Leone	Harry Grey, Leonardo Benvenuti	The Ladd Company	A former Prohibition-era Jewish gangster returns to the Lower East Side of Manhattan over thirty years later, where he once again must confront the ghosts and regrets of his old life.	8.4	302317	\N	\N	new
64	2022-08-07 03:06:26.038622	2022-08-07 03:06:26.038622	\N	tt0119698	Mononoke-hime	1997	134	Hayao Miyazaki	Hayao Miyazaki, Neil Gaiman	DENTSU Music And Entertainment	On a journey to find the cure for a Tatarigami's curse, Ashitaka finds himself in the middle of a war between the forest gods and Tatara, a mining colony. In this quest he also meets San, the Mononoke Hime.	8.4	331045	\N	\N	new
65	2022-08-07 03:06:26.048668	2022-08-07 03:06:26.048668	\N	tt0209144	Memento	2000	113	Christopher Nolan	Christopher Nolan, Jonathan Nolan	Newmarket Capital Group	A man with short-term memory loss attempts to track down his wife's murderer.	8.4	1098879	\N	\N	new
66	2022-08-07 03:06:26.059138	2022-08-07 03:06:26.059138	\N	tt0364569	Oldeuboi	2003	120	Chan-wook Park	Garon Tsuchiya, Nobuaki Minegishi	Egg Films	After being kidnapped and imprisoned for fifteen years, Oh Dae-Su is released, only to find that he must find his captor in five days.	8.4	501082	\N	\N	new
67	2022-08-07 03:06:26.073234	2022-08-07 03:06:26.073234	\N	tt0405094	Das Leben der Anderen	2006	137	Florian Henckel von Donnersmarck	Florian Henckel von Donnersmarck	Wiedemann & Berg Filmproduktion	In 1984 East Berlin, an agent of the secret police, conducting surveillance on a writer and his lover, finds himself becoming increasingly absorbed by their lives.	8.4	349642	\N	\N	new
68	2022-08-07 03:06:26.085635	2022-08-07 03:06:26.085635	\N	tt0910970	WALL·E	2008	98	Andrew Stanton	Andrew Stanton, Pete Docter	FortyFour Studios	In the distant future, a small waste-collecting robot inadvertently embarks on a space journey that will ultimately decide the fate of mankind.	8.4	974734	\N	\N	new
69	2022-08-07 03:06:26.097324	2022-08-07 03:06:26.097324	\N	tt0986264	Taare Zameen Par	2007	165	Aamir Khan, Amole Gupte	Amole Gupte, Amole Gupte	Aamir Khan Productions	An eight-year-old boy is thought to be a lazy trouble-maker, until the new art teacher has the patience and compassion to discover the real problem behind his struggles in school.	8.4	161867	\N	\N	new
70	2022-08-07 03:06:26.106248	2022-08-07 03:06:26.106248	\N	tt1187043	3 Idiots	2009	170	Rajkumar Hirani	Rajkumar Hirani, Abhijat Joshi	Vinod Chopra Productions	Two friends are searching for their long lost companion. They revisit their college days and recall the memories of their friend who inspired them to think differently, even as the rest of the world called them "idiots".	8.4	332217	\N	\N	new
71	2022-08-07 03:06:26.114442	2022-08-07 03:06:26.114442	\N	tt1345836	The Dark Knight Rises	2012	164	Christopher Nolan	Jonathan Nolan, Christopher Nolan	Warner Bros.	Eight years after the Joker's reign of anarchy, Batman, with the help of the enigmatic Catwoman, is forced from his exile to save Gotham City from the brutal guerrilla terrorist Bane.	8.4	1480582	\N	\N	new
72	2022-08-07 03:06:26.123633	2022-08-07 03:06:26.123633	\N	tt1853728	Django Unchained	2012	165	Quentin Tarantino	Quentin Tarantino	The Weinstein Company	With the help of a German bounty hunter, a freed slave sets out to rescue his wife from a brutal Mississippi plantation owner.	8.4	1317856	\N	\N	new
73	2022-08-07 03:06:26.135185	2022-08-07 03:06:26.135185	\N	tt2380307	Coco	2017	105	Lee Unkrich, Adrian Molina	Lee Unkrich, Jason Katz	Walt Disney Pictures	Aspiring musician Miguel, confronted with his family's ancestral ban on music, enters the Land of the Dead to find his great-great-grandfather, a legendary singer.	8.4	352455	\N	\N	new
74	2022-08-07 03:06:26.145164	2022-08-07 03:06:26.145164	\N	tt4154756	Avengers: Infinity War	2018	149	Anthony Russo, Joe Russo	Christopher Markus, Stephen McFeely	Marvel Studios	The Avengers and their allies must be willing to sacrifice all in an attempt to defeat the powerful Thanos before his blitz of devastation and ruin puts an end to the universe.	8.4	796486	\N	\N	new
75	2022-08-07 03:06:26.153699	2022-08-07 03:06:26.153699	\N	tt4154796	Avengers: Endgame	2019	181	Anthony Russo, Joe Russo	Christopher Markus, Stephen McFeely	Marvel Studios	After the devastating events of	8.4	754786	\N	\N	new
76	2022-08-07 03:06:26.166007	2022-08-07 03:06:26.166007	\N	tt4633694	Spider-Man: Into the Spider-Verse	2018	117	Bob Persichetti, Peter Ramsey	Phil Lord, Rodney Rothman	Sony Pictures Entertainment (SPE)	Teen Miles Morales becomes the Spider-Man of his universe, and must join with five spider-powered individuals from other dimensions to stop a threat for all realities.	8.4	335892	\N	\N	new
77	2022-08-07 03:06:26.17637	2022-08-07 03:06:26.17637	\N	tt5074352	Dangal	2016	161	Nitesh Tiwari	Piyush Gupta, Shreyas Jain	Aamir Khan Productions	Former wrestler	8.4	147907	\N	\N	new
78	2022-08-07 03:06:26.186639	2022-08-07 03:06:26.186639	\N	tt5311514	Kimi no na wa.	2016	106	Makoto Shinkai	Makoto Shinkai, Makoto Shinkai	Amuse	Two strangers find themselves linked in a bizarre way. When a connection forms, will distance be the only thing to keep them apart?	8.4	178480	\N	\N	new
79	2022-08-07 03:06:26.198851	2022-08-07 03:06:26.198851	\N	tt8267604	Capharnaüm	2018	126	Nadine Labaki	Nadine Labaki, Jihad Hojeily	Mooz Films	While serving a five-year sentence for a violent crime, a 12-year-old boy sues his parents for neglect.	8.4	53506	\N	\N	new
80	2022-08-07 03:06:26.20298	2022-08-07 03:06:26.20298	\N	tt0012349	The Kid	1921	68	Charles Chaplin	Charles Chaplin	Charles Chaplin Productions	The Tramp cares for an abandoned child, but events put that relationship in jeopardy.	8.3	109038	\N	\N	new
81	2022-08-07 03:06:26.208166	2022-08-07 03:06:26.208166	\N	tt0017136	Metropolis	1927	153	Fritz Lang	Thea von Harbou, Thea von Harbou	Universum Film (UFA)	In a futuristic city sharply divided between the working class and the city planners, the son of the city's mastermind falls in love with a working class prophet who predicts the coming of a savior to mediate their differences.	8.3	156076	\N	\N	new
82	2022-08-07 03:06:26.219177	2022-08-07 03:06:26.219177	\N	tt0022100	M - Eine Stadt sucht einen Mörder	1931	117	Fritz Lang	Thea von Harbou, Fritz Lang	Nero-Film AG	When the police in a German city are unable to catch a child-murderer, other criminals join in the manhunt.	8.3	139271	\N	\N	new
83	2022-08-07 03:06:26.229329	2022-08-07 03:06:26.229329	\N	tt0033467	Citizen Kane	1941	119	Orson Welles	Herman J. Mankiewicz, Orson Welles	RKO Radio Pictures	Following the death of publishing tycoon Charles Foster Kane, reporters scramble to uncover the meaning of his final utterance; 'Rosebud'.	8.3	389322	\N	\N	new
84	2022-08-07 03:06:26.236893	2022-08-07 03:06:26.236893	\N	tt0036775	Double Indemnity	1944	107	Billy Wilder	Billy Wilder, Raymond Chandler	Paramount Pictures	An insurance representative lets himself be talked by a seductive housewife into a murder/insurance fraud scheme that arouses the suspicion of an insurance investigator.	8.3	139564	\N	\N	new
85	2022-08-07 03:06:26.24412	2022-08-07 03:06:26.24412	\N	tt0040522	Ladri di biciclette	1948	89	Vittorio De Sica	Cesare Zavattini, Luigi Bartolini	Produzioni De Sica (PDS)	In post-war Italy, a working-class man's bicycle is stolen. He and his son set out to find it.	8.3	141507	\N	\N	new
86	2022-08-07 03:06:26.253738	2022-08-07 03:06:26.253738	\N	tt0044741	Ikiru	1952	143	Akira Kurosawa	Akira Kurosawa, Shinobu Hashimoto	Toho Company	A bureaucrat tries to find a meaning in his life after he discovers he has terminal cancer.	8.3	65369	\N	\N	new
87	2022-08-07 03:06:26.26202	2022-08-07 03:06:26.26202	\N	tt0045152	Singin' in the Rain	1952	103	Stanley Donen, Gene Kelly	Betty Comden, Adolph Green	Metro-Goldwyn-Mayer (MGM)	A silent film production company and cast make a difficult transition to sound.	8.3	213152	\N	\N	new
88	2022-08-07 03:06:26.270044	2022-08-07 03:06:26.270044	\N	tt0052357	Vertigo	1958	128	Alfred Hitchcock	Alec Coppel, Samuel A. Taylor	Alfred J. Hitchcock Productions	A former police detective juggles wrestling with his personal demons and becoming obsessed with a hauntingly beautiful woman.	8.3	352786	\N	\N	new
89	2022-08-07 03:06:26.286364	2022-08-07 03:06:26.286364	\N	tt0053125	North by Northwest	1959	136	Alfred Hitchcock	Ernest Lehman	Metro-Goldwyn-Mayer (MGM)	A New York City advertising executive goes on the run after being mistaken for a government agent by a group of foreign spies.	8.3	291628	\N	\N	new
90	2022-08-07 03:06:26.299575	2022-08-07 03:06:26.299575	\N	tt0053604	The Apartment	1960	125	Billy Wilder	Billy Wilder, I.A.L. Diamond	The Mirisch Corporation	A man tries to rise in his company by letting its executives use his apartment for trysts, but complications and a romance of his own ensue.	8.3	158999	\N	\N	new
91	2022-08-07 03:06:26.31141	2022-08-07 03:06:26.31141	\N	tt0056172	Lawrence of Arabia	1962	228	David Lean	T.E. Lawrence, Robert Bolt	Horizon Pictures (II)	The story of	8.3	261504	\N	\N	new
92	2022-08-07 03:06:26.320499	2022-08-07 03:06:26.320499	\N	tt0059578	Per qualche dollaro in più	1965	132	Sergio Leone	Sergio Leone, Fulvio Morsella	Produzioni Europee Associate (PEA)	Two bounty hunters with the same intentions team up to track down a Western outlaw.	8.3	226039	\N	\N	new
93	2022-08-07 03:06:26.331686	2022-08-07 03:06:26.331686	\N	tt0062622	2001: A Space Odyssey	1968	149	Stanley Kubrick	Stanley Kubrick, Arthur C. Clarke	Metro-Goldwyn-Mayer (MGM)	After discovering a mysterious artifact buried beneath the Lunar surface, mankind sets off on a quest to find its origins with help from intelligent supercomputer H.A.L. 9000.	8.3	587866	\N	\N	new
94	2022-08-07 03:06:26.342843	2022-08-07 03:06:26.342843	\N	tt0066921	A Clockwork Orange	1971	136	Stanley Kubrick	Stanley Kubrick, Anthony Burgess	Warner Bros.	In the future, a sadistic gang leader is imprisoned and volunteers for a conduct-aversion experiment, but it doesn't go as planned.	8.3	740301	\N	\N	new
95	2022-08-07 03:06:26.354037	2022-08-07 03:06:26.354037	\N	tt0070735	The Sting	1973	129	George Roy Hill	David S. Ward	Zanuck/Brown Productions	Two grifters team up to pull off the ultimate con.	8.3	236285	\N	\N	new
96	2022-08-07 03:06:26.368719	2022-08-07 03:06:26.368719	\N	tt0075314	Taxi Driver	1976	114	Martin Scorsese	Paul Schrader	Columbia Pictures	A mentally unstable veteran works as a nighttime taxi driver in New York City, where the perceived decadence and sleaze fuels his urge for violent action by attempting to liberate a presidential campaign worker and an underage prostitute.	8.3	703264	\N	\N	new
97	2022-08-07 03:06:26.380299	2022-08-07 03:06:26.380299	\N	tt0082096	Das Boot	1981	149	Wolfgang Petersen	Wolfgang Petersen, Lothar G. Buchheim	Bavaria Film	The claustrophobic world of a WWII German U-boat; boredom, filth and sheer terror.	8.3	226427	\N	\N	new
98	2022-08-07 03:06:26.389748	2022-08-07 03:06:26.389748	\N	tt0086190	Star Wars: Episode VI - Return of the Jedi	1983	131	Richard Marquand	Lawrence Kasdan, George Lucas	Lucasfilm	After a daring mission to rescue Han Solo from Jabba the Hutt, the Rebels dispatch to Endor to destroy the second Death Star. Meanwhile, Luke struggles to help Darth Vader back from the dark side without falling into the Emperor's trap.	8.3	928036	\N	\N	new
99	2022-08-07 03:06:26.406	2022-08-07 03:06:26.406	\N	tt0086250	Scarface	1983	170	Brian De Palma	Oliver Stone	Universal Pictures	In 1980 Miami, a determined Cuban immigrant takes over a drug cartel and succumbs to greed.	8.3	721343	\N	\N	new
100	2022-08-07 03:06:26.41888	2022-08-07 03:06:26.41888	\N	tt0086879	Amadeus	1984	160	Milos Forman	Peter Shaffer, Peter Shaffer	AMLF	The life, success and troubles of	8.3	361028	\N	\N	new
\.


--
-- TOC entry 3706 (class 0 OID 33758)
-- Dependencies: 225
-- Data for Name: movie_actor; Type: TABLE DATA; Schema: public; Owner: phamthainb
--

COPY public.movie_actor ("movieId", "actorId") FROM stdin;
1	1
1	2
1	3
1	4
1	5
1	6
1	7
1	8
1	9
1	10
1	11
1	12
1	13
1	14
1	15
2	16
2	17
2	18
2	19
2	20
2	21
2	22
2	23
2	24
2	25
2	26
2	27
2	28
2	29
2	30
3	17
3	20
3	25
3	31
3	29
3	27
3	32
3	33
3	34
3	35
3	36
3	37
3	38
3	39
3	40
4	41
4	42
4	43
4	44
4	45
4	46
4	2
4	47
4	48
4	49
4	50
4	51
4	52
4	53
4	54
5	55
5	56
5	57
5	58
5	59
5	60
5	61
5	62
5	63
5	64
5	65
5	66
6	67
6	68
6	69
6	70
6	71
6	72
6	73
6	74
6	75
6	76
6	77
6	78
6	79
6	80
6	81
7	82
7	83
7	84
7	85
7	86
7	87
7	88
7	89
7	90
7	91
7	92
7	93
7	94
7	95
7	96
8	97
8	98
8	99
8	100
8	101
8	102
8	103
8	104
8	105
8	106
8	107
8	108
8	109
8	110
8	111
9	112
9	113
9	114
9	115
9	116
9	117
9	118
9	119
9	120
9	121
9	122
9	123
9	124
9	125
9	126
10	127
10	128
10	129
10	130
10	131
10	132
10	133
10	134
10	135
10	136
10	137
10	138
10	139
10	140
10	141
11	142
11	97
11	99
11	143
11	102
11	103
11	104
11	105
11	108
11	144
11	145
11	146
11	147
11	148
11	149
12	150
12	151
12	152
12	153
12	154
12	155
12	156
12	157
12	158
12	159
12	160
12	161
12	162
12	163
12	164
13	165
13	166
13	167
13	168
13	169
13	170
13	49
13	171
13	172
13	173
13	44
13	174
13	175
13	176
13	177
14	178
14	179
14	180
14	181
14	182
14	183
14	184
14	185
14	186
14	187
14	188
14	189
14	190
14	191
14	192
15	193
15	194
15	195
15	196
15	197
15	198
15	199
15	200
15	201
15	202
15	203
15	204
15	205
15	206
15	207
16	208
16	209
16	210
16	211
16	212
16	213
16	214
16	215
16	216
16	217
16	218
16	219
16	220
16	221
16	222
17	223
17	224
17	225
17	226
17	227
17	228
17	229
17	230
17	231
17	232
17	233
17	234
17	235
17	236
17	237
18	31
18	238
18	239
18	240
18	241
18	39
18	242
18	243
18	244
18	245
18	246
18	247
18	248
18	249
18	250
19	251
19	252
19	253
19	254
19	255
19	256
19	257
19	258
19	259
19	260
19	261
19	262
19	263
19	100
19	264
20	265
20	99
20	101
20	143
20	103
20	104
20	105
20	266
20	267
20	268
20	269
20	111
20	270
20	271
20	148
21	272
21	273
21	274
21	275
21	276
21	277
21	278
21	279
21	280
21	281
21	282
21	283
21	284
21	285
21	286
22	287
22	288
22	289
22	290
22	291
22	292
22	293
22	294
22	295
22	296
22	297
22	298
22	299
22	300
22	301
23	223
23	224
23	225
23	302
23	232
23	227
23	230
23	229
23	228
23	303
23	304
23	235
23	305
23	306
23	307
24	308
24	309
24	310
24	311
24	312
24	313
24	314
24	315
24	316
24	317
24	318
24	319
24	320
24	321
24	322
25	2
25	323
25	324
25	151
25	325
25	326
25	327
25	328
25	329
25	330
25	331
25	332
25	333
25	334
25	335
26	336
26	337
26	338
26	339
26	340
26	341
26	342
26	343
26	344
26	345
26	346
26	347
26	348
26	349
26	350
27	127
27	351
27	352
27	353
27	354
27	355
27	356
27	357
27	358
27	359
27	9
27	360
27	361
27	362
27	363
28	127
28	364
28	365
28	359
28	366
28	367
28	368
28	369
28	370
28	371
28	372
28	373
28	374
28	375
28	376
29	377
29	378
29	379
29	380
29	381
29	382
29	383
29	384
29	385
29	386
29	387
29	388
29	389
29	390
29	391
30	392
30	393
30	394
30	395
30	396
30	397
30	398
30	399
30	400
30	401
30	402
30	403
30	404
30	405
30	406
31	407
31	408
31	409
31	410
31	411
31	412
31	413
31	414
31	415
31	416
31	417
31	418
31	419
31	44
31	420
32	421
32	422
32	423
32	424
32	425
32	426
32	427
32	428
32	429
32	430
32	431
32	432
32	433
32	434
32	435
33	436
33	437
33	438
33	439
33	440
33	441
34	441
34	442
34	443
34	444
34	445
34	440
34	446
34	439
34	447
34	448
34	449
34	450
34	451
34	452
34	453
35	454
35	455
35	456
35	457
35	458
35	459
35	460
35	461
35	462
35	463
35	464
35	465
35	466
35	467
36	468
36	469
36	470
36	471
36	55
36	472
36	473
36	282
36	474
36	475
36	476
36	477
36	478
37	479
37	62
37	480
37	481
37	482
37	483
37	484
37	485
37	486
37	487
37	488
38	489
38	490
38	491
38	492
38	493
38	494
38	495
38	496
38	497
38	498
38	499
38	500
38	501
38	502
38	503
39	504
39	505
39	506
39	507
39	508
39	509
39	510
39	511
39	512
39	513
39	514
39	515
39	516
39	517
39	518
40	519
40	520
40	521
40	522
40	523
40	524
40	525
40	526
40	527
40	528
40	529
40	530
40	531
40	532
40	533
41	534
41	535
41	536
41	537
41	538
41	539
41	540
41	541
41	542
41	543
41	544
41	545
41	546
41	547
41	548
42	549
42	550
42	551
42	552
42	553
42	554
42	555
42	556
42	557
42	558
42	559
42	560
42	561
42	562
42	563
43	564
43	46
43	565
43	566
43	567
43	568
43	569
43	570
43	571
43	572
43	573
43	574
43	575
43	576
43	577
44	578
44	579
44	580
44	581
44	582
44	583
44	173
44	584
44	585
44	586
44	587
44	588
44	589
44	590
44	591
45	150
45	536
45	592
45	593
45	594
45	595
45	596
45	597
45	598
45	599
45	600
45	601
45	602
45	603
45	604
46	605
46	606
46	607
46	608
46	609
46	610
46	611
46	612
46	613
46	614
46	615
46	616
46	617
46	618
46	619
47	620
47	621
47	622
47	623
47	624
47	625
47	626
47	627
47	628
47	629
47	630
47	631
47	632
47	633
47	634
48	165
48	370
48	208
48	635
48	636
48	637
48	638
48	639
48	640
48	641
48	642
48	643
48	7
48	644
48	645
49	646
49	41
49	44
49	647
49	648
49	649
49	650
49	651
49	652
49	653
49	654
49	655
49	656
49	657
49	658
50	659
50	660
50	661
50	662
50	663
50	664
50	665
50	666
50	667
50	668
50	669
50	670
50	671
50	672
50	673
51	674
51	675
51	676
51	677
51	678
51	679
51	680
51	681
51	682
51	683
51	684
51	685
51	686
51	687
51	688
52	606
52	31
52	689
52	690
52	691
52	692
52	693
52	694
52	695
52	696
52	697
52	698
52	699
52	700
52	701
53	441
53	702
53	703
53	704
53	705
53	706
53	707
53	442
53	708
53	709
53	710
53	711
53	445
53	712
53	440
54	713
54	714
54	715
54	716
54	717
54	718
54	719
54	720
54	721
54	722
54	723
54	724
54	725
54	726
54	281
55	272
55	727
55	728
55	729
55	730
55	731
55	732
55	733
55	734
55	735
55	736
55	737
55	738
55	739
56	740
56	741
56	742
56	743
56	744
56	745
56	746
56	747
56	748
56	749
56	750
56	751
56	752
56	753
56	754
57	755
57	756
57	757
57	758
57	759
57	704
57	760
57	761
57	762
57	763
57	764
57	765
57	766
58	767
58	768
58	21
58	486
58	769
58	770
58	556
58	771
58	772
58	773
58	774
58	775
58	776
58	777
58	778
59	779
59	780
59	781
59	361
59	782
59	147
59	783
59	784
59	785
60	16
60	636
60	20
60	786
60	787
60	252
60	788
60	224
60	789
60	34
60	790
60	312
60	791
60	792
60	793
61	208
61	794
61	795
61	214
61	796
61	797
61	746
61	798
61	799
61	800
61	801
61	802
61	803
61	804
61	805
62	224
62	806
62	807
62	808
62	809
62	810
62	811
62	812
62	813
62	814
62	815
62	816
62	817
62	818
62	819
63	31
63	820
63	821
63	822
63	823
63	824
63	239
63	566
63	825
63	826
63	827
63	828
63	829
63	830
63	35
64	831
64	832
64	833
64	834
64	835
64	836
64	837
64	838
64	839
64	840
64	841
64	842
64	843
64	844
64	845
65	846
65	253
65	256
65	847
65	848
65	849
65	850
65	851
65	852
65	853
65	854
65	855
65	856
66	857
66	858
66	859
66	860
66	861
66	862
66	863
66	864
66	865
66	866
66	867
66	868
66	869
66	870
66	871
67	872
67	873
67	874
67	875
67	876
67	877
67	878
67	879
67	880
67	881
67	882
67	883
67	884
67	885
67	886
68	887
68	888
68	889
68	890
68	891
68	892
68	893
68	780
68	894
68	895
68	896
68	897
68	898
68	899
68	900
69	901
69	902
69	903
69	904
69	905
69	906
69	907
69	908
69	909
69	910
69	911
69	912
69	913
69	914
69	915
70	902
70	916
70	917
70	918
70	919
70	920
70	921
70	922
70	923
70	924
70	925
70	926
70	927
70	928
70	929
71	41
71	46
71	168
71	166
71	416
71	172
71	2
71	44
71	930
71	931
71	932
71	933
71	934
71	935
71	936
72	937
72	938
72	165
72	939
72	86
72	940
72	941
72	942
72	943
72	944
72	945
72	946
72	947
72	948
72	949
73	950
73	951
73	952
73	953
73	954
73	955
73	956
73	957
73	958
73	959
73	960
73	961
73	962
73	963
73	964
74	965
74	966
74	967
74	968
74	649
74	969
74	970
74	971
74	972
74	973
74	974
74	975
74	976
74	977
74	978
75	965
75	968
75	967
75	966
75	649
75	979
75	969
75	980
75	970
75	972
75	981
75	971
75	974
75	973
75	982
76	983
76	984
76	985
76	986
76	987
76	988
76	989
76	990
76	991
76	992
76	993
76	994
76	995
76	996
76	997
77	902
77	998
77	999
77	1000
77	1001
77	1002
77	1003
77	1004
77	1005
77	1006
77	1007
77	1008
77	1009
77	1010
77	1011
78	383
78	1012
78	1013
78	1014
78	1015
78	1016
78	1017
78	1018
78	1019
78	1020
78	1021
78	1022
78	1023
78	1024
78	1025
79	1026
79	1027
79	1028
79	1029
79	1030
79	1031
79	1032
79	1033
79	1034
79	1035
79	1036
79	1037
79	1038
79	1039
79	1040
80	1041
80	1042
80	1043
80	441
81	1044
81	1045
81	1046
81	1047
81	1048
81	1049
81	1050
81	1051
82	460
82	1052
82	1053
82	1054
82	1048
82	1055
82	1056
82	1057
82	1058
82	1059
82	1060
82	1061
82	1062
82	1063
82	1064
83	1065
83	1066
83	1067
83	1068
83	1069
83	1070
83	1071
83	1072
83	1073
83	1074
83	1075
83	1076
83	1077
83	1078
83	1079
84	1080
84	1081
84	1082
84	1083
84	1084
84	1085
84	1086
84	1087
84	1075
84	1088
85	1089
85	1090
85	1091
85	1092
85	1093
85	1094
85	1095
85	1096
85	1097
85	1098
85	1099
86	288
86	1100
86	1101
86	294
86	1102
86	297
86	1103
86	291
86	1104
86	1105
86	1106
86	1107
86	293
86	1108
86	1109
87	1110
87	1111
87	1112
87	1113
87	1114
87	1115
87	1116
87	1117
88	272
88	1118
88	1119
88	1120
88	1121
88	1122
88	1123
88	1124
88	1125
89	1126
89	1127
89	1128
89	1129
89	1130
89	1131
89	1132
89	1133
89	1134
89	1135
89	1136
89	1137
89	1138
89	1139
89	60
90	1140
90	1141
90	1080
90	1142
90	1143
90	1144
90	1145
90	1146
90	1147
90	1148
90	1149
90	1150
90	1151
90	1152
91	1153
91	232
91	1154
91	1155
91	1156
91	1157
91	1158
91	457
91	1159
91	1160
91	1161
91	1162
91	1163
91	1164
91	1165
92	113
92	114
92	1166
92	1167
92	116
92	1168
92	1169
92	124
92	1170
92	1171
92	1172
92	1173
92	1174
92	1175
92	1176
93	1177
93	1178
93	1179
93	1180
93	1181
93	1182
93	1183
93	1184
93	1185
93	1186
93	1187
93	1188
93	775
93	1189
93	1190
94	1191
94	1192
94	1193
94	1194
94	1195
94	1196
94	1197
94	1198
94	1199
94	1200
94	1201
94	1202
94	1203
94	1204
94	1205
95	1206
95	1207
95	1208
95	1209
95	1142
95	1210
95	1211
95	1212
95	1213
95	1214
95	1215
95	1216
95	1217
95	1218
95	1219
96	1220
96	1221
96	1222
96	1223
96	1224
96	1225
96	1226
96	1227
96	1228
96	31
96	1229
96	1230
96	308
96	1231
96	1232
97	1233
97	1234
97	1235
97	1236
97	1237
97	1238
97	1239
97	1240
97	1241
97	1242
97	1243
97	1244
97	1245
97	1246
97	1247
98	223
98	224
98	225
98	226
98	227
98	229
98	1248
98	1249
98	231
98	556
98	228
98	232
98	230
98	1250
98	1251
99	17
99	1252
99	1253
99	1254
99	1255
99	1256
99	1257
99	1258
99	1259
99	1260
99	1261
99	1262
99	1263
99	1264
99	1265
100	1257
100	1266
100	1267
100	1268
100	1269
100	1270
100	1271
100	1272
100	1273
100	230
100	1274
100	1275
100	1276
100	1277
100	1278
\.


--
-- TOC entry 3705 (class 0 OID 33751)
-- Dependencies: 224
-- Data for Name: movie_tag; Type: TABLE DATA; Schema: public; Owner: phamthainb
--

COPY public.movie_tag ("movieId", "tagId") FROM stdin;
1	1
2	2
2	1
3	2
3	1
4	3
4	2
4	1
5	2
5	1
6	4
6	1
6	5
7	2
7	1
8	3
8	6
8	1
9	7
10	1
10	8
11	3
11	6
11	1
12	1
13	3
13	6
13	9
14	3
14	1
14	10
15	11
15	1
15	8
16	1
17	3
17	6
17	12
18	4
18	2
18	1
19	3
19	9
20	3
20	6
20	1
21	1
21	13
21	12
22	3
22	6
22	1
23	3
23	6
23	12
24	2
24	1
24	14
25	2
25	1
25	15
26	11
26	1
26	8
27	2
27	1
27	12
28	1
28	10
29	16
29	6
29	13
30	2
30	1
31	6
31	1
31	9
32	11
32	1
32	14
33	11
33	1
33	8
34	11
34	1
34	13
35	1
35	8
35	10
36	17
36	15
36	14
37	7
38	6
38	11
38	9
39	16
39	1
39	10
40	1
41	3
41	9
42	16
42	6
42	1
43	3
43	2
43	1
44	2
44	15
44	14
45	1
46	3
46	6
46	1
47	4
47	1
47	18
48	2
48	1
48	14
49	1
49	15
49	9
50	4
50	11
50	1
51	1
51	18
52	2
52	1
52	14
53	11
53	1
53	10
54	1
54	19
55	15
55	14
56	1
56	10
57	2
57	1
57	15
58	11
59	17
59	9
60	1
60	15
60	10
61	1
61	17
62	3
62	6
63	2
63	1
64	16
64	6
64	12
65	15
65	14
66	3
66	1
66	15
67	1
67	15
67	14
68	16
68	6
68	13
69	1
69	13
70	11
70	1
71	3
71	6
72	1
72	7
73	16
73	6
73	13
74	3
74	6
74	9
75	3
75	6
75	1
76	16
76	3
76	6
77	3
77	4
77	1
78	16
78	1
78	12
79	1
80	11
80	1
80	13
81	1
81	9
82	2
82	15
82	14
83	1
83	15
84	2
84	1
84	19
85	1
86	1
87	11
87	20
87	8
88	15
88	8
88	14
89	6
89	15
89	14
90	11
90	1
90	8
91	6
91	4
91	1
92	7
93	6
93	9
94	2
94	1
94	9
95	11
95	2
95	1
96	2
96	1
97	6
97	1
97	14
98	3
98	6
98	12
99	2
99	1
100	4
100	1
100	5
\.


--
-- TOC entry 3696 (class 0 OID 33680)
-- Dependencies: 215
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: phamthainb
--

COPY public.tag (id, "createdAt", "updatedAt", "deletedAt", name) FROM stdin;
1	2022-08-07 03:06:24.504933	2022-08-07 03:06:24.504933	\N	Drama
2	2022-08-07 03:06:24.588321	2022-08-07 03:06:24.588321	\N	Crime
3	2022-08-07 03:06:24.644544	2022-08-07 03:06:24.644544	\N	Action
4	2022-08-07 03:06:24.686413	2022-08-07 03:06:24.686413	\N	Biography
5	2022-08-07 03:06:24.688196	2022-08-07 03:06:24.688196	\N	History
6	2022-08-07 03:06:24.74811	2022-08-07 03:06:24.74811	\N	Adventure
7	2022-08-07 03:06:24.798284	2022-08-07 03:06:24.798284	\N	Western
8	2022-08-07 03:06:24.828636	2022-08-07 03:06:24.828636	\N	Romance
9	2022-08-07 03:06:24.892262	2022-08-07 03:06:24.892262	\N	Sci-Fi
10	2022-08-07 03:06:24.942307	2022-08-07 03:06:24.942307	\N	War
11	2022-08-07 03:06:25.003904	2022-08-07 03:06:25.003904	\N	Comedy
12	2022-08-07 03:06:25.088816	2022-08-07 03:06:25.088816	\N	Fantasy
13	2022-08-07 03:06:25.184708	2022-08-07 03:06:25.184708	\N	Family
14	2022-08-07 03:06:25.354327	2022-08-07 03:06:25.354327	\N	Thriller
15	2022-08-07 03:06:25.381422	2022-08-07 03:06:25.381422	\N	Mystery
16	2022-08-07 03:06:25.466964	2022-08-07 03:06:25.466964	\N	Animation
17	2022-08-07 03:06:25.586184	2022-08-07 03:06:25.586184	\N	Horror
18	2022-08-07 03:06:25.751413	2022-08-07 03:06:25.751413	\N	Music
19	2022-08-07 03:06:25.835902	2022-08-07 03:06:25.835902	\N	Film-Noir
20	2022-08-07 03:06:26.255188	2022-08-07 03:06:26.255188	\N	Musical
\.


--
-- TOC entry 3690 (class 0 OID 33636)
-- Dependencies: 209
-- Data for Name: typeorm_metadata; Type: TABLE DATA; Schema: public; Owner: phamthainb
--

COPY public.typeorm_metadata (type, database, schema, "table", name, value) FROM stdin;
\.


--
-- TOC entry 3720 (class 0 OID 0)
-- Dependencies: 210
-- Name: account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phamthainb
--

SELECT pg_catalog.setval('public.account_id_seq', 3, true);


--
-- TOC entry 3721 (class 0 OID 0)
-- Dependencies: 212
-- Name: actor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phamthainb
--

SELECT pg_catalog.setval('public.actor_id_seq', 1278, true);


--
-- TOC entry 3722 (class 0 OID 0)
-- Dependencies: 218
-- Name: collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phamthainb
--

SELECT pg_catalog.setval('public.collection_id_seq', 7, true);


--
-- TOC entry 3723 (class 0 OID 0)
-- Dependencies: 220
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phamthainb
--

SELECT pg_catalog.setval('public.comment_id_seq', 1, true);


--
-- TOC entry 3724 (class 0 OID 0)
-- Dependencies: 222
-- Name: history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phamthainb
--

SELECT pg_catalog.setval('public.history_id_seq', 1, false);


--
-- TOC entry 3725 (class 0 OID 0)
-- Dependencies: 216
-- Name: movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phamthainb
--

SELECT pg_catalog.setval('public.movie_id_seq', 100, true);


--
-- TOC entry 3726 (class 0 OID 0)
-- Dependencies: 214
-- Name: tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phamthainb
--

SELECT pg_catalog.setval('public.tag_id_seq', 20, true);


--
-- TOC entry 3523 (class 2606 OID 33678)
-- Name: actor PK_05b325494fcc996a44ae6928e5e; Type: CONSTRAINT; Schema: public; Owner: phamthainb
--

ALTER TABLE ONLY public.actor
    ADD CONSTRAINT "PK_05b325494fcc996a44ae6928e5e" PRIMARY KEY (id);


--
-- TOC entry 3531 (class 2606 OID 33735)
-- Name: comment PK_0b0e4bbc8415ec426f87f3a88e2; Type: CONSTRAINT; Schema: public; Owner: phamthainb
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT "PK_0b0e4bbc8415ec426f87f3a88e2" PRIMARY KEY (id);


--
-- TOC entry 3537 (class 2606 OID 33755)
-- Name: movie_tag PK_3fbb510576135acf0b082b02885; Type: CONSTRAINT; Schema: public; Owner: phamthainb
--

ALTER TABLE ONLY public.movie_tag
    ADD CONSTRAINT "PK_3fbb510576135acf0b082b02885" PRIMARY KEY ("movieId", "tagId");


--
-- TOC entry 3519 (class 2606 OID 33665)
-- Name: account PK_54115ee388cdb6d86bb4bf5b2ea; Type: CONSTRAINT; Schema: public; Owner: phamthainb
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT "PK_54115ee388cdb6d86bb4bf5b2ea" PRIMARY KEY (id);


--
-- TOC entry 3525 (class 2606 OID 33689)
-- Name: tag PK_8e4052373c579afc1471f526760; Type: CONSTRAINT; Schema: public; Owner: phamthainb
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT "PK_8e4052373c579afc1471f526760" PRIMARY KEY (id);


--
-- TOC entry 3533 (class 2606 OID 33750)
-- Name: history PK_9384942edf4804b38ca0ee51416; Type: CONSTRAINT; Schema: public; Owner: phamthainb
--

ALTER TABLE ONLY public.history
    ADD CONSTRAINT "PK_9384942edf4804b38ca0ee51416" PRIMARY KEY (id);


--
-- TOC entry 3529 (class 2606 OID 33723)
-- Name: collection PK_ad3f485bbc99d875491f44d7c85; Type: CONSTRAINT; Schema: public; Owner: phamthainb
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT "PK_ad3f485bbc99d875491f44d7c85" PRIMARY KEY (id);


--
-- TOC entry 3527 (class 2606 OID 33710)
-- Name: movie PK_cb3bb4d61cf764dc035cbedd422; Type: CONSTRAINT; Schema: public; Owner: phamthainb
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT "PK_cb3bb4d61cf764dc035cbedd422" PRIMARY KEY (id);


--
-- TOC entry 3541 (class 2606 OID 33762)
-- Name: movie_actor PK_ec68224442acf0fe62985ba725d; Type: CONSTRAINT; Schema: public; Owner: phamthainb
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT "PK_ec68224442acf0fe62985ba725d" PRIMARY KEY ("movieId", "actorId");


--
-- TOC entry 3521 (class 2606 OID 33667)
-- Name: account UQ_41dfcb70af895ddf9a53094515b; Type: CONSTRAINT; Schema: public; Owner: phamthainb
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT "UQ_41dfcb70af895ddf9a53094515b" UNIQUE (username);


--
-- TOC entry 3534 (class 1259 OID 33757)
-- Name: IDX_31fc580c1847949cb41e65a34e; Type: INDEX; Schema: public; Owner: phamthainb
--

CREATE INDEX "IDX_31fc580c1847949cb41e65a34e" ON public.movie_tag USING btree ("tagId");


--
-- TOC entry 3538 (class 1259 OID 33764)
-- Name: IDX_528cb7d2a0c17e05421ab14881; Type: INDEX; Schema: public; Owner: phamthainb
--

CREATE INDEX "IDX_528cb7d2a0c17e05421ab14881" ON public.movie_actor USING btree ("actorId");


--
-- TOC entry 3535 (class 1259 OID 33756)
-- Name: IDX_c5c695f219479d1f627143836d; Type: INDEX; Schema: public; Owner: phamthainb
--

CREATE INDEX "IDX_c5c695f219479d1f627143836d" ON public.movie_tag USING btree ("movieId");


--
-- TOC entry 3539 (class 1259 OID 33763)
-- Name: IDX_df7c2fa133a021b2ce7c1785b0; Type: INDEX; Schema: public; Owner: phamthainb
--

CREATE INDEX "IDX_df7c2fa133a021b2ce7c1785b0" ON public.movie_actor USING btree ("movieId");


--
-- TOC entry 3545 (class 2606 OID 33780)
-- Name: history FK_2c939f48b096561fc6de387c4b5; Type: FK CONSTRAINT; Schema: public; Owner: phamthainb
--

ALTER TABLE ONLY public.history
    ADD CONSTRAINT "FK_2c939f48b096561fc6de387c4b5" FOREIGN KEY ("accountId") REFERENCES public.account(id);


--
-- TOC entry 3546 (class 2606 OID 33785)
-- Name: history FK_2f9bd04629875158fe0a56b3d4c; Type: FK CONSTRAINT; Schema: public; Owner: phamthainb
--

ALTER TABLE ONLY public.history
    ADD CONSTRAINT "FK_2f9bd04629875158fe0a56b3d4c" FOREIGN KEY ("movieId") REFERENCES public.movie(id);


--
-- TOC entry 3548 (class 2606 OID 33795)
-- Name: movie_tag FK_31fc580c1847949cb41e65a34e0; Type: FK CONSTRAINT; Schema: public; Owner: phamthainb
--

ALTER TABLE ONLY public.movie_tag
    ADD CONSTRAINT "FK_31fc580c1847949cb41e65a34e0" FOREIGN KEY ("tagId") REFERENCES public.tag(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3543 (class 2606 OID 33770)
-- Name: comment FK_454cbc3ab248f142c461934f551; Type: FK CONSTRAINT; Schema: public; Owner: phamthainb
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT "FK_454cbc3ab248f142c461934f551" FOREIGN KEY ("accountId") REFERENCES public.account(id);


--
-- TOC entry 3550 (class 2606 OID 33805)
-- Name: movie_actor FK_528cb7d2a0c17e05421ab148816; Type: FK CONSTRAINT; Schema: public; Owner: phamthainb
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT "FK_528cb7d2a0c17e05421ab148816" FOREIGN KEY ("actorId") REFERENCES public.actor(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3544 (class 2606 OID 33775)
-- Name: comment FK_aea4918c888422550a85e257894; Type: FK CONSTRAINT; Schema: public; Owner: phamthainb
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT "FK_aea4918c888422550a85e257894" FOREIGN KEY ("movieId") REFERENCES public.movie(id);


--
-- TOC entry 3542 (class 2606 OID 33765)
-- Name: collection FK_afcddd7c1eeb160789782bb8917; Type: FK CONSTRAINT; Schema: public; Owner: phamthainb
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT "FK_afcddd7c1eeb160789782bb8917" FOREIGN KEY ("movieId") REFERENCES public.movie(id);


--
-- TOC entry 3547 (class 2606 OID 33790)
-- Name: movie_tag FK_c5c695f219479d1f627143836d0; Type: FK CONSTRAINT; Schema: public; Owner: phamthainb
--

ALTER TABLE ONLY public.movie_tag
    ADD CONSTRAINT "FK_c5c695f219479d1f627143836d0" FOREIGN KEY ("movieId") REFERENCES public.movie(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3549 (class 2606 OID 33800)
-- Name: movie_actor FK_df7c2fa133a021b2ce7c1785b05; Type: FK CONSTRAINT; Schema: public; Owner: phamthainb
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT "FK_df7c2fa133a021b2ce7c1785b05" FOREIGN KEY ("movieId") REFERENCES public.movie(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2022-08-07 20:12:21 +07

--
-- PostgreSQL database dump complete
--

