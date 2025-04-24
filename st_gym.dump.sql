--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-1.pgdg120+2)
-- Dumped by pg_dump version 16.4 (Debian 16.4-1.pgdg120+2)

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
-- Name: heroku_ext; Type: SCHEMA; Schema: -; Owner: st_gym_user
--

CREATE SCHEMA heroku_ext;


ALTER SCHEMA heroku_ext OWNER TO st_gym_user;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: st_gym_user
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO st_gym_user;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: st_gym_user
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: action_text_rich_texts; Type: TABLE; Schema: public; Owner: st_gym_user
--

CREATE TABLE public.action_text_rich_texts (
    id bigint NOT NULL,
    name character varying NOT NULL,
    body text,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.action_text_rich_texts OWNER TO st_gym_user;

--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: st_gym_user
--

CREATE SEQUENCE public.action_text_rich_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.action_text_rich_texts_id_seq OWNER TO st_gym_user;

--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st_gym_user
--

ALTER SEQUENCE public.action_text_rich_texts_id_seq OWNED BY public.action_text_rich_texts.id;


--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: st_gym_user
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO st_gym_user;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: st_gym_user
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_attachments_id_seq OWNER TO st_gym_user;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st_gym_user
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: st_gym_user
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO st_gym_user;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: st_gym_user
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_blobs_id_seq OWNER TO st_gym_user;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st_gym_user
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: st_gym_user
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE public.active_storage_variant_records OWNER TO st_gym_user;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: st_gym_user
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNER TO st_gym_user;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st_gym_user
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ahoy_events; Type: TABLE; Schema: public; Owner: st_gym_user
--

CREATE TABLE public.ahoy_events (
    id bigint NOT NULL,
    visit_id bigint,
    user_id bigint,
    name character varying,
    properties jsonb,
    "time" timestamp(6) without time zone
);


ALTER TABLE public.ahoy_events OWNER TO st_gym_user;

--
-- Name: ahoy_events_id_seq; Type: SEQUENCE; Schema: public; Owner: st_gym_user
--

CREATE SEQUENCE public.ahoy_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ahoy_events_id_seq OWNER TO st_gym_user;

--
-- Name: ahoy_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st_gym_user
--

ALTER SEQUENCE public.ahoy_events_id_seq OWNED BY public.ahoy_events.id;


--
-- Name: ahoy_visits; Type: TABLE; Schema: public; Owner: st_gym_user
--

CREATE TABLE public.ahoy_visits (
    id bigint NOT NULL,
    visit_token character varying,
    visitor_token character varying,
    user_id bigint,
    ip character varying,
    user_agent text,
    referrer text,
    referring_domain character varying,
    landing_page text,
    browser character varying,
    os character varying,
    device_type character varying,
    country character varying,
    region character varying,
    city character varying,
    latitude double precision,
    longitude double precision,
    utm_source character varying,
    utm_medium character varying,
    utm_term character varying,
    utm_content character varying,
    utm_campaign character varying,
    app_version character varying,
    os_version character varying,
    platform character varying,
    started_at timestamp(6) without time zone
);


ALTER TABLE public.ahoy_visits OWNER TO st_gym_user;

--
-- Name: ahoy_visits_id_seq; Type: SEQUENCE; Schema: public; Owner: st_gym_user
--

CREATE SEQUENCE public.ahoy_visits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ahoy_visits_id_seq OWNER TO st_gym_user;

--
-- Name: ahoy_visits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st_gym_user
--

ALTER SEQUENCE public.ahoy_visits_id_seq OWNED BY public.ahoy_visits.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: st_gym_user
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO st_gym_user;

--
-- Name: blocks; Type: TABLE; Schema: public; Owner: st_gym_user
--

CREATE TABLE public.blocks (
    id bigint NOT NULL,
    workout_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    "position" integer,
    repetitions integer DEFAULT 1,
    "time" integer DEFAULT 600,
    title character varying,
    tabata boolean DEFAULT false
);


ALTER TABLE public.blocks OWNER TO st_gym_user;

--
-- Name: blocks_id_seq; Type: SEQUENCE; Schema: public; Owner: st_gym_user
--

CREATE SEQUENCE public.blocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.blocks_id_seq OWNER TO st_gym_user;

--
-- Name: blocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st_gym_user
--

ALTER SEQUENCE public.blocks_id_seq OWNED BY public.blocks.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: st_gym_user
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    main_category boolean DEFAULT false
);


ALTER TABLE public.categories OWNER TO st_gym_user;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: st_gym_user
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO st_gym_user;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st_gym_user
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: contacts; Type: TABLE; Schema: public; Owner: st_gym_user
--

CREATE TABLE public.contacts (
    id bigint NOT NULL,
    email character varying,
    content text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.contacts OWNER TO st_gym_user;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: st_gym_user
--

CREATE SEQUENCE public.contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contacts_id_seq OWNER TO st_gym_user;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st_gym_user
--

ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;


--
-- Name: exercise_categories; Type: TABLE; Schema: public; Owner: st_gym_user
--

CREATE TABLE public.exercise_categories (
    id bigint NOT NULL,
    exercise_id bigint NOT NULL,
    category_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.exercise_categories OWNER TO st_gym_user;

--
-- Name: exercise_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: st_gym_user
--

CREATE SEQUENCE public.exercise_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.exercise_categories_id_seq OWNER TO st_gym_user;

--
-- Name: exercise_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st_gym_user
--

ALTER SEQUENCE public.exercise_categories_id_seq OWNED BY public.exercise_categories.id;


--
-- Name: exercise_instances; Type: TABLE; Schema: public; Owner: st_gym_user
--

CREATE TABLE public.exercise_instances (
    id bigint NOT NULL,
    block_id bigint NOT NULL,
    exercise_id bigint NOT NULL,
    repetitions integer DEFAULT 10,
    "time" integer DEFAULT 30,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    "position" integer,
    tabata boolean DEFAULT false
);


ALTER TABLE public.exercise_instances OWNER TO st_gym_user;

--
-- Name: exercise_instances_id_seq; Type: SEQUENCE; Schema: public; Owner: st_gym_user
--

CREATE SEQUENCE public.exercise_instances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.exercise_instances_id_seq OWNER TO st_gym_user;

--
-- Name: exercise_instances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st_gym_user
--

ALTER SEQUENCE public.exercise_instances_id_seq OWNED BY public.exercise_instances.id;


--
-- Name: exercises; Type: TABLE; Schema: public; Owner: st_gym_user
--

CREATE TABLE public.exercises (
    id bigint NOT NULL,
    name character varying,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    user_id bigint
);


ALTER TABLE public.exercises OWNER TO st_gym_user;

--
-- Name: exercises_id_seq; Type: SEQUENCE; Schema: public; Owner: st_gym_user
--

CREATE SEQUENCE public.exercises_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.exercises_id_seq OWNER TO st_gym_user;

--
-- Name: exercises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st_gym_user
--

ALTER SEQUENCE public.exercises_id_seq OWNED BY public.exercises.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: st_gym_user
--

CREATE TABLE public.posts (
    id bigint NOT NULL,
    title character varying,
    user_id bigint NOT NULL,
    subtitle text,
    published boolean,
    "position" integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.posts OWNER TO st_gym_user;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: st_gym_user
--

CREATE SEQUENCE public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.posts_id_seq OWNER TO st_gym_user;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st_gym_user
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: st_gym_user
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO st_gym_user;

--
-- Name: users; Type: TABLE; Schema: public; Owner: st_gym_user
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    admin boolean DEFAULT false,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO st_gym_user;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: st_gym_user
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO st_gym_user;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st_gym_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: workouts; Type: TABLE; Schema: public; Owner: st_gym_user
--

CREATE TABLE public.workouts (
    id bigint NOT NULL,
    name character varying,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    user_id bigint,
    public boolean DEFAULT true,
    saved boolean DEFAULT false,
    original_workout character varying,
    ahoy_visit_id bigint
);


ALTER TABLE public.workouts OWNER TO st_gym_user;

--
-- Name: workouts_id_seq; Type: SEQUENCE; Schema: public; Owner: st_gym_user
--

CREATE SEQUENCE public.workouts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.workouts_id_seq OWNER TO st_gym_user;

--
-- Name: workouts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st_gym_user
--

ALTER SEQUENCE public.workouts_id_seq OWNED BY public.workouts.id;


--
-- Name: action_text_rich_texts id; Type: DEFAULT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.action_text_rich_texts ALTER COLUMN id SET DEFAULT nextval('public.action_text_rich_texts_id_seq'::regclass);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: ahoy_events id; Type: DEFAULT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.ahoy_events ALTER COLUMN id SET DEFAULT nextval('public.ahoy_events_id_seq'::regclass);


--
-- Name: ahoy_visits id; Type: DEFAULT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.ahoy_visits ALTER COLUMN id SET DEFAULT nextval('public.ahoy_visits_id_seq'::regclass);


--
-- Name: blocks id; Type: DEFAULT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.blocks ALTER COLUMN id SET DEFAULT nextval('public.blocks_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- Name: exercise_categories id; Type: DEFAULT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.exercise_categories ALTER COLUMN id SET DEFAULT nextval('public.exercise_categories_id_seq'::regclass);


--
-- Name: exercise_instances id; Type: DEFAULT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.exercise_instances ALTER COLUMN id SET DEFAULT nextval('public.exercise_instances_id_seq'::regclass);


--
-- Name: exercises id; Type: DEFAULT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.exercises ALTER COLUMN id SET DEFAULT nextval('public.exercises_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: workouts id; Type: DEFAULT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.workouts ALTER COLUMN id SET DEFAULT nextval('public.workouts_id_seq'::regclass);


--
-- Data for Name: action_text_rich_texts; Type: TABLE DATA; Schema: public; Owner: st_gym_user
--

COPY public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at) FROM stdin;
2	body	<div>Hey there and welcome to a little exploration of veganism and its potential role in shaping your fitness nutrition. <br><br></div><h1>Intro</h1><div><br></div><div>Veganism, a dietary practice abstaining from any animal products, has seen a significant surge in popularity over recent years. Its advocates hail it not only as a more <strong>ethical and sustainable choice</strong>, but also as a lifestyle that can provide numerous <strong>health benefits</strong>. As the fitness world continually evolves, it's essential to question and reevaluate established nutritional norms. In this blog, I aim to delve into the intersection of veganism and fitness nutrition, examining whether a plant-based diet could be the key to optimal health and <strong>performance</strong> but I will also highlight some potential downsides, if practised wrongly.<br><br><br></div><h1>What is veganism</h1><div><br></div><div>To fully comprehend the potential impact of veganism on fitness nutrition, let's first try to understand veganism itself. Veganism is more than a diet; it's a lifestyle choice rooted in a philosophy that seeks to exclude, as far as possible and practicable, all forms of exploitation of, and cruelty to, animals for food, clothing, or any other purpose. When it comes to diet, vegans exclude meat, dairy, eggs, and other animal-derived substances, focusing instead on <strong>plant-based foods</strong>.<br><br></div><div>There are several types of vegan diets, including whole foods, raw-food, 80/10/10, the starch solution, and junk-food vegan diets. Each varies in its focus and nutrient composition, however, all avoid animal-derived products.</div><div><br></div><div>The health benefits of a vegan diet can be significant. Numerous studies have associated vegan diets with <strong>lower blood pressure</strong> and <strong>cholesterol</strong>, and <strong>lower rates of heart disease</strong>, some types of cancer, and type 2 diabetes. These benefits are thought to be due to <strong>lower intakes of saturated fat and cholesterol</strong>, and higher intakes of <strong>dietary fiber, antioxidants, and phytochemicals</strong>. But how do these benefits translate to the fitness world? The following sections will delve deeper into the bond between veganism and fitness nutrition.<br><br><br></div><h1>Veganism and Fitness Nutrition</h1><div><br><strong>The Role of Nutrition in Fitness<br></strong>Nutrition is the cornerstone of fitness, as it fuels the body for physical activity and aids in recovery post-workout. It provides the necessary energy and nutrients that the body requires to perform optimally, supporting muscle growth and repair, enhancing endurance and strength, and boosting overall health and vitality. <br><br></div><div><strong>Nutrients Important for Fitness and How They Can Be Sourced from a Vegan Diet</strong></div><ul><li>Protein: Commonly associated with meat and dairy, protein is crucial for muscle repair and growth. However, it can be abundantly found in vegan foods like <strong>lentils</strong>, <strong>chickpeas</strong>, <strong>tofu</strong>, <strong>tempeh</strong>, <strong>quinoa</strong>, and <strong>hemp seeds</strong>, among others.</li><li><em>Carbohydrates</em>: The primary energy source for the body during physical activities, carbohydrates can be easily sourced from a vegan diet. <strong>Whole grains</strong>, <strong>fruits</strong>, <strong>vegetables</strong>, and <strong>legumes</strong> are excellent sources of complex carbs that provide sustained energy.</li><li><em>Fats</em>: Healthy fats are essential for energy, brain function, and absorption of fat-soluble vitamins. <strong>Avocados</strong>, <strong>nuts</strong>, <strong>seeds</strong>, and <strong>olive oil</strong> are excellent vegan sources of healthy fats.</li><li><em>Vitamins and Minerals</em>: A balanced vegan diet can provide all the necessary vitamins and minerals, including iron, calcium, and B12, which are essential for energy production and overall health. <strong>Leafy greens</strong>, <strong>beans</strong>, <strong>fortified plant milks</strong>, <strong>whole grains</strong>, and <strong>fruits</strong> are rich in these nutrients. </li></ul><div><br></div><div><strong>Vegan athletes</strong></div><div>Many professional athletes have adopted a vegan diet and excelled in their respective fields. Tennis champions Serena Williams, football player Colin Kaepernick, and ultra-marathon runner Scott Jurek are just a few examples. They attribute their endurance, recovery, and overall performance improvements to their plant-based diet.<br><br><br></div><h1>Challenges of Veganism in Fitness Nutrition</h1><div><br><strong>Potential Nutrient Deficiencies and How to Avoid Them</strong></div><div>While a vegan diet can provide all the necessary nutrients, deficiencies can occur if the diet isn't well-planned. Eating a variety of foods and supplementing with B12, iron, and omega-3 can help avoid these deficiencies.<br><br></div><div>One common misconception is that vegans can't get enough protein for muscle building. However, numerous plant-based protein sources, combined with a balanced diet, can meet the protein needs of an athlete.<br><br></div><div><strong>Tips for Transitioning to a Vegan Diet for Fitness</strong></div><div>Transitioning to a vegan diet can be a challenge, but it's manageable with proper planning. Start by gradually introducing more plant-based foods into your diet, learn about vegan sources of essential nutrients, and consider seeking advice from a nutritionist or dietitian. Remember, the aim is to create a sustainable and enjoyable diet that supports your fitness goals and overall health.</div><div><br><action-text-attachment sgid="BAh7CEkiCGdpZAY6BkVUSSIzZ2lkOi8vc3QtZ3ltL0FjdGl2ZVN0b3JhZ2U6OkJsb2IvMjY_ZXhwaXJlc19pbgY7AFRJIgxwdXJwb3NlBjsAVEkiD2F0dGFjaGFibGUGOwBUSSIPZXhwaXJlc19hdAY7AFQw--3318bd423a4906b9bb7dc4b20c16a59820a9fa6d" content-type="image/jpeg" url="https://www.stgym.club/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBIdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--2f7a6a986875e1e1739a8f42afb4ea97717cd647/not-entirely-vegan.jpg" filename="not-entirely-vegan.jpg" filesize="1438461" width="2500" height="1701" previewable="true" presentation="gallery" caption="It doesn't always have to be vegan"></action-text-attachment><br><br></div><h1>Looking Ahead: Is Veganism the Future of Fitness Nutrition?</h1><div><br><strong>Current trends</strong> in fitness nutrition are progressively shifting towards plant-based diets. As science continues to reveal the health benefits of such diets, many fitness enthusiasts and athletes are choosing to adopt a vegan lifestyle. The emphasis on nutrient-dense whole foods, rich in proteins, vitamins, and minerals, is not only aiding in performance enhancement, but also in <strong>faster recovery and overall wellbeing</strong>.<br><br><strong>Predictions</strong> for the future of veganism in fitness nutrition are <strong>bullish</strong>. As the understanding of the human body and its response to different nutrients grows, the potential benefits of a vegan diet are set to become even more prominent. It is expected that plant-based diets will not be seen as an alternative but rather a <strong>primary option for athletes</strong> and <strong>fitness enthusiasts seeking optimal nutrition</strong>.<br><br>The impact of veganism on the fitness industry has been significant. It has encouraged a shift in the perception of protein sources and the importance of holistic nutrition. Fitness brands are now launching vegan supplements, promoting the idea that peak performance can be achieved without animal products.<br><br><br></div><h1>Conclusion</h1><div><br></div><div>We have explored the rise of veganism in the fitness nutrition landscape, understanding the science behind it and its potential benefits. We have also looked at the current trends and future predictions, indicating a significant shift towards plant-based diets in the fitness industry.<br><br>As we move forward, it's worth considering the benefits of a vegan diet for fitness. Apart from the obvious health benefits, it also offers a sustainable and ethical choice in an industry often criticized for its environmental impact.<br><br>Veganism, thus, holds immense potential in shaping the future of fitness nutrition. It represents an evolution in our understanding of diet and performance, encouraging a more holistic approach to health and fitness. As more people embrace this lifestyle, veganism could well become the norm rather than the exception in fitness nutrition.<br><br><action-text-attachment sgid="BAh7CEkiCGdpZAY6BkVUSSIzZ2lkOi8vc3QtZ3ltL0FjdGl2ZVN0b3JhZ2U6OkJsb2IvMjk_ZXhwaXJlc19pbgY7AFRJIgxwdXJwb3NlBjsAVEkiD2F0dGFjaGFibGUGOwBUSSIPZXhwaXJlc19hdAY7AFQw--c197edeb2b1ac0be61fe66cf26fc7991d164d4ea" content-type="image/jpeg" url="https://www.stgym.club/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBJZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--516b854e3fa787acd4a3f09df63596e63ef6f564/tasty_bowl.jpg" filename="tasty_bowl.jpg" filesize="304893" width="1000" height="837" previewable="true" presentation="gallery" caption="All you need is a good veggie bowl"></action-text-attachment><br><br></div>	Post	2	2023-06-28 13:06:46.947135	2023-06-29 05:42:14.210065
3	body	<h1>Introduction</h1><div><br>Everywhere you look, someone is walking, running, cycling, or even doing yoga, all while their eyes are glued to their mobile screens. They're not scrolling through social media or responding to emails, but rather, they're checking in on their digital fitness companion. Welcome to the age of fitness apps! The technology of tracking your every step, logging every meal, monitoring every heartbeat has swept across the globe, becoming as ubiquitous as the smartphones that host them.<br><br>Fitness apps have exploded in popularity, with thousands of options available in the app stores, each promising to make you leaner, healthier, and more disciplined. They've become a staple in our daily lives, a constant reminder on our home screens that we ought to be living healthier lives. But with so many apps vying for our attention, and potentially distracting us from the actual act of exercising, one can't help but wonder: Do fitness apps really help, or are they just a distraction?<br><br>This article will delve into this question, exploring the potential benefits and pitfalls of these digital fitness tools. Are they genuinely aiding us in our quest for better health and fitness? Or are they merely another shiny distraction, keeping us from fully engaging in our workouts and potentially hindering our progress? Buckle up for a ride through the digital fitness landscape as we seek to answer these pressing questions.<br><br><action-text-attachment sgid="BAh7CEkiCGdpZAY6BkVUSSIzZ2lkOi8vc3QtZ3ltL0FjdGl2ZVN0b3JhZ2U6OkJsb2IvMzU_ZXhwaXJlc19pbgY7AFRJIgxwdXJwb3NlBjsAVEkiD2F0dGFjaGFibGUGOwBUSSIPZXhwaXJlc19hdAY7AFQw--664a99aa9d0204e8279e9d5db78a3aefed453417" content-type="image/jpeg" url="https://www.stgym.club/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBLQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--9a8729398ca7dde8bfb59c4fba6f50d37c22e9ed/woman_exercising_with_a_watch.jpg" filename="woman_exercising_with_a_watch.jpg" filesize="197132" width="1500" height="1000" previewable="true" presentation="gallery" caption="Fitness App, blessing or curse?"></action-text-attachment><br><br></div><h1>The Rise of Fitness Apps</h1><div><br>Let's take a trip down memory lane, shall we? At the break of the 21st century, fitness was synonymous with grueling gym sessions, personal trainers, and complex equipment. Fast forward a decade or two, and the landscape is vastly different. The catalyst? Maybe, the explosive evolution of fitness apps.<br><br>The first wave of fitness apps hit the market in the late 2000s, piggybacking on the smartphone revolution. Primitive in design, these apps were essentially digital pedometers, counting steps and estimating calories burned. While they were a novelty, they hardly revolutionized the fitness world.<br><br>However, as technology advanced, so did the capabilities of fitness apps. By the mid-2010s, apps began integrating elements of gamification, social networking, and personalization. These features transformed mundane workouts into exciting challenges, social engagements, and tailored experiences. Today, they offer everything from real-time heart rate monitoring to guided meditation sessions, making them virtual personal trainers at our fingertips.<br><br>The popularity of fitness apps is not just anecdotal - the numbers tell a compelling story. According to a report by Research and Markets, the global fitness app market was valued at $3.15 billion in 2020. But hold onto your yoga mats, because it’s projected to reach an astounding $15.96 billion by 2026. That's a compound annual growth rate of over 26%!<br><br>In 2020, amid the COVID-19 pandemic, fitness apps saw an unprecedented surge in downloads. Data from App Annie showed that downloads of health and fitness apps grew by a whopping 30% in the first half of 2020 compared to the same period in 2019.<br><br><strong>Examples of Popular Fitness Apps</strong><br>Now, let's dive into the digital playground of fitness, where apps reign supreme. Topping the charts is "MyFitnessPal", the versatile app that has been a mainstay for fitness enthusiasts for over a decade. Its comprehensive food diary feature and extensive food database make it the go-to option for people aiming to manage their diet.<br><br>Next up is "Strava", a social network for athletes. Strava turns every run or cycle into a race, leveraging the power of competition to push its users to their limits. It's not just about personal bests, but also about community engagement and shared fitness journeys.<br><br>Finally, we have "Headspace", an app that caters to the often-overlooked aspect of fitness - mental wellbeing. Headspace offers guided meditations and mindfulness exercises, proving that fitness is not just about physical strength, but also mental resilience.<br><br><br></div><h1>The Argument Against Fitness Apps</h1><div><br>As with every coin that has two sides, fitness apps are not exempt from criticism. From distraction factors to inaccurate data, and the risk of over-reliance, there are valid concerns in the mix. Let's delve into these arguments more deeply.<br><br><strong>1. The Distraction Factor</strong><br>Ever been in the middle of a high-intensity workout and your fitness app alerts you to an incoming call or a trending tweet? This constant interference is one of the biggest criticisms of fitness apps. While they promise to keep us on track, they often end up being sources of distraction, hindering our focus and overall workout momentum.<br><br><action-text-attachment sgid="BAh7CEkiCGdpZAY6BkVUSSIzZ2lkOi8vc3QtZ3ltL0FjdGl2ZVN0b3JhZ2U6OkJsb2IvMzM_ZXhwaXJlc19pbgY7AFRJIgxwdXJwb3NlBjsAVEkiD2F0dGFjaGFibGUGOwBUSSIPZXhwaXJlc19hdAY7AFQw--2ec100ce89fa548cfe976419f8565c8dbc9deb29" content-type="image/jpeg" url="https://www.stgym.club/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBKZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--fdf59bd22b7d7f00acac23afe479a204fbf4c862/distraction.jpg" filename="distraction.jpg" filesize="615176" width="1984" height="1414" previewable="true" presentation="gallery" caption="Apps, a source of distraction"></action-text-attachment><br><br>The technology that was designed to keep us engaged in our fitness journey often ends up disrupting it. Instead of focusing on the rhythm of our breath or the movement of our body, we get lost in a sea of notifications.<br><br><strong>2. The Risk of Inaccurate Data</strong><br>Fitness apps are not always accurate in their data collection. A study published in the Journal of Medical Internet Research found that some popular fitness apps overestimated or underestimated users' physical activity levels by as much as 30%. This inaccurate data can lead to misleading information about our health, causing us to either overestimate our fitness levels or underestimate the amount of exercise we need.<br><br>The danger, of course is, when a fitness app overestimates your calorie burn, you might end up consuming more calories than you expend. On the other hand, if it underestimates your activity, you could be pushing yourself too hard, risking injury or adverser training effects.<br><br><strong>3. The Potential for Over-Reliance</strong><br>With the convenience they offer, fitness apps can create a certain level of dependency. The danger lies in users replacing their innate body awareness and intuition with data from an app. Over-reliance on these apps can lead to a disconnection from our bodies and our understanding of its needs.<br><br>While we may believe that these fitness apps are our allies in health, they can unintentionally foster a reliance that disconnects us from our bodies. We start to trust the app more than our own bodies.<br><br><strong>Supporting Evidence</strong><br>The aforementioned criticisms are not just anecdotal complaints. Scientific studies and expert opinions back these claims. The distraction factor, the risk of inaccurate data, and the potential for over-reliance are real concerns that need to be addressed for fitness apps to be truly beneficial.<br><br>In the end, it's crucial to remember that fitness apps are tools. They can supplement our fitness journey, but they should never replace our own body awareness or the advice of qualified professionals.<br><br><br></div><h1>The Case for Fitness Apps</h1><div><br>Let's delve into the case for fitness apps and explore the potential benefits they offer.<br><br><strong>1. Accessibility and Convenience</strong><br>One of the most compelling benefits of fitness apps is their sheer convenience and accessibility. Picture this; it's pouring down with rain, your local gym is a 20-minute drive away and you're just not feeling the motivation to step out of your comfort zone. With a fitness app, your personal gym is right in your pocket, accessible at any time, and in any place. This makes fitness apps a godsend for those with hectic schedules. Fitness apps break down barriers like time, confusion, and inconvenience.<br><br><strong>2. Motivation and Accountability</strong><br>Let's admit it, maintaining a consistent workout routine can be a daunting task. Fitness apps, however, provide a unique solution to this problem. Through social features and progress tracking, these apps create a sense of motivation and accountability. A study by the Journal of Medical Internet Research found that users of fitness apps were more likely to exercise during their leisure time, compared to those who didn't use such apps. The 'gamification' of fitness encourages users to view exercise as a game, creating a competitive spirit that keeps them engaged.<br><br><action-text-attachment sgid="BAh7CEkiCGdpZAY6BkVUSSIzZ2lkOi8vc3QtZ3ltL0FjdGl2ZVN0b3JhZ2U6OkJsb2IvMzQ_ZXhwaXJlc19pbgY7AFRJIgxwdXJwb3NlBjsAVEkiD2F0dGFjaGFibGUGOwBUSSIPZXhwaXJlc19hdAY7AFQw--bfc701dc926b8533a4140fa9d5c0f9a340008cd1" content-type="image/jpeg" url="https://www.stgym.club/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBKdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--1213629a9ca867f33c289786e4089cb55c1f5ca8/justin-veenema-zP80MWApkn8-unsplash.jpg" filename="justin-veenema-zP80MWApkn8-unsplash.jpg" filesize="278254" width="1500" height="1000" previewable="true" presentation="gallery" caption="Apps can keep your motivation up"></action-text-attachment><br><br><strong>3. Personalized Workout and Diet Plans</strong><br>The beauty of fitness apps lies in their ability to tailor workout and diet plans to the individual's needs. Whether you're a seasoned gym-goer looking to enhance your routine, or a fitness newbie needing a kick-start, these apps have got you covered. A study published in the Annals of Internal Medicine found that personalized diet plans delivered through apps were significantly more effective than general advice. The future of fitness lies in personalisation. Apps allow us to understand our bodies better and make smarter choices.<br><br><strong>Use Studies and Expert Quotes to Support this View</strong><br>The above benefits are not just conjecture; they are backed by a body of research and expert opinions. A study conducted by the University of South Australia found that fitness apps can increase physical activity and reduce sedentary behavior. Furthermore, fitness apps can act as a virtual personal trainer, providing expertise and guidance which can lead to improved fitness outcomes.<br><br>So, are fitness apps a distraction? Or do they actually contribute to our health regime? The answer, I believe, is leaning towards the latter. As with any tool, the effectiveness of fitness apps largely depends on how we use them. With the right approach, these apps can indeed serve as an effective aid in our quest for fitness. Like a perfectly executed yoga pose, the secret to understanding fitness apps lies in finding balance. On one hand, these apps offer a host of benefits. They deliver a wealth of information at our fingertips, from tracking our steps, sleep patterns, and heart rate to offering personalized workout routines and diet plans. For some, they serve as an anchor, a digital cheerleader nudging them towards their health goals.<br><br>Yet, it's the other side of the coin that fuels the controversy. Critics argue that these apps can quickly morph from helpful companions into compulsive obsessions. The constant tracking, the relentless pursuit of perfection, and the pressure to 'keep up' can lead to unhealthy behaviours and stress. Others claim that these apps encourage a one-size-fits-all approach to fitness and fail to account for the uniqueness of individual bodies and their abilities.<br><br><br></div><h1>Can the Criticisms be overcome?</h1><div><br>In this era of technological boom, fitness apps have amassed a cult following, but they haven't escaped criticism. Critics raise valid concerns about distractions, data accuracy, and the potential to become a crutch. But let's flip the script and address these criticisms head-on.<br><br><strong>Avoid distractions while using fitness apps</strong><br>First, let's talk about distractions. We've all been there - you're in the middle of a workout, and a notification pops up, sending you down the rabbit hole of memes, social media, and cat videos. It's a common pain point, but not an insurmountable one. Here's the secret: use your app settings wisely. Most fitness apps allow you to customize notifications and alerts. Make use of the 'do not disturb' or 'focus' modes while working out, cutting out unnecessary distractions. Secondly, dedicate a specific time for your fitness routine and stick to it like a ritual, treating it with the same respect as a meeting with your boss. You wouldn't check your phone while in a meeting, would you? This mindset can help curb the unwanted interruptions.<br><br><strong>Ensure data accuracy</strong><br>Data accuracy, another bone of contention, is equally critical. Misleading data can skew your fitness goals and demotivate you. The key here lies in understanding how your fitness app works. Make sure you've correctly input your personal data - weight, height, age, and so forth, as these can greatly influence the accuracy of the results. Additionally, calibrate your devices regularly and ensure they're updated to the latest software version. Remember, garbage in, garbage out; the more accurate the input, the more reliable the output.<br><br><strong>Use fitness apps as a tool rather than a crutch</strong><br>Finally, fitness apps should be your tool, not a crutch. They are an aid to your fitness journey, not the journey itself. The real work happens in the gym, on the running track, or on your yoga mat. Fitness apps can guide and motivate you, but they can't do the push-ups or eat healthy food for you. Use them to track your progress, set and achieve goals, and understand your body better. But beware of becoming overly dependent on them. The day you can't exercise because your phone battery died is the day you need to reassess your approach.<br><br>While fitness apps are not without their flaws, they can be incredibly beneficial when used correctly. It's about finding the right balance and using the apps to enhance, not dictate, your fitness journey. <br><br><br></div><h1>Fitness Apps – More Than Just a Distraction</h1><div><br></div><div>As we draw this exploration to its finale, let's take a moment to revisit the key points we've dissected in our vibrant discourse on the role of fitness apps. Are they the heralds of a health revolution or merely the latest manifestation of our society's digital distraction addiction?<br><br>We’ve delved into the heart of the matter, dissecting the components of these apps that have taken the fitness world by storm. We've explored their multifaceted features, from personalized workout plans to nutrition tracking, and understood how they can deliver a tailor-made fitness experience right into the palms of our hands. Simultaneously, we've acknowledged the potential pitfalls, the risk of becoming overly reliant or distracted by these digital tools.<br><br>Now, here's the crux of the matter: Yes, fitness apps can be a distraction. They can be yet another screen demanding our attention, another notification interrupting our day. But, and this is a substantial but, when used judiciously and purposefully, they can be so much more than that. They can be a catalyst for change, a tool for transformation, an aide on our journey to a healthier, fitter version of ourselves.<br><br>Their potential for personalized fitness guidance, motivation boosting features, and ability to track and monitor progress are all powerful allies in the battle against sedentary lifestyles. The distraction factor, while certainly a valid concern, can be mitigated with intentional use and a healthy dose of self-discipline.<br><br>So, dear reader, the question is not whether fitness apps are inherently good or bad, helpful or distracting. The question is whether we can harness their full potential, navigate their challenges, and use them to fuel our personal fitness journeys.<br><br>So, dare to download that app. Give it a go. Explore its features, take advantage of its tools, and see if it adds value to your fitness regime. Or perhaps it's a distraction you can do without. The decision, ultimately, is yours.<br><br>In the end, it's not about the app. It's about you, your goals, your health, and your journey. Fitness apps are merely tools in your fitness toolbox. How you use them will determine whether they're a distraction or a driving force. So, go on, give them a shot. You might just surprise yourself.</div>	Post	3	2023-06-29 07:18:06.690479	2023-06-30 07:44:49.832865
\.


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: st_gym_user
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
5	files	Exercise	170	6	2023-06-20 08:23:50.775727
6	files	Exercise	171	7	2023-06-20 08:26:32.698454
7	files	Exercise	172	8	2023-06-20 08:29:51.67636
10	files	Exercise	185	10	2023-06-24 14:52:05.390481
11	files	Exercise	191	11	2023-06-24 14:55:05.19797
12	files	Exercise	188	12	2023-06-24 14:56:07.429843
13	files	Exercise	187	14	2023-06-25 09:52:11.02588
14	files	Exercise	187	13	2023-06-25 09:52:11.030659
15	files	Exercise	194	15	2023-06-25 09:54:04.821081
16	files	Exercise	189	16	2023-06-25 09:55:20.252944
17	files	Exercise	186	17	2023-06-25 09:57:20.165996
18	files	Exercise	193	18	2023-06-25 09:58:41.802481
19	files	Exercise	190	19	2023-06-25 09:59:41.704929
20	files	Exercise	192	20	2023-06-25 10:01:09.876758
23	embeds	ActionText::RichText	2	26	2023-06-28 15:31:13.946083
24	image	Post	2	27	2023-06-28 15:33:35.300713
25	embeds	ActionText::RichText	2	29	2023-06-28 17:19:51.27168
27	image	Post	3	31	2023-06-29 08:08:13.927472
28	files	Exercise	203	32	2023-06-29 08:10:25.317813
29	embeds	ActionText::RichText	3	35	2023-06-30 07:43:51.647025
30	embeds	ActionText::RichText	3	33	2023-06-30 07:43:51.676655
31	embeds	ActionText::RichText	3	34	2023-06-30 07:43:51.710592
32	files	Exercise	204	36	2023-07-05 08:52:55.940937
33	files	Exercise	198	37	2023-07-05 08:57:15.44119
34	files	Exercise	199	39	2023-07-05 08:58:14.87016
35	files	Exercise	199	38	2023-07-05 08:58:14.874088
36	files	Exercise	200	40	2023-07-05 08:58:55.491699
37	files	Exercise	201	41	2023-07-05 09:00:14.261768
38	files	Exercise	201	42	2023-07-05 09:00:14.266133
39	files	Exercise	195	43	2023-07-05 09:03:26.082898
40	files	Exercise	196	44	2023-07-05 09:04:27.143188
41	files	Exercise	197	45	2023-07-05 09:05:24.711394
42	files	Exercise	64	46	2023-07-05 09:06:27.177696
43	files	Exercise	205	47	2023-07-05 09:07:48.277912
44	files	Exercise	206	48	2023-07-05 09:09:30.158018
45	files	Exercise	207	49	2023-07-05 09:10:17.870593
46	files	Exercise	208	50	2023-07-05 09:11:24.675815
47	files	Exercise	209	51	2023-07-05 09:12:19.113005
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: st_gym_user
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
31	h398kpmazy7cc12awuluezccjwum	martin-hexeberg-QTWLSIbgjI0.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	378080	LweLoUqvaFH2yi6OSMsSQw==	2023-06-29 08:08:06.5285
32	f1wlur42ihiqjvrtfkfetjfafd2z	victor-freitas-KkYWWpurqbE-unsplash.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	155061	N5J8aBDEYZQ50pio2kHTDQ==	2023-06-29 08:10:21.038045
33	5paaxa6m2pdlr7re5t83jn9duskk	distraction.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	615176	pRy5ASI8XulYKXsoSmLYCQ==	2023-06-30 07:24:50.80162
34	0zpb0k1kgck9t3yeusdd7wdetr2n	justin-veenema-zP80MWApkn8-unsplash.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	278254	lGLVLA5TYvSn2foIhnbXtg==	2023-06-30 07:26:37.585557
6	fxvn88vanbzrjbl11lttkgfbjqcq	IMG_4071.jpeg	image/jpeg	{"identified":true}	cloudinary	302240	fH4H1vih6UO/KO/n9t3Bzg==	2023-06-20 08:23:38.26487
7	c64at52b0kjr5lqxtp6sw65yj1dt	IMG_4073.jpeg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	213670	TZC8v1gnazc37DnVQj/FRw==	2023-06-20 08:25:49.504272
8	7ixqp1lvuqr28qk6j19thuxycsus	IMG_4074.jpeg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	170311	3gr0yvgptPM66PeOLQDPPg==	2023-06-20 08:29:18.178253
35	ijfr71ll6uhlie9eoqks14qx6z5f	woman_exercising_with_a_watch.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	197132	iD01dDmiRHbYG42F/8bAqg==	2023-06-30 07:43:06.138298
9	47qbz02utqiuqkqfe1svi3eec12s	IMG_4076.jpeg	image/jpeg	{"identified":true}	cloudinary	7101113	WbUEQysx3Ddgcnu1DRyU4w==	2023-06-21 13:46:53.362123
36	58fzdtyynfsju796a6pt6xtgnjfg	Screenshot 2023-07-05 at 10.50.47.png	image/png	{"identified":true,"analyzed":true}	cloudinary	323626	NObtCIMz11HKzl6BSDnV9g==	2023-07-05 08:52:49.1971
37	mk4k3708lcjsvjqj1vsouoruqaid	Screenshot 2023-07-05 at 10.56.51.png	image/png	{"identified":true,"analyzed":true}	cloudinary	780359	z8YkWDLsjJJ6ML86RhsZcg==	2023-07-05 08:57:01.430463
39	wj08vmg44por9agvwlh0rbcepb8h	Screenshot 2023-07-05 at 10.57.57.png	image/png	{"identified":true,"analyzed":true}	cloudinary	594647	q2oKpN8bckqwMc0v2wqqTA==	2023-07-05 08:58:08.679637
38	kcdt723bbrq6y0tjm2cqbdtijt61	Screenshot 2023-07-05 at 10.57.50.png	image/png	{"identified":true,"analyzed":true}	cloudinary	444536	Uzvumjz8Bg2BDc5NTlgwnQ==	2023-07-05 08:58:08.657191
40	g3qedjxs4nct5ol4y7m2gvkv5912	Screenshot 2023-07-05 at 10.58.41.png	image/png	{"identified":true,"analyzed":true}	cloudinary	536609	sultfZiN3f5eSNG5/r9V2Q==	2023-07-05 08:58:51.764509
10	7x0vcio61u7qctbldo91m0sr365r	DALL·E 2023-06-24 16.51.26 - Give me a photo of a person doing the Barbell Bicep Curls exercise in a gym. The image should look realistic and detailed..png	image/png	{"identified":true,"analyzed":true}	cloudinary	2101907	5iy7Gdqf8D9rF6HWdQLUTg==	2023-06-24 14:51:42.109698
11	u30dbprezq4wbq1br887sanwfe3v	Screenshot 2023-06-24 at 16.53.38.png	image/png	{"identified":true,"analyzed":true}	cloudinary	330716	gAxRmV7yKBQZvyGMolz6Aw==	2023-06-24 14:54:59.61392
41	3fdthpamk9pnyxvpg5a2884orcz8	Screenshot 2023-07-05 at 10.59.25.png	image/png	{"identified":true,"analyzed":true}	cloudinary	245201	onOQTbIdgAr0qYifVhDZuw==	2023-07-05 09:00:07.241848
12	swlgp83rahq7qsflup9b6t7z0oni	Screenshot 2023-06-24 at 16.55.51.png	image/png	{"identified":true,"analyzed":true}	cloudinary	358225	aosOSmk2wSR/KjOOSvPzlQ==	2023-06-24 14:56:03.012464
13	igngdwan9rzs42un8zj9cmjdw776	IMG_4097.jpeg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	166122	5prcyLdkDisfghMO4MYAjg==	2023-06-25 09:52:05.435897
42	jj93eqnjbqyu1nm8noba5ry08i0u	Screenshot 2023-07-05 at 10.59.21.png	image/png	{"identified":true,"analyzed":true}	cloudinary	260336	EURV2BYAuoH85EHCpcqLCw==	2023-07-05 09:00:07.243554
43	n228yisef2f0hz9wy58u3eay3goo	Screenshot 2023-07-05 at 11.03.05.png	image/png	{"identified":true,"analyzed":true}	cloudinary	624750	+JEDvzWXsEEN6eBh8XhnJg==	2023-07-05 09:03:20.803682
44	5qnm30zxpaumj2ftkl9p4xwu04kg	Screenshot 2023-07-05 at 11.03.50.png	image/png	{"identified":true,"analyzed":true}	cloudinary	415398	/+idhDeGWTgD68eYIxjK6g==	2023-07-05 09:04:22.145614
45	exbdmpoe0sxm9wlhczzw6immle90	Screenshot 2023-07-05 at 11.05.01.png	image/png	{"identified":true,"analyzed":true}	cloudinary	414323	ad09lOlkaWuDGvVFVFGguA==	2023-07-05 09:05:13.480858
46	d1aam8bu31u47g74x34yv9xc6l7j	Screenshot 2023-07-05 at 11.06.08.png	image/png	{"identified":true,"analyzed":true}	cloudinary	631056	qDjHMK6eJnIPDcpCrBMfkg==	2023-07-05 09:06:21.769062
47	bljmpr1s1qrf58gswtqn9l66g73v	Screenshot 2023-07-05 at 11.07.30.png	image/png	{"identified":true,"analyzed":true}	cloudinary	176729	U/FEr7q9CiUFF9EjNzN5VQ==	2023-07-05 09:07:43.193654
48	pwn1quukn2r6v29qlu61fsxqivl7	Screenshot 2023-07-05 at 11.08.46.png	image/png	{"identified":true,"analyzed":true}	cloudinary	388795	eVbeicQm+i+x9n6eoP/Mtw==	2023-07-05 09:09:25.471348
49	elcgosyn8dx6ouq69kayeuvwmayn	Screenshot 2023-07-05 at 11.09.55.png	image/png	{"identified":true,"analyzed":true}	cloudinary	508874	RlSfpBpiD+cP6luZAo/Z2Q==	2023-07-05 09:10:06.982408
50	0amdwndkb8z12k3hdsg78ic1tltc	Screenshot 2023-07-05 at 11.10.55.png	image/png	{"identified":true,"analyzed":true}	cloudinary	1065680	GAOXDUBC3LFz7+szafFqqw==	2023-07-05 09:11:07.700028
51	j7v6ics0id69oi9lvkmxkzwclxxx	Screenshot 2023-07-05 at 11.11.54.png	image/png	{"identified":true,"analyzed":true}	cloudinary	504579	TQuznOloyJOJyzgZ0llvTw==	2023-07-05 09:12:08.255247
14	z1msso27lrhto9xz2bixh537i398	IMG_4096.jpeg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	173983	SoRt7Lr4FWYbTtE6A6OFOg==	2023-06-25 09:52:05.471472
15	dd23ay1xzo7c0fqyovon9r1nuane	IMG_4098.jpeg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	144841	FbrA6flhW3Cs1O2BLOg0Ow==	2023-06-25 09:53:59.222961
16	h6jmqg0xbcae6zjne4s3ezsdgzcw	IMG_4099.jpeg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	224176	rnDTGtCRo9ipMznFTcgzig==	2023-06-25 09:55:16.062931
17	eoh65re5l5r746cdpfp37pwu1vo9	IMG_4100.jpeg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	327737	g2QWkgUrVKbuoxpiBXWZdg==	2023-06-25 09:57:15.786793
18	l0ut2494ohleu8wyqy1xrl14kj4p	IMG_4101.jpeg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	265212	LtgBqN6OTsOBe3pIvYairQ==	2023-06-25 09:58:37.850115
19	swdl94o7apyjvr9bi7e8qtdbv7ur	IMG_4102.jpeg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	156750	I6K3EFS0OjYxOmlbNUwAFg==	2023-06-25 09:59:37.519495
20	h44ln1tetqq218037tt9aovcuw96	IMG_4103.jpeg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	329051	6McJeCgVYJM6iZGI6qKOCg==	2023-06-25 10:01:06.779865
23	5cb4m4xa0i38dn1l1kob59qfj9ch	brooke-lark-jUPOXXRNdcA-unsplash.jpg	image/jpeg	\N	cloudinary	5367196	BGa9Kp1sR+g2KrZf1T0Tzg==	2023-06-28 15:25:17.314197
24	ldmh74xtcvx9a9edz07u1dw9pjqx	not-entirely-vegan.jpg	image/jpeg	{"analyzed":true}	cloudinary	1438461	+K6g459VJbCOLVtCOp2nzg==	2023-06-28 15:27:45.235044
26	q4utji422ns1eh275zcjo3vg8n00	not-entirely-vegan.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	1438461	+K6g459VJbCOLVtCOp2nzg==	2023-06-28 15:29:02.19996
27	q7uj6bo8wlk6j0ymfwvu76vssdr3	vegan.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	1064887	b9a7R79Zuw7XO8H0BW9YRg==	2023-06-28 15:33:16.681511
29	894uv61y2rdh3kxd10f5nth99qad	tasty_bowl.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	304893	n0+50r3RBhVhshO6WnCGxA==	2023-06-28 17:19:35.672123
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: st_gym_user
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- Data for Name: ahoy_events; Type: TABLE DATA; Schema: public; Owner: st_gym_user
--

COPY public.ahoy_events (id, visit_id, user_id, name, properties, "time") FROM stdin;
6799	14667	1	Viewed workout	{"name": "Workout #49"}	2024-09-13 08:41:20.804263
6800	14667	1	Viewed workout	{"name": "Workout #49"}	2024-09-13 08:41:23.604306
6801	14667	1	Viewed workout	{"name": "Workout #49"}	2024-09-13 08:41:24.550055
6802	14798	\N	Viewed workout	{"name": "Happy Legs"}	2024-09-27 10:16:22.506315
6803	14827	\N	Viewed workout	{"name": "Workout #49"}	2024-09-30 15:15:11.539803
6804	14827	\N	Viewed workout	{"name": "Workout #49"}	2024-09-30 15:19:22.083333
6805	14827	\N	Viewed workout	{"name": "Workout #49"}	2024-09-30 15:19:23.25344
6806	14827	\N	Viewed workout	{"name": "Workout #49"}	2024-09-30 15:19:25.036723
6807	14827	\N	Viewed workout	{"name": "Workout #49"}	2024-09-30 15:19:25.860761
6808	14827	\N	Viewed workout	{"name": "Workout #49"}	2024-09-30 15:19:30.814752
6809	14827	\N	Viewed workout	{"name": "Workout #49"}	2024-09-30 15:19:35.275533
6810	15090	\N	Viewed workout	{"name": "Workout #49"}	2024-11-25 10:28:47.348819
6811	15090	\N	Viewed workout	{"name": "Workout #49"}	2024-11-25 10:29:06.078578
6812	15090	\N	Viewed workout	{"name": "Workout #49"}	2024-11-25 10:29:06.721365
6813	15090	\N	Viewed workout	{"name": "Workout #49"}	2024-11-25 10:29:07.621637
6814	15090	\N	Viewed workout	{"name": "Workout #49"}	2024-11-25 10:29:07.777881
6815	15090	\N	Viewed workout	{"name": "Workout #49"}	2024-11-25 10:29:08.869953
6816	15090	\N	Viewed workout	{"name": "Workout #49"}	2024-11-25 10:29:09.036175
6817	15090	\N	Viewed workout	{"name": "Workout #49"}	2024-11-25 10:29:09.172321
6818	15090	\N	Viewed workout	{"name": "Workout #49"}	2024-11-25 10:29:10.188796
6819	15090	\N	Viewed workout	{"name": "Workout #49"}	2024-11-25 10:29:10.338504
6820	15091	\N	Viewed workout	{"name": "Workout #49"}	2024-11-25 16:51:57.004805
6821	15112	1	Viewed workout	{"name": "Belly Gym"}	2024-12-13 07:27:55.058079
6822	15112	1	Viewed workout	{"name": "Belly Gym"}	2024-12-13 07:29:06.703883
6823	15112	1	Created new workout	{"name": "User workout"}	2024-12-13 07:34:16.723131
6824	15112	1	Viewed workout	{"name": "Workout #50"}	2024-12-13 07:34:16.854831
6825	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:35:31.093611
6826	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:35:34.221062
6827	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:35:34.838197
6828	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:35:35.322322
6829	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:35:35.800836
6830	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:35:37.496498
6831	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:36:05.671752
6832	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:36:06.13336
6833	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:36:06.551462
6834	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:36:07.022556
6835	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:36:07.516262
6836	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:36:09.564246
6837	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:36:10.077549
6838	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:36:10.519197
6839	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:36:11.192379
6840	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:36:12.030583
6841	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:36:12.516278
6842	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:36:20.521286
6843	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:36:21.475314
6844	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:36:21.834846
6845	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:36:22.393855
6846	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:36:22.735254
6847	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:36:23.878592
6848	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:36:24.485271
6849	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:39:22.505885
6850	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:39:24.575805
6851	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:39:25.025479
6852	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:39:25.458569
6853	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:39:25.871958
6854	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:39:26.337815
6855	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:39:27.002879
6856	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:39:51.270059
6857	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:40:54.561945
6858	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:40:56.364408
6859	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:40:56.862853
6860	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:40:57.303067
6861	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:40:58.187246
6862	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:41:02.663471
6863	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:41:03.123319
6864	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:46:54.98994
6865	15112	1	Generated PDF	{"name": "Belly short"}	2024-12-13 07:46:55.19905
6867	15113	\N	Viewed workout	{"name": "Belly short"}	2024-12-13 17:05:34.030376
6866	15112	1	Viewed workout	{"name": "Belly short"}	2024-12-13 07:47:18.658185
6868	15137	\N	Viewed workout	{"name": "Gym"}	2024-12-28 19:00:35.483385
6869	15138	\N	Viewed workout	{"name": "Workout #49"}	2024-12-28 19:00:35.557274
6870	15139	\N	Viewed workout	{"name": "Belly short"}	2024-12-28 19:00:35.567095
6871	15154	1	Viewed workout	{"name": "Belly 🔥"}	2025-02-02 18:44:02.390802
6872	15154	1	Viewed workout	{"name": "Belly 🔥"}	2025-02-02 18:58:13.469694
6873	15154	1	Viewed workout	{"name": "Belly 🔥"}	2025-02-02 18:58:14.82672
6874	15154	1	Viewed workout	{"name": "Belly 🔥"}	2025-02-02 18:58:15.980261
6875	15154	1	Viewed workout	{"name": "Belly 🔥"}	2025-02-02 18:58:17.050611
6876	15154	1	Viewed workout	{"name": "Belly 🔥"}	2025-02-02 18:58:17.593061
6877	15154	1	Viewed workout	{"name": "Belly 🔥"}	2025-02-02 19:00:51.028457
6878	15154	1	Generated PDF	{"name": "Belly 🔥"}	2025-02-02 19:00:51.213924
6879	15169	1	Viewed workout	{"name": "Belly short"}	2025-04-05 08:11:37.19056
6880	15171	1	Viewed workout	{"name": "Belly short"}	2025-04-05 20:36:07.063359
6881	15173	\N	Viewed workout	{"name": "Belly short"}	2025-04-07 05:28:57.946104
6882	15186	\N	Viewed workout	{"name": "Happy Legs"}	2025-04-12 14:29:53.709736
6883	15187	\N	Created new workout	{"name": "Anonym workout"}	2025-04-12 14:33:29.064991
6884	15188	\N	Viewed workout	{"name": "Train your Belly 🔥"}	2025-04-12 14:35:24.410577
6885	15189	\N	Viewed workout	{"name": "Back training"}	2025-04-12 14:39:17.198478
\.


--
-- Data for Name: ahoy_visits; Type: TABLE DATA; Schema: public; Owner: st_gym_user
--

COPY public.ahoy_visits (id, visit_token, visitor_token, user_id, ip, user_agent, referrer, referring_domain, landing_page, browser, os, device_type, country, region, city, latitude, longitude, utm_source, utm_medium, utm_term, utm_content, utm_campaign, app_version, os_version, platform, started_at) FROM stdin;
14667	b6234429-08c9-4123-80e7-3f1a4167ea22	85f0805e-61bb-41f9-ac9f-2f125c9fb8be	1	162.158.87.218	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.6 Safari/605.1.15	\N	\N	https://gym.margareti.com/workouts/1290	Safari	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-13 08:41:20.804263
14668	a9546c40-b211-463d-8ef3-2cece86f7cc0	1cb78dcc-5e76-405d-adb9-77a2dccd899e	\N	5.8.11.202	Mozilla/5.0 (iPhone; CPU iPhone OS 12_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.2 Mobile/15E148 Safari/604.1	\N	\N	https://172.17.0.24:3000/	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-13 10:27:42.9794
14669	41f5480f-8759-432a-ad8c-b5d330fd5e0e	ceea1837-04c6-40e3-a7e2-1586737f5880	\N	80.82.77.202	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.12 Safari/537.36 OPR/14.0.1116.4	\N	\N	https://172.17.0.24:3000/	Opera	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-13 10:50:16.369825
14670	f187fb7e-43ee-485e-bf48-47f2bbbe1b58	5894a346-f888-4808-a0f2-646be2cce665	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-13 10:57:16.823771
14671	70815255-4e09-4bcc-b805-61bafabce209	d7f11074-144a-4c7d-b029-463d9336a55b	\N	172.71.102.161	Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:80.0) Gecko/20100101 Firefox/80.0	\N	\N	https://gym.margareti.com/	Firefox	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-13 11:03:30.807139
14672	6c3b5943-3ebb-4679-9e04-5c1deed63f18	85ee0d1f-9185-4750-abf8-8697e0258191	\N	93.174.93.12	Mozilla/5.0 (Linux; Android 9; SM-A530F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36	\N	\N	https://172.17.0.24:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-13 12:31:34.510625
14673	9f8bf538-2d14-49eb-ad91-a633a59258cc	e2a48178-287e-49c5-8523-ba52989e8184	\N	162.158.111.155	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-13 14:04:21.254548
14674	92f220a5-93fb-4f64-95f2-9c88d9dcea7a	ec0eb6c5-ce2e-4156-9a02-6619589719d3	\N	5.8.11.202	Mozilla/5.0 (Linux; Android 8.1.0; Nexus 6P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36	\N	\N	https://172.17.0.24:3000/	Chrome Mobile	Android	Phablet	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-13 17:31:57.308575
14675	bd34b604-b109-4af1-8dc0-119baf1af823	4be7af3b-9c9a-4f0f-bf24-6eafbe1ff2d5	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-13 21:27:13.260179
14676	3279247c-a06c-45c7-88fb-44c3eec5fa69	51854d16-48b8-44e5-8aef-1e89f0f98c46	\N	46.174.191.30	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.24:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-13 22:26:14.1238
14677	d8617615-09a0-43bb-9888-8bd74e624296	693e2b70-5426-4567-a4cd-0b3a332d6b59	\N	93.174.93.12	Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.57 Safari/537.36 OPR/18.0.1284.49	\N	\N	https://172.17.0.24:3000/	Opera	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-13 22:38:30.472694
14678	0fc6f584-ab02-472c-8e94-fcd1121f2688	22ba981a-b454-459b-9d40-7b010d771f35	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-14 03:09:31.000334
14679	728238bd-62cb-4a62-9acf-9e69d8b59a03	5cc7f8da-1879-4d91-b62a-d5378a0c9ddc	\N	152.42.162.119	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-14 05:57:27.638366
14680	daca6150-f48c-43a5-8aab-2c82f522288b	16eaf913-5c4e-4e85-81cd-bad9cab716e1	\N	78.153.140.151	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36 OPR/42.0.2393.94	\N	\N	https://168.119.127.165/?phpinfo=-1	Opera	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-14 08:22:22.259685
14681	eeff03c2-f88c-41cd-9aca-2401725f0fd4	e018f547-5ed0-4d10-99cd-394bd0244148	\N	5.8.11.202	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.1 Safari/605.1.15	\N	\N	https://172.17.0.24:3000/	Safari	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-14 11:20:38.535268
14682	12cf4aa2-2fcf-4d20-a4e5-c08caa6ec3b4	3af4644e-a3e3-436a-96a7-118e807ef8c1	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-14 12:19:35.993861
14683	00894330-b861-41ba-888b-6eb9b8d3a819	b3df061e-d105-4c66-97c3-b903504cb3b8	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-14 15:34:46.133238
14684	07f804c5-d5db-4f14-aebf-154aa715a7c7	d8183ca9-8cbb-42e4-a0f3-e67b22895c62	\N	5.8.11.202	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36	\N	\N	https://172.17.0.24:3000/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-14 19:00:28.91247
14685	42bad094-a9ea-4b82-a03f-fb908527d6ff	64b7e8d0-7442-4a3f-a19f-886e32567423	\N	46.174.191.32	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.24:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-14 20:04:29.983701
14686	1ad380af-2a93-4d93-8cb2-a98d91f147a2	fe73366c-cccf-498b-b4c0-8b365b16b8f5	\N	93.174.93.12	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36	\N	\N	https://172.17.0.24:3000/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-15 04:06:21.721279
14687	841db114-74e7-4f00-8eb5-b82c1abe2612	b296f4bc-5303-46cd-b512-54a62f7c4df5	\N	80.82.77.202	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) snap Chromium/75.0.3770.142 Chrome/75.0.3770.142 Safari/537.36	\N	\N	https://172.17.0.24:3000/	Chromium	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-15 07:12:40.826582
14688	8325e55e-108d-40eb-b083-6f4b35c5420e	b4298156-e9ea-451a-a137-003f3a51de8a	\N	5.8.11.202	Mozilla/5.0 (Linux; Android 7.0; LGUS997 Build/NRD90U) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	\N	https://172.17.0.24:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-15 10:34:37.000463
14689	82d6441e-24b1-4deb-8d6d-26d68f32d06d	cdda92ee-f7e6-4e6e-8635-311fefeb4195	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-15 12:30:03.750481
14690	96690ce7-ee9b-4df8-989b-9103524a9c15	ffcc3f93-8cf0-4ab4-b52e-988fefa7d829	\N	93.174.93.12	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3724.8 Safari/537.36	\N	\N	https://172.17.0.24:3000/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-15 15:33:30.385852
14691	8694f593-07e5-4378-9c65-fdda98658331	ff8a2999-9ff9-41bc-a8f7-ddc2a8dd6240	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-15 16:36:50.058792
14692	8680cf35-cce2-418b-8eb4-eb2b39f1f6bb	dfb62b12-b57c-4012-b261-09a641e730a9	\N	46.174.191.31	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.24:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-15 17:45:33.96523
14693	f1d4026f-c75e-40e9-9209-de6c2e059c47	a6cedd69-bce1-4b69-8cc5-db485f0843eb	\N	80.82.77.202	Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.2.9) Gecko/20100915 Gentoo Firefox/3.6.9	\N	\N	https://172.17.0.24:3000/	Firefox	Gentoo	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-15 23:52:55.038671
14694	f9677878-13db-4dbb-9c6a-6b8604994d4a	ca28c5f2-70fc-4961-86b6-e316d6f72a31	\N	134.122.6.12	Mozilla/5.0 (X11; Linux x86_64; rv:73.0) Gecko/20100101 Firefox/73.0	\N	\N	https://172.17.0.24:3000/	Firefox	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-16 01:21:12.315811
14695	be018033-7609-4be7-82b8-980cecc449f0	aaf6fe94-4762-4133-aadb-6edf0dbd21e6	\N	172.69.194.115	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-16 03:45:19.538602
14696	580d5d3f-7b4b-4c39-9948-c98afb764386	a908024b-fa66-4268-bf45-c8914c6d64d0	\N	93.174.93.12	mukewang/7.2.0 (iPhone; iOS 12.3.1; Scale/2.00) webview	\N	\N	https://172.17.0.24:3000/	mukewang	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-16 07:59:24.402535
14697	6f9d238a-80c1-4977-8bb8-55b5e3cf73ec	78639b87-da52-4019-ac5c-15d6e938e4c2	\N	5.8.11.202	Mozilla/5.0 (Linux; U; Android 7.1.2; el-gr; Redmi 4X Build/N2G47H) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/71.0.3578.141 Mobile Safari/537.36 XiaoMi/MiuiBrowser/10.9.7-g	\N	\N	https://172.17.0.24:3000/	MIUI Browser	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-16 09:48:05.125668
14698	dab87bd8-ad25-4b13-a3c1-10dc05da79fa	21e3e0f0-094c-4c22-9fbf-66203a6ceaa6	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-16 12:33:44.363237
14699	46b4f131-7b18-4d5e-89ec-f40b08ced603	95335570-fdf9-4d04-be75-ad89b523a096	\N	128.199.40.197	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-16 12:39:00.654402
14700	99747a11-bd9d-4f0a-a108-c716278bb0ae	2b7c52a5-bd16-4793-acd8-43af5e1f6786	\N	46.174.191.30	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.24:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-16 13:51:12.620113
14701	1529cd9a-8be4-4332-b670-6cc23f7ca615	e1e90557-091d-40c7-8905-154d262708d6	\N	80.82.77.202	Mozilla/5.0 (iPhone; CPU iPhone OS 12_4 like Mac OS X) AppleWebKit/602.1.50 (KHTML, like Gecko) CriOS/56.0.2924.79 Mobile/16G77 Safari/602.1	\N	\N	https://172.17.0.24:3000/	Chrome Mobile iOS	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-16 14:08:48.185445
14702	12e67d62-628b-4487-9f9a-c473d790d0ca	fd978429-f0f7-45c4-89a9-4889d53aae0a	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-16 17:03:50.361493
14703	a3847def-d170-49e5-8be3-2ae16af2ee1c	ce212819-4622-4fd5-be4d-05e7bea0ff08	\N	93.174.93.12	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.87 Safari/537.36	\N	\N	https://172.17.0.24:3000/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-16 18:08:51.740213
14704	67142fac-3f77-434d-978f-ca7ec188b4f1	f46fea56-9d03-467f-99df-3467b68708d4	\N	45.83.66.28	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0	\N	\N	https://168.119.127.165/	Firefox	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-16 23:12:31.263902
14705	0876de16-1e63-4f07-aa59-f49e78f01a2a	7584b339-94d6-4825-b80f-8eee4009adea	\N	46.174.191.28	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.24:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-16 23:46:01.869419
14706	3a1f0a2a-2dd2-4080-bcb4-53dfbf284d11	18ee0e55-36bd-4fbd-b7b4-3c52d52bc1a6	\N	5.8.11.202	Mozilla/5.0 (Linux; Android 9; SM-G950U) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36	\N	\N	https://172.17.0.24:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-17 00:33:55.56578
14707	90b1fba8-4e67-4f08-bc99-f999db73c4df	a6464b0a-ae42-446c-9437-1032a9dd868b	\N	172.70.175.133	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-17 04:58:04.082547
14708	76806f83-5d38-44a7-a252-77ae9afba891	d7e6b9da-fdf0-4dbc-93d2-4ae72d1fe3d3	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-17 11:41:54.036451
14709	68a59f9f-7600-4fcc-b2b2-c2c8d17ab640	34a2a06c-7975-456c-ba77-7638289707cb	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-17 12:03:36.00994
14710	d54a2a70-715e-4918-ac73-5939133adc04	6e6497a5-2d2c-4ec7-9a1c-e165b1f70e57	\N	172.70.230.229	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-17 12:14:21.37954
14711	5012c9bf-e4c4-4e99-9af3-260c40a8f71f	f87839a5-1682-4dbd-b920-f04e2ce27f03	\N	80.82.77.202	Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.5(0x17000523) NetType/WIFI Language/zh_CN	\N	\N	https://172.17.0.24:3000/	WeChat	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-17 13:29:32.544697
14712	734ff39d-0ebc-46c3-93ce-ad03d4e6bef9	e0f47909-3234-455d-9666-e7ca1be16a42	\N	5.8.11.202	Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)	\N	\N	https://172.17.0.24:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-17 14:32:06.590109
14713	86959a29-dbc9-48f2-a921-0a9c447013d2	a2a33145-278c-4b73-ab36-85fb58caa96d	\N	46.174.191.29	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.24:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-17 17:26:43.656436
14714	f54c7b0e-57fd-40b9-8833-5a90637d8d47	055d1341-1dfd-4b3e-aea0-61c89c930e4a	\N	78.153.140.179	Mozilla/5.0 (Mobile; rv:46.0) Gecko/46.0 Firefox/46.0	\N	\N	https://168.119.127.165/?url=.env	Firefox Mobile	Firefox OS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-17 17:51:07.232364
14715	911c1a31-cd96-471a-8a55-0a5a21fe2577	aed8606a-bc68-439a-a7ef-bfeebc598364	\N	162.158.90.69	Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0	\N	\N	https://gym.margareti.com/	Firefox	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-18 07:09:20.898184
14716	2603321d-1832-4a2a-bca8-4e546e388936	9a24f9c3-018b-4040-959b-099926122330	\N	80.82.77.202	Mozilla/5.0 (X11; Linux i686; rv:40.0) Gecko/20100101 Firefox/40.0	\N	\N	https://172.17.0.24:3000/	Firefox	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-18 11:46:41.372182
14717	02775c9b-be2d-48fa-9ee5-59f5efe4b0fb	a0cc1863-1fe3-483d-bee8-cb382ab29790	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-18 12:34:31.079687
14718	50dc4f08-a0ba-4a8a-bbf9-13cbdef638c8	599857ac-0822-4a56-b61f-d76f504a6a54	\N	5.8.11.202	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1	\N	\N	https://172.17.0.24:3000/	Microsoft Edge	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-18 16:15:30.185389
14719	1a9491ea-1491-45bc-8dbf-8814e6f34372	6401f20a-6983-40e7-88a9-2fe7e0183bd8	\N	78.153.140.151	Mozilla/5.0 (Windows; U; Windows NT 5.1; ru; rv:1.9.1b3) Gecko/20090305 Firefox/3.1b3	\N	\N	https://168.119.127.165/?phpinfo=-1	Firefox	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-18 16:26:43.727806
14720	6228789b-5a56-4537-906c-3dc68032ff80	60886b56-cf56-492f-b1ec-508e1431b914	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-18 17:08:37.014208
14721	0771c5e9-a25c-4669-a55e-72a68856fe43	4da71157-754a-43f0-bf9f-cdabe8b13899	\N	93.174.93.12	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/10.1 Safari/603.1.30	\N	\N	https://172.17.0.24:3000/	Safari	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-18 18:40:26.030552
14722	81d2f4b9-9fed-4fb9-bb78-38149a3eae94	e4129037-bf63-43f2-bca5-d54f9c2c00ea	\N	80.82.77.202	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3872.0 Safari/537.36 Edg/78.0.244.0	\N	\N	https://172.17.0.24:3000/	Microsoft Edge	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-18 20:54:52.953757
14723	dc1d0f5b-b46b-43c3-8293-204656c5c5f3	c7ed4fa7-c006-4239-ae79-97cd9e9e1ec9	\N	46.174.191.29	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.24:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-18 21:33:17.309685
14724	272487bb-7c56-4d05-a622-21e11216671b	fdcbe275-4f79-4e3b-8bc3-c7677aff3da5	\N	172.70.126.17	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36	http://gym.margareti.com/	gym.margareti.com	https://gym.margareti.com/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-19 06:52:42.49146
14725	809006a6-3891-4257-b4e1-0ceda61a11b7	702e7a17-571f-4c27-b071-e03279a52254	\N	162.158.186.143	Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0	\N	\N	https://gym.margareti.com/	Firefox	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-19 09:23:35.266789
14726	5e6afbf9-1e6d-477e-8c61-c5065696ff6b	b058b1d1-01ec-4f54-b4d9-0aea6775c850	\N	162.158.90.238	Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0	\N	\N	https://gym.margareti.com/	Firefox	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-19 09:53:35.168178
14727	907c1e7f-6678-4a65-b72e-e43639cf00b6	0c9d6d61-2c39-4dd7-8401-f31229d12e9c	\N	172.69.225.251	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:131.0) Gecko/20100101 Firefox/131.0	\N	\N	https://gym.margareti.com/	Firefox	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-19 10:09:45.902648
14728	d8ba9738-64ca-4538-9acb-b40de188adf8	3fccd576-a1fa-476a-b917-96e0f8431807	\N	172.70.214.141	Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0	\N	\N	https://gym.margareti.com/	Firefox	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-19 10:21:42.68894
14729	f506f6a1-de70-47b0-a671-07f4434e5f4b	d66f30fe-2ba7-44e8-b16e-57533581acf0	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-19 12:15:20.488367
14730	f3b6e57f-9a7e-479d-9684-fd5b8823fa07	808f249d-7301-4d68-b402-f4ed14d6d061	\N	46.174.191.32	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.24:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-19 12:54:23.936321
14731	1da43474-e81a-4ca2-959c-1d5089abd998	c5779ee5-5c26-4791-9786-d67c5c375028	\N	188.166.87.67	Mozilla/5.0 (Windows NT 6.1; WOW64; rv:54.0) Gecko/20100101 Firefox/70.0	\N	\N	https://168.119.127.165/	Firefox	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-19 12:57:40.780385
14732	a2a184c8-df9e-4276-9fda-3d2360e1abf7	73422484-3c21-40e7-b037-ffdd0512182e	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-19 15:09:06.482113
14733	0e538b22-847e-4bd5-9697-8be9c5caa768	2b88f870-3126-424d-b536-d02efcc25202	\N	93.174.93.12	Mozilla/5.0 (Linux; Android 9; ONEPLUS A6010) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36	\N	\N	https://172.17.0.24:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-19 16:08:41.016709
14734	6adfffb6-571f-4f8e-b1c7-5d02b4fbcaca	0b4ef94c-7e45-4fee-89c0-3a7d78f43736	\N	5.8.11.202	portalmmm/2.0 N410i(c20;TB)	\N	\N	https://172.17.0.24:3000/	\N	\N	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-20 02:04:36.244201
14735	c45828c2-de61-4420-a467-caf5641499f6	0c9d6d61-2c39-4dd7-8401-f31229d12e9c	\N	188.114.102.185	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:131.0) Gecko/20100101 Firefox/131.0	\N	\N	https://gym.margareti.com/	Firefox	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-20 06:57:34.691373
14736	845d931f-3b71-465d-b48e-9c6496bc14b1	126435e0-868c-4819-a620-ce5026024d6b	\N	93.174.93.12	Mozilla/5.0 (Linux; Android 8.0.0; LLD-L31) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.90 Mobile Safari/537.36	\N	\N	https://172.17.0.24:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-20 09:02:37.194876
14737	56ee3dcb-e84d-43e4-9345-a337030d55b6	91044ed4-ed88-47bd-94d0-db4d184a1dc2	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-20 12:01:08.595005
14738	ddac1f3b-b27b-4688-8aaa-d8c1ca610e58	3d67a05e-20d5-4b0e-b44c-3947ce945a39	\N	46.174.191.29	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.24:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-20 12:10:29.326169
14739	2f17098a-aea4-4120-990b-09b277324cec	b3730dc6-2a6a-4fd5-84a6-1a18e0d48cfc	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-20 13:51:00.740315
14740	88827732-db42-4b05-b017-20dd2460eb29	770b3574-df9f-469d-a3c6-ca91c3f92cfc	\N	80.82.77.202	Mozilla/5.0 (X11; U; FreeBSD i386; en-US) AppleWebKit/532.0 (KHTML, like Gecko) Chrome/4.0.207.0 Safari/532.0	\N	\N	https://172.17.0.24:3000/	Chrome	FreeBSD	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-21 02:04:15.771533
14741	01ebc654-3cd7-413f-baad-5cad3adf2942	abf9c385-47f2-4d28-a9d9-5ca1a0c229ca	\N	5.8.11.202	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:2.0b6pre) Gecko/20100907 Firefox/4.0b6pre Camino/2.2a1pre	\N	\N	https://172.17.0.24:3000/	Camino	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-21 03:00:01.349962
14742	f245c891-3949-4299-9336-82cfb4f5af88	ba9ef7ee-ad91-45f2-b83c-6fcc29245a78	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-21 11:43:51.550131
14743	2eb70fdb-6067-4c85-9dec-0129e7aae99c	e0ae847e-baa4-45d9-8199-6892971c61cd	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-21 11:56:49.786386
14744	92ae492e-b2b0-4db8-84b6-bbb7cc6c167d	0c9d6d61-2c39-4dd7-8401-f31229d12e9c	\N	172.70.247.210	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:131.0) Gecko/20100101 Firefox/131.0	\N	\N	https://gym.margareti.com/	Firefox	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-21 11:56:56.427228
14745	c61b6a6c-46f7-467e-bb16-579594c8e25b	7f569038-3d7f-40ee-8998-c94d2bd61b74	\N	172.70.46.165	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.6 Safari/605.1.15	https://www.margareti.com/	www.margareti.com	https://gym.margareti.com/	Safari	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-21 12:23:35.389144
14746	41634a51-10a3-4aba-a416-74dec5a80a49	55ab1cf4-67b4-47d9-9e3f-e1a595327f1f	\N	46.174.191.30	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.24:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-21 13:34:33.890993
14747	bc5e7767-175d-45fb-8ce2-67fe26a55713	6a256f22-c393-4714-ab7d-0bf7f271c195	\N	80.82.77.202	Mozilla/5.0 (Android; Linux armv7l; rv:2.0.1) Gecko/20100101 Firefox/4.0.1 Fennec/2.0.1	\N	\N	https://172.17.0.24:3000/	Fennec	Android	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-21 19:38:26.704902
14748	5cf4a7c8-f080-43ad-babf-bd976a04bfed	d14cce9a-1e22-48da-a380-ffd084b05597	\N	5.8.11.202	POLARIS/6.01(BREW 3.1.5;U;en-us;LG;LX265;POLARIS/6.01/WAP;)MMP/2.0 profile/MIDP-201 Configuration /CLDC-1.1	\N	\N	https://172.17.0.24:3000/	Polaris	Brew	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-21 23:36:16.290257
14749	7c637fea-cb64-483f-8f31-78cc80a2c789	78ab914e-dcaf-4dc3-aa86-6edd25f02c5a	\N	46.174.191.31	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.24:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 00:08:31.01465
14750	9388e33f-59bf-4fa7-b688-5ff3521c095e	44c830dd-80c8-4430-aea7-3782930c6534	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 12:06:36.928072
14751	c3226305-f5fc-499b-9b0a-afcf4b4f6e80	f4ed2136-e339-41e1-9516-f1508731328b	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 14:18:16.823553
14752	6b6b0e2c-cd34-4c32-8e77-ae70d5bcdae9	80a5d68a-cedc-4f5e-a397-4f4fedc95de9	\N	5.8.11.202	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	\N	\N	https://172.17.0.24:3000/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 20:58:23.327016
14753	918ad1f7-0d20-4207-aeae-1550958bcfcf	b22277f9-d428-4813-9af5-288b0f564546	\N	80.82.77.202	Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36 OPR/62.0.3331.116	\N	\N	https://172.17.0.24:3000/	Opera	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-23 00:53:09.829931
14754	2c5512f3-148a-43ac-8d4c-38e5f741eb0d	b97af6d6-7fe7-4064-9cbc-19056a2528ed	\N	46.174.191.30	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.24:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-23 04:47:49.822347
14755	40dade55-e69f-4b5c-80af-4d1892a31c3f	0b542e29-5b3f-4fe1-b58b-191d84c58bda	\N	5.8.11.202	Mozilla/5.0 (Linux; Android 6.0.1; SM-G900H Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 Mobile Safari/537.36	\N	\N	https://172.17.0.24:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-23 09:42:32.978713
14756	275141f0-3a27-4d3c-8b5b-0321dc1a1289	6bfeca52-69fe-4101-86ac-c45ab2ea0325	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-23 12:30:27.610643
14757	9f4b0ea6-0078-434a-97d9-69acfe77d3e0	9668df3f-1a28-4fc5-b4f2-35f5d6ba7311	\N	93.174.93.12	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36	\N	\N	https://172.17.0.24:3000/	Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-23 14:10:35.801254
14758	b5edee8b-5268-4dca-bb46-8dd07d3b74f7	11e3884f-f5f6-4a6d-8552-0e1384fd6e96	\N	80.82.77.202	Mozilla/5.0 (SymbianOS/9.2; U; Series60/3.1 Nokia6120c/3.70; Profile/MIDP-2.0 Configuration/CLDC-1.1) AppleWebKit/413 (KHTML, like Gecko) Safari/413	\N	\N	https://172.17.0.24:3000/	Nokia OSS Browser	Symbian OS Series 60	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-23 16:08:31.239038
14759	52ac29f3-ece3-4a3e-9ebd-6f8d27fb81bf	236eda45-f836-4b6a-b666-81d512c5d005	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-23 16:35:57.481044
14760	d00cca4d-f9de-4972-bc2b-d13a303d6786	996fa479-0153-4723-a4d4-9d4d8f589a00	\N	5.8.11.202	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36	\N	\N	https://172.17.0.24:3000/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-23 18:31:03.066117
14761	5933d3e0-9184-46fc-90bf-3f04b012e881	ead6621a-90ef-4163-b090-ec4857ad3a6e	\N	165.227.39.203	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-23 21:09:35.671623
14762	852cc570-0850-4c54-87b3-cd097a0a42aa	0658b212-556c-4d72-a922-2acc25ba5f33	\N	46.174.191.30	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.24:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-23 21:51:43.61279
14763	d53e3bde-49cf-40f6-a7c1-71b99e4a9ca9	02dfe052-f068-4385-9de7-6bbbfc6128d5	\N	93.174.93.12	Opera/9.80 (Android 4.0.4; Linux; Opera Mobi/ADR-1205181138; U; pl) Presto/2.10.254 Version/12.00	\N	\N	https://172.17.0.24:3000/	Opera Mobile	Android	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-23 22:41:47.707397
14764	6ba81ac1-74d0-443f-8487-f750d8397abe	5ebf197f-06b5-4ee6-b2d0-3d3961ee2ca5	\N	172.71.222.175	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-24 04:14:44.747786
14765	dc07a705-59ec-4ae2-becd-86325d860eab	42bc7309-8771-4874-9c78-a647e1baf8c6	\N	5.8.11.202	Mozilla/5.0 (Linux; Android 7.0; XT1585) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.101 Mobile Safari/537.36	\N	\N	https://172.17.0.24:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-24 06:12:06.6034
14766	dccd08d6-5710-4622-9832-986c3a9ec409	43b5b0e8-1340-4963-bb06-00f8833fb873	\N	162.158.110.146	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-24 11:40:33.48181
14767	bcf522b5-2bda-4f8a-ba33-8a1b6d1adf53	8947b8de-e9de-45e9-b00d-2472a767de6a	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-24 12:14:25.387528
14768	04323b2d-74ab-44fe-9d20-258a247bf4fc	2c0852e0-9b41-4340-935e-c73825d4348a	\N	46.174.191.32	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.24:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-24 13:49:21.532954
14769	934ada32-d8d8-4edd-bd84-45a3aebd1141	4c3033cc-43c8-4b08-b81c-0a5454e1033b	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-24 14:58:01.333478
14770	cd1e55c0-5576-4612-974b-216251e62d94	1e8bd9f9-1a7d-4767-af2f-d27d8a8cb8a1	\N	80.82.77.202	Mozilla/5.0 (Linux; Android 9; Mi A1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Mobile Safari/537.36	\N	\N	https://172.17.0.24:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-24 15:15:12.531076
14771	33c1a5a0-fba3-484e-8d7b-7ff638a22617	54e65524-3b7b-4d99-8112-f8369af58be2	\N	78.153.140.179	Opera/9.25 (Windows NT 5.1; U; zh-cn)	\N	\N	https://168.119.127.165/?url=.env	Opera	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-24 16:13:03.749852
14772	7620456b-dbd4-44d6-b54c-1c455dc19923	ef1d5dde-00c1-42e0-bf0a-c63cfb4c24e4	\N	93.174.93.12	Mozilla/5.0 (Linux; Android 8.1.0; vivo 1726) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Mobile Safari/537.36	\N	\N	https://172.17.0.24:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-24 18:19:52.126019
14773	0ea33985-55e2-4fef-89bf-589d980a3a6e	6b99c415-1feb-4c17-a185-ac8c6b6a06a7	\N	5.8.11.202	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.89 Vivaldi/1.0.94.2 Safari/537.36	\N	\N	https://172.17.0.24:3000/	Vivaldi	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-24 20:17:32.879254
14774	0ee81598-92dd-4538-8a06-ee4d4ec20d30	631d1e07-7d24-47e5-8a6e-418fa9bbaeca	\N	80.82.77.202	Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A5362a Safari/604.1	\N	\N	https://172.17.0.24:3000/	Mobile Safari	iOS	Tablet	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-25 05:51:50.134456
14775	2676f1f6-0f5d-42e6-9e82-9a5b3858780c	713287cd-3454-4732-9509-a3c75d4b67e0	\N	178.128.59.55	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-25 07:01:17.098816
14776	e80cdfd0-0d80-4cfb-8f13-775b56f858a4	9e4ae613-a32f-423f-be9d-7e79f0850e86	\N	93.174.93.12	Mozilla/5.0 (Linux; Android 5.1.1; SM-J111F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36	\N	\N	https://172.17.0.24:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-25 08:18:58.299853
14777	486013a7-f94e-4246-ab0e-d2150ef2b372	ec90d8e5-8e49-483c-a4c9-9c4a15ccd7aa	\N	80.82.70.133	Mozilla/5.0 (Windows NT 6.1; WOW64; rv:2.0b4pre) Gecko/20100815 Minefield/4.0b4pre	\N	\N	https://172.17.0.24:3000/	Firefox	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-25 08:44:34.830368
14778	95f427b0-d263-465a-8d32-03e2e13354ba	822c9dc8-a1e9-46e8-a658-e3e0db3e3589	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-25 12:33:59.648766
14779	3ad26e90-1a3e-4da5-876f-07ab343ee47d	3007a3c7-e0d0-41e5-af13-7e4d4cffaf53	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-25 14:50:21.780254
14780	08859792-9cce-41a9-b643-629dccd6a8aa	3099b359-d31e-4f46-9519-a15c759a8331	\N	46.174.191.31	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.24:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-25 17:42:04.446396
14781	cf003fe5-8211-4923-bc1c-449c24d19121	bed7d3c7-4703-438d-a6a6-76c4a28fc1fb	\N	80.82.70.133	Mozilla/5.0 (Linux; U; Android 1.5; fr-fr; GT-I5700 Build/CUPCAKE) AppleWebKit/528.5  (KHTML, like Gecko) Version/3.1.2 Mobile Safari/525.20.1	\N	\N	https://172.17.0.24:3000/	Android Browser	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-25 19:49:27.229221
14782	8eeaeb06-6242-4123-82bd-75c0a0932034	1404da77-9153-44b5-bd88-2257b2bac192	\N	5.8.11.202	Opera/9.64 (X11; Linux i686; U; Linux Mint; nb) Presto/2.1.1	\N	\N	https://172.17.0.24:3000/	Opera	Mint	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-25 22:12:07.218903
14783	2b7507dc-cdcb-4ead-9b79-ce9fea7e7093	a21bf811-ee01-4d64-a608-ef805a9eeca0	\N	93.174.93.12	Mozilla/5.0 (Linux; U; Android 4.0.3; en-us; KFTT Build/IML74K) AppleWebKit/535.19 (KHTML, like Gecko) Silk/2.1 Mobile Safari/535.19 Silk-Accelerated=true	\N	\N	https://172.17.0.24:3000/	Mobile Silk	Android	Tablet	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-26 05:56:23.419651
14784	914d2045-bba0-4911-8cdc-ea292728411e	bf9d124f-154a-4422-b085-347d1c7dc4a3	\N	80.82.77.202	Mozilla/5.0 (Symbian/3; Series60/5.2 NokiaX7-00/021.004; Profile/MIDP-2.1 Configuration/CLDC-1.1 ) AppleWebKit/533.4 (KHTML, like Gecko) NokiaBrowser/7.3.1.21 Mobile Safari/533.4 3gpp-gba	\N	\N	https://172.17.0.24:3000/	Nokia Browser	Symbian^3	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-26 07:18:30.544993
14785	911554f4-096f-4602-989c-bd8aa0c81e4f	bbe5cdf4-b6ee-47a9-b238-cf7542aca9af	\N	46.174.191.29	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.24:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-26 09:00:56.238132
14786	2ecea1e4-1005-441c-b45a-54dcc3718820	d65bebb1-88cd-49ea-a577-84c1ae11cc81	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-26 12:05:30.473173
14787	7bdea610-1ace-4622-ac08-c9a2f5056a77	31b0dbc9-68c5-4b40-a7be-50b98d45aa05	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-26 12:07:36.454057
14788	2913496a-c47f-4994-8f98-6b0be1d664c8	ba0c66b5-bfbf-4049-b5c1-97a2062eb3b7	\N	5.8.11.202	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36	\N	\N	https://172.17.0.24:3000/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-26 16:20:22.073532
14789	8090f5fd-3f84-4811-a9f9-3a2d59d46315	ef595dbb-dcc5-4106-8818-81d3cd403454	\N	13.58.97.162	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-26 16:40:17.374334
14790	fc5eaf90-0459-4e5a-91f1-92171ef7bb66	6c6393b5-4114-44b7-ae0d-b327a32e62cf	\N	46.174.191.29	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.24:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-26 17:39:38.262946
14791	8679e7a1-edb5-4729-a0db-8dd1c48ed247	68d150c4-3754-4424-9b38-95e6cc7efa46	\N	167.71.227.177	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-26 18:28:31.928037
14792	25edd523-37ec-42b0-993b-dd2d8c25bf21	d54dcabf-33b8-407d-a059-aabcb8452d89	\N	80.82.77.202	Mozilla/5.0 (Linux; Android 5.1.1; vivo Y31L.RastaMod_Version) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.143 Mobile Safari/537.36	\N	\N	https://172.17.0.24:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-26 21:32:55.550862
14793	2b5fc9e4-ff4e-402d-ba0c-03b6a919023c	fb0ad84a-3a27-407d-8aa2-6a285c217225	\N	93.174.93.12	Nokia7250/1.0 (3.14) Profile/MIDP-1.0 Configuration/CLDC-1.0	\N	\N	https://172.17.0.24:3000/	Nokia Browser	Symbian	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-27 02:12:29.775229
14794	5fa478fa-fbc1-4c31-a8c7-45f1c6f627c6	fbf1bc10-1fce-45f5-b259-e7048ec2c9d3	\N	5.8.11.202	Mozilla/5.0 (Linux; U; Android 8.1.0; zh-CN; EML-AL00 Build/HUAWEIEML-AL00) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.108 baidu.sogo.uc.UCBrowser/11.9.4.974 UWS/2.13.1.48 Mobile Safari/537.36 AliApp(DingTalk/4.5.11) com.alibaba.android.rimet/10487439 Channel/227200 language/zh-CN	\N	\N	https://172.17.0.24:3000/	DingTalk	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-27 05:47:11.185396
14795	e599017e-2b6e-48e8-9c43-c9de7faec733	18193050-a45e-47a6-86ea-f415ff2e862b	\N	188.166.87.67	Mozilla/5.0 (Windows NT 6.1; WOW64; rv:54.0) Gecko/20100101 Firefox/70.0	\N	\N	https://168.119.127.165/	Firefox	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-27 05:47:57.706536
14796	e6bbbd6a-d0da-4dc1-b9ee-142b50ae58e7	eff7ee87-47a1-4509-835b-a78baec2820d	\N	124.156.193.7	Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1	\N	\N	https://168.119.127.165/	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-27 10:08:56.942742
14797	ceb555f5-84e4-4132-a381-e2bb7777c076	3f43500e-be33-4e3d-bce3-8816e5a1585c	\N	43.128.100.206	Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1	\N	\N	https://168.119.127.165/exercises	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-27 10:15:35.525623
14798	e8ccc7a4-23d7-482e-88ff-161cb358f2d6	b280bbbe-d9e6-456a-bdfe-9a7d9d31b954	\N	49.51.233.46	Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1	\N	\N	https://168.119.127.165/workouts/5	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-27 10:16:22.482498
14799	64b31e3d-bfa1-480b-918a-aed525c99db4	122e1e6f-61e5-4256-b74c-b69c47b39841	\N	49.51.233.46	Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1	\N	\N	https://168.119.127.165/	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-27 10:16:23.896741
14800	5a687960-1566-4d07-814e-632690a2afb2	31b0dbfc-6c04-4f6c-92a4-2223e49f5608	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-27 12:25:31.196859
14801	dbb4d237-6c1c-4b25-bd4d-67ec7d44cecf	c8c52ab6-228b-4a47-a8aa-d82e06f4a2c9	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-27 14:01:31.055325
14802	a52dd49c-bfad-4c48-903d-10f45999b18c	47fe760a-c62a-4412-b172-903b2768f53a	\N	80.82.77.202	Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/418.8 (KHTML, like Gecko) Safari/419.3	\N	\N	https://172.17.0.24:3000/	Safari	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-27 14:31:30.109486
14803	759b9391-883d-4745-836d-b5f080df48e2	a2869622-74b5-455f-87a5-66baae97ee2a	\N	46.174.191.32	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.24:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-27 14:36:49.880176
14804	dce3329e-33f4-4c55-bffb-0a3448a41a58	9294c8fb-3f9c-4070-b235-2aefa566c863	\N	93.174.93.12	Mozilla/5.0 (Linux; Android 6.0.1; MI 4W) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36	\N	\N	https://172.17.0.24:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-27 17:00:55.287579
14805	6527325a-9192-4e4e-906b-be3c9c9e696f	a14ea92d-965d-4c3a-ab71-3f35b16cebd4	\N	5.8.11.202	Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36	\N	\N	https://172.17.0.24:3000/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-27 17:36:34.340241
14806	48d3cf10-0059-4ea3-b395-1b23c5272381	0e85a41c-cbbf-43bf-b6c0-f6483c5957a0	\N	46.174.191.32	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.24:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-28 10:43:24.680592
14807	156e7e81-bee3-4d03-a710-2146250efcca	ef75bee3-7c4f-4483-a021-4b8fa1fe0858	\N	93.174.93.12	Opera/9.80 (Linux i686; Opera Mobi/1040; U; en) Presto/2.5.24 Version/10.00	\N	\N	https://172.17.0.24:3000/	Opera Mobile	GNU/Linux	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-28 11:39:02.398707
14808	641d2614-c783-42c8-9531-86854b8a813e	01f0c400-dc1c-4082-868f-6c52f58387f4	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-28 13:03:07.299981
14809	2705406b-bfcc-4119-8617-df5f7b760447	63a4bc13-3d37-460d-835d-341bdb45cafc	\N	91.243.50.206	Mozilla/5.0 (Linux; Android 8.0.0; d-02K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.105 Safari/537.36	\N	\N	https://172.17.0.24:3000/	Chrome	Android	Tablet	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-28 13:33:09.635848
14810	421377de-aa86-4dc9-af05-0a57fc3407dc	3efa9740-08c2-4848-be7f-eb0cabbe30eb	\N	80.82.77.202	Mozilla/5.0 (Linux; Android 9; RMX1801) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36	\N	\N	https://172.17.0.24:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-28 15:30:57.204147
14811	6aae379f-2e63-47ca-85cb-3d8fb97ba437	d57d23ee-9283-4c21-a2be-af40b96eca1e	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-28 17:46:05.947036
14812	2cfee450-8a20-4c7e-8121-b7dc3f9c70fb	cb4b4940-e648-4cec-bc01-841d91190307	\N	80.82.77.202	Mozilla/5.0 (X11; CrOS x86_64 11647.154.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.114 Safari/537.36	\N	\N	https://172.17.0.24:3000/	Chrome	Chrome OS	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-29 01:29:37.44062
14813	375b77b1-75ce-4ad6-9121-d3a135175f22	14277418-9906-4bd3-9ba8-b531738c02cf	\N	172.70.175.171	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-29 05:27:23.400976
14814	b0ec7a6e-a876-40f4-9d6a-dd50282b3e48	c6cfd3ab-e577-4974-b37b-4564df51f00d	\N	5.8.11.202	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	\N	\N	https://172.17.0.24:3000/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-29 10:57:44.50437
14815	ec043f8a-01f1-4230-9f5a-a3f69c76c5b5	f269dce3-8faf-416a-bb32-95828c960fc3	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-29 13:01:52.405375
14816	dbd7dc77-6afb-4730-a3e9-166c9b7d97df	839bcd10-375e-4ef3-bb9a-30a10eb00f2f	\N	93.174.93.12	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.7 (KHTML, like Gecko) Chrome/16.0.912.36 Safari/535.7	\N	\N	https://172.17.0.24:3000/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-29 14:34:08.885043
14817	ade93257-6983-41ff-bc06-28d3b18060b6	34fcf5ce-09dc-4499-a93f-25b766ce9c8d	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-29 17:27:50.372128
14818	f7ada487-44bc-485e-b5f5-e3b9e83e0260	16e91168-d6b0-483e-ae83-731f8bbabb66	\N	46.174.191.32	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.24:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-29 18:44:30.665463
14819	5e7d459a-0575-4468-93b4-9f53a25a9c2e	0ef6caa9-7383-40f4-920c-3ee1ba0a1b1a	\N	5.8.11.202	Mozilla/5.0 (iPhone; CPU iPhone OS 12_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/74.0.3729.121 Mobile/15E148 Safari/605.1	\N	\N	https://172.17.0.24:3000/	Chrome Mobile iOS	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-29 19:07:20.043002
14820	608b1e40-7741-4ed0-bb80-a5339b2b3951	f887a411-bf05-4728-9e8f-a2eacc1b3349	\N	93.174.93.12	Mozilla/5.0 (Linux; Android 7.0; SAMSUNG SM-G925R6 Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/5.4 Chrome/51.0.2704.106 Mobile Safari/537.36	\N	\N	https://172.17.0.24:3000/	Samsung Browser	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-29 22:17:57.142195
14821	969d1b96-8a01-42f2-a088-f816c5181555	9bebedb3-db06-4bdf-b371-2a2197ddb4ec	\N	108.162.221.67	Mozilla/5.0 (Linux; Android 5.1; C6740N Build/LMY47O) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.111 Mobile Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-29 22:18:27.22303
14822	c6444081-4ae4-435c-8d63-9164a97c0a8f	2aecb097-2c4e-4c06-8615-2f00c7bdaf8e	\N	172.104.11.34	Mozilla/5.0 (Macintosh; Intel Mac OS X 13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-30 02:05:16.529049
14823	dfed4834-c463-4fb4-98e5-3e3b95ccdc93	fa5fa62e-e6c5-4260-8f53-a7daf1ffa0d7	\N	162.158.86.75	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-30 03:09:38.486186
14824	f1e9f2ff-60ad-40dc-85e2-4c6a8a288336	4c4b9be3-b086-41b1-b379-ab927cf41f54	\N	192.155.90.118	Mozilla/5.0 (Macintosh; Intel Mac OS X 13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-30 04:37:41.164588
14825	f60a222f-d073-4143-821b-8420d668b287	d14c6420-3c70-4a40-a309-2ac4c3a682a5	\N	5.8.11.202	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) snap Chromium/76.0.3809.100 Chrome/76.0.3809.100 Safari/537.36	\N	\N	https://172.17.0.24:3000/	Chromium	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-30 06:51:33.849631
14826	83e82a63-b80c-4509-b0ed-8604c7d52bc4	5192b1c4-27ca-473e-b605-19c07d2cdea1	\N	80.82.77.202	Mozilla/5.0 (Linux; Android 6.0; LG-D850 Build/MRA58K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.97 Mobile Safari/537.36	\N	\N	https://172.17.0.24:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-30 07:09:01.863439
14827	5001eea7-5931-4b32-9285-e874d1d8b062	0c9d6d61-2c39-4dd7-8401-f31229d12e9c	\N	162.158.95.130	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:131.0) Gecko/20100101 Firefox/131.0	\N	\N	https://gym.margareti.com/	Firefox	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-30 15:14:55.270305
14828	053f9f80-c2ba-49b6-a703-6c0550bc2171	67f868a2-8376-4fd7-9bdf-1c4f5c76e93b	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-30 16:36:08.480535
14829	2f84a078-0671-4e64-8e92-27a39b28eee1	58acc103-8731-4668-8d2c-90770df63e6a	\N	93.174.93.12	Mozilla/5.0 (Linux; Android 9; ONEPLUS A6003) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-30 20:38:45.460252
14830	522c6acc-880c-4b84-9900-8c3e37efcfbd	be23538c-2ffb-48d6-a3cf-d74153008b57	\N	80.82.77.202	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-01 04:06:37.641643
14831	68f69d40-bb9f-4d59-965a-5e81bd7449ce	384833db-dd44-4994-87f1-9bc8b60d05ae	\N	46.174.191.30	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.22:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-01 05:51:28.111873
14832	0bbbcfc5-6e66-4804-b22b-d419b7081c87	7f569038-3d7f-40ee-8998-c94d2bd61b74	\N	172.71.164.167	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.0 Safari/605.1.15	\N	\N	https://gym.margareti.com/	Safari	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-01 06:15:15.978744
14833	30735527-68a6-4375-a2db-d2f11c7dd4f5	e215929f-e36c-4f56-b871-26d216977de3	\N	5.8.11.202	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-01 08:37:15.101436
14834	0017798b-56c9-4758-a41f-434f056c6684	90256ba2-8551-4ceb-a76d-908b50a84685	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-01 12:54:34.112745
14835	cb9aabf5-4716-4cd1-9741-098f845b0289	3ae9f900-2852-4566-8925-a1ba61e7a097	\N	93.174.93.12	Mozilla/4.0 (compatible; MSIE 5.15; Mac_PowerPC)	\N	\N	https://172.17.0.22:3000/	Internet Explorer	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-01 16:16:06.874294
14836	ac324ec5-ac5c-4e57-8f1e-c431c43e2132	fe55d23f-1274-4997-a3f6-4d8c08e20b26	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-01 16:51:46.083442
14837	44478660-4d00-4c70-b223-78753ec64eb8	3e6fd72e-6d6b-401d-8dec-79660e08cdda	\N	5.8.11.202	Mozilla/5.0 (Linux; Android 9; SAMSUNG SM-G970F Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/9.4 Chrome/67.0.3396.87 Mobile Safari/537.36	\N	\N	https://172.17.0.22:3000/	Samsung Browser	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-01 21:13:20.929883
14838	7bb8848e-d650-4efe-ad70-0ef1cc0ffd8c	9519e2ad-b370-4fdf-b74f-ef98e8f6a886	\N	13.58.97.162	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-01 23:05:26.586515
14839	8f1255ff-8a7a-4ed8-a9f7-1540d4567f2d	c3af2199-fa8e-4f98-9de0-a14ef209f421	\N	46.174.191.28	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.22:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-01 23:09:06.108248
14840	cccdbd86-0ea9-4e87-b85b-84d49184e871	589f7265-3fd2-4ca7-9929-c9246995ea06	\N	45.79.181.94	Mozilla/5.0 (Macintosh; Intel Mac OS X 13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-02 06:40:32.837751
14841	603e49a9-1833-488a-9586-49e61352a6aa	7fd1eee8-0085-4bca-9865-e0768c5a584f	\N	93.174.93.12	Opera/9.80 (X11; Linux i686; U; en) Presto/2.2.15 Version/10.10	\N	\N	https://172.17.0.22:3000/	Opera	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-02 08:06:36.870533
14842	b8a3881c-69b7-4ff9-a08d-6d4a75c98a5e	f3a4de3b-cc1e-4109-b6c9-5fc0a4fdce75	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-02 13:18:05.2693
14843	c57e15ea-c18e-4ba8-b7a2-0a99dd1af4e2	32b8d345-1978-4d72-aeb6-7be004e70414	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-02 17:23:14.824696
14844	bdd95a04-b90d-44c2-8ba8-055a0ee469b0	1e9cc752-17a8-48ab-9c2d-f2f2e22fd72c	\N	80.82.77.202	Mozilla/5.0 (Linux; Android 9; EML-L09) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-02 17:52:32.891644
14845	09947a33-df21-454f-94d4-791d145297e3	421ca465-9ccd-4cdd-810d-54c78c011bb5	\N	46.174.191.28	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.22:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-02 18:08:30.633823
14846	15891372-b16a-467b-a131-43e541ac7e23	a7b19589-8219-47ed-b13a-7d47130030ab	\N	93.174.93.12	Mozilla/5.0 (Linux; Android 9; SM-G950F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.143 Mobile Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-02 23:07:42.918103
14847	64df8940-7ab3-48ff-9b99-754c8c09ada4	64ac8748-c8c3-461a-98d7-35238fb7e95d	\N	5.8.11.202	Mozilla/5.0 (Windows NT 6.2) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1061.1 Safari/536.3	\N	\N	https://172.17.0.22:3000/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-03 00:02:21.179484
14848	fe1e6676-fdd9-4d60-a000-e5c412b1f146	b03a3b82-c145-4f33-a46e-11d92a7c3075	\N	93.174.93.12	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.82 Safari/537.36 OPR/29.0.1795.41	\N	\N	https://172.17.0.22:3000/	Opera	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-03 04:25:59.471856
14849	1cef3f50-a378-4151-a456-e3d305b86b37	10ee8b00-bfe9-44d6-a0e2-926278cba7fb	\N	162.158.90.93	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.43	\N	\N	https://gym.margareti.com/	Microsoft Edge	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-03 05:37:29.602474
14850	bcfbc8c5-13a0-4055-a46c-9aa969ab0e4e	7fbaa513-a406-476a-8102-091b2de82c06	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-03 12:32:51.792992
14851	725276ca-d514-4ae0-a524-25e0bd7757a7	338b8b66-48c9-473a-b663-d3ea21ebeaec	\N	93.174.93.12	Mozilla/5.0 (OS/2; Warp 4.5; rv:24.0) Gecko/20100101 Firefox/24.0	\N	\N	https://172.17.0.22:3000/	Firefox	OS/2	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-03 12:34:49.793632
14852	4cbbfbb7-f8cf-4d30-bf20-9e0c742456b2	7d003923-2515-45c2-9915-dcf7de83f417	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-03 12:55:52.048932
14853	67002bd7-2a55-4ada-95ef-c63c2f9451b0	1c48b4d5-c61a-412c-b4b2-5c17eebd6598	\N	5.8.11.202	Mozilla/5.0 (Linux; Android 9; Redmi Note 7 Build/PKQ1.180904.001) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/9.4 Chrome/67.0.3396.87 Mobile Safari/537.36	\N	\N	https://172.17.0.22:3000/	Samsung Browser	Android	Phablet	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-03 16:00:05.115772
14854	9830821d-bb08-45b5-9377-e059e04c823b	be5f1fa5-9db4-4c1e-b1c5-35070b51903d	\N	78.153.140.179	Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8b5) Gecko/20051008 Fedora/1.5-0.5.0.beta2 Firefox/1.4.1	\N	\N	https://168.119.127.165/?url=.env	Firefox	Fedora	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-03 16:40:37.450456
14855	3a877552-9bf8-41e5-badb-1d17a26a52ac	35e0ad6f-4897-4b7e-a5cc-d342e7676329	\N	80.82.77.202	Mozilla/5.0 (X11; U; SunOS i86pc; en-US; rv:1.8.1.12) Gecko/20080303 SeaMonkey/1.1.8	\N	\N	https://172.17.0.22:3000/	SeaMonkey	Solaris	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-03 19:57:25.865141
14856	c33b5dcf-3911-4250-becf-c9a0d8faad77	707400af-b4fb-4256-9b4c-2371bd35cf35	\N	78.153.140.151	Mozilla/5.2 (compatible; MSIE11.0; Windows NT 6.1; WOW64; Trident/7.0)	\N	\N	https://168.119.127.165/?phpinfo=-1	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-03 20:27:38.83759
14857	98c4e629-24fc-46ef-9333-254191feec4a	7565569e-ca16-48c4-96fa-01d932a25577	\N	46.174.191.30	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.22:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-03 21:12:30.525931
14858	454941bd-68b2-4a2d-9f3c-030f8979a239	7779cdf8-190e-4a68-b687-8d18cf857118	\N	5.8.11.202	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-03 22:07:34.478759
14859	a91ab91f-fafb-4e9a-9eb9-fa39d5933317	e6361c18-f622-453b-aaa7-f1360cbe96c7	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-04 13:29:48.435881
14860	608cbe3c-4da6-4ecd-b27f-425afb09b7b0	6e1ecb10-5d46-4827-8112-e23c19fcc2f7	\N	188.166.87.67	Mozilla/5.0 (Windows NT 6.1; WOW64; rv:54.0) Gecko/20100101 Firefox/70.0	\N	\N	https://168.119.127.165/	Firefox	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-04 14:39:05.68411
14861	2f2b375f-a991-4f6d-83d4-55a7cf216994	b26f125a-22b6-4ec1-ae15-5e6654dbd713	\N	46.174.191.32	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.22:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-04 15:26:56.398746
14862	b0fdb955-ed31-4882-b042-4705aaaf288b	db7b2a7e-4d0c-40d2-a015-4371d4fc4bdf	\N	93.174.93.12	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36 OPR/58.0.3135.107	\N	\N	https://172.17.0.22:3000/	Opera	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-04 15:57:15.998193
14863	89088274-d4d4-497a-ae67-0569dc7a5fa3	8c677f33-c4fd-4496-a1c8-869ae491dab4	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-04 18:37:56.455325
14864	21ff3b3e-124c-4b4e-89ac-7281bd34f393	458384c2-808e-4315-9ae2-baec79b018de	\N	5.8.11.202	Mozilla/5.0 (Linux; Android 8.0.0; SM-A600FN) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-04 20:03:41.765093
14865	1b4e7757-af8c-4fc1-a539-8c136b7a814b	873b5025-06c3-4231-82fe-9971e6fa4263	\N	80.82.77.202	Mozilla/5.0 (Linux; Android 9; MI 8 Build/PKQ1.180729.001; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/66.0.3359.126 MQQBrowser/6.2 TBS/044851 Mobile Safari/537.36 MMWEBID/2901 MicroMessenger/7.0.6.1460(0x2700066A) Process/tools NetType/4G Language/zh_CN	\N	\N	https://172.17.0.22:3000/	WeChat	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-05 01:15:53.14796
14866	06644fa0-11ed-4ec1-aad1-01db081f47e9	1903b70a-954b-4cfe-b427-1f15af269c43	\N	192.155.90.220	Mozilla/5.0 (Macintosh; Intel Mac OS X 13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-05 02:36:32.266806
14867	6ae979a1-694e-491a-9adc-21e5e8759b84	ce46880f-3a05-4a6c-8317-fd00c1142f71	\N	93.174.93.12	Mozilla/5.0 (Linux; Android 8.1.0; SM-G610M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-05 05:20:43.010165
14868	17e7bee6-95ba-46b2-82f8-81433d962b85	4a2d14d2-069f-4f10-9fbc-7b14d721c4cc	\N	80.82.77.202	Mozilla/5.0 (Linux; Android 5.1; A1601) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-05 07:01:06.209091
14869	fa5a26ec-0fec-4dcb-a536-a025f987a77e	cc4d5c28-a6d1-4647-bf0c-dcf4947a7d8f	\N	5.8.11.202	Mozilla/5.0 (X11; Ubuntu; Linux x86_64) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.0 Safari/605.1.15 Epiphany/605.1.15	\N	\N	https://172.17.0.22:3000/	GNOME Web	Ubuntu	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-05 09:47:32.288476
14870	cba3f36b-fabf-49d0-ab36-f2ebd9b65c0f	190597b9-2e03-4ee6-ba6f-7565c099e541	\N	93.174.93.12	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-05 10:17:12.586391
14871	091c9ae1-081b-4fa0-ae1c-fc267da519e3	418712f9-8017-44d6-8f01-887eb6d7be2b	\N	46.174.191.30	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.22:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-05 12:42:52.23722
14872	8438e7e3-f681-4add-9a92-4dfa4d8dbbb1	ff790655-03af-4dcc-b06d-47ed658ee497	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-05 13:17:05.119077
14873	fe112a2a-e07b-43df-86ae-9e449c7e8abf	c9e158ce-dcb9-41cf-9354-0fa9e8c794bc	\N	78.153.140.177	Mozilla/5.0 (Linux; Android 4.2.2; ALCATEL ONE TOUCH Fierce Build/JDQ39) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36	\N	\N	https://168.119.127.165/?phpinfo=-1	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-05 15:07:46.082945
14874	6cfe9c19-870f-42cf-9905-11ec49465ca5	6dd9bbfb-1d88-4a90-a1d7-dc080ff6dc45	\N	5.8.11.202	MOT-L7v/08.B7.5DR MIB/2.2.1 Profile/MIDP-2.0 Configuration/CLDC-1.1 UP.Link/6.3.0.0.0	\N	\N	https://172.17.0.22:3000/	\N	Java ME	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-05 16:33:51.858052
14875	2fef3a21-879a-4a6c-9d13-6062723b3125	dd9a5ef0-fb6b-4907-9fff-c7fa26cd2bd0	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-05 17:20:24.839349
14876	4d31151e-08e8-41a5-9f7f-2ccc50d038a1	271b460e-eaf9-420e-9b0d-482775c3ed11	\N	5.8.11.202	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36 OPR/62.0.3331.116	\N	\N	https://172.17.0.22:3000/	Opera	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-06 04:47:41.831004
14877	89604424-68d2-4d8d-a10a-97bffe3c4ad6	5c56cd5e-8433-4141-8ccc-8b3315459dd4	\N	46.174.191.32	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.22:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-06 08:30:07.584113
14878	705c6d99-ce94-4519-bfd8-7a6022cb8851	58a6ef7f-815e-4918-827a-eca3beb17139	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-06 12:37:29.14857
14879	079492b1-36c7-48b2-81d0-7d5ce26cadf4	34a550bc-a5fa-4c82-99ab-88540c6da4fa	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-06 13:38:17.403163
14880	c850db10-dd56-4773-a1fd-fbf1a698cd47	54339830-9595-4caf-a9a5-1b9bc497c835	\N	80.82.77.202	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-06 17:01:29.97471
14881	19299b91-9528-4d41-81e9-c10b1b4aa3bc	95b8a448-8944-4bee-a9b8-9e57b6fcd625	\N	45.83.65.98	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0	\N	\N	https://168.119.127.165/	Firefox	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-06 17:04:50.09083
14882	326f550e-3e97-43d7-b098-9aa40c430634	c2a7cd4b-47ba-4bc2-8c82-1d9ebbaea442	\N	46.174.191.28	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.22:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-06 18:36:22.766199
14883	cba4ea9c-2aad-4eaa-ad91-3230323072a3	b9424099-d4c0-41bc-9740-ba676ed45f0a	\N	5.8.11.202	Mozilla/5.0 (Linux; Android 8.1.0; Redmi Y2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-06 21:25:05.405114
14884	c0ad200c-22a7-4b41-a578-75cd71f0d796	df4c56ac-502d-411a-a7b2-a49b60481215	\N	93.174.93.12	Mozilla/5.0 (Linux; Android 8.0.0; SM-A600FN) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-07 00:02:30.246785
14885	877330d7-28e4-452d-bce4-41c314a251f1	47c39984-0729-4bca-812c-19097e827c59	\N	5.8.11.202	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:52.0) Gecko/20100101 Firefox/52.0	\N	\N	https://172.17.0.22:3000/	Firefox	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-07 05:21:12.598508
14886	e39507f6-258a-4b03-8927-65a6d39a6c21	8d872c4b-6e86-4567-b05e-7acf5667b078	\N	93.174.93.12	Mozilla/5.0 (Windows NT 5.1; rv:31.0) Gecko/20100101 Firefox/31.0	\N	\N	https://172.17.0.22:3000/	Firefox	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-07 07:48:27.2214
14887	7b70f73c-9e06-4a58-8e0f-591995dbf8d5	92e590bb-c6cb-4374-8cc9-96cd5ec9b2a0	\N	159.89.154.179	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-07 08:57:17.539678
14888	d1558935-ab0b-44b3-bc0d-68ceed68e464	bbbfdd3b-75e7-41c7-974a-f42f228cfd54	\N	46.174.191.32	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.22:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-07 11:50:43.454044
14889	aa8e6936-c952-4685-8187-cc671f3b593a	687b39b4-5be7-4cc1-995d-5b993b9dd2b8	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-07 12:29:17.021133
14890	2fca6867-0ebe-49ea-a514-6a759a116bac	d44abdea-3616-4b7b-840d-791728f23873	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-07 12:45:16.9145
14891	2d55d4bc-bb72-480a-baff-a3b94d94b316	cd14aef3-60b6-45ab-a068-2a1bf6c22cff	\N	80.82.77.202	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-07 17:49:44.244755
14892	765992fe-ce65-4cb1-9e81-7cb20acafbd5	f324895d-d8be-44c5-a010-6f3b93766b44	\N	172.232.38.156	Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:76.0) Gecko/20100101 Firefox/76.0	\N	\N	https://168.119.127.165/	Firefox	Ubuntu	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-07 21:57:47.330043
14893	8b57bfc9-6128-4ff5-bcc9-f23437ad0e8f	bbf87956-ef47-4cc0-b4ed-1fb98bd3a34a	\N	172.232.38.153	Linux Gnu (cow)	\N	\N	https://168.119.127.165/	\N	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-07 22:06:57.263238
14894	96412bc1-5390-4ab8-9e1c-0a9559abb6ec	5bf11ef4-2aa0-4c5c-9534-e364c9964732	\N	5.8.11.202	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-07 23:07:45.073317
14895	991821ac-275a-4300-83e0-a7a46bd2af7d	61ee33e3-061f-478d-80c9-d7715a9417d7	\N	93.174.93.12	Mozilla/5.0 (Linux; Android 9; SM-N950F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome Mobile	Android	Phablet	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-08 03:05:04.870937
14896	9b79fcb4-57a5-4002-a037-6f6c3919038e	92be685b-9585-4248-80d2-93d125d6b374	\N	5.8.11.202	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-08 07:37:53.152194
14897	35978e2b-58c0-4e02-90a0-805686c9ab45	2651db06-83c6-45fa-af19-d3cce958c11a	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-08 12:51:03.497002
14898	eedecc3f-32c2-43f6-8ebe-4e8a18dbf89d	dfa86c4e-3448-409b-ab53-695c79d1536b	\N	46.174.191.31	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.22:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-08 13:21:11.604817
14899	7d1eb69c-4f24-4be7-a386-ead851583f52	393c19e3-e857-453b-b4f6-5323ce1cba99	\N	80.82.77.202	Opera/9.64 (X11; Linux i686; U; Linux Mint; nb) Presto/2.1.1	\N	\N	https://172.17.0.22:3000/	Opera	Mint	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-08 14:13:39.27427
14900	4f56ca44-d2bb-4170-92a6-5943c591d208	ddd815d7-6573-44f0-8412-83e87fc66280	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-08 14:50:27.234633
14901	37e7ad7d-4a5d-4705-acec-dd01e79a3888	c77c0bb9-21dd-4d99-85ea-90b1e237237b	\N	93.174.93.12	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36 OPR/60.0.3255.170	\N	\N	https://172.17.0.22:3000/	Opera	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-08 15:03:45.149588
14902	964f7c60-04b8-4b5d-81cd-8c92f9e6547b	2cb87e3b-9919-45ba-ac01-e39260cfb001	\N	78.153.140.224	Mozilla/5.0 (X11; U; Linux x86_64; fr; rv:1.9.0.1) Gecko/2008070400 SUSE/3.0.1-1.1 Firefox/3.0.1	\N	\N	https://168.119.127.165/?phpinfo=-1	Firefox	SUSE	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-09 00:45:24.158577
14903	ba3a5912-cda2-4a7f-8cf6-a246bf30584b	87183e14-fc43-477b-b708-82b95533784b	\N	46.174.191.32	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.22:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-09 01:14:48.98745
14904	8692f008-3273-435b-8d9c-176a55012982	9f0a18a5-59c0-44e5-9dc1-ea1af793c545	\N	45.33.80.243	Mozilla/5.0 (Macintosh; Intel Mac OS X 13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-09 01:31:42.128308
14905	3a09f5ff-de70-4e12-9b4b-e13a2eec0583	4fe51408-97ae-4c22-9f83-bc2211b5ff55	\N	5.8.11.202	Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12F70 Safari/600.1.4	\N	\N	https://172.17.0.22:3000/	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-09 04:14:40.417535
14906	ca606318-9a72-441a-a501-b51544303f90	1385b25e-a2b0-42b7-9062-413c122d5cdf	\N	13.58.97.162	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-09 04:28:36.089183
14907	59891919-2c58-4775-9a93-17d43263c70f	5b839614-74dd-4693-96e3-48d6b9efc946	\N	45.79.128.205	Mozilla/5.0 (Macintosh; Intel Mac OS X 13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-09 04:35:39.267086
14908	9fc383eb-398f-4af5-9c7a-4a7d80a3b5d5	7f569038-3d7f-40ee-8998-c94d2bd61b74	\N	172.71.102.116	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.0.1 Safari/605.1.15	\N	\N	https://gym.margareti.com/	Safari	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-09 06:39:51.959294
14909	ec296163-e8a1-4471-8920-c428dfe9b99e	c9e54e48-d4a2-480e-ae58-ad1e58038842	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-09 12:44:45.315868
14910	8a6d00d0-53c7-4650-88ee-72b0f65d99e0	b7cb8452-2cc0-4965-b2bc-a219043f8769	\N	80.82.77.202	Mozilla/5.0 (Linux; Android 9; SM-G9600) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-09 12:45:09.82138
14911	1e6f36c1-b474-4621-8e75-bbcc5160af16	a9fe75d6-2014-41e6-becc-7ab5a0a113f0	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-09 14:11:47.298217
14912	151da0cb-9060-4315-b9bd-73b12afcac94	94db5efc-77e0-497d-a307-092a05cb5d7c	\N	93.174.93.12	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-09 14:55:31.315168
14913	e998f4f6-ca18-4c29-ab07-351c52920e49	260a1200-ce37-4a6a-99dd-94da6b9d27f1	\N	167.71.17.20	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-10 06:01:52.155322
14914	8b65fbe7-3217-4486-80bb-c4d06e2f7504	fefc1580-d0fe-4b6d-9f43-3100e354f973	\N	46.174.191.30	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.22:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-10 12:21:18.53292
14915	e4d5f31b-1f81-43b1-b8e0-42d26ac26568	3dfd229e-9c78-4299-97e5-3bb0bf3099aa	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-10 13:43:29.295977
14916	a3366143-b420-40e3-992c-43eded0899e7	746a56f2-50c3-4617-b14f-1d41b1bf9655	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-10 19:12:33.225969
14917	5190dcd2-cc79-4967-8b04-c54d22759070	010213f3-a0f6-4dfc-8f5b-71defc347c07	\N	5.8.11.202	ELinks (0.4pre5; Linux 2.6.10-ac7 i686; 80x33)	\N	\N	https://172.17.0.22:3000/	Elinks	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-10 21:49:38.567766
14918	8826e2c2-2dc1-4351-b8c6-745c5cd41bc4	73131daa-e288-4664-89c3-e2cd0ed6fe3c	\N	46.174.191.32	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.22:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-11 01:23:19.025145
14919	d204f27a-91c6-44e2-a076-a5beef54a720	6a7f20df-114d-4370-9aeb-8b408c1fe126	\N	80.82.77.202	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-11 03:11:24.816647
14920	fd16af26-8404-45b2-8de1-335cc78101f1	0f7dad78-6692-4fbb-a892-3d0d9a2ab2fe	\N	159.65.82.169	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-11 05:09:05.563948
14921	bc325ff6-608f-4fa6-b872-53dbc306cae6	843ef7ff-d5f4-4018-8ac9-67c0f06253bf	\N	5.8.11.202	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/602.2.14 (KHTML, like Gecko) Version/10.0.1 Safari/602.2.14	\N	\N	https://172.17.0.22:3000/	Safari	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-11 11:29:48.046458
14922	2dd4dd12-3417-4716-9d77-a75be13daf24	59df93eb-a23a-4529-9119-073f38548042	\N	93.174.93.12	Mozilla/5.0 (compatible; Konqueror/4.3; Linux) KHTML/4.3.1 (like Gecko) Fedora/4.3.1-3.fc11	\N	\N	https://172.17.0.22:3000/	Konqueror	Fedora	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-11 12:05:37.537359
14923	4c859b50-8f82-4d99-b79f-92572cff969c	33c9a3b9-a70d-467a-8508-2551bc717b04	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-11 13:17:15.238496
14924	623ea0c7-8999-4ae6-b3b9-89a95b617915	76a22d53-f53e-4f00-846b-26d54ebf7693	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-11 17:11:03.29817
14925	6fe88df0-a18a-4168-a4fa-a1389c2413b3	f69861b3-0c03-4112-851d-825ccde93a19	\N	46.174.191.28	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.22:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-11 21:47:59.875767
14926	4c212c92-2c80-4349-8b4a-e675a11f2da3	e6d3299d-859f-4026-acc4-5314b15a4602	\N	80.82.77.202	Mozilla/5.0 (iPhone; CPU iPhone OS 12_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.2 Mobile/15E148 Safari/604.1	\N	\N	https://172.17.0.22:3000/	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-11 23:31:20.305697
14927	424c5bd8-44d9-4160-b042-fa5fcb9f29e0	37dd9663-fa42-403d-afa7-3a5eac2aa51e	\N	5.8.11.202	Mozilla/5.0 (Linux; Android 5.1; A1601) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-12 00:56:15.39117
14928	325945aa-3842-40bf-b039-ab72820af9ce	9ed3e8ad-622b-40b7-92ec-693fc61c353d	\N	174.138.61.44	Mozilla/5.0 (Windows NT 6.1; WOW64; rv:54.0) Gecko/20100101 Firefox/70.0	\N	\N	https://168.119.127.165/	Firefox	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-12 07:50:26.23781
14929	c0d43334-5711-4004-8113-41516769bbbb	a7d8481e-1795-4318-baf9-b1926f02e463	\N	93.174.93.12	Mozilla/5.0 (Linux; Android 9; SM-G973W) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-12 10:40:10.744862
14930	629a7c78-fb9a-4046-96b1-4cdcd704062e	385ed5be-31b2-4a5e-8c71-629d25990b29	\N	80.82.70.133	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-12 12:19:58.421727
14957	e1b2e0fb-553b-44f4-ab2d-c759b29c4699	59d6112f-8974-4346-bfc9-a3fa02e808fc	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-15 12:57:44.750833
14931	a3873802-661f-4473-9a22-72d25b6d8452	f75eec3f-dc09-4eea-a146-fb318f464d18	\N	5.8.11.202	Mozilla/5.0 (SymbianOS/9.2; U; Series60/3.1 Nokia6120c/3.70; Profile/MIDP-2.0 Configuration/CLDC-1.1) AppleWebKit/413 (KHTML, like Gecko) Safari/413	\N	\N	https://172.17.0.22:3000/	Nokia OSS Browser	Symbian OS Series 60	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-12 12:47:13.410214
14932	e15ec78c-1e14-4a8b-b823-e59712e05b47	16eecd85-e78e-4854-98cd-e1619fb7fe8e	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-12 13:21:00.481705
14933	b6c5d5b4-bb5c-4d08-a8ed-a152ad2dc580	0ad18671-b2ae-47eb-b556-eacf4c8bfc58	\N	80.82.77.202	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.122 Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-12 13:56:16.3797
14934	de0bc93d-1b0a-422b-b517-1ce5278a11e4	c3822df8-98f3-4bac-9664-a3b2a587e0f1	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-12 17:43:41.999364
14935	cfd31cd1-3849-40a9-9541-321adecd794d	7fe6b51c-7f0e-435d-bd2f-a0988cdf1f30	\N	80.82.77.202	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-12 17:59:24.511229
14936	ef1804ae-217b-4312-818b-dccc2f7e6595	46e15439-fd8b-43e9-bb5f-d959ebcb2a40	\N	46.174.191.32	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.22:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-12 20:57:04.890015
14937	8fa48c62-94c1-4ea3-b16e-a619f5dbddfb	84ee03ae-4556-46ad-9131-3329a55927c8	\N	93.174.93.12	Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-13 02:58:10.895965
14938	2ec8d49c-0332-4dd3-8aed-83568c639f25	42e0c38d-a41f-42fa-9761-5824777cc59b	\N	46.174.191.29	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.22:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-13 08:25:35.814864
14939	3e70971f-434d-4d65-adb6-c259465e7f74	0112d4b3-23f4-45e6-ab32-a581657a078e	\N	5.8.11.202	Mozilla/5.0 (Linux; Android 9; SM-G960U) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-13 09:58:00.471791
14940	8f50766f-44c8-4de6-bd05-e9526c11e40a	0a1ad2f4-ba29-425b-975e-0d8b43aad899	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-13 13:27:15.145923
14941	0752b53b-46e7-4ac7-9586-8b827f372f2d	507c34d6-9468-4f00-9b8c-a5a3996e91c5	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-13 18:20:05.127108
14942	c42d201e-3c56-4e9e-ae22-6a188ab19361	473d673b-3af3-4873-abd5-2eb1200d264c	\N	5.8.11.202	Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57	\N	\N	https://172.17.0.22:3000/	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-13 22:22:57.992694
14943	03f5c9dc-df8b-40ed-9ad6-46de3a8c5eae	68999b14-36f8-4e12-825b-74fc31cc9dd4	\N	5.8.11.202	Mozilla/5.0 (Linux; Android 6.0; Lenovo A7000-a Build/MRA58K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Mobile Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-14 02:27:01.407911
14944	43819adb-4a3c-4d7a-bb97-bfdf97c34a5f	6351f804-01a5-4082-bf55-372a50f66ec7	\N	93.174.93.12	Mozilla/5.0 (X11; CrOS i686 2268.111.0) AppleWebKit/536.11 (KHTML, like Gecko) Chrome/20.0.1132.57 Safari/536.11	\N	\N	https://172.17.0.22:3000/	Chrome	Chrome OS	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-14 02:46:16.814333
14945	01b5d146-7a6e-4afd-9cef-fd53e334fe06	2c813fc7-62c4-4ff4-9f8e-77c41e54e18f	\N	46.174.191.28	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.22:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-14 03:56:50.178737
14946	84093e4e-265a-40fc-b390-124ce9612c85	2b87e7c4-8463-4547-b78c-270426dd0b6f	\N	172.70.175.8	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-14 05:50:27.140295
14947	b3d2c580-a54e-4d5a-a493-d9022488c01f	31e8e87c-a191-41dd-8660-166fbc8a0e6e	\N	172.71.99.194	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-14 08:03:22.164239
14948	d452c97e-5870-4bdd-8c23-6388c5d8b538	9f9c6d93-7dd4-4890-9635-62e41dfd310a	\N	172.70.231.42	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-14 11:42:38.776309
14949	09342660-c1c2-459b-9863-9b7319047dfa	eb52cdd0-87e8-49af-ad1a-3ee734d49823	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-14 12:52:50.253649
14950	16d16036-7dbe-409c-9623-de1489483740	13993043-d03a-4ddf-a764-95da50346614	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-14 14:51:10.527018
14951	747c9dbd-423b-4114-86e8-5602d5ec05ee	fc91ddf4-5bcc-4d09-b1cc-950a78cf7b6a	\N	78.153.140.151	Opera/9.80 (Windows NT 6.2; WOW64) Presto/2.12.388 Version/12.17	\N	\N	https://168.119.127.165/?phpinfo=-1	Opera	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-14 16:16:47.678537
14952	eb5f8430-61be-4705-b77e-a38ff3c263f5	1300d937-7856-4364-97db-961ecf199d03	\N	46.174.191.32	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.22:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-14 21:53:17.671367
14953	19a4e8f3-d1ca-45e0-b3ce-1f96f3a26cc4	23d828d5-c4ed-49d4-87f8-201d96db3cfa	\N	5.8.11.202	Mozilla/5.0 (Linux; Android 9; SM-G960F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.136 Mobile Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-15 03:17:35.330491
14954	6db15ddf-00e4-4e20-8e6a-24ff10f29b73	e034cfe1-b440-46e3-bbf9-3237d2690fc3	\N	172.69.59.53	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36	http://gym.margareti.com/	gym.margareti.com	https://gym.margareti.com/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-15 06:24:00.030531
14955	d7fd7581-cbf8-415b-8843-b6197584450f	ead9d1fc-9a13-47c6-b7ad-4da35fed26cf	\N	93.174.93.12	Mozilla/5.0 (Android; Mobile; rv:35.0) Gecko/35.0 Firefox/35.0	\N	\N	https://172.17.0.22:3000/	Firefox Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-15 09:07:09.157631
14956	3049a6cb-abbf-4f49-b7c6-b305ba67ad1f	beea3982-b33f-403c-841e-48c8cf1e156e	\N	5.8.11.202	Mozilla/5.0 (Linux; Android 9; Pixel) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-15 09:44:24.136696
14958	5782f63b-613f-4f25-ad15-2b6deaf39f12	76230294-3895-44ae-b8f3-d11add53fb2a	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-15 15:26:08.59254
14959	357b954d-b54c-4a87-a3aa-755c74d7f6ec	5f4c30ed-cb4b-43b2-944d-0b0ee12be627	\N	45.83.64.32	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0	\N	\N	https://168.119.127.165/	Firefox	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-15 17:22:11.892948
14960	369507d4-4a82-4879-b6d1-5813a56cd704	17775244-a9bf-4d22-886c-598af3313b32	\N	5.8.11.202	Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-15 20:08:49.393324
14961	ea116e59-7d39-497c-8fdd-77254bb43825	f5cf9701-7412-4bc2-b3c8-f680bb973638	\N	46.174.191.31	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.22:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-15 21:24:00.515548
14962	ec2357bd-9a05-4417-8b86-da35e9abfcb7	c81eb6ae-2525-43a2-8bf7-5b20ac0101be	\N	13.58.97.162	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-16 02:16:27.546229
14963	0996c281-bb9c-4b29-8884-0e33fb0efc60	1a10d031-53b2-4039-8630-c32c5497db1d	\N	5.8.11.202	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-16 09:26:05.981557
14964	d46cfc5a-bb81-411e-96f3-10ecc9efb20f	106f6850-3e25-467c-ad2c-334218733130	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-16 13:18:09.358869
14965	2015490f-b143-4703-8e31-e54d91294e1d	042f7014-543e-4c88-af29-92a01720ec4c	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-16 17:24:21.486876
14966	442ff05d-7f91-45a5-88b9-4917e131ace3	12ccd01c-3fa1-4991-919e-bed5a1dddec5	\N	93.174.93.12	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3887.7 Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-16 18:28:32.453437
14967	5bc41079-fc10-4f36-a8fa-3f140c68069e	adc772a9-5453-4aaa-8aeb-63d71ee29dff	\N	5.8.11.202	Mozilla/5.0 (Linux; Android 7.1.2; Redmi 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Mobile Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-16 20:37:29.741862
14968	ba3b2edc-0505-498f-b86a-b1d7220bf978	71ea5598-c546-4c3f-999f-deb11f8f71c1	\N	46.174.191.29	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.22:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-16 20:52:08.742631
14969	d9dd6c43-8dfa-47bb-ae06-0de1b5b92f90	e3f3281b-3433-4852-93f0-3e75164986ce	\N	80.82.77.202	Mozilla/5.0 (Linux; Android 6.0.1; MI 4W) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-17 06:30:23.076164
14970	7170c2bc-439e-43a9-b0e8-3765fe1054b3	36a22f08-48dd-4e59-b0d6-2ba65430e46c	\N	5.8.11.202	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.20 Safari/535.1	\N	\N	https://172.17.0.22:3000/	Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-17 13:22:22.222509
14971	fd8d327f-241e-4abe-ba77-74cf247dd3ce	7876e720-a62d-420a-a49a-ca004ee5aaf0	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-17 13:23:04.975313
14972	8c67d27f-3195-4d01-95b9-85baf78a8f1f	9a8e0c14-fa6a-4883-a0ed-d6a4dd4a20d2	\N	46.174.191.28	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.22:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-17 14:55:23.919224
14973	1a682e0f-118a-48b2-86cc-3e41d8a28c40	2cb51d17-8ccc-4e6c-a274-d86328495021	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-17 17:52:21.234177
14974	b5196872-d95d-4cb2-b44a-6686e1d3d678	c1e40379-87d9-43f3-bce3-c57d0b396fd8	\N	93.174.93.12	Mozilla/5.0 (Linux; U; Android 7.0; es-es; Redmi Note 4 Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/71.0.3578.141 Mobile Safari/537.36 XiaoMi/MiuiBrowser/10.9.7-g	\N	\N	https://172.17.0.22:3000/	MIUI Browser	Android	Phablet	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-17 18:18:46.987243
14975	76734367-6455-438f-b7da-0dbad1ab20f2	9461a0cb-cce0-418f-b606-e013cd674065	\N	80.82.77.202	Mozilla/5.0 (iPhone; CPU iPhone OS 12_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/79.0.259819395 Mobile/16G77 Safari/604.1	\N	\N	https://172.17.0.22:3000/	Google Search App	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-17 21:55:04.465256
14976	e4b72b1c-bedb-42a3-94c0-a81a7ddb65a3	a5a448cf-5502-48aa-9871-98686902b621	\N	93.174.93.12	Mozilla/5.0 (Linux; Android 7.0; Redmi Note 4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3880.5 Mobile Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome Mobile	Android	Phablet	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-18 06:21:03.592289
14977	fecb90d0-a4e8-4058-955f-7d4619153f2d	d4b310b0-738c-4c46-aa2d-59fd0e1edd25	\N	5.8.11.202	Mozilla/5.0 (iPhone; CPU iPhone OS 12_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.1 Mobile/15E148 Safari/604.1	\N	\N	https://172.17.0.22:3000/	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-18 07:11:07.389086
14978	bcf4fcd0-39ff-487e-b560-4df3500c3e08	cd4601c5-012f-49fa-9030-a6b511972512	\N	172.71.124.214	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-18 08:51:25.40458
14979	5d27d7c9-02af-4548-8098-b3b8904e081e	a8d4ec98-db31-45fa-ae5a-bac524d34abf	\N	172.71.103.184	Mozilla/5.0 (Linux; Android 6.0; HTC One M9 Build/MRA58K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 Mobile Safari/537.3	\N	\N	https://gym.margareti.com/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-18 09:30:59.949433
14980	5c877a19-0bd1-4f64-aee4-165e6eb81329	6a79a0a9-e41d-4911-a6d7-3a1ffc63ca54	\N	172.69.179.18	Mozilla/5.0 (Linux; Android 6.0; HTC One M9 Build/MRA211145) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.1746.98 Mobile Safari/537.3	\N	\N	https://gym.margareti.com/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-18 09:31:01.047859
14981	ceee018c-36e9-42ff-a916-a5320a861889	02240467-8644-4e32-bdd3-704af09c9bc5	\N	172.70.46.164	Mozilla/5.0 (Linux; Android 6.0; HTC One M9 Build/MRA58K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 Mobile Safari/537.3	\N	\N	https://gym.margareti.com/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-18 09:31:01.062911
14982	1af1a43d-5246-4d8a-83eb-6afd1a1bb3cd	4a3e2eac-72fb-4028-b3c7-b3b2c9b88517	\N	162.158.106.73	Mozilla/5.0 (Linux; Android 6.0; HTC One M9 Build/MRA114826) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2890.98 Mobile Safari/537.3	\N	\N	https://gym.margareti.com/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-18 09:31:02.805705
14983	b321dd60-5fe2-474c-a7ca-50cb721603e5	2185f606-ed78-4047-b510-c85157ae0095	\N	172.71.172.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-18 09:31:21.090502
14984	59eae76c-71a3-4bb5-9b43-8376aae929ff	a5bcd2cf-c0b3-4c7c-897d-e2acd728418f	\N	172.69.150.99	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-18 09:31:32.320061
14985	d76c8fc7-533f-4736-8205-377f10ce79d6	755a57ca-3371-4c9c-9e52-a2f86213d372	\N	172.69.6.176	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-18 09:32:02.998248
14986	245efaea-3e1b-4771-ac36-e080c669bbc2	fb45c786-b9b8-492a-b2bf-8a17e045a125	\N	172.71.254.13	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/92.0.4515.159 Safari/537.36	\N	\N	https://gym.margareti.com/	Headless Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-18 09:32:43.459808
14987	a6ac6d94-f6e9-49b6-a129-86344dbd5b79	e7962e59-0f9e-4369-9f57-be207509a75f	\N	172.71.167.52	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-18 09:33:07.360125
14988	31ad7f23-4427-421a-8d60-542aafcc73cc	86a28606-c877-4739-8976-b01c515f9963	\N	172.71.174.151	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-18 09:33:13.20022
14989	0d0d70f8-5b13-4f32-a8ef-2d3c15f80da6	4962e968-7a8b-4800-9228-e8a5c57a5263	\N	172.68.27.71	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.5938.132 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-18 09:35:58.31832
14990	fcaff1e4-d230-4adc-9f2b-76a468ed1e67	5f45234d-1e16-4fac-838f-7cfd5f68ec69	\N	172.70.43.97	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-18 11:17:21.510682
14991	1da028e4-e9f5-4dad-a94c-9269f2607248	f7eb97cf-3c99-44cb-bb78-4156bd849dd7	\N	172.70.42.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-18 11:17:26.339474
14992	e0c53cb0-f096-4cac-903f-9581a7b55c70	d076b563-6a1e-4f64-b69b-50d7563ef4c7	\N	80.82.77.202	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-18 13:07:01.174828
14993	659caeff-ed78-4067-bddd-5775a1625c50	b671b4da-98e8-4241-8be9-4b371f4034a9	\N	5.8.11.202	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-18 15:06:20.43309
14994	ddf55aae-4aa3-46d5-a1ad-e78a8d96113b	76dd9f4f-f1e7-4508-85f7-89725586e31a	\N	46.174.191.31	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.22:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-18 16:42:12.118082
14995	1f8fcdd2-b985-46ac-869a-1e2e6fe5dc0e	740ef337-07b0-4dfb-9c09-1ebd8ee202f2	\N	172.68.225.147	Opera/9.80 (Windows NT 6.1; U; zh-tw) Presto/2.7.62 Version/11.01	\N	\N	https://gym.margareti.com/	Opera	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-18 17:31:27.759876
14996	72e3df16-4318-442a-865e-5f0d85a975a0	4fc84bd2-d071-489e-8c40-171ed875303d	\N	93.174.93.12	Mozilla/5.0 (Linux; Android 8.0.0; SM-G950U1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-18 22:35:11.628965
14997	58b3a366-6e3b-4335-9f2f-fec657d92f06	0854bf80-f94b-41f9-a203-c7c30fc21b74	\N	172.68.245.138	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-19 05:03:32.47691
14998	d0807937-35e0-400c-bc9f-a436fbcee983	890ae0ac-636b-47a5-8597-5431175a8044	\N	46.174.191.31	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.22:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-19 05:17:11.69809
14999	52023048-a4e0-4302-86b2-1a1f0c65dc86	3a1a8dd8-8797-42af-b776-6fbe4795a291	\N	5.8.11.202	Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-19 08:07:19.975594
15000	b7c2369d-79b4-4128-8333-11f8ca2ae641	afa6a50b-2686-4660-9181-3529a19d1ced	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-19 12:45:04.904565
15001	88599a60-0e25-4710-bc3e-b12be8b3036e	e5c46458-2fe4-4f13-b322-c25946537704	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-19 13:09:58.641344
15002	75d53534-4b57-4fd7-ade4-fbbd49d297b7	11ccf5cb-1406-4509-8602-17405e168968	\N	174.138.61.44	Mozilla/5.0 (Windows NT 6.1; WOW64; rv:54.0) Gecko/20100101 Firefox/70.0	\N	\N	https://168.119.127.165/	Firefox	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-19 13:24:07.451305
15003	38a905e6-caca-406d-b245-57931aa13e7b	327b6e41-e215-48d8-a263-3c3769a496f6	\N	5.8.11.202	Mozilla/5.0 (X11; U; Linux armv6l; rv 1.8.1.5pre) Gecko/20070619 Minimo/0.020	\N	\N	https://172.17.0.22:3000/	Minimo	GNU/Linux	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-19 14:32:44.246993
15004	af5742fb-f0ba-4ca0-8726-5f289be1440b	583f8f0f-8a5d-4540-9ee0-519e3164a5d0	\N	78.153.140.179	Mozilla/5.0 (Linux; U; Android 4.0.4; en-us; GT-S7562 Build/IMM76I) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30	\N	\N	https://168.119.127.165/?url=.env	Android Browser	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-19 14:42:06.310152
15005	3805febb-be81-45a4-a38e-02a49749c228	74a5f428-0d95-4f94-8239-5e3ad6669050	\N	80.82.77.202	Mozilla/5.0 (Linux; U; Android 6.0; zh-CN; KNT-UL10 Build/HUAWEIKNT-UL10) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.108 Quark/3.0.2.943 Mobile Safari/537.36	\N	\N	https://172.17.0.22:3000/	Quark	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-19 17:23:03.177926
15006	24cc934e-e7e3-405b-b5ee-5daa4b265e8f	c5f24416-ba4e-4ed7-9628-1daf79511af1	\N	46.174.191.29	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.22:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-19 19:27:02.09086
15007	dc0fb997-08c7-422c-a63e-4e9568a2365c	ae890f0b-2ef4-484f-b104-f0ed28b818e7	\N	172.69.6.193	Mozilla/5.0 (iPhone; CPU iPhone OS 17_0_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1	\N	\N	https://gym.margareti.com/	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-20 11:45:17.486665
15008	7257d4a9-ece3-442f-aced-173150902650	ec44d798-71d0-4a1e-b4f2-0bf86735e17f	\N	5.8.11.202	Mozilla/5.0 (Linux; Android 9; SM-G960U) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-20 12:25:14.618212
15009	4fb6b303-b7c6-4845-bb3b-906dd52fae02	2071b2f2-3576-4e09-a472-7dc20dba8f5b	\N	172.71.142.81	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-20 13:22:33.691371
15010	5943036a-6487-4993-98e6-65418d433d0a	b8491c5b-dc1e-40d7-bc81-7a6aee41f87d	\N	93.174.93.12	Mozilla/5.0 (Linux; Android 8.0.0; SAMSUNG SM-N935F Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/9.4 Chrome/67.0.3396.87 Mobile Safari/537.36	\N	\N	https://172.17.0.22:3000/	Samsung Browser	Android	Phablet	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-20 14:41:21.073851
15011	d03478d1-a45c-41e9-8e72-a36bfb3134c3	973d0265-cb05-4b35-94d2-2b37800c8652	\N	46.174.191.30	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko	\N	\N	https://172.17.0.22:3000/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-20 16:10:09.157042
15012	2108e70e-bfdd-4011-9243-c4d641f8e1bd	b8e10069-eed6-42ef-9b39-7ac0b4a3910e	\N	80.82.77.202	Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-20 19:41:36.668233
15013	54b8ab47-5474-4d54-a70b-a13d6a878ded	4715d461-7178-4a59-ad66-fda88e4d4732	\N	5.8.11.202	Mozilla/5.0 (iPhone; CPU iPhone OS 10_2_1 like Mac OS X) AppleWebKit/602.4.6 (KHTML, like Gecko) Version/10.0 Mobile/14D27 Safari/602.1	\N	\N	https://172.17.0.22:3000/	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-20 23:18:14.290798
15014	529a6c18-16d6-4119-9b2f-36f4cb270579	1bd9a61e-2dbc-4398-ad14-a0e7261aa9b9	\N	172.71.103.89	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-21 01:47:48.922381
15015	296a70b5-c4c1-4b2f-95a6-1f0f03a85c8d	4ecca917-166f-4ffd-a818-26020b1e597d	\N	93.174.93.12	Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0 Iceweasel/38.2.1	\N	\N	https://172.17.0.22:3000/	Iceweasel	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-21 06:50:37.5742
15016	d3718bed-f753-4e08-98f9-ebe3f675fb2e	1172e7de-a95d-43d4-ade7-75cdf0dfd23c	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-21 13:16:35.387733
15017	c09ca9fd-769f-49af-87b7-5d4e04385d88	53aac563-cc3f-4447-ae1f-83e487fb8bc0	\N	80.82.77.202	Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.96 Safari/537.36	\N	\N	https://172.17.0.22:3000/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-21 13:32:34.15044
15018	dd3acfa6-6a88-4540-b0f6-1541f3606242	364a4933-1e7d-4cb5-9f4a-047548a0e04e	\N	5.8.11.202	Mozilla/5.0 (iPhone; CPU iPhone OS 12_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Safari/605.1.15 Version/12.2.1.0.4	\N	\N	https://172.17.0.22:3000/	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-21 14:28:10.558776
15019	e0dfea93-3243-40ea-ba69-c2e00a21df80	38a65517-042d-41ee-bef1-cd9e05cf486c	\N	77.221.148.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://168.119.127.165/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-21 16:21:37.088904
15020	e1dae447-5580-4050-a197-40a2ba84ccbf	7f569038-3d7f-40ee-8998-c94d2bd61b74	\N	172.71.130.207	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.0.1 Safari/605.1.15	\N	\N	https://gym.margareti.com/	Safari	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-21 18:12:19.185956
15021	b5c99d61-5bc9-47bd-a725-d4782635ae05	20169d12-50dd-4ebe-b7c0-462e970d461d	\N	172.70.178.74	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	\N	\N	https://www.gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-21 21:58:53.851615
15022	d4f9d078-27ff-494c-9ab2-596299171de7	83259d6d-a61c-440b-87f3-f10a7b72d3c5	\N	108.162.245.195	Mozilla/5.0 (X11; Linux i686; rv:2.0.1) Gecko/20100101 Firefox/4.0.1	\N	\N	https://www.gym.margareti.com/	Firefox	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-21 22:37:35.459068
15023	e74e10d9-0d3f-47c2-b823-e71e9edeb604	cb33f30f-86fe-407c-8625-e586970d2c77	\N	172.71.94.55	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://www.gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-22 12:41:16.562288
15024	c2c9887d-cb5c-4204-9f4c-392874a8eaf1	c19f8e22-c067-4265-ab18-25b75f981ae1	\N	141.101.76.115	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.76 Safari/537.36	\N	\N	https://www.gym.margareti.com/	Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-22 13:42:45.543943
15025	d88e7d0e-f95d-4f6e-8366-5f213d455d7a	2a64cc47-3674-4ce6-8a77-2a4554242961	\N	172.70.114.175	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-23 02:04:07.659834
15026	d2c2c71c-23ba-461a-8689-7faa1360c5c0	00622c34-579d-4652-8e31-6c9ae348c7ce	\N	172.70.111.101	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-23 02:04:08.319952
15027	36a86917-c919-41e7-b1b4-f8c194ae3771	7968a74e-a03e-4388-b3bb-0b40b8d02010	\N	162.158.155.218	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://www.gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-24 12:48:44.436736
15028	0b069a75-50f7-4cdb-ab92-2c7fbcb9c23a	ce6b2e14-6c21-4987-a78a-c185170661ce	\N	172.70.246.45	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-25 00:27:27.002848
15029	ab242103-01ff-49a0-84e3-14fe0e6d857c	a1d9d3f9-7b67-4a85-8539-3752366e7f7d	\N	172.71.148.72	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-25 00:27:27.266693
15030	c0908b1d-a07c-4d4a-b519-edfd8e7713e9	bd376de9-7971-4b4c-a740-4ffcbaf60977	\N	162.158.42.234	Mozilla/5.0 (X11; Linux i686; rv:14.0) Gecko/20100101 Firefox/14.0.1 Iceweasel/14.0.1	\N	\N	https://gym.margareti.com/	Iceweasel	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-25 19:07:10.258681
15031	58e8e328-2b30-4896-9461-f8590903d7c8	f9a3aa1a-965e-4c8c-9092-9a1068476432	\N	172.69.86.27	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-28 07:30:55.269978
15032	61d60d1e-c081-4e6c-bf89-cf0cd145e323	cbfc0222-3417-4d0e-a37f-4ec8d0df5d69	\N	172.69.179.78	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-28 07:30:56.294227
15033	fa2bf252-4f67-432e-97b0-6befff7c97b0	be59a039-c49c-49d0-ae67-a0d3cd768c05	\N	172.70.46.85	Mozilla/5.0 (Linux; Android 9; SM-G965F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.90 Mobile Safari/537.36 EdgA/42.0.2.3819	\N	\N	https://gym.margareti.com/	Microsoft Edge	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-29 22:44:02.219601
15034	1ff27f55-8cba-4bf7-97dc-51acbb904599	96f4a46d-2184-4d4e-a05f-bdb5c091db29	\N	172.70.110.64	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	\N	\N	https://www.gym.margareti.com/	Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-30 09:10:38.108348
15035	b777617c-b51d-4eaa-b9fd-e4bf3a1d863f	45391d7d-5d37-4126-8a23-a5e2ae9b36c8	\N	172.71.182.75	Mozilla/5.0 (Linux; Android 8.0.0; SAMSUNG-SM-G930A) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36	\N	\N	https://www.gym.margareti.com/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-31 08:10:25.574792
15036	48d9b91c-79f6-42dc-a173-38d989b69c5d	b858939f-44ce-4252-8fbf-cf6f18e0305f	\N	172.70.178.232	Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Fedora	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-31 09:05:58.456472
15037	d5b54f1f-ce1d-4213-ba8c-a4766fc4e8d4	0c9d6d61-2c39-4dd7-8401-f31229d12e9c	\N	172.71.144.35	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:132.0) Gecko/20100101 Firefox/132.0	\N	\N	https://gym.margareti.com/	Firefox	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-31 10:36:52.646119
15038	8edf3012-dc2a-4696-8ed6-d89a985cbd41	e6ab6ef2-e66e-477f-b427-9e8481bc882b	\N	172.71.99.56	Mozilla/5.0 (Linux; Android 9; GM1917) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36	\N	\N	https://www.gym.margareti.com/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-01 03:25:43.245095
15039	d297fddf-78b4-49bd-a6eb-28efe84c0727	f350b379-92f0-45ca-bc04-f3081842fbd8	\N	172.71.94.130	Mozilla/5.0 (Linux; Android 8.1.0; LM-Q710.FG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.101 Mobile Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-01 20:44:45.534219
15040	bd85a55d-5937-424b-b4b8-19ecc95af181	bea7af72-946b-4ba3-bc3c-05aa77283d51	\N	172.68.15.166	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-02 04:00:14.482465
15041	e67c7cf1-b74d-4a56-b293-3cfc7437ec9f	ff793814-ca37-4138-93c7-2c3f5a5d22ac	\N	172.70.134.141	Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0; XBLWP7; ZuneWP7) UCBrowser/2.9.0.263	\N	\N	https://gym.margareti.com/	UC Browser	Windows Phone	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-02 08:54:44.29551
15042	053bafc9-6a18-4f9c-97c2-27eb9e8c62f0	22c33f50-a335-43b8-820e-eabecc889412	\N	141.101.68.70	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-02 10:39:22.967099
15043	95e75a6e-8a01-4e4d-8e7d-a160355604df	e2723ee2-6d7b-48cb-8adc-eca257cf4d89	\N	172.69.222.61	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-02 10:40:02.974204
15044	7327674d-f384-411f-88ae-ce0053a25f90	e0d515e2-2cfb-4cd8-bc9b-96cb398dcd79	\N	162.158.74.66	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-02 10:40:09.34832
15045	a53a231c-1a6a-4855-b7e9-9269273f0008	1a80995b-dcbf-4b16-a2d4-a33289115aee	\N	172.71.102.37	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-02 10:40:23.279979
15046	5ecff8d9-16d3-4612-8596-82ccf868d908	919c8a1c-ee27-40b3-8715-d3cba64ebee4	\N	172.70.46.71	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-02 10:40:25.377567
15047	a9ed92e2-624c-4906-afd1-afd7b864d223	572aa1b7-b535-47e7-afe9-8183d989efb2	\N	172.68.76.137	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-02 10:41:02.389935
15048	b516b705-e294-40ea-a6c5-d4200366f314	a30814ce-e99c-46b0-a634-860a460a6972	\N	172.70.235.131	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.5563.65 Safari/537.36	https://www.google.ie/	www.google.ie	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-02 10:42:15.658118
15049	b2647b5c-b75e-430c-be9c-eb813016cf99	560f2068-5bcd-4dfb-80a4-c453e2427076	\N	172.70.235.133	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/122.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Headless Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-02 10:42:16.397051
15050	2ab4a328-a980-4375-b8d0-1d07447d9bcc	d6c22099-1bb3-41f7-99e1-a039aca2ee67	\N	172.64.238.142	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-02 10:42:25.912386
15051	142734b8-e641-4ada-8cec-2d2c79eaab4a	e930166d-2979-45fc-9654-e7ecd9b8035d	\N	198.41.242.207	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0	\N	\N	https://gym.margareti.com/	Microsoft Edge	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-02 10:43:29.632155
15052	8ab707e2-d9c4-4eab-8336-5f83279a83dd	8f4073e5-8ed0-4bba-a27a-ceddfff5bc06	\N	172.70.114.161	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0	\N	\N	https://gym.margareti.com/	Microsoft Edge	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-02 10:43:30.219762
15053	24450421-1a8e-415c-9743-021b31f9e695	7e4eee2e-677e-4d53-8468-55e30667ffcd	\N	162.158.166.223	Mozilla/5.0 (iPhone; CPU iPhone OS 17_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4.1 Mobile/15E148 Safari/604.1	\N	\N	https://gym.margareti.com/	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-02 10:43:30.325557
15054	f9883ef3-c321-4015-839b-fb77905e412a	dfd1c9e0-0ac2-4664-93aa-8b3b18fad38d	\N	172.71.98.15	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-02 10:43:35.510118
15055	b63aff75-75e0-4d2d-84ef-2927bc39bb9e	9ed89d69-5e3f-46a4-aed1-921325f62d6e	\N	188.114.111.105	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0	\N	\N	https://gym.margareti.com/	Microsoft Edge	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-02 10:49:56.03544
15056	938bfcfd-f1fc-4a03-8ff9-04294c6de5b4	0c81b3fb-1b39-4520-aa5c-9226c6af61ca	\N	172.69.214.168	Mozilla/5.0 (iPhone; CPU iPhone OS 16_1_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.1 Mobile/15E148 Safari/604.1	\N	\N	https://gym.margareti.com/	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-02 11:05:54.222462
15057	f41e11f7-c52a-44c8-b0fa-c4596b9daaf0	ba2defbe-2ebe-4cf4-beae-cc265489dcd2	\N	172.69.214.182	Mozilla/5.0 (iPhone; CPU iPhone OS 16_1_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.1 Mobile/15E148 Safari/604.1	\N	\N	https://gym.margareti.com/	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-02 11:07:13.74047
15058	1b595327-5820-4d98-816c-d803489b9843	9478639b-c956-4130-9bc0-67ce91ab9435	\N	172.70.49.233	Mozilla/5.0 (iPhone; CPU iPhone OS 16_6_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) FxiOS/118.1 Mobile/15E148 Safari/605.1.15	\N	\N	https://gym.margareti.com/	Firefox Mobile iOS	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-02 11:32:06.946869
15059	a0d70166-222d-4075-be47-01506f631705	4c2394e9-b07b-4b2e-9b4c-df687e78ffd0	\N	172.70.49.217	Mozilla/5.0 (iPhone; CPU iPhone OS 16_6_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) FxiOS/118.1 Mobile/15E148 Safari/605.1.15	\N	\N	https://gym.margareti.com/	Firefox Mobile iOS	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-02 11:32:07.792438
15060	a5655cf7-a1df-4d3f-89a6-f823b64cfe52	e92a0c28-0710-4e30-adc4-df53cd1f9afd	\N	172.69.135.18	Mozilla/5.0 (Linux; Android 11; M2004J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Mobile Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-02 11:47:28.989489
15061	2f452c68-1b78-469a-a071-eb0bfd7c136b	e1a1ea37-419d-4c3f-b733-b8baa0f84c93	\N	172.68.174.78	Mozilla/5.0 (Linux; Android 12; Pixel 6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-02 12:23:26.678033
15062	796db869-c51e-4b12-b6a2-de69dbdd6a2b	433a312e-a08f-446b-984d-05e1a360f491	\N	172.69.222.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-02 15:20:45.315607
15063	89df813d-3960-4726-a46a-a80a029c65e1	6ed4fd5e-a430-47a9-817a-fbf1fe0432c1	\N	172.71.154.117	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.6422.78 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-02 20:11:39.679459
15064	4624db93-f0b4-4fad-aa86-f6c36299a179	9f9ddee8-3f2d-448e-83a0-44e57e01afbc	\N	162.158.90.49	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0	\N	\N	https://gym.margareti.com/	Microsoft Edge	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-02 20:13:36.34294
15065	de91897e-c5c0-4fb7-aa64-5b9dcd18d610	d91d9c22-91fe-4c24-824b-b5afb5ffcc45	\N	172.69.50.214	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-03 08:22:07.257494
15066	665f35dc-200a-4845-bab9-d96b6f05139d	2d3d5dea-7bec-4559-86a4-4f059132a83f	\N	172.69.58.66	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 OPT/3.2.13	\N	\N	https://www.gym.margareti.com/	Opera Touch	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-03 23:42:41.080329
15067	d2ef1fc4-2847-46f0-9957-cded88498b44	06910255-3092-4ebb-8797-6d5df6f82897	\N	172.71.151.67	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-07 01:31:21.677095
15068	3e9ee6dd-b3bb-466e-9ee4-5ed32bccc2cd	f305e6f9-c4a9-42e6-b6f7-7a54693281dd	\N	172.71.150.170	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3	\N	\N	https://www.gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-07 01:31:41.375454
15069	58b92a3d-1dc0-4ec4-8962-95a2ed01e89e	35e21199-4b7f-4cd4-b41e-328d7e681b46	\N	172.71.195.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-09 05:29:47.108293
15070	48d77ddd-1f82-485e-ada2-a8ed02585573	bb38b2bd-278b-41ef-be4d-822c5fb03449	\N	172.70.242.10	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-10 04:08:09.570159
15071	73332288-afb7-4002-bf07-9f24e9e52981	4d179bc1-4dc2-4306-aeed-31917c00a2fa	\N	172.71.164.99	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-10 04:08:09.845312
15072	5ca31619-016b-410a-a1ba-7105ef95ca82	bbed34c2-8620-459a-8054-9b60cbb6eb91	\N	162.158.63.68	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 08:17:36.615228
15073	2031a3bf-a38c-4355-a50f-bb4ed3cd5eb7	064defa3-a276-4f98-90f0-7c9aff63caa6	\N	172.68.55.33	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 08:17:37.388341
15074	1e3c135b-28a6-46eb-9db9-3d76b422b852	1fb5f7ce-e62b-48a5-8e5f-2160bf572d50	\N	172.70.80.57	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	\N	\N	https://www.gym.margareti.com/	Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 14:49:41.94965
15075	a549120f-d725-471d-8988-13928b9d40e5	9278a534-f6b3-49f0-9e56-bcbbb4c00fef	\N	172.71.158.76	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-12 02:10:13.016831
15076	7a0f71ba-7e78-4479-bb8f-57cc99260c00	2c0d34e4-50e6-499a-902a-41a9d134d6e7	\N	162.158.166.227	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-12 02:10:14.225425
15077	7d489e75-145c-48a5-a72d-90a07169d78b	db6cccd4-94e2-4157-a80f-056507e244c7	\N	172.71.182.129	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	\N	\N	https://www.gym.margareti.com/	Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-13 09:46:21.158741
15078	7ac004cd-fade-4ebd-81a6-ebe6a7e98b03	285e8417-768a-43b3-b2d0-4a7189d815a1	\N	172.70.114.162	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	\N	\N	https://www.gym.margareti.com/	Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-13 13:21:20.087073
15079	77d9b0b0-c685-4fdc-bec0-b3063b15e826	982cd20b-587b-4543-a2f9-7989cc5470cb	\N	162.158.110.56	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-14 00:47:49.416421
15080	a71cebd2-9807-428a-9c37-04a95757d86c	1e3be3c1-cb51-4334-9371-a38451f3bf86	\N	162.158.162.211	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-14 00:47:50.577499
15081	d93ac7d9-8267-4546-ab13-27d14b865be5	b1f69c81-17a5-45e2-a93e-75865ab8998e	\N	172.68.245.183	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-16 04:02:14.651096
15082	7fae3243-bf76-4ede-9633-e38125d0e4f0	dc146c0a-22bd-4e9a-88e0-e1a913061245	\N	172.70.131.73	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36	\N	\N	https://www.gym.margareti.com/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-16 15:57:37.042424
15083	092cbc07-f02d-4c75-861d-1b6c02b084da	1a558513-1bc4-449d-95b7-482d601d674c	\N	172.70.130.7	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-16 16:07:18.916562
15084	66e55c28-d6d2-4049-a515-06508b9b3d6e	00953bfc-d827-404a-b409-18fcdac4a73e	\N	172.70.85.207	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-19 00:34:47.030035
15085	8f5d2a94-05b0-4ecd-9a13-5de85be36cfa	70edfa77-dfd1-4fa7-bf1d-3334b4009613	\N	172.71.223.133	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-23 05:00:04.460988
15086	2baff37c-4150-4bce-a4ed-bab2c315668a	2b184c8d-eaea-4839-b340-d96241aa5510	\N	172.71.158.65	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-24 14:38:18.61874
15087	04482f32-0525-42bf-8c3d-08886ea50b96	78b271a2-416c-4e6b-abdd-68736935385a	\N	172.69.23.145	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3	\N	\N	https://www.gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-24 14:38:29.559651
15088	a31e340d-e5a3-4eea-b7c6-a36a89ac7517	0f0c19df-a095-4e67-90ea-74530d3c19fc	\N	172.69.135.103	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-25 04:33:44.399181
15089	84643004-8d0e-4f6e-aa70-5ebaf72830a7	1c34e12a-7668-4f0a-8812-fdc65358a4d9	\N	162.158.167.191	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-25 04:33:45.41035
15090	7f0f2005-d251-4053-857d-eecefe733836	0c9d6d61-2c39-4dd7-8401-f31229d12e9c	\N	172.71.144.39	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:133.0) Gecko/20100101 Firefox/133.0	\N	\N	https://gym.margareti.com/	Firefox	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-25 09:59:34.416214
15091	74bfa784-2e8d-4f08-b88d-4cfc2622426b	0c9d6d61-2c39-4dd7-8401-f31229d12e9c	\N	162.158.203.69	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:133.0) Gecko/20100101 Firefox/133.0	\N	\N	https://gym.margareti.com/workouts/1290	Firefox	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-25 16:51:56.95317
15092	a2932d55-15f8-40ce-87ad-95d2b1f2baba	421027e9-d365-4c22-9f99-b5a189b76820	\N	172.70.207.172	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-25 20:33:24.499747
15093	1595cdd5-a313-4f95-a65a-51a4e30197a6	fb35329a-7342-4865-8967-5d56f710e596	\N	172.70.211.125	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3	\N	\N	https://www.gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-25 20:33:46.492314
15094	d295e07c-b6f8-45bd-95b5-ede3b95c9474	c2cf4891-7465-4929-8f3e-641c5cf55858	\N	172.70.85.49	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	\N	\N	https://www.gym.margareti.com/	Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-27 01:25:03.298766
15095	79d00ef3-235d-4cf1-ba78-002ae58b51cc	0c9d6d61-2c39-4dd7-8401-f31229d12e9c	\N	172.70.46.224	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:134.0) Gecko/20100101 Firefox/134.0	\N	\N	https://gym.margareti.com/	Firefox	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-30 11:16:35.485352
15096	cb226e68-8364-4251-bfcd-689ea4175051	1da46990-4b2b-45ed-9ef6-f0a1effc424d	\N	172.70.160.168	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.2623.112 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-04 13:50:09.110435
15097	c072788d-638c-468f-b886-37307500bd6f	653e0b25-08a1-4915-a58a-7129dbd179a1	\N	172.70.91.8	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36 QIHU 360SE	\N	\N	https://gym.margareti.com/	360 Browser	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-04 13:50:11.026721
15098	8430d31c-c3b6-41ce-9361-c2e6953458a5	9f0a4519-300e-4c96-9010-e4d553cf1ea7	\N	172.71.26.55	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.2623.112 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-04 13:50:15.088082
15099	26892ca5-64c8-4fe3-9b57-7fbf6dedc0e3	47c24f4b-0b60-438f-ae0d-698aeaeb2657	\N	172.70.91.18	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36 QIHU 360SE	\N	\N	https://gym.margareti.com/	360 Browser	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-04 13:50:19.558558
15100	91a6255d-b92b-494d-b1a4-37607ab1d838	8c3ddf09-cb72-483c-8e81-c43f47216052	\N	172.70.160.168	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.2623.112 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-04 13:50:19.992496
15101	011d63f0-e4c0-4cc3-9028-9fd0eb0134d8	0d035466-441e-48b7-b93d-9a2d44a8a4df	\N	172.69.194.196	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.2623.112 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-04 13:50:22.135622
15102	11aea8fc-b825-4eb9-afbb-2aaedcaf7b5e	cb7ba346-90e8-4fe5-afae-91214cf39021	\N	172.70.91.8	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36 QIHU 360SE	\N	\N	https://gym.margareti.com/	360 Browser	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-04 13:50:24.367726
15103	2c3bc8c0-40fa-4d4b-b642-683a7d854c38	67c2f0e1-a5c5-452e-b550-e93255f8a7f3	\N	172.69.68.92	Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome Webview	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-05 14:57:55.2629
15104	c57e6925-88c0-49ae-9903-53d8478566d5	a7182823-bc87-497f-818f-4be492b79522	\N	172.71.98.142	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/68.0.3440.75 Chrome/68.0.3440.75 Safari/537.36	\N	\N	https://gym.margareti.com/	Chromium	Ubuntu	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-06 06:32:39.275233
15105	731db05a-b3a6-41fe-b2e9-1b76fe5fc9e6	77b0ccca-c79f-4fa3-b645-a015d28a6e10	\N	172.71.94.65	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	\N	\N	https://www.gym.margareti.com/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-06 06:32:42.519759
15106	b6dc2a97-189c-484f-8b11-2b9b2efa71e7	6a03e50d-f30b-43a2-9e25-21b97bf8ada5	\N	172.71.164.200	Mozilla/5.0 (X11; FreeBSD amd64; rv:5.0) Gecko/20100101 Firefox/5.0	\N	\N	https://gym.margareti.com/	Firefox	FreeBSD	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-07 04:17:10.372969
15107	c51afc93-1449-4a9d-9e55-62a4b71845d4	06b8dbbd-0a7a-48e5-8788-62360b22353b	\N	172.71.172.63	Mozilla/5.0 (iPad; CPU OS 12_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/76.0.3809.81 Mobile/15E148 Safari/605.1	\N	\N	https://www.gym.margareti.com/	Chrome Mobile iOS	iOS	Tablet	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-07 06:44:34.459627
15108	cb693bc8-12f2-4c7f-bd2a-04f928e02ec5	c7d3cc54-9a0a-4f3d-9e15-bce8e6921921	\N	172.70.46.229	Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome Webview	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-08 23:37:09.241403
15109	a3bb3838-fa4c-4298-a6e6-3568e81f2e81	597d75b6-dcca-42a6-9622-1efabb99506b	\N	172.70.47.17	Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36	\N	\N	https://www.gym.margareti.com/	Chrome Webview	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-08 23:37:09.380978
15110	73ad33c7-96da-4a45-8315-1b8848e1d13c	00b4d4b7-20db-4ec7-ac98-fb00addb0b81	\N	162.158.155.68	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-09 10:39:38.36492
15111	5c0ba33c-c77a-4d5c-88a4-99ff543105ac	40da2d21-319c-4a25-a603-04d5931aa5ef	\N	162.158.154.114	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-09 10:39:39.215932
15112	db680f52-b88a-4168-9192-dc15e1af88f9	c82f00c6-f6ee-4fcd-b0c9-d881e8946a59	1	172.69.225.229	Mozilla/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Mobile/15E148 Safari/604.1	\N	\N	https://gym.margareti.com/	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-13 07:27:32.617354
15113	6b414a24-082d-4c0d-b77d-57092ef2e600	c82f00c6-f6ee-4fcd-b0c9-d881e8946a59	\N	172.71.90.48	Mozilla/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Mobile/15E148 Safari/604.1	\N	\N	https://gym.margareti.com/workouts/1593	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-13 17:05:33.954505
15114	6d2872b1-470f-463f-9f30-2705dcb4acd0	4a2b0a7c-c10a-4bef-aa82-464347ebe9a4	\N	108.162.216.150	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-14 02:37:26.433059
15115	87504109-4f5c-4b22-b2b9-5cb33d07b468	c82f00c6-f6ee-4fcd-b0c9-d881e8946a59	\N	172.70.216.155	Mozilla/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Mobile/15E148 Safari/604.1	https://gym.margareti.com/workouts/1593	gym.margareti.com	https://gym.margareti.com/workouts/1593/actions	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-14 07:26:33.699571
15116	46f84da4-3ca9-4a18-9538-d408fc4ac080	c82f00c6-f6ee-4fcd-b0c9-d881e8946a59	\N	172.70.216.154	Mozilla/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Mobile/15E148 Safari/604.1	https://gym.margareti.com/workouts/1593	gym.margareti.com	https://gym.margareti.com/workouts/1593/blocks/new	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-14 07:26:33.680847
15117	0a14ae25-a66f-497f-87f9-bbf95e3dfb62	d01305d1-0551-4cfc-b58f-fc25b4797eb2	\N	172.71.255.107	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36	\N	\N	https://www.gym.margareti.com/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-14 22:41:19.6843
15118	8dcf27c2-ff0f-40e7-a256-a8adfc34d169	9be2031c-7ef6-485b-bf2f-1b0b7e0c6024	\N	172.71.99.226	Mozilla/5.0 (Linux; U; Android 2.2; en-us; Sprint APA9292KT Build/FRF91) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1	\N	\N	https://gym.margareti.com/	Android Browser	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-23 02:02:50.415212
15119	1df9bc73-db52-4946-b9b7-67ff50a93024	9593b885-3380-496f-a8ca-6f8ea136ed0c	\N	172.71.98.147	Mozilla/5.0 (Linux; Android 7.0; SM-G955U) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Mobile Safari/537.36	\N	\N	https://www.gym.margareti.com/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-23 02:02:52.99578
15120	6c33cf5d-3aea-43e5-95d0-591cc0b817a6	ad76b5cc-fd04-4fac-83ed-f5ec8d889966	\N	172.71.98.142	Mozilla/5.0 (X11; U; Linux x86_64; en-us) AppleWebKit/534.35 (KHTML, like Gecko) Chrome/11.0.696.65 Safari/534.35 Puffin/2.9174AT	\N	\N	https://gym.margareti.com/	Puffin	GNU/Linux	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-25 22:03:25.85326
15121	c90fece5-c80a-4029-aedf-740b8d36c53e	5b5381a7-512f-4f3d-b3ae-bcf336575396	\N	172.71.183.121	Mozilla/5.0 (Linux; Android 8.0.0; SM-G950U1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36	\N	\N	https://www.gym.margareti.com/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-25 22:03:28.994619
15122	b55e5512-8ed4-44d6-82a2-45dadea83de6	482fdcdf-a256-4e27-8536-129d07add6d3	\N	172.70.175.224	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-28 04:11:53.768906
15123	38a677c3-24ad-41cc-8bf9-9a31eaaeabae	58b0d17b-4986-4b4f-9b73-9d3f2e3dd2a7	\N	172.71.172.155	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-28 09:48:32.830495
15124	4eb89837-7c87-41e1-9b6b-734eafe81bad	ade914f5-2467-460f-93e6-1ef158a2b363	\N	172.68.213.28	Mozilla/5.0 (iPhone; CPU iPhone OS 17_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4.1 Mobile/15E148 Safari/604.1	\N	\N	https://gym.margareti.com/	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-28 09:50:02.686618
15125	08b2047f-cd08-4a5e-a674-b7b958c3cf17	157bbe8d-20ae-4718-89f9-6cd34e8b3756	\N	188.114.102.148	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0	\N	\N	https://gym.margareti.com/	Microsoft Edge	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-28 09:50:02.69496
15126	6ba8295a-e891-4751-931f-11d1f66b0bc3	683a9a4b-cdd2-4e9c-acd0-36cb972c3f63	\N	172.71.154.117	Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1	\N	\N	https://gym.margareti.com/	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-28 09:50:03.311664
15127	c192f0e8-c2a0-4385-b435-c08bc67b505b	9c3846f1-cc1a-4105-829a-012f0a3dd7a8	\N	172.71.102.233	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-28 09:50:15.105852
15128	ffd74938-edbb-4eaa-b7eb-8af0afffd78e	157b2c61-67cb-44d1-98f7-af32a7362f20	\N	172.71.30.11	Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1	\N	\N	https://gym.margareti.com/	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-28 09:52:21.526644
15129	6a115255-763b-466b-abeb-e172b12e966a	ce8cf0dd-8a91-4da1-b056-88334f9347df	\N	172.70.176.64	Mozilla/5.0 (iPhone; CPU iPhone OS 17_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4.1 Mobile/15E148 Safari/604.1	http://gym.margareti.com/	gym.margareti.com	https://gym.margareti.com/	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-28 09:52:36.882577
15130	7fe80fdf-d67d-459e-beb7-c8c8e3bffa82	198e2122-8264-401f-be24-0160f7ea4592	\N	172.70.216.59	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0	http://gym.margareti.com/	gym.margareti.com	https://gym.margareti.com/	Microsoft Edge	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-28 09:52:45.360196
15131	0388dbcc-a1a7-4b93-a361-e485fed2a975	e9228d65-82b5-4698-8c7e-00d48e463502	\N	172.71.95.71	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-28 09:53:01.04941
15132	41b06a0e-e9c5-4471-a3b6-c1911f78c0b7	21cccaff-8033-4489-ac54-1366a8956a22	\N	162.158.167.99	Mozilla/5.0 (iPhone; CPU iPhone OS 17_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/123.0.6312.52 Mobile/15E148 Safari/604.1	\N	\N	https://gym.margareti.com/	Chrome Mobile iOS	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-28 10:00:32.705152
15133	0c0f808f-d15a-451a-9b7c-4c8868b08845	b6be6c4e-2e1b-4fe1-a651-c0c415155bc6	\N	172.69.22.83	Mozilla/5.0 (iPhone; CPU iPhone OS 17_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/123.0.6312.52 Mobile/15E148 Safari/604.1	\N	\N	https://gym.margareti.com/	Chrome Mobile iOS	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-28 10:03:34.559958
15134	3f455fa9-dffb-44c2-99ed-262947503fc2	5bc96408-a452-4040-86d3-0e71f45ee8bf	\N	172.70.42.157	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-28 11:24:57.163032
15135	70f8ec14-2874-420a-8d69-c835bf24c36f	39eea9e2-347c-4f4c-bcf3-ece71693278f	\N	162.158.14.124	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-28 11:53:08.585182
15136	b2879810-5277-475a-baa6-cd042d66e8ec	3138b053-0d2d-4bc6-9eb6-a423f121e816	\N	162.158.167.118	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.6422.143 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-28 18:59:57.668515
15137	98ab5697-0e83-4122-8376-4f6840c72f1a	80c9b681-cbb0-4da1-b038-c9416026f790	\N	172.71.154.32	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.6422.114 Safari/537.36	https://gym.margareti.com/	gym.margareti.com	https://gym.margareti.com/workouts/1011	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-28 19:00:35.430373
15138	6ccfea7f-563c-45fb-8d40-1006420e59c4	ed3c7090-8ad3-4918-8b3d-83ab647fb7a5	\N	172.71.154.33	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.6422.114 Safari/537.36	https://gym.margareti.com/	gym.margareti.com	https://gym.margareti.com/workouts/1290	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-28 19:00:35.448218
15139	5a0e6116-1d1b-4c86-9745-f6e302eafc35	f89e4d99-0a47-4768-9476-4245881902bb	\N	172.71.154.32	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.6422.114 Safari/537.36	https://gym.margareti.com/	gym.margareti.com	https://gym.margareti.com/workouts/1593	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-28 19:00:35.436915
15140	ac6a42be-3a40-43da-8a2b-eb42b32c7549	1a2e742f-4793-49a5-b184-2e69fb682ba9	\N	172.70.175.25	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-04 04:49:24.046222
15141	cbdc311d-caab-40fb-a389-a7c16c00f169	c82f00c6-f6ee-4fcd-b0c9-d881e8946a59	\N	172.71.148.94	Mozilla/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Mobile/15E148 Safari/604.1	\N	\N	https://gym.margareti.com/	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-05 08:31:44.09793
15142	eafb53e7-74e6-4634-84d7-fc430830c33e	ecd6d74b-be2c-4675-817c-dfe12cdd0408	\N	172.70.43.49	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-11 04:01:54.846286
15143	8b11692d-01af-4add-bded-d59f02f90e52	c0baa97a-7e75-4c92-8a60-64921c88bacb	\N	172.68.245.161	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-18 04:01:07.710099
15144	10bd993b-6d71-4e85-a120-69c387afe304	9aad4c67-9778-494a-918a-11e2d84e7f34	\N	172.70.90.75	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.2623.112 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-20 07:44:57.558895
15145	b608eaed-83a3-42c2-950b-2ec0a46e307a	fe4958e2-d15d-4b4d-9ddc-8132095b9033	\N	141.101.98.53	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36 QIHU 360SE	\N	\N	https://gym.margareti.com/	360 Browser	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-20 07:44:59.215999
15146	371f1641-67cb-40fd-b81a-8ca23f26a241	ac16ed8b-42ab-4e3b-b0a6-a1cc3ffe50cd	\N	141.101.98.75	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.2623.112 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-20 07:45:22.57936
15147	557381e0-3977-4f62-8838-093b834e67a8	04e37f4d-4fed-43e7-a616-e66cce2addd3	\N	172.70.91.177	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36 QIHU 360SE	\N	\N	https://gym.margareti.com/	360 Browser	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-20 07:45:23.709562
15148	3952783d-acf0-42ae-8748-150298bf52eb	7f387b15-86d2-4bf9-9992-57f3e2cab465	\N	172.68.186.172	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.2623.112 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-20 07:45:24.63912
15149	6f34db7b-4b2f-449e-8436-869f7e0ac957	44d7bf11-7138-4577-8f2f-668e069176af	\N	172.69.194.196	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36 QIHU 360SE	\N	\N	https://gym.margareti.com/	360 Browser	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-20 07:45:26.066971
15150	7c77081c-b4a2-41a1-8b38-d7f2e4a4a3c2	4044244a-ba69-416a-81fa-c43c23d13fe3	\N	172.70.162.10	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.2623.112 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-20 07:45:38.542632
15151	71a78200-861a-4508-ace0-f387ac57bc4c	9d66065c-21b3-4036-aa5d-f6b44d4b5f83	\N	172.70.162.197	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36 QIHU 360SE	\N	\N	https://gym.margareti.com/	360 Browser	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-20 07:45:39.755945
15152	8b717825-9bc8-4f2c-9ebd-186f2d3069f6	53088b72-c848-40b2-9830-24338e9e9678	\N	172.71.161.143	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0	\N	\N	https://gym.margareti.com/	Firefox	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-20 09:22:26.281541
15153	7d2fd916-dbfc-466c-8036-62e83c31fcd4	10c9e826-6569-47af-b832-66c31cfcc9fa	\N	108.162.220.67	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-02-01 07:23:52.038547
15154	5426f567-7526-46ae-8fec-40b500b65f5b	61dabc54-c39a-440b-93ec-5aa84b76e450	1	162.158.210.63	Mozilla/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Mobile/15E148 Safari/604.1	\N	\N	https://gym.margareti.com/	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-02-02 18:42:00.597801
15155	151845a1-fc6a-484a-98b0-0be074055bd5	80753597-3952-4a28-bb31-b2fbc3bc0674	\N	172.71.183.166	Mozilla/5.0 (Windows; U; Windows NT 5.1; tr; rv:1.9.2.8) Gecko/20100722 Firefox/3.6.8 ( .NET CLR 3.5.30729; .NET4.0E)	\N	\N	https://www.gym.margareti.com/	Firefox	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-02-05 09:12:40.468478
15156	22ea7909-b97b-4885-9cb5-354aec67db10	1c9f2695-32f8-43b8-af1e-dfc17199ebd4	\N	172.71.183.36	iTunes/4.2 (Macintosh; U; PPC Mac OS X 10.2)	\N	\N	https://gym.margareti.com/	iTunes	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-02-05 09:12:43.029519
15157	fd103434-c17c-4513-b47e-2bd1cd03c816	d30a0930-e068-4042-b9af-237d09477501	\N	172.71.172.164	Mozilla/5.0 (Windows NT 10.0; Win64; x64)	\N	\N	https://gym.margareti.com/	\N	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-02-06 20:10:20.680464
15158	106a06ee-5e50-463c-8397-1491b8badfc8	d2847ac2-d031-4c9a-9e1f-35eeceaa20d7	\N	162.158.217.13	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15	\N	\N	https://gym.margareti.com/	Safari	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-02-09 07:25:29.561181
15159	5277204e-46dc-4110-84e2-347c2848d5f3	bd77158f-5958-4e39-8366-eaa7a5759869	\N	172.71.94.164	Mozilla/5.0 (OS/2; Warp 4.5; rv:38.0) Gecko/20100101 Firefox/38.0	\N	\N	https://gym.margareti.com/	Firefox	OS/2	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-02-10 15:26:21.210378
15160	cb99dc9e-01ca-4fc4-9768-2c2dce2c3e83	128d1d1f-e27c-4777-90f3-f92940312f67	\N	172.71.103.181	Mozilla/5.0 (Linux; Android 9; EML-L09) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36	\N	\N	https://www.gym.margareti.com/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-02-10 15:26:24.044742
15161	84b3882d-c486-4a39-9377-496ce5182b35	b71aa116-dab9-4e48-be34-4294820d88c3	\N	141.101.104.91	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	\N	\N	https://www.gym.margareti.com/	Chrome	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-02-13 03:26:40.098148
15162	4e75fe0c-4a5e-49cd-b3f1-d79daeed05ae	ea888696-3386-4a45-a4e2-68b7e264eee3	\N	141.101.105.100	Mozilla/5.0 (Linux; Android 8.0.0; SM-G935V) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-02-14 09:32:27.749043
15163	d33cede1-1d86-47b6-ab31-07d855e28442	4f398de8-489b-44d8-8bfd-b473226779b1	\N	172.68.15.202	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-02-17 04:13:16.700126
15164	1819ef21-da0c-4972-9d16-cf8da2ea97c7	3efb8c08-aae0-4380-a87e-e4c450133a5d	\N	172.71.254.20	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.67 Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-02-17 08:12:03.099767
15165	3629754c-8119-4db0-85c8-f239a71e667e	1ca855f7-aac4-4f4f-844f-b296c8fc1db9	\N	172.71.99.171	Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0 )	\N	\N	https://www.gym.margareti.com/	Internet Explorer	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-02-18 10:13:45.289961
15166	e2c31a0a-c67e-4fcf-b13a-eb63f01da714	37bc0d66-9c89-4214-9d09-cbd616fc8e5b	\N	172.71.98.209	Mozilla/5.0 (X11; Linux x86_64; rv:2.0.1) Gecko/20100101 Firefox/4.0.1	\N	\N	https://gym.margareti.com/	Firefox	GNU/Linux	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-02-21 10:00:15.973857
15167	f2ac5c09-b06e-4e89-bfcc-3a3b1a7db8e5	92cbd93d-58db-4d72-9c66-0614de3baec2	\N	162.158.88.150	Mozilla/5.0 (Linux; Android 8.0.0; SM-G930F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Mobile Safari/537.36	\N	\N	https://gym.margareti.com/	Chrome Mobile	Android	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-02-22 03:11:25.913551
15168	636e5e9c-d194-46dd-8f2d-32a8d827fa10	0c9d6d61-2c39-4dd7-8401-f31229d12e9c	\N	172.69.225.250	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:138.0) Gecko/20100101 Firefox/138.0	\N	\N	https://gym.margareti.com/	Firefox	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-04-05 07:35:44.412397
15169	7ce71d34-5ed6-4063-a704-bc7416216bb1	61dabc54-c39a-440b-93ec-5aa84b76e450	1	172.69.9.51	Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.3.1 Mobile/15E148 Safari/604.1	\N	\N	https://gym.margareti.com/	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-04-05 08:11:11.230773
15170	73a52158-acb2-49cc-ad2d-f3acab4bc35f	0a7e75c4-a526-4a72-b8cb-1b3319fd41b8	\N	104.23.166.58	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:122.0) Gecko/20100101 Firefox/122.0	\N	\N	https://gym.margareti.com/	Firefox	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-04-05 17:15:35.108529
15171	8217d631-610a-44e1-82e9-6caf3caaa116	61dabc54-c39a-440b-93ec-5aa84b76e450	1	172.69.9.94	Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.3.1 Mobile/15E148 Safari/604.1	\N	\N	https://gym.margareti.com/workouts/1593	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-04-05 20:36:07.055038
15172	66bc2227-84cf-4d8f-8d3b-e8e9a4a49bb6	61dabc54-c39a-440b-93ec-5aa84b76e450	\N	162.158.111.56	Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.3.1 Mobile/15E148 Safari/604.1	https://gym.margareti.com/workouts/1593	gym.margareti.com	https://gym.margareti.com/workouts/1593/actions	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-04-07 05:28:53.974536
15173	babcb675-9c7d-4604-be16-3f1cd17f15e4	61dabc54-c39a-440b-93ec-5aa84b76e450	\N	162.158.111.55	Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.3.1 Mobile/15E148 Safari/604.1	https://gym.margareti.com/workouts/1593	gym.margareti.com	https://gym.margareti.com/workouts/1593/blocks/new	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-04-07 05:28:53.960958
15174	ee913f03-ef29-41dc-b267-b5be87c82b63	8643fa96-f74a-40cb-971a-f148a0ae42bd	\N	162.158.170.170	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.43	http://www.gym.margareti.com	www.gym.margareti.com	https://www.gym.margareti.com/	Microsoft Edge	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-04-09 20:49:12.091221
15175	35854636-7547-400c-949c-900569818f94	944dec6c-cc70-4397-97c7-38feec7ede98	\N	104.23.168.20	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:122.0) Gecko/20100101 Firefox/122.0	\N	\N	https://www.gym.margareti.com/	Firefox	Mac	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-04-10 02:26:24.474561
15176	2113e961-048b-4e54-b9eb-74d9094628ba	4c877e7b-0227-4b69-8e27-3a7178fd94e7	\N	162.158.88.157	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.43	http://gym.margareti.com	gym.margareti.com	https://gym.margareti.com/	Microsoft Edge	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-04-11 02:37:04.579063
15177	025b0ce6-678d-4eea-b06b-e9e0bb708580	61dabc54-c39a-440b-93ec-5aa84b76e450	\N	172.69.109.124	Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.3.1 Mobile/15E148 Safari/604.1	\N	\N	https://gym.margareti.com/	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-04-11 05:22:35.909139
15178	147d9d11-3482-40de-ae66-c894cf2d0c9d	ddd9c4eb-0529-4b65-bfa1-744f98b76740	\N	162.158.88.141	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.43	http://www.gym.margareti.com	www.gym.margareti.com	https://www.gym.margareti.com/	Microsoft Edge	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-04-11 21:55:55.404307
15179	7aa51387-aeed-47a0-9bf3-2b527678674a	61dabc54-c39a-440b-93ec-5aa84b76e450	\N	172.70.240.86	Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.3.1 Mobile/15E148 Safari/604.1	\N	\N	https://gym.margareti.com/	Mobile Safari	iOS	Mobile	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-04-12 11:04:23.994409
15180	84921f7f-4e68-44da-b057-c7f5a97bad92	9cea54a1-d7f9-4f15-8e32-19d455586858	\N	172.68.164.97	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.43	http://www.gym.margareti.com/posts	www.gym.margareti.com	https://www.gym.margareti.com/posts	Microsoft Edge	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-04-12 13:27:34.44484
15181	fd1af41f-d0e3-4ce3-9356-125f00647c6e	228da79e-59a0-46b3-9dd7-fc89c63fbbed	\N	108.162.226.24	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.43	http://www.gym.margareti.com/about	www.gym.margareti.com	https://www.gym.margareti.com/about	Microsoft Edge	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-04-12 13:38:59.833596
15182	529568c9-3f7f-4f45-a009-c09d47aaaf26	fae47ade-e8c5-4eb7-81e0-44e6e47ee37d	\N	104.23.175.91	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.43	http://www.gym.margareti.com/users/sign_in	www.gym.margareti.com	https://www.gym.margareti.com/users/sign_in	Microsoft Edge	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-04-12 14:00:58.344413
15183	45197acd-2a7f-4e39-b44f-9b4387ef528e	045b67d4-3f23-4e0a-971a-3c98b8718cc6	\N	162.158.106.106	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.43	http://www.gym.margareti.com/contacts/new	www.gym.margareti.com	https://www.gym.margareti.com/contacts/new	Microsoft Edge	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-04-12 14:13:36.184272
15184	b98fce15-72c6-4eb7-9913-4abcba610ac5	b2b04dad-e881-433a-bd96-0f122ca51603	\N	172.68.164.86	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.43	http://www.gym.margareti.com/exercises	www.gym.margareti.com	https://www.gym.margareti.com/exercises	Microsoft Edge	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-04-12 14:23:09.720587
15185	e7a6d444-cb45-4bae-8c71-b7c5f12d410f	2d862c24-e15f-4fe3-b29c-ff29112f0d64	\N	162.158.190.17	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.43	http://www.gym.margareti.com/my_workouts	www.gym.margareti.com	https://www.gym.margareti.com/my_workouts	Microsoft Edge	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-04-12 14:23:25.536139
15186	1e11f122-73da-4363-9292-1f38dd40ba88	562a252c-ba3c-470f-803f-10f8f1dab3a2	\N	172.71.124.239	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.43	http://www.gym.margareti.com/workouts/5	www.gym.margareti.com	https://www.gym.margareti.com/workouts/5	Microsoft Edge	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-04-12 14:29:53.602994
15187	5406e1da-ae28-4138-9797-3971c83eb3a0	5bd93d6c-e239-4745-8b92-f91c65ec4e89	\N	172.70.143.208	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.43	http://www.gym.margareti.com/workouts/new	www.gym.margareti.com	https://www.gym.margareti.com/workouts/new	Microsoft Edge	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-04-12 14:33:29.031902
15188	caa48655-5f27-4425-921b-05ff5a3dff2e	64df8da7-6a3a-48e5-afdd-7fff64de189e	\N	172.70.142.20	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.43	http://www.gym.margareti.com/workouts/7	www.gym.margareti.com	https://www.gym.margareti.com/workouts/7	Microsoft Edge	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-04-12 14:35:24.384788
15189	3ab04fb4-cf37-426b-8228-312f22d63dc6	3da54449-4b29-49ac-b261-804526485ce0	\N	162.158.108.82	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.43	http://www.gym.margareti.com/workouts/4	www.gym.margareti.com	https://www.gym.margareti.com/workouts/4	Microsoft Edge	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-04-12 14:39:17.166153
15190	9a696d27-2d87-426c-b12c-f6ecc64748db	d714bd47-55ad-4a6c-9b14-8abb2a1a0681	\N	162.158.170.96	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.43	http://www.gym.margareti.com/home_modal	www.gym.margareti.com	https://www.gym.margareti.com/home_modal	Microsoft Edge	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-04-12 14:40:47.662769
15191	7e56ec22-26bd-41dd-bc50-b56390269e10	76a4099f-7046-4eda-9705-39959bd5e3ed	\N	162.158.108.82	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.43	http://www.gym.margareti.com/public_workouts	www.gym.margareti.com	https://www.gym.margareti.com/public_workouts	Microsoft Edge	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-04-12 14:42:31.380799
15192	573f9f2d-c578-4650-9ea9-d516d97f23c5	3e5c5f5c-025f-4062-b6bb-7f18d9640fb6	\N	162.158.88.43	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.43	http://www.gym.margareti.com	www.gym.margareti.com	https://www.gym.margareti.com/	Microsoft Edge	Windows	Desktop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-04-12 14:44:23.62382
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: st_gym_user
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2022-08-13 15:07:09.696129	2022-08-13 15:07:09.696129
\.


--
-- Data for Name: blocks; Type: TABLE DATA; Schema: public; Owner: st_gym_user
--

COPY public.blocks (id, workout_id, created_at, updated_at, "position", repetitions, "time", title, tabata) FROM stdin;
7	3	2022-08-13 15:07:33.689477	2022-08-13 15:07:33.689477	1	1	600	\N	f
8	3	2022-08-13 15:07:33.74342	2022-08-13 15:07:33.74342	2	1	600	\N	f
9	3	2022-08-13 15:07:33.750421	2022-08-13 15:07:33.750421	3	1	600	\N	f
16	6	2022-08-13 15:07:33.893181	2022-08-13 15:07:33.893181	1	1	600	\N	f
17	6	2022-08-13 15:07:33.902212	2022-08-13 15:07:33.902212	2	1	600	\N	f
18	6	2022-08-13 15:07:33.908499	2022-08-13 15:07:33.908499	3	1	600	\N	f
22	8	2022-08-13 15:07:34.016451	2022-08-13 15:07:34.016451	1	1	600	\N	f
23	8	2022-08-13 15:07:34.030161	2022-08-13 15:07:34.030161	2	1	600	\N	f
24	8	2022-08-13 15:07:34.038886	2022-08-13 15:07:34.038886	3	1	600	\N	f
27	9	2022-08-13 15:07:34.109253	2022-08-13 15:07:34.109253	3	1	600	\N	f
126	4	2022-08-31 07:53:29.206968	2022-08-31 07:53:42.419344	4	3	600	Front	f
48	19	2022-08-21 15:00:55.738959	2022-08-22 01:56:37.217043	3	3	600	Back & Belly	f
5	2	2022-08-13 15:07:33.521822	2022-08-13 15:26:10.250838	2	1	600	\N	f
6	2	2022-08-13 15:07:33.534762	2022-08-13 15:26:10.252452	3	1	600	\N	f
19	7	2022-08-13 15:07:33.951204	2022-08-30 10:46:17.802825	2	3	600	Belly Tabata	f
30	11	2022-08-13 20:59:56.479987	2022-08-13 20:59:56.479987	1	1	600	\N	f
31	11	2022-08-13 21:01:25.606723	2022-08-13 21:01:25.606723	2	1	600	\N	f
45	18	2022-08-20 16:24:51.576471	2022-08-23 16:33:15.690066	5	3	600	Block 4	f
54	32	2022-08-23 16:40:51.000921	2022-08-23 16:40:57.478844	1	1	600	Warmup	f
63	36	2022-08-24 01:29:55.065745	2022-08-24 01:30:05.300914	1	1	600	Warm up	f
99	71	2022-08-29 16:14:32.07601	2022-08-29 16:14:32.07601	2	4	600	Belly fat	f
46	19	2022-08-21 14:52:56.032567	2022-08-22 12:07:34.796014	1	1	600	Warm up	f
34	12	2022-08-15 20:40:46.528894	2022-08-15 20:40:46.528894	1	1	600	\N	f
35	12	2022-08-15 20:41:03.464454	2022-08-15 20:41:03.464454	2	1	600	\N	f
36	12	2022-08-15 20:41:48.20106	2022-08-15 20:41:48.20106	3	1	600	\N	f
37	12	2022-08-15 20:46:47.006146	2022-08-15 20:46:47.006146	4	1	600	\N	f
88	69	2022-08-29 16:14:05.720936	2022-08-29 16:14:05.720936	1	1	600	Warm up	f
57	32	2022-08-23 16:59:50.186479	2022-09-27 05:36:23.743013	5	3	600	Leg madness II	f
38	12	2022-08-15 20:53:48.377868	2022-08-15 20:55:59.810786	5	1	600	\N	f
2	1	2022-08-13 15:07:33.462871	2022-08-29 12:21:17.872506	1	1	600	Warmup	f
1	1	2022-08-13 15:07:33.283122	2022-08-22 20:58:53.294253	3	1	600	Back	f
3	1	2022-08-13 15:07:33.472636	2022-08-29 12:21:21.995294	2	3	600	Shoulders	t
64	36	2022-08-24 01:31:46.448656	2022-08-24 01:36:47.9579	2	4	600	Belly fat	f
28	10	2022-08-13 20:45:59.30482	2022-08-22 23:19:14.473456	1	5	600	Pull & Push 🔥 	f
4	2	2022-08-13 15:07:33.504704	2022-08-23 13:53:19.801111	1	1	600	Warmup	f
65	36	2022-08-24 01:34:34.367316	2022-08-24 01:42:56.76595	3	4	600	Tabata	f
55	32	2022-08-23 16:46:22.967784	2022-08-23 17:25:49.84266	2	2	600	Leg madness	f
56	32	2022-08-23 16:47:20.282376	2022-08-23 17:33:13.403217	3	3	600	Back & Shoulders	f
59	32	2022-08-23 17:44:53.711174	2022-08-23 17:45:03.533627	6	1	600	Cash out	f
49	19	2022-08-21 15:12:44.412587	2022-08-23 16:30:59.592825	4	3	600	Legs & Belly	f
50	19	2022-08-21 15:14:16.76134	2022-08-23 16:31:18.325835	5	3	600	Arms, Legs & Belly	f
41	18	2022-08-20 15:54:25.348954	2022-08-23 16:32:08.077115	1	1	600	Warm up	f
67	10	2022-08-24 01:43:48.513305	2022-08-24 01:45:14.923515	3	3	600	Leg 🔥 	f
47	19	2022-08-21 14:58:33.791288	2022-08-22 01:56:05.289721	2	3	600	Legs & Belly	f
42	18	2022-08-20 16:08:38.458262	2022-08-23 16:32:20.670242	2	3	600	Block 1	f
95	70	2022-08-29 16:14:20.938067	2022-08-29 16:14:21.040004	8	1	600	Cash out	f
29	10	2022-08-13 20:56:10.609728	2022-08-24 15:01:51.910136	2	3	600	Pow!	f
66	36	2022-08-24 01:34:45.991668	2022-08-24 01:46:08.538822	4	4	600	Block 4	f
68	10	2022-08-24 01:45:37.324848	2022-08-24 01:46:28.730153	4	1	600	Back	f
69	36	2022-08-24 01:46:18.591061	2022-08-24 01:47:54.936141	5	3	600	Block 5	f
76	10	2022-08-24 15:02:20.371495	2022-08-24 15:02:37.896441	5	1	600	Inou's WOD 24-08	f
70	36	2022-08-24 01:48:32.797977	2022-08-24 01:49:29.99602	6	1	600	Cash out - max it!	f
89	69	2022-08-29 16:14:05.774382	2022-08-29 16:14:05.920746	5	3	600	Legs & Belly	f
87	69	2022-08-29 16:14:05.657009	2022-08-29 16:14:05.920746	7	3	600	Back & Belly	f
90	69	2022-08-29 16:14:05.844531	2022-08-29 16:14:05.920746	6	3	600	Arms, Legs & Belly	f
43	18	2022-08-20 16:13:24.607338	2022-08-26 01:48:58.697513	4	3	600	Block 2	f
44	18	2022-08-20 16:20:47.084313	2022-08-26 01:48:58.703842	3	3	600	Block 3	f
83	68	2022-08-29 16:13:54.361849	2022-08-29 16:13:54.361849	1	1	600	Warm up	f
91	69	2022-08-29 16:14:05.914094	2022-08-29 16:14:05.914094	2	3	600	Legs & Belly	f
84	68	2022-08-29 16:13:54.438674	2022-08-29 16:13:54.438674	2	3	600	Block 1	f
92	70	2022-08-29 16:14:20.773054	2022-08-29 16:14:20.773054	1	1	600	Warmup	f
82	68	2022-08-29 16:13:54.211276	2022-08-29 16:13:54.615101	9	3	600	Block 4	f
85	68	2022-08-29 16:13:54.519113	2022-08-29 16:13:54.615101	5	3	600	Block 2	f
86	68	2022-08-29 16:13:54.608327	2022-08-29 16:13:54.608327	3	3	600	Block 3	f
93	70	2022-08-29 16:14:20.816565	2022-08-29 16:14:20.816565	2	2	600	Leg madness	f
94	70	2022-08-29 16:14:20.870257	2022-08-29 16:14:20.870257	3	3	600	Back & Shoulders	f
96	70	2022-08-29 16:14:20.96315	2022-08-29 16:14:21.040004	6	3	600	Back & Shoulders II	f
97	70	2022-08-29 16:14:21.033752	2022-08-29 16:14:21.033752	4	3	600	Leg madness II	f
98	71	2022-08-29 16:14:32.016106	2022-08-29 16:14:32.016106	1	1	600	Warm up	f
100	71	2022-08-29 16:14:32.139909	2022-08-29 16:14:32.139909	3	4	600	Tabata	f
101	71	2022-08-29 16:14:32.20567	2022-08-29 16:14:32.20567	4	4	600	Block 4	f
102	71	2022-08-29 16:14:32.279022	2022-08-29 16:14:32.279022	5	3	600	Block 5	f
103	71	2022-08-29 16:14:32.339543	2022-08-29 16:14:32.339543	6	1	600	Cash out - max it!	f
21	7	2022-08-13 15:07:33.971121	2022-08-30 10:44:08.064197	1	2	600	Warmup	f
15	5	2022-08-13 15:07:33.863418	2022-08-30 18:55:48.650739	3	1	600	Leg 🔥 	f
11	4	2022-08-13 15:07:33.81451	2022-08-30 20:39:09.744969	2	3	600	Back run	f
10	4	2022-08-13 15:07:33.803941	2022-08-30 19:51:38.847879	1	2	600	Warm up	f
12	4	2022-08-13 15:07:33.821753	2022-08-30 20:40:56.758556	3	3	600	Pull & push	f
109	7	2022-08-30 11:01:22.893888	2022-08-30 11:03:34.10826	5	1	600	Cash out 🤑	f
110	4	2022-08-30 20:40:22.400149	2022-08-31 07:53:31.63964	5	1	600	Cash out	f
58	32	2022-08-23 17:03:15.196447	2022-09-27 05:36:23.745006	4	3	600	Back & Shoulders II	f
114	77	2022-08-31 07:04:17.729194	2022-08-31 07:07:22.61012	3	2	600	Block 4	f
111	77	2022-08-31 07:04:17.433148	2022-08-31 07:07:31.268579	4	3	600	Belly Tabata	f
130	84	2022-09-03 08:36:05.587225	2022-09-03 08:36:23.412277	3	3	600	Bellyssimo	f
113	77	2022-08-31 07:04:17.678681	2022-08-31 07:08:07.352013	1	1	600	Warmup	f
112	77	2022-08-31 07:04:17.565008	2022-08-31 07:10:05.275313	6	1	600	Cardio ❤️‍🔥	f
158	222	2022-09-27 06:05:26.634338	2022-09-27 06:07:11.654263	1	3	600	Your first block	f
116	78	2022-08-31 07:11:06.004962	2022-08-31 07:11:06.192318	4	2	600	Block 4	f
129	84	2022-09-03 08:34:21.319935	2022-09-03 09:39:18.468834	2	2	600	Back	f
118	78	2022-08-31 07:11:06.186707	2022-08-31 07:11:06.186707	1	1	600	Warmup	f
117	78	2022-08-31 07:11:06.106426	2022-08-31 07:11:06.321779	6	3	600	Belly Tabata	f
119	78	2022-08-31 07:11:06.234508	2022-08-31 07:11:06.321779	7	1	600	Cardio ❤️‍🔥	f
26	9	2022-08-13 15:07:34.070251	2022-12-06 12:55:43.176721	2	2	600	\N	f
120	78	2022-08-31 07:11:06.315136	2022-08-31 07:11:06.315136	5	1	600	Cash out 🤑	f
115	77	2022-08-31 07:04:17.80173	2022-08-31 07:11:42.956476	5	1	600	Cash out 🤑	f
131	84	2022-09-03 08:37:54.838968	2022-09-03 11:17:20.665544	4	2	600	Cash out	f
108	7	2022-08-30 10:59:23.715193	2022-08-31 07:13:41.16965	4	2	600	Block 4	f
20	7	2022-08-13 15:07:33.961815	2022-08-31 07:13:41.17254	3	1	600	Cardio ❤️‍🔥	f
183	240	2022-10-04 08:23:02.813365	2022-10-04 08:23:03.552195	5	3	600	Chest 🔥	f
128	84	2022-09-03 08:32:32.03975	2022-09-04 08:35:23.230681	1	2	600	Pull / Push	f
174	233	2022-09-30 06:13:41.887191	2022-09-30 06:42:41.617329	1	3	600	Your first block	f
13	5	2022-08-13 15:07:33.845191	2022-09-05 09:22:08.30524	1	1	600	Warmup	f
14	5	2022-08-13 15:07:33.85671	2022-09-05 09:22:08.306775	2	1	600	Oiling up	f
136	209	2022-09-18 12:47:59.397092	2022-09-18 12:49:36.132119	2	3	600	Chest 🔥	f
135	209	2022-09-18 12:44:11.964254	2022-09-18 12:50:42.364023	1	2	600	Warm up	f
186	240	2022-10-04 08:23:03.459023	2022-10-04 08:23:03.552195	6	1	600	💰 	f
137	209	2022-09-18 12:51:01.986341	2022-09-18 12:54:21.715104	3	2	600	Back	f
178	237	2022-10-02 15:58:13.716254	2022-10-02 16:05:30.63367	1	2	600	Your first block	f
139	209	2022-09-18 12:56:02.623661	2022-09-18 12:56:10.922315	5	1	600	💰 	f
187	240	2022-10-04 08:23:03.533303	2022-10-04 08:23:03.533303	4	2	600	s‘gascho🫃🏼	f
141	210	2022-09-18 13:03:23.29895	2022-09-18 13:03:23.29895	1	2	600	Warm up	f
180	237	2022-10-02 16:08:31.393236	2022-10-02 16:08:39.32495	2	1	600	Block 2oo	f
142	210	2022-09-18 13:03:23.336528	2022-09-18 13:03:23.336528	3	2	600	Back	f
140	210	2022-09-18 13:03:22.149549	2022-09-18 13:03:23.449059	5	3	600	Chest 🔥	f
143	210	2022-09-18 13:03:23.399128	2022-09-18 13:03:23.449059	6	1	600	💰 	f
144	210	2022-09-18 13:03:23.442864	2022-09-18 13:03:23.442864	4	1	600	s‘gascho🫃🏼	f
138	209	2022-09-18 12:52:55.405639	2022-09-18 15:53:47.914597	4	2	600	s‘gascho🫃🏼	f
184	240	2022-10-04 08:23:03.263366	2022-10-04 08:25:11.538496	1	1	600	Warm up	f
185	240	2022-10-04 08:23:03.349248	2022-10-04 09:24:10.864245	2	2	600	Back	f
190	243	2022-10-05 13:15:58.963952	2022-10-05 13:16:41.439487	1	10	600	Traingle	f
235	288	2022-10-15 08:42:28.221175	2022-10-15 09:05:23.678605	1	3	600	Shoulders	f
236	288	2022-10-15 09:05:28.250338	2022-10-15 09:06:59.107338	2	3	600	Legs	f
238	288	2022-10-15 09:09:55.479746	2022-10-15 09:10:35.907587	4	2	600	Calves	f
237	288	2022-10-15 09:07:02.427664	2022-10-15 09:09:47.481119	3	2	600	Core	f
239	288	2022-10-15 09:11:09.235501	2022-10-15 09:11:19.606755	5	1	600	💰	f
264	304	2022-11-03 05:55:18.305035	2022-11-09 09:56:20.076419	3	5	600	🔥🔥	f
267	304	2022-11-03 06:02:36.073542	2022-11-10 08:16:18.930195	2	1	600	Warmup	f
265	304	2022-11-03 05:56:45.216887	2022-11-10 08:16:18.931315	1	3	600	Calves & legs	f
266	304	2022-11-03 05:59:27.858523	2022-11-03 06:03:21.272553	4	3	600	Shoulders	f
251	295	2022-10-22 08:55:30.511842	2022-10-22 08:57:07.496936	4	3	600	Legs	f
250	295	2022-10-22 08:53:14.67262	2022-10-22 08:57:11.304853	3	3	600	Back	f
285	315	2022-11-11 07:48:14.232517	2022-11-11 07:48:14.232517	1	3	600	Shoulders	f
249	295	2022-10-22 08:50:24.412357	2022-10-22 08:57:13.596015	2	3	600	Shoulders	f
286	315	2022-11-11 07:48:14.27592	2022-11-11 07:48:14.27592	2	3	600	Legs	f
252	295	2022-10-22 08:57:01.899632	2022-10-22 08:57:24.775341	1	1	600	Warmup	f
253	295	2022-10-22 08:57:51.751001	2022-10-22 08:58:44.508812	5	2	600	🤑	f
262	303	2022-11-01 08:38:17.208275	2022-11-01 08:39:23.072071	1	1	600	Block #1	f
288	315	2022-11-11 07:48:14.343356	2022-11-11 07:48:14.343356	3	2	600	Core	f
289	315	2022-11-11 07:48:14.430881	2022-11-11 07:48:14.430881	5	1	600	💰	f
263	303	2022-11-01 08:39:29.738009	2022-11-01 08:40:57.557367	2	5	600	Block #2	f
290	315	2022-11-11 07:49:16.781829	2022-11-11 07:49:25.925191	6	1	600	Cash out	f
268	304	2022-11-03 06:04:28.124792	2022-11-03 06:05:17.814795	5	1	600	💰 	f
269	305	2022-11-06 07:14:39.925407	2022-11-06 07:14:39.925407	1	2	600	Warm up	f
272	305	2022-11-06 07:14:40.144803	2022-11-06 07:14:40.212141	7	1	600	💰 	f
270	305	2022-11-06 07:14:40.016669	2022-11-06 08:55:30.437903	3	3	600	Back	f
273	305	2022-11-06 07:14:40.204531	2022-11-06 08:59:08.043598	4	2	600	s‘gascho🫃🏼	f
271	305	2022-11-06 07:14:40.103171	2022-11-06 09:06:03.348523	6	2	600	Chest 🔥	f
315	337	2022-11-22 15:43:47.528665	2022-11-22 15:44:32.95417	2	3	600	Arm & Shoulders	f
395	403	2022-12-30 09:44:01.893987	2022-12-30 09:44:45.912163	1	1	600	Warmup	f
317	337	2022-11-22 15:45:56.777477	2022-11-22 15:46:11.350902	4	1	600	Pushups	f
316	337	2022-11-22 15:44:40.409981	2022-11-22 15:46:18.956049	3	3	600	Belli	f
410	411	2023-01-06 07:41:14.06833	2023-01-06 07:44:27.280458	5	1	600	Cash out	f
396	403	2022-12-30 09:46:13.635236	2022-12-30 09:48:10.519543	2	5	600	Shoulders & Legs	f
314	337	2022-11-22 15:40:59.8549	2022-11-25 09:53:24.847639	1	3	600	Warmup	f
398	403	2022-12-30 09:51:09.283793	2022-12-30 09:51:16.066396	4	1	600	Cash out	f
397	403	2022-12-30 09:48:54.32743	2022-12-30 10:33:48.471501	3	2	600	Belly	f
671	646	2023-05-24 01:59:53.030702	2023-06-29 09:27:25.224824	1	2	600	Warmup #1	f
673	646	2023-05-24 02:47:45.676782	2023-05-24 02:51:00.5139	3	3	600	Back #3	f
674	646	2023-05-24 02:51:09.606212	2023-05-24 02:54:46.007493	4	2	600	Cash out #4	f
407	411	2023-01-06 07:41:13.734259	2023-01-06 07:41:13.734259	1	1	600	Warmup	f
408	411	2023-01-06 07:41:13.859456	2023-01-06 07:41:13.859456	2	5	600	Shoulders & Legs	f
411	411	2023-01-06 07:44:19.611701	2023-01-06 07:44:51.756725	4	2	600	Back	f
409	411	2023-01-06 07:41:13.958656	2023-01-06 07:44:54.239622	3	2	600	Belly	f
619	608	2023-05-07 03:34:23.486636	2023-05-07 03:35:13.355069	1	3	600	Block #1	f
620	608	2023-05-07 03:35:17.467736	2023-05-07 03:36:46.707473	2	2	600	Block #2	f
627	614	2023-05-09 05:58:57.687692	2023-05-09 06:14:47.564747	1	3	600	Warmup	f
684	656	2023-05-29 01:58:04.563959	2023-05-29 02:03:17.142371	1	3	600	Block #1	f
630	614	2023-05-09 06:14:52.493062	2023-05-09 06:36:40.97633	4	3	600	Them legs	f
640	620	2023-05-11 14:13:39.902069	2023-05-11 14:13:57.674809	4	3	600	Block #4	f
639	620	2023-05-11 14:12:48.94316	2023-05-11 14:14:02.626054	3	3	600	Block #3	f
25	9	2022-08-13 15:07:34.058993	2022-12-06 12:55:03.907467	1	2	600	\N	f
441	438	2023-02-04 13:53:53.189714	2023-02-04 14:00:38.50929	2	3	600	Strenght	f
440	438	2023-02-04 13:48:19.151548	2023-02-04 14:01:00.690104	1	3	600	Warmup	f
443	438	2023-02-04 13:57:57.366021	2023-02-04 13:58:23.521473	4	3	600	Cash out	f
442	438	2023-02-04 13:56:37.6572	2023-02-04 13:59:32.779597	3	3	600	Core	f
803	764	2023-07-05 09:17:07.22693	2023-07-05 09:18:38.360885	2	2	600	Belly I	f
721	689	2023-06-12 17:07:09.644587	2023-06-12 17:08:21.037088	2	3	600	Back	f
722	689	2023-06-12 17:07:46.374297	2023-06-12 17:10:02.486407	3	3	600	Cardio	f
804	764	2023-07-05 09:18:40.270994	2023-07-05 09:19:46.973879	3	2	600	Back I	f
481	476	2023-02-17 15:04:30.553803	2023-02-17 15:04:30.553803	1	3	600	Warmup	f
482	476	2023-02-17 15:04:30.64571	2023-02-17 15:04:30.64571	2	3	600	Strenght	f
483	476	2023-02-17 15:04:30.740386	2023-02-17 15:04:30.740386	3	3	600	Core	f
484	476	2023-02-17 15:04:30.795553	2023-02-17 15:04:30.795553	4	3	600	Cash out	f
672	646	2023-05-24 02:14:49.712567	2023-05-24 02:47:41.214601	2	3	600	Belly #2	f
920	877	2023-08-31 07:29:15.076943	2023-08-31 07:57:37.441726	3	2	600	Legs	f
773	738	2023-06-29 08:08:35.776729	2023-06-29 08:10:35.054866	1	1	600	Warmup	f
527	519	2023-03-08 06:27:26.903797	2023-03-08 06:27:26.903797	1	1	600	Warmup	f
918	877	2023-08-31 07:23:53.708905	2023-11-20 16:03:30.961904	1	1	600	100 in 10’	t
528	519	2023-03-08 06:27:27.115052	2023-03-08 06:27:27.115052	2	5	600	Shoulders & Legs	f
529	519	2023-03-08 06:27:27.265774	2023-03-08 06:27:27.265774	3	2	600	Belly	f
530	519	2023-03-08 06:27:27.525176	2023-03-08 06:27:27.525176	4	1	600	Cash out	f
621	608	2023-05-07 03:36:50.389231	2023-05-07 03:38:15.793987	3	2	600	Block #3	f
628	614	2023-05-09 06:12:10.616543	2023-05-09 06:13:00.241591	2	3	600	Back & shoulders	f
774	738	2023-06-29 08:10:51.421959	2023-06-29 08:12:06.878911	2	2	600	Biceps	f
685	656	2023-05-29 02:03:45.240475	2023-05-29 02:04:16.18406	2	1	600	Block #2	f
631	614	2023-05-09 06:17:22.74275	2023-05-09 06:18:19.620079	5	3	600	Cash out	f
629	614	2023-05-09 06:13:16.722329	2023-05-09 06:36:34.865688	3	3	600	Push	f
775	738	2023-06-29 08:12:08.833401	2023-06-29 08:12:43.703898	3	2	600	Triceps	f
776	738	2023-06-29 08:12:48.683727	2023-06-29 08:12:53.727588	4	1	600	Cash out	f
637	620	2023-05-11 14:00:59.392722	2023-05-11 14:09:43.803888	1	3	600	Block #1	f
638	620	2023-05-11 14:05:57.736526	2023-05-11 14:12:40.787928	2	3	600	Block #2	f
932	887	2023-09-08 16:36:19.080446	2023-09-08 16:36:19.080446	3	1	600	Block #3	f
930	887	2023-09-08 16:28:23.177252	2023-09-08 16:47:08.274133	2	1	600	Block #1	t
648	627	2023-05-17 14:23:50.2036	2023-05-17 14:23:50.2036	1	2	600	Warmup	f
714	656	2023-06-11 11:30:34.345553	2023-06-11 11:30:34.345553	3	1	600	Block #3	f
802	764	2023-07-05 09:13:11.389825	2023-07-05 09:13:43.707548	1	1	600	Warmup	f
805	764	2023-07-05 09:19:50.150245	2023-07-05 09:19:55.424441	4	1	600	Cash out	f
649	627	2023-05-17 14:23:50.266718	2023-05-17 14:25:51.202339	6	1	600	Cash out 🤑	f
650	627	2023-05-17 14:23:50.33681	2023-05-17 14:26:42.849922	2	2	600	Belly I	f
720	689	2023-06-12 17:06:17.048422	2023-06-21 08:10:46.267206	1	3	600	Legs	f
741	689	2023-06-22 20:03:24.43917	2023-06-22 20:03:24.43917	4	1	600	Block #4	f
1644	1593	2024-12-13 07:34:16.749542	2024-12-13 07:39:41.326012	1	2	600	Belly	f
1645	1593	2024-12-13 07:39:32.997819	2024-12-13 07:39:51.237413	2	2	600	Back	f
651	627	2023-05-17 14:23:50.443889	2025-02-02 19:00:17.600461	5	2	600	Cardio ❤️‍🔥	f
647	627	2023-05-17 14:23:50.091565	2025-02-02 19:00:17.602313	4	3	600	Belly II	f
1646	1594	2025-02-20 06:23:18.28392	2025-02-20 06:23:18.28392	1	1	600	Block #1	f
1647	1595	2025-04-12 14:33:29.082105	2025-04-12 14:33:29.082105	1	1	600	Block #1	f
919	877	2023-08-31 07:27:44.98764	2023-08-31 07:29:11.235665	2	3	600	Shoulders	f
1340	1290	2024-03-29 10:43:21.764841	2024-03-29 10:49:29.805489	2	3	600	Chest	f
1341	1290	2024-03-29 10:44:15.020775	2024-03-29 10:49:56.482779	3	3	600	Back	f
931	887	2023-09-08 16:31:17.329217	2023-11-20 14:07:34.438897	1	3	600	Block #2	f
1339	1290	2024-03-29 10:40:56.295388	2024-03-29 10:50:10.896869	1	3	600	Belly	f
1057	1011	2024-01-09 08:47:17.865592	2024-01-09 08:58:38.383308	2	3	600	Belly	f
1015	970	2023-12-02 17:29:28.960452	2023-12-02 17:31:15.703769	1	3	600	Block #1	f
1016	970	2023-12-02 17:30:47.945837	2023-12-12 10:31:19.3539	2	3	600	Block #2	f
1059	1011	2024-01-09 08:55:57.204931	2024-01-09 08:58:20.704942	1	1	600	Egym	f
1058	1011	2024-01-09 08:49:59.994087	2024-01-09 08:58:33.015105	3	3	600	Them legs	f
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: st_gym_user
--

COPY public.categories (id, name, created_at, updated_at, main_category) FROM stdin;
1	pull	2022-08-13 15:07:32.967215	2023-05-23 07:47:59.834199	f
2	push	2022-08-13 15:07:32.972597	2023-05-23 07:47:59.844486	f
3	cardio	2022-08-13 15:07:32.976314	2023-05-23 07:47:59.847996	f
4	back	2022-08-13 15:07:32.982521	2023-05-23 07:47:59.851479	f
5	legs	2022-08-13 15:07:32.997331	2023-05-23 07:47:59.85442	f
6	chest	2022-08-13 15:07:33.003081	2023-05-23 07:47:59.857186	f
7	belly	2022-08-13 15:07:33.006946	2023-05-23 07:47:59.860053	f
8	arms	2022-08-13 15:07:33.011733	2023-05-23 07:47:59.863713	f
9	shoulders	2022-08-13 15:07:33.015061	2023-05-23 07:47:59.866327	f
10	mobility	2023-05-23 07:46:53.409302	2023-05-23 07:47:59.868912	f
11	core	2023-05-23 07:47:04.623608	2023-05-23 07:47:59.87142	f
12	functional	2023-05-23 07:47:13.116145	2023-06-12 12:25:16.19004	t
13	gym	2023-06-12 12:26:50.307234	2023-06-12 12:26:50.307234	t
\.


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: st_gym_user
--

COPY public.contacts (id, email, content, created_at, updated_at) FROM stdin;
1	stephens@hey.com	First feedback for you!	2023-01-23 13:49:58.515237	2023-01-23 13:49:58.515237
3	FTeoko.hjwjhqm@gemination.hair	itPXCcDelbubKvmFTJdOezOtjtAjx	2023-10-27 03:44:31.128057	2023-10-27 03:44:31.128057
4	nVzyAn.wtdtdp@zetetic.sbs	auMoJtnpeeHPCuaywMjVy	2023-11-20 09:03:59.970796	2023-11-20 09:03:59.970796
5	PPrjcJ.qdpjpb@chiffon.fun	Princeton Richmond	2023-11-24 22:17:56.17353	2023-11-24 22:17:56.17353
6	eIdMxB.qhmwch@anaphora.team	Khalil Lozano	2023-11-27 16:03:38.786709	2023-11-27 16:03:38.786709
7	xnrvfv.qwmmmt@spinapp.bar	Baker Watson	2023-11-29 22:28:27.396109	2023-11-29 22:28:27.396109
8	hSIlOT.tdwhbp@brasswire.me	Carson Mckee	2023-12-01 09:08:22.906482	2023-12-01 09:08:22.906482
9	dbMBYM.hdpdbch@rightbliss.beauty	Nola Villarreal	2023-12-09 13:08:48.356502	2023-12-09 13:08:48.356502
10	kNqWmJ.qmcdjh@wisefoot.club	Jaylani Ray	2023-12-17 07:40:35.631363	2023-12-17 07:40:35.631363
11	UWwMVT.mhbmwmh@zetetic.sbs	eQwRKXeCNSQaJJUxhNxT	2023-12-18 19:52:25.388113	2023-12-18 19:52:25.388113
12	OSMiIW.bbtjqhd@rushlight.cfd	Cali Haley	2023-12-22 04:15:38.942494	2023-12-22 04:15:38.942494
13	DCYzEM.mbwcq@tarboosh.shop	Marilyn Rangel	2023-12-26 09:43:50.548905	2023-12-26 09:43:50.548905
14	bDnIIe.tjqpjwc@flexduck.click	Jemma Coffey	2023-12-31 23:10:24.469044	2023-12-31 23:10:24.469044
15	cqqJOK.dhcpwbp@sandcress.xyz	Alfred Roth	2024-01-06 01:34:22.323066	2024-01-06 01:34:22.323066
16	nwiEYP.dhphpqc@sandcress.xyz	Shepard Ray	2024-01-06 01:48:05.51425	2024-01-06 01:48:05.51425
17	TkrnQe.phmjtpw@purline.top	Talon Moon	2024-01-07 08:53:49.564916	2024-01-07 08:53:49.564916
18	WcrJxR.dbwjwc@tonetics.biz	Kalani Booth	2024-01-14 02:18:45.352038	2024-01-14 02:18:45.352038
19	byTRHn.qjbcqwh@wheelry.boats	Amina Wise	2024-01-14 22:55:42.150597	2024-01-14 22:55:42.150597
20	XvBHAc.hwwtcdb@zetetic.sbs	Huxley Walls	2024-01-22 18:30:49.995768	2024-01-22 18:30:49.995768
21	QhQLzR.qqcdqqtq@rottack.autos	Uriel Ramos	2024-01-25 12:54:37.948549	2024-01-25 12:54:37.948549
22	LJwUux.ccchdbj@wisefoot.club	Amari Sherman	2024-02-02 13:16:23.103946	2024-02-02 13:16:23.103946
23	pQcrCq.pwdqcqq@silesia.life	Byron Hanna	2024-03-03 14:30:09.731603	2024-03-03 14:30:09.731603
24	WfRjUJ.pwpdhq@chiffon.fun	Darren Huffman	2024-03-13 01:21:31.486552	2024-03-13 01:21:31.486552
25	qmddjjqmm.h@monochord.xyz	aimil nicholsen	2024-03-15 23:00:44.075523	2024-03-15 23:00:44.075523
26	dmqdcwqbp.h@monochord.xyz	chira nascimento da silva	2024-03-18 23:14:00.425263	2024-03-18 23:14:00.425263
27	qjwbcjdjpt.h@monochord.xyz	basile sinson	2024-03-24 16:02:53.242419	2024-03-24 16:02:53.242419
28	qtwhcphjtq.h@monochord.xyz	ardoth huffstutler	2024-03-27 21:58:14.786952	2024-03-27 21:58:14.786952
\.


--
-- Data for Name: exercise_categories; Type: TABLE DATA; Schema: public; Owner: st_gym_user
--

COPY public.exercise_categories (id, exercise_id, category_id, created_at, updated_at) FROM stdin;
2	3	9	2023-05-23 06:48:14.279652	2023-05-23 06:48:14.279652
3	4	7	2023-05-23 06:48:14.284458	2023-05-23 06:48:14.284458
4	5	2	2023-05-23 06:48:14.289963	2023-05-23 06:48:14.289963
5	7	3	2023-05-23 06:48:14.294964	2023-05-23 06:48:14.294964
6	9	7	2023-05-23 06:48:14.299385	2023-05-23 06:48:14.299385
7	10	5	2023-05-23 06:48:14.303991	2023-05-23 06:48:14.303991
8	12	4	2023-05-23 06:48:14.30831	2023-05-23 06:48:14.30831
9	13	4	2023-05-23 06:48:14.312706	2023-05-23 06:48:14.312706
10	14	4	2023-05-23 06:48:14.316794	2023-05-23 06:48:14.316794
11	15	4	2023-05-23 06:48:14.321061	2023-05-23 06:48:14.321061
12	17	7	2023-05-23 06:48:14.325626	2023-05-23 06:48:14.325626
13	18	9	2023-05-23 06:48:14.330003	2023-05-23 06:48:14.330003
14	19	9	2023-05-23 06:48:14.334293	2023-05-23 06:48:14.334293
15	20	4	2023-05-23 06:48:14.338409	2023-05-23 06:48:14.338409
16	21	5	2023-05-23 06:48:14.342364	2023-05-23 06:48:14.342364
17	22	5	2023-05-23 06:48:14.346362	2023-05-23 06:48:14.346362
19	25	7	2023-05-23 06:48:14.35533	2023-05-23 06:48:14.35533
20	27	7	2023-05-23 06:48:14.359568	2023-05-23 06:48:14.359568
21	28	3	2023-05-23 06:48:14.364167	2023-05-23 06:48:14.364167
22	29	7	2023-05-23 06:48:14.368263	2023-05-23 06:48:14.368263
23	30	7	2023-05-23 06:48:14.38124	2023-05-23 06:48:14.38124
24	31	5	2023-05-23 06:48:14.385953	2023-05-23 06:48:14.385953
25	32	5	2023-05-23 06:48:14.390454	2023-05-23 06:48:14.390454
27	35	7	2023-05-23 06:48:14.399358	2023-05-23 06:48:14.399358
28	36	7	2023-05-23 06:48:14.407893	2023-05-23 06:48:14.407893
29	37	9	2023-05-23 06:48:14.41207	2023-05-23 06:48:14.41207
30	38	9	2023-05-23 06:48:14.416112	2023-05-23 06:48:14.416112
31	41	5	2023-05-23 06:48:14.420554	2023-05-23 06:48:14.420554
32	42	5	2023-05-23 06:48:14.424617	2023-05-23 06:48:14.424617
33	43	5	2023-05-23 06:48:14.428975	2023-05-23 06:48:14.428975
34	44	5	2023-05-23 06:48:14.433655	2023-05-23 06:48:14.433655
35	48	7	2023-05-23 06:48:14.437949	2023-05-23 06:48:14.437949
36	49	7	2023-05-23 06:48:14.442247	2023-05-23 06:48:14.442247
37	50	7	2023-05-23 06:48:14.4466	2023-05-23 06:48:14.4466
38	52	9	2023-05-23 06:48:14.45117	2023-05-23 06:48:14.45117
39	53	5	2023-05-23 06:48:14.456109	2023-05-23 06:48:14.456109
40	96	5	2023-05-23 06:48:14.460247	2023-05-23 06:48:14.460247
41	95	9	2023-05-23 06:48:14.464219	2023-05-23 06:48:14.464219
42	1	3	2023-05-23 06:48:14.468368	2023-05-23 06:48:14.468368
43	2	5	2023-05-23 06:48:14.472492	2023-05-23 06:48:14.472492
44	6	9	2023-05-23 06:48:14.489384	2023-05-23 06:48:14.489384
45	8	7	2023-05-23 06:48:14.494367	2023-05-23 06:48:14.494367
46	11	5	2023-05-23 06:48:14.499005	2023-05-23 06:48:14.499005
47	16	7	2023-05-23 06:48:14.506978	2023-05-23 06:48:14.506978
48	24	7	2023-05-23 06:48:14.511163	2023-05-23 06:48:14.511163
49	26	7	2023-05-23 06:48:14.515116	2023-05-23 06:48:14.515116
50	34	5	2023-05-23 06:48:14.51903	2023-05-23 06:48:14.51903
51	39	9	2023-05-23 06:48:14.523305	2023-05-23 06:48:14.523305
52	46	5	2023-05-23 06:48:14.527638	2023-05-23 06:48:14.527638
53	51	3	2023-05-23 06:48:14.531763	2023-05-23 06:48:14.531763
54	54	1	2023-05-23 06:48:14.536042	2023-05-23 06:48:14.536042
55	55	7	2023-05-23 06:48:14.540099	2023-05-23 06:48:14.540099
56	56	7	2023-05-23 06:48:14.544196	2023-05-23 06:48:14.544196
58	58	3	2023-05-23 06:48:14.552071	2023-05-23 06:48:14.552071
59	59	6	2023-05-23 06:48:14.556951	2023-05-23 06:48:14.556951
60	60	9	2023-05-23 06:48:14.560924	2023-05-23 06:48:14.560924
61	61	3	2023-05-23 06:48:14.565883	2023-05-23 06:48:14.565883
62	62	3	2023-05-23 06:48:14.570997	2023-05-23 06:48:14.570997
63	63	3	2023-05-23 06:48:14.575093	2023-05-23 06:48:14.575093
64	64	3	2023-05-23 06:48:14.579359	2023-05-23 06:48:14.579359
65	65	3	2023-05-23 06:48:14.58334	2023-05-23 06:48:14.58334
66	97	5	2023-05-23 06:48:14.58709	2023-05-23 06:48:14.58709
67	98	8	2023-05-23 06:48:14.591671	2023-05-23 06:48:14.591671
68	99	8	2023-05-23 06:48:14.595579	2023-05-23 06:48:14.595579
127	123	10	2023-05-24 01:55:19.409972	2023-05-24 01:55:19.409972
128	123	11	2023-05-24 01:55:19.417891	2023-05-24 01:55:19.417891
131	125	10	2023-05-24 01:55:19.446529	2023-05-24 01:55:19.446529
132	125	5	2023-05-24 01:55:19.463549	2023-05-24 01:55:19.463549
133	126	10	2023-05-24 01:55:19.473557	2023-05-24 01:55:19.473557
134	126	4	2023-05-24 01:55:19.484248	2023-05-24 01:55:19.484248
135	127	10	2023-05-24 01:55:19.496189	2023-05-24 01:55:19.496189
136	127	11	2023-05-24 01:55:19.503308	2023-05-24 01:55:19.503308
140	129	11	2023-05-24 01:55:19.540399	2023-05-24 01:55:19.540399
141	129	10	2023-05-24 01:55:19.547659	2023-05-24 01:55:19.547659
142	129	7	2023-05-24 01:55:19.554934	2023-05-24 01:55:19.554934
143	130	11	2023-05-24 01:55:19.56573	2023-05-24 01:55:19.56573
144	130	5	2023-05-24 01:55:19.575072	2023-05-24 01:55:19.575072
145	130	7	2023-05-24 01:55:19.582707	2023-05-24 01:55:19.582707
146	131	11	2023-05-24 01:55:19.59355	2023-05-24 01:55:19.59355
147	131	9	2023-05-24 01:55:19.602993	2023-05-24 01:55:19.602993
148	131	12	2023-05-24 01:55:19.61084	2023-05-24 01:55:19.61084
149	132	11	2023-05-24 01:55:19.621273	2023-05-24 01:55:19.621273
150	132	10	2023-05-24 01:55:19.628333	2023-05-24 01:55:19.628333
151	133	8	2023-05-24 01:55:19.640343	2023-05-24 01:55:19.640343
152	134	1	2023-05-24 01:55:19.650328	2023-05-24 01:55:19.650328
153	134	4	2023-05-24 01:55:19.656659	2023-05-24 01:55:19.656659
154	134	8	2023-05-24 01:55:19.663628	2023-05-24 01:55:19.663628
158	136	1	2023-05-24 01:55:19.707886	2023-05-24 01:55:19.707886
159	136	11	2023-05-24 01:55:19.714418	2023-05-24 01:55:19.714418
160	136	8	2023-05-24 01:55:19.720851	2023-05-24 01:55:19.720851
161	137	1	2023-05-24 01:55:19.731009	2023-05-24 01:55:19.731009
162	137	4	2023-05-24 01:55:19.738104	2023-05-24 01:55:19.738104
163	137	8	2023-05-24 01:55:19.745878	2023-05-24 01:55:19.745878
167	139	2	2023-05-24 01:55:19.835963	2023-05-24 01:55:19.835963
168	139	6	2023-05-24 01:55:19.88303	2023-05-24 01:55:19.88303
169	139	8	2023-05-24 01:55:19.948156	2023-05-24 01:55:19.948156
173	141	2	2023-05-24 01:55:20.089422	2023-05-24 01:55:20.089422
174	141	6	2023-05-24 01:55:20.137639	2023-05-24 01:55:20.137639
175	141	9	2023-05-24 01:55:20.178229	2023-05-24 01:55:20.178229
176	142	3	2023-05-24 01:55:20.206141	2023-05-24 01:55:20.206141
177	142	5	2023-05-24 01:55:20.262184	2023-05-24 01:55:20.262184
178	142	11	2023-05-24 01:55:20.289808	2023-05-24 01:55:20.289808
180	143	5	2023-05-24 01:55:20.324589	2023-05-24 01:55:20.324589
181	144	4	2023-05-24 01:55:20.345458	2023-05-24 01:55:20.345458
182	144	11	2023-05-24 01:55:20.375692	2023-05-24 01:55:20.375692
183	144	12	2023-05-24 01:55:20.402886	2023-05-24 01:55:20.402886
184	145	4	2023-05-24 01:55:20.431916	2023-05-24 01:55:20.431916
185	145	9	2023-05-24 01:55:20.463973	2023-05-24 01:55:20.463973
186	145	10	2023-05-24 01:55:20.482354	2023-05-24 01:55:20.482354
187	146	4	2023-05-24 01:55:20.501696	2023-05-24 01:55:20.501696
188	146	8	2023-05-24 01:55:20.512794	2023-05-24 01:55:20.512794
189	146	12	2023-05-24 01:55:20.520582	2023-05-24 01:55:20.520582
190	147	4	2023-05-24 01:55:20.535995	2023-05-24 01:55:20.535995
191	147	11	2023-05-24 01:55:20.542839	2023-05-24 01:55:20.542839
192	147	3	2023-05-24 01:55:20.553929	2023-05-24 01:55:20.553929
193	148	4	2023-05-24 01:55:20.565676	2023-05-24 01:55:20.565676
194	148	8	2023-05-24 01:55:20.572292	2023-05-24 01:55:20.572292
195	148	12	2023-05-24 01:55:20.578687	2023-05-24 01:55:20.578687
196	149	5	2023-05-24 01:55:20.588546	2023-05-24 01:55:20.588546
197	149	12	2023-05-24 01:55:20.595273	2023-05-24 01:55:20.595273
198	149	10	2023-05-24 01:55:20.601702	2023-05-24 01:55:20.601702
199	150	5	2023-05-24 01:55:20.610184	2023-05-24 01:55:20.610184
200	150	12	2023-05-24 01:55:20.616856	2023-05-24 01:55:20.616856
201	150	10	2023-05-24 01:55:20.622953	2023-05-24 01:55:20.622953
202	151	5	2023-05-24 01:55:20.632518	2023-05-24 01:55:20.632518
203	151	12	2023-05-24 01:55:20.639167	2023-05-24 01:55:20.639167
204	151	10	2023-05-24 01:55:20.646588	2023-05-24 01:55:20.646588
205	152	2	2023-05-24 01:55:20.656602	2023-05-24 01:55:20.656602
206	152	6	2023-05-24 01:55:20.663381	2023-05-24 01:55:20.663381
207	152	11	2023-05-24 01:55:20.670093	2023-05-24 01:55:20.670093
208	153	2	2023-05-24 01:55:20.680114	2023-05-24 01:55:20.680114
209	153	6	2023-05-24 01:55:20.687965	2023-05-24 01:55:20.687965
210	153	3	2023-05-24 01:55:20.693997	2023-05-24 01:55:20.693997
211	154	2	2023-05-24 01:55:20.702976	2023-05-24 01:55:20.702976
212	154	6	2023-05-24 01:55:20.710845	2023-05-24 01:55:20.710845
213	154	10	2023-05-24 01:55:20.717626	2023-05-24 01:55:20.717626
214	155	6	2023-05-24 01:55:20.727068	2023-05-24 01:55:20.727068
215	155	8	2023-05-24 01:55:20.737214	2023-05-24 01:55:20.737214
216	155	12	2023-05-24 01:55:20.743568	2023-05-24 01:55:20.743568
217	156	2	2023-05-24 01:55:20.753134	2023-05-24 01:55:20.753134
218	156	6	2023-05-24 01:55:20.759562	2023-05-24 01:55:20.759562
219	156	11	2023-05-24 01:55:20.765741	2023-05-24 01:55:20.765741
220	157	11	2023-05-24 01:55:20.775558	2023-05-24 01:55:20.775558
221	157	3	2023-05-24 01:55:20.782626	2023-05-24 01:55:20.782626
222	157	12	2023-05-24 01:55:20.78938	2023-05-24 01:55:20.78938
223	158	11	2023-05-24 01:55:20.79902	2023-05-24 01:55:20.79902
224	158	7	2023-05-24 01:55:20.809634	2023-05-24 01:55:20.809634
225	158	12	2023-05-24 01:55:20.818281	2023-05-24 01:55:20.818281
226	159	11	2023-05-24 01:55:20.833694	2023-05-24 01:55:20.833694
227	159	10	2023-05-24 01:55:20.841215	2023-05-24 01:55:20.841215
228	159	12	2023-05-24 01:55:20.85635	2023-05-24 01:55:20.85635
229	160	2	2023-05-24 01:55:20.864809	2023-05-24 01:55:20.864809
230	160	8	2023-05-24 01:55:20.871462	2023-05-24 01:55:20.871462
231	160	11	2023-05-24 01:55:20.877959	2023-05-24 01:55:20.877959
232	161	12	2023-05-24 01:55:20.886816	2023-05-24 01:55:20.886816
233	161	8	2023-05-24 01:55:20.893763	2023-05-24 01:55:20.893763
234	161	11	2023-05-24 01:55:20.900372	2023-05-24 01:55:20.900372
235	162	10	2023-05-24 01:55:20.909233	2023-05-24 01:55:20.909233
236	162	8	2023-05-24 01:55:20.916176	2023-05-24 01:55:20.916176
237	162	11	2023-05-24 01:55:20.922893	2023-05-24 01:55:20.922893
238	163	2	2023-05-24 01:55:20.932496	2023-05-24 01:55:20.932496
239	163	9	2023-05-24 01:55:20.942713	2023-05-24 01:55:20.942713
240	163	11	2023-05-24 01:55:20.951941	2023-05-24 01:55:20.951941
241	164	10	2023-05-24 01:55:20.961092	2023-05-24 01:55:20.961092
242	164	9	2023-05-24 01:55:20.967383	2023-05-24 01:55:20.967383
243	164	11	2023-05-24 01:55:20.974362	2023-05-24 01:55:20.974362
244	165	11	2023-05-24 01:55:20.983746	2023-05-24 01:55:20.983746
245	165	12	2023-05-24 01:55:20.990134	2023-05-24 01:55:20.990134
246	165	9	2023-05-24 01:55:20.998362	2023-05-24 01:55:20.998362
247	166	10	2023-05-24 01:55:21.013381	2023-05-24 01:55:21.013381
248	166	9	2023-05-24 01:55:21.020465	2023-05-24 01:55:21.020465
249	166	11	2023-05-24 01:55:21.027139	2023-05-24 01:55:21.027139
250	167	4	2023-05-24 01:55:21.035925	2023-05-24 01:55:21.035925
251	167	9	2023-05-24 01:55:21.042868	2023-05-24 01:55:21.042868
252	167	11	2023-05-24 01:55:21.049392	2023-05-24 01:55:21.049392
253	168	12	2023-05-24 01:55:21.059243	2023-05-24 01:55:21.059243
254	168	5	2023-05-24 01:55:21.065537	2023-05-24 01:55:21.065537
255	168	3	2023-05-24 01:55:21.075603	2023-05-24 01:55:21.075603
256	169	12	2023-05-24 01:55:21.086143	2023-05-24 01:55:21.086143
257	169	5	2023-05-24 01:55:21.09274	2023-05-24 01:55:21.09274
258	169	3	2023-05-24 01:55:21.09919	2023-05-24 01:55:21.09919
259	3	12	2023-06-12 12:48:22.170079	2023-06-12 12:48:22.170079
260	4	12	2023-06-12 12:48:22.180009	2023-06-12 12:48:22.180009
261	5	12	2023-06-12 12:48:22.188042	2023-06-12 12:48:22.188042
262	7	12	2023-06-12 12:48:22.195906	2023-06-12 12:48:22.195906
263	9	12	2023-06-12 12:48:22.203741	2023-06-12 12:48:22.203741
264	10	12	2023-06-12 12:48:22.211166	2023-06-12 12:48:22.211166
265	12	12	2023-06-12 12:48:22.218502	2023-06-12 12:48:22.218502
266	13	12	2023-06-12 12:48:22.22772	2023-06-12 12:48:22.22772
267	14	12	2023-06-12 12:48:22.235523	2023-06-12 12:48:22.235523
268	15	12	2023-06-12 12:48:22.245485	2023-06-12 12:48:22.245485
269	17	12	2023-06-12 12:48:22.254243	2023-06-12 12:48:22.254243
270	18	12	2023-06-12 12:48:22.262078	2023-06-12 12:48:22.262078
271	19	12	2023-06-12 12:48:22.269754	2023-06-12 12:48:22.269754
272	20	12	2023-06-12 12:48:22.277502	2023-06-12 12:48:22.277502
273	21	12	2023-06-12 12:48:22.28951	2023-06-12 12:48:22.28951
274	22	12	2023-06-12 12:48:22.297193	2023-06-12 12:48:22.297193
276	25	12	2023-06-12 12:48:22.314583	2023-06-12 12:48:22.314583
277	27	12	2023-06-12 12:48:22.329929	2023-06-12 12:48:22.329929
278	28	12	2023-06-12 12:48:22.339577	2023-06-12 12:48:22.339577
279	29	12	2023-06-12 12:48:22.351893	2023-06-12 12:48:22.351893
280	30	12	2023-06-12 12:48:22.360121	2023-06-12 12:48:22.360121
281	31	12	2023-06-12 12:48:22.368423	2023-06-12 12:48:22.368423
282	32	12	2023-06-12 12:48:22.377706	2023-06-12 12:48:22.377706
283	35	12	2023-06-12 12:48:22.39103	2023-06-12 12:48:22.39103
284	36	12	2023-06-12 12:48:22.399708	2023-06-12 12:48:22.399708
285	37	12	2023-06-12 12:48:22.407955	2023-06-12 12:48:22.407955
286	38	12	2023-06-12 12:48:22.415588	2023-06-12 12:48:22.415588
287	41	12	2023-06-12 12:48:22.423016	2023-06-12 12:48:22.423016
288	42	12	2023-06-12 12:48:22.430376	2023-06-12 12:48:22.430376
289	43	12	2023-06-12 12:48:22.438598	2023-06-12 12:48:22.438598
290	44	12	2023-06-12 12:48:22.44841	2023-06-12 12:48:22.44841
291	48	12	2023-06-12 12:48:22.456383	2023-06-12 12:48:22.456383
292	49	12	2023-06-12 12:48:22.464568	2023-06-12 12:48:22.464568
293	50	12	2023-06-12 12:48:22.472781	2023-06-12 12:48:22.472781
294	52	12	2023-06-12 12:48:22.480546	2023-06-12 12:48:22.480546
295	53	12	2023-06-12 12:48:22.489178	2023-06-12 12:48:22.489178
296	96	12	2023-06-12 12:48:22.496896	2023-06-12 12:48:22.496896
297	95	12	2023-06-12 12:48:22.505583	2023-06-12 12:48:22.505583
298	1	12	2023-06-12 12:48:22.512887	2023-06-12 12:48:22.512887
299	2	12	2023-06-12 12:48:22.520207	2023-06-12 12:48:22.520207
300	6	12	2023-06-12 12:48:22.528189	2023-06-12 12:48:22.528189
301	8	12	2023-06-12 12:48:22.535656	2023-06-12 12:48:22.535656
302	11	12	2023-06-12 12:48:22.542923	2023-06-12 12:48:22.542923
303	16	12	2023-06-12 12:48:22.551779	2023-06-12 12:48:22.551779
304	24	12	2023-06-12 12:48:22.55942	2023-06-12 12:48:22.55942
305	26	12	2023-06-12 12:48:22.567036	2023-06-12 12:48:22.567036
306	34	12	2023-06-12 12:48:22.576523	2023-06-12 12:48:22.576523
307	39	12	2023-06-12 12:48:22.584094	2023-06-12 12:48:22.584094
308	46	12	2023-06-12 12:48:22.5919	2023-06-12 12:48:22.5919
309	51	12	2023-06-12 12:48:22.599456	2023-06-12 12:48:22.599456
310	54	12	2023-06-12 12:48:22.607152	2023-06-12 12:48:22.607152
311	55	12	2023-06-12 12:48:22.614921	2023-06-12 12:48:22.614921
312	56	12	2023-06-12 12:48:22.622113	2023-06-12 12:48:22.622113
313	58	12	2023-06-12 12:48:22.629539	2023-06-12 12:48:22.629539
314	59	12	2023-06-12 12:48:22.641652	2023-06-12 12:48:22.641652
315	60	12	2023-06-12 12:48:22.649599	2023-06-12 12:48:22.649599
316	61	12	2023-06-12 12:48:22.657106	2023-06-12 12:48:22.657106
317	62	12	2023-06-12 12:48:22.664737	2023-06-12 12:48:22.664737
318	63	12	2023-06-12 12:48:22.67213	2023-06-12 12:48:22.67213
319	64	12	2023-06-12 12:48:22.686502	2023-06-12 12:48:22.686502
320	65	12	2023-06-12 12:48:22.694207	2023-06-12 12:48:22.694207
321	97	12	2023-06-12 12:48:22.701321	2023-06-12 12:48:22.701321
322	98	12	2023-06-12 12:48:22.708553	2023-06-12 12:48:22.708553
323	99	12	2023-06-12 12:48:22.715559	2023-06-12 12:48:22.715559
324	123	12	2023-06-12 12:48:22.722709	2023-06-12 12:48:22.722709
325	125	12	2023-06-12 12:48:22.73619	2023-06-12 12:48:22.73619
326	126	12	2023-06-12 12:48:22.749567	2023-06-12 12:48:22.749567
327	127	12	2023-06-12 12:48:22.762789	2023-06-12 12:48:22.762789
328	129	12	2023-06-12 12:48:22.775411	2023-06-12 12:48:22.775411
329	130	12	2023-06-12 12:48:22.793061	2023-06-12 12:48:22.793061
330	132	12	2023-06-12 12:48:22.820101	2023-06-12 12:48:22.820101
331	133	12	2023-06-12 12:48:22.84085	2023-06-12 12:48:22.84085
332	134	12	2023-06-12 12:48:22.848511	2023-06-12 12:48:22.848511
334	136	12	2023-06-12 12:48:22.8929	2023-06-12 12:48:22.8929
335	137	12	2023-06-12 12:48:22.91158	2023-06-12 12:48:22.91158
336	139	12	2023-06-12 12:48:22.932954	2023-06-12 12:48:22.932954
337	141	12	2023-06-12 12:48:22.954044	2023-06-12 12:48:22.954044
338	142	12	2023-06-12 12:48:22.97585	2023-06-12 12:48:22.97585
339	143	12	2023-06-12 12:48:22.994292	2023-06-12 12:48:22.994292
340	145	12	2023-06-12 12:48:23.020771	2023-06-12 12:48:23.020771
341	147	12	2023-06-12 12:48:23.061098	2023-06-12 12:48:23.061098
342	152	12	2023-06-12 12:48:23.11885	2023-06-12 12:48:23.11885
343	153	12	2023-06-12 12:48:23.138284	2023-06-12 12:48:23.138284
344	154	12	2023-06-12 12:48:23.15683	2023-06-12 12:48:23.15683
345	156	12	2023-06-12 12:48:23.184406	2023-06-12 12:48:23.184406
346	160	12	2023-06-12 12:48:23.234614	2023-06-12 12:48:23.234614
347	162	12	2023-06-12 12:48:23.265395	2023-06-12 12:48:23.265395
348	163	12	2023-06-12 12:48:23.284242	2023-06-12 12:48:23.284242
349	164	12	2023-06-12 12:48:23.309973	2023-06-12 12:48:23.309973
350	166	12	2023-06-12 12:48:23.339471	2023-06-12 12:48:23.339471
351	167	12	2023-06-12 12:48:23.358221	2023-06-12 12:48:23.358221
352	7	2	2023-06-19 14:27:27.134141	2023-06-19 14:27:27.134141
353	7	6	2023-06-19 14:27:27.142693	2023-06-19 14:27:27.142693
354	170	8	2023-06-20 08:23:50.78598	2023-06-20 08:23:50.78598
355	170	9	2023-06-20 08:23:50.792091	2023-06-20 08:23:50.792091
356	170	13	2023-06-20 08:23:50.796348	2023-06-20 08:23:50.796348
357	171	4	2023-06-20 08:26:32.73262	2023-06-20 08:26:32.73262
358	171	5	2023-06-20 08:26:32.742418	2023-06-20 08:26:32.742418
359	171	13	2023-06-20 08:26:32.788157	2023-06-20 08:26:32.788157
360	172	6	2023-06-20 08:29:51.694104	2023-06-20 08:29:51.694104
361	172	9	2023-06-20 08:29:51.70033	2023-06-20 08:29:51.70033
362	172	13	2023-06-20 08:29:51.705702	2023-06-20 08:29:51.705702
375	185	8	2023-06-24 14:29:34.880815	2023-06-24 14:29:34.880815
376	185	13	2023-06-24 14:29:34.886218	2023-06-24 14:29:34.886218
377	186	8	2023-06-24 14:30:02.667862	2023-06-24 14:30:02.667862
378	186	13	2023-06-24 14:30:02.672537	2023-06-24 14:30:02.672537
379	187	8	2023-06-24 14:30:26.244568	2023-06-24 14:30:26.244568
380	187	13	2023-06-24 14:30:26.249279	2023-06-24 14:30:26.249279
381	188	8	2023-06-24 14:30:48.211555	2023-06-24 14:30:48.211555
382	188	13	2023-06-24 14:30:48.216215	2023-06-24 14:30:48.216215
383	189	8	2023-06-24 14:31:08.774749	2023-06-24 14:31:08.774749
384	189	13	2023-06-24 14:31:08.779476	2023-06-24 14:31:08.779476
385	190	8	2023-06-24 14:45:52.085664	2023-06-24 14:45:52.085664
386	190	13	2023-06-24 14:45:52.09163	2023-06-24 14:45:52.09163
387	191	8	2023-06-24 14:46:27.642348	2023-06-24 14:46:27.642348
388	191	13	2023-06-24 14:46:27.64722	2023-06-24 14:46:27.64722
389	192	8	2023-06-24 14:46:48.066977	2023-06-24 14:46:48.066977
390	192	13	2023-06-24 14:46:48.071154	2023-06-24 14:46:48.071154
391	193	8	2023-06-24 14:47:07.233476	2023-06-24 14:47:07.233476
392	193	13	2023-06-24 14:47:07.240417	2023-06-24 14:47:07.240417
393	194	8	2023-06-24 14:47:29.758614	2023-06-24 14:47:29.758614
394	194	13	2023-06-24 14:47:29.762862	2023-06-24 14:47:29.762862
395	190	12	2023-06-25 10:00:10.935107	2023-06-25 10:00:10.935107
396	195	4	2023-06-26 07:15:05.417195	2023-06-26 07:15:05.417195
397	195	13	2023-06-26 07:15:05.422693	2023-06-26 07:15:05.422693
398	196	4	2023-06-26 07:44:30.472339	2023-06-26 07:44:30.472339
399	196	13	2023-06-26 07:44:30.47852	2023-06-26 07:44:30.47852
400	197	4	2023-06-26 07:45:13.329907	2023-06-26 07:45:13.329907
401	197	13	2023-06-26 07:45:13.334377	2023-06-26 07:45:13.334377
402	64	4	2023-06-26 07:46:01.287704	2023-06-26 07:46:01.287704
403	64	13	2023-06-26 07:46:01.299925	2023-06-26 07:46:01.299925
404	3	4	2023-06-26 07:51:50.568734	2023-06-26 07:51:50.568734
405	3	13	2023-06-26 07:51:50.573949	2023-06-26 07:51:50.573949
406	198	4	2023-06-26 07:52:26.665163	2023-06-26 07:52:26.665163
407	198	13	2023-06-26 07:52:26.670121	2023-06-26 07:52:26.670121
408	199	4	2023-06-26 07:52:53.083806	2023-06-26 07:52:53.083806
409	199	13	2023-06-26 07:52:53.088689	2023-06-26 07:52:53.088689
410	200	4	2023-06-26 07:53:20.399267	2023-06-26 07:53:20.399267
411	200	13	2023-06-26 07:53:20.403732	2023-06-26 07:53:20.403732
412	201	4	2023-06-26 07:53:44.896002	2023-06-26 07:53:44.896002
413	201	13	2023-06-26 07:53:44.90047	2023-06-26 07:53:44.90047
414	23	5	2023-06-26 07:55:44.412353	2023-06-26 07:55:44.412353
415	23	12	2023-06-26 07:55:44.418935	2023-06-26 07:55:44.418935
419	203	4	2023-06-29 08:10:25.333378	2023-06-29 08:10:25.333378
420	203	8	2023-06-29 08:10:25.338606	2023-06-29 08:10:25.338606
421	203	11	2023-06-29 08:10:25.342903	2023-06-29 08:10:25.342903
422	203	13	2023-06-29 08:10:25.347087	2023-06-29 08:10:25.347087
423	204	5	2023-07-05 08:52:56.975908	2023-07-05 08:52:56.975908
424	204	10	2023-07-05 08:52:56.983638	2023-07-05 08:52:56.983638
425	204	12	2023-07-05 08:52:56.989197	2023-07-05 08:52:56.989197
426	204	13	2023-07-05 08:52:56.994232	2023-07-05 08:52:56.994232
427	205	7	2023-07-05 09:07:48.290652	2023-07-05 09:07:48.290652
428	205	13	2023-07-05 09:07:48.296696	2023-07-05 09:07:48.296696
429	206	7	2023-07-05 09:09:30.168931	2023-07-05 09:09:30.168931
430	206	13	2023-07-05 09:09:30.173892	2023-07-05 09:09:30.173892
431	207	7	2023-07-05 09:10:17.879328	2023-07-05 09:10:17.879328
432	207	13	2023-07-05 09:10:17.88513	2023-07-05 09:10:17.88513
433	208	7	2023-07-05 09:11:24.688418	2023-07-05 09:11:24.688418
434	208	13	2023-07-05 09:11:24.693967	2023-07-05 09:11:24.693967
435	209	7	2023-07-05 09:12:19.123044	2023-07-05 09:12:19.123044
436	209	13	2023-07-05 09:12:19.128794	2023-07-05 09:12:19.128794
437	210	3	2023-07-05 09:16:50.593081	2023-07-05 09:16:50.593081
438	210	12	2023-07-05 09:16:50.599826	2023-07-05 09:16:50.599826
439	210	13	2023-07-05 09:16:50.60457	2023-07-05 09:16:50.60457
440	208	11	2023-07-05 10:00:27.334946	2023-07-05 10:00:27.334946
441	211	4	2023-08-31 07:29:00.25681	2023-08-31 07:29:00.25681
442	211	9	2023-08-31 07:29:00.261858	2023-08-31 07:29:00.261858
443	211	12	2023-08-31 07:29:00.266097	2023-08-31 07:29:00.266097
444	212	1	2024-01-09 08:57:29.1559	2024-01-09 08:57:29.1559
445	212	2	2024-01-09 08:57:29.160031	2024-01-09 08:57:29.160031
446	212	3	2024-01-09 08:57:29.164562	2024-01-09 08:57:29.164562
447	212	4	2024-01-09 08:57:29.169008	2024-01-09 08:57:29.169008
448	212	5	2024-01-09 08:57:29.173569	2024-01-09 08:57:29.173569
449	212	6	2024-01-09 08:57:29.17807	2024-01-09 08:57:29.17807
450	212	7	2024-01-09 08:57:29.182177	2024-01-09 08:57:29.182177
451	212	8	2024-01-09 08:57:29.186295	2024-01-09 08:57:29.186295
452	212	9	2024-01-09 08:57:29.190574	2024-01-09 08:57:29.190574
453	212	10	2024-01-09 08:57:29.194534	2024-01-09 08:57:29.194534
454	212	11	2024-01-09 08:57:29.198772	2024-01-09 08:57:29.198772
455	212	13	2024-01-09 08:57:29.203048	2024-01-09 08:57:29.203048
\.


--
-- Data for Name: exercise_instances; Type: TABLE DATA; Schema: public; Owner: st_gym_user
--

COPY public.exercise_instances (id, block_id, exercise_id, repetitions, "time", created_at, updated_at, "position", tabata) FROM stdin;
1	4	5	10	30	2022-08-13 15:07:33.545098	2022-08-13 15:07:33.545098	1	f
3	6	5	10	30	2022-08-13 15:07:33.64112	2022-08-13 15:07:33.64112	1	f
4	7	7	10	30	2022-08-13 15:07:33.760248	2022-08-13 15:07:33.760248	1	f
5	8	1	10	30	2022-08-13 15:07:33.768369	2022-08-13 15:07:33.768369	1	f
6	9	7	10	30	2022-08-13 15:07:33.784027	2022-08-13 15:07:33.784027	1	f
9	15	2	10	30	2022-08-13 15:07:33.883562	2022-08-13 15:07:33.883562	1	f
14	26	3	10	30	2022-08-13 15:07:34.124923	2022-08-13 15:07:34.124923	1	f
48	25	19	10	60	2022-08-16 20:17:08.892234	2022-08-16 20:17:27.957344	3	t
99	50	8	20	30	2022-08-21 15:16:50.226522	2022-08-22 01:57:11.671005	2	f
67	43	25	20	30	2022-08-20 16:17:45.041995	2022-08-20 16:17:48.762087	5	f
16	28	3	10	30	2022-08-13 20:52:43.537279	2022-08-13 20:55:53.459545	1	f
71	44	32	12	30	2022-08-20 16:23:19.36353	2022-08-20 16:23:33.222907	4	f
13	25	6	10	50	2022-08-13 15:07:34.11867	2022-08-16 20:17:36.564418	1	t
19	29	6	10	90	2022-08-13 20:56:27.568157	2022-08-13 20:56:40.599944	1	t
49	26	3	10	30	2022-08-16 20:17:59.657417	2022-08-16 20:17:59.657417	2	f
2	5	5	10	60	2022-08-13 15:07:33.616357	2022-08-16 15:55:47.489197	1	t
20	30	6	10	90	2022-08-13 21:00:08.517472	2022-08-13 21:00:24.610486	1	t
50	25	20	10	60	2022-08-16 20:18:11.928783	2022-08-16 20:18:16.594898	4	t
69	44	29	16	30	2022-08-20 16:23:19.344597	2022-08-20 16:24:35.466454	3	f
70	44	35	10	30	2022-08-20 16:23:19.35241	2022-08-20 16:24:35.467614	2	t
36	36	14	10	30	2022-08-15 20:45:48.29236	2022-08-16 17:37:47.469777	1	t
33	36	13	10	30	2022-08-15 20:43:55.389529	2022-08-16 17:37:56.493711	4	t
98	50	5	10	30	2022-08-21 15:16:50.214561	2022-08-21 15:17:03.497169	1	f
51	27	15	10	30	2022-08-16 20:19:21.920305	2022-08-16 20:19:44.776488	1	t
35	36	12	10	30	2022-08-15 20:43:55.427686	2022-08-16 17:37:58.751277	3	t
53	27	12	10	30	2022-08-16 20:19:21.940846	2022-08-16 20:19:52.631882	3	t
21	30	4	40	30	2022-08-13 21:00:41.10846	2022-08-13 21:00:56.171875	2	f
22	30	10	18	30	2022-08-13 21:01:10.410243	2022-08-13 21:01:16.370946	3	f
72	45	7	10	30	2022-08-20 16:24:59.011241	2022-08-20 17:19:27.751626	1	f
38	36	15	10	30	2022-08-15 20:48:21.040095	2022-08-16 17:37:58.752902	2	t
23	31	9	16	30	2022-08-13 21:01:35.320185	2022-08-13 21:01:50.624853	1	f
30	34	11	20	30	2022-08-15 20:40:51.847277	2022-08-15 20:40:56.323422	1	f
39	37	4	10	30	2022-08-15 20:49:33.508172	2022-08-16 17:38:09.224517	4	t
42	38	6	10	90	2022-08-15 20:53:57.100426	2022-08-15 20:56:34.519454	1	t
41	37	17	10	30	2022-08-15 20:53:14.619159	2022-08-16 17:38:09.225878	3	t
125	55	11	12	30	2022-08-23 16:55:58.238459	2022-08-23 16:56:45.041312	2	f
40	37	16	10	30	2022-08-15 20:51:13.405238	2022-08-16 17:38:11.594504	1	t
31	35	5	14	30	2022-08-15 20:41:14.301969	2022-08-15 20:41:23.220114	1	f
37	37	9	10	30	2022-08-15 20:47:06.794235	2022-08-16 17:38:11.596098	2	t
176	70	5	20	30	2022-08-24 01:48:50.413461	2022-08-24 01:48:59.738522	1	f
138	58	4	20	30	2022-08-23 17:04:23.545674	2022-08-23 17:04:42.494714	2	f
84	47	21	10	30	2022-08-21 15:00:19.738911	2022-08-21 15:00:25.665047	1	f
118	1	44	10	30	2022-08-22 20:59:12.457282	2022-08-22 20:59:12.457282	1	f
32	35	5	14	30	2022-08-15 20:41:30.541411	2022-08-15 20:41:39.380399	2	f
45	38	18	10	90	2022-08-15 20:58:14.882244	2022-08-16 17:40:00.250109	2	t
124	55	23	16	30	2022-08-23 16:55:58.132091	2022-08-23 16:56:56.410519	3	f
46	38	19	10	90	2022-08-15 20:58:14.893485	2022-08-16 17:40:00.251401	3	t
82	47	31	6	30	2022-08-21 15:00:19.718555	2022-08-21 15:00:32.301773	2	f
81	47	27	12	30	2022-08-21 15:00:19.480226	2022-08-21 15:18:18.415587	4	f
47	25	18	10	60	2022-08-16 20:17:08.676213	2022-08-16 20:17:17.159055	2	t
127	56	12	10	40	2022-08-23 16:57:43.535132	2022-08-23 16:58:18.69087	1	t
92	48	25	12	30	2022-08-21 15:12:00.696461	2022-08-21 15:18:54.363204	4	f
83	47	9	12	30	2022-08-21 15:00:19.729232	2022-08-21 15:00:45.026102	3	f
131	56	5	10	30	2022-08-23 16:59:19.540993	2022-08-23 16:59:45.656928	2	f
163	66	43	12	30	2022-08-24 01:43:14.731801	2022-08-24 01:45:01.716234	2	f
97	50	30	12	30	2022-08-21 15:16:50.207277	2022-08-21 15:19:31.303292	4	f
101	50	32	12	30	2022-08-21 15:16:50.24812	2022-08-21 15:19:36.971494	3	f
137	58	8	20	30	2022-08-23 17:04:09.08413	2022-08-23 17:04:50.277895	4	f
55	41	1	100	30	2022-08-20 16:06:52.571688	2022-08-20 16:07:21.855632	1	f
189	29	37	10	30	2022-08-24 15:01:17.055929	2022-08-24 15:01:34.485824	2	f
202	82	19	10	30	2022-08-29 16:13:54.322415	2022-08-29 16:13:54.322415	3	t
156	64	49	12	30	2022-08-24 01:36:01.221628	2022-08-24 17:11:32.702637	2	f
157	64	50	12	30	2022-08-24 01:36:01.228788	2022-08-24 17:11:33.955062	1	f
165	67	31	10	30	2022-08-24 01:44:15.460896	2022-08-24 15:01:58.313809	2	f
164	67	23	10	30	2022-08-24 01:44:15.44337	2022-08-24 15:01:58.315712	1	f
171	68	12	10	40	2022-08-24 01:46:27.17467	2022-08-24 15:02:10.526463	2	t
200	82	7	10	30	2022-08-29 16:13:54.274296	2022-08-29 16:13:54.274296	1	f
201	82	18	10	30	2022-08-29 16:13:54.291981	2022-08-29 16:13:54.291981	2	t
203	82	4	12	30	2022-08-29 16:13:54.344702	2022-08-29 16:13:54.344702	4	f
208	84	8	30	30	2022-08-29 16:13:54.452902	2022-08-29 16:13:54.452902	1	f
206	83	23	16	30	2022-08-29 16:13:54.411828	2022-08-29 16:13:54.411828	2	f
205	83	22	10	30	2022-08-29 16:13:54.39832	2022-08-29 16:13:54.433425	5	t
207	83	28	14	30	2022-08-29 16:13:54.426026	2022-08-29 16:13:54.426026	4	f
209	84	10	16	30	2022-08-29 16:13:54.467912	2022-08-29 16:13:54.467912	2	f
210	84	26	12	30	2022-08-29 16:13:54.48785	2022-08-29 16:13:54.48785	3	f
211	84	21	16	30	2022-08-29 16:13:54.505665	2022-08-29 16:13:54.505665	4	f
10	19	8	18	30	2022-08-13 15:07:33.988067	2022-08-30 18:22:21.684639	2	t
212	85	25	20	30	2022-08-29 16:13:54.535914	2022-08-29 16:13:54.602565	9	f
17	28	10	16	30	2022-08-13 20:55:34.27993	2022-09-11 09:12:48.114338	2	f
254	97	31	10	30	2022-08-29 16:14:21.048528	2022-08-29 16:14:21.06749	3	f
68	44	38	20	30	2022-08-20 16:20:53.756813	2022-08-20 16:23:45.198031	1	f
255	97	21	10	30	2022-08-29 16:14:21.060846	2022-08-29 16:14:21.060846	1	f
74	45	18	10	30	2022-08-20 16:27:13.901142	2022-08-20 16:27:16.332395	2	t
75	45	19	10	30	2022-08-20 16:27:13.911428	2022-08-20 16:27:18.098944	3	t
76	45	4	12	30	2022-08-20 16:27:13.923906	2022-08-20 16:27:22.289651	4	f
126	55	11	12	30	2022-08-23 16:56:22.974181	2022-08-23 16:56:47.050619	1	f
59	42	8	30	30	2022-08-20 16:11:28.242708	2022-08-20 16:11:58.486417	1	f
60	42	10	16	30	2022-08-20 16:11:28.276837	2022-08-20 16:12:02.206071	2	f
167	66	29	16	30	2022-08-24 01:45:17.317421	2022-08-24 01:45:20.748006	3	f
57	41	22	10	30	2022-08-20 16:07:50.976542	2022-08-22 17:29:53.234834	3	t
56	41	23	16	30	2022-08-20 16:07:50.96649	2022-08-22 17:29:53.236062	2	f
61	42	26	12	30	2022-08-20 16:11:28.293999	2022-08-20 16:50:34.337028	3	f
62	42	21	16	30	2022-08-20 16:11:28.315657	2022-08-22 17:44:33.516443	4	f
102	46	34	10	30	2022-08-21 15:17:52.833286	2023-05-24 03:17:53.111232	2	f
120	1	6	10	30	2022-08-22 20:59:12.487964	2023-05-24 03:17:53.228057	2	f
1367	802	210	10	120	2023-07-05 09:16:50.607005	2023-07-05 09:17:03.711704	4	t
139	59	7	10	60	2022-08-23 17:45:52.957752	2022-08-23 17:48:26.797905	1	t
173	69	7	10	30	2022-08-24 01:47:27.120617	2022-08-24 01:47:30.353918	1	f
172	69	48	16	30	2022-08-24 01:47:27.113025	2022-08-24 01:47:36.767771	2	f
166	66	44	10	30	2022-08-24 01:44:49.037588	2022-08-24 17:38:31.348484	1	f
281	97	6	10	30	2022-08-29 20:19:18.111279	2022-08-29 20:19:18.111279	4	f
174	69	6	10	60	2022-08-24 01:47:27.13237	2022-08-24 17:44:19.951658	3	t
305	10	1	120	30	2022-08-30 19:52:41.419083	2022-08-31 07:15:46.133535	1	f
151	64	17	16	30	2022-08-24 01:33:28.675203	2022-08-24 01:36:22.467117	3	f
152	64	4	20	30	2022-08-24 01:33:28.690276	2022-08-24 01:36:22.467117	4	f
289	20	7	10	30	2022-08-30 10:51:10.648122	2022-08-30 10:51:10.648122	2	f
290	20	7	6	30	2022-08-30 10:51:18.949034	2022-08-30 10:51:25.424002	3	f
291	20	7	2	30	2022-08-30 10:51:32.513929	2022-08-30 10:51:35.65289	4	f
213	85	12	10	30	2022-08-29 16:13:54.550722	2022-08-29 16:13:54.550722	1	t
215	85	6	10	60	2022-08-29 16:13:54.581815	2022-08-29 16:13:54.581815	2	t
214	85	14	10	30	2022-08-29 16:13:54.567273	2022-08-29 16:13:54.602565	6	t
216	85	5	10	30	2022-08-29 16:13:54.594796	2022-08-29 16:13:54.594796	3	f
288	20	7	14	30	2022-08-30 10:50:55.254516	2022-08-30 10:51:46.797435	1	f
296	109	39	10	60	2022-08-30 11:01:42.130124	2022-08-31 07:13:11.13531	1	t
217	86	32	12	30	2022-08-29 16:13:54.625986	2022-08-29 16:13:54.680807	7	f
218	86	29	16	30	2022-08-29 16:13:54.645799	2022-08-29 16:13:54.680807	5	f
219	86	35	10	30	2022-08-29 16:13:54.660101	2022-08-29 16:13:54.680807	3	t
220	86	38	20	30	2022-08-29 16:13:54.673119	2022-08-29 16:13:54.673119	1	f
240	92	1	100	30	2022-08-29 16:14:20.79218	2022-08-29 16:14:20.79218	1	f
241	92	51	10	30	2022-08-29 16:14:20.803959	2022-08-29 16:14:20.803959	2	t
242	93	11	12	30	2022-08-29 16:14:20.830381	2022-08-29 16:14:20.860334	3	f
243	93	23	16	30	2022-08-29 16:14:20.842923	2022-08-29 16:14:20.860334	4	f
244	93	11	12	30	2022-08-29 16:14:20.855416	2022-08-29 16:14:20.855416	1	f
245	94	12	10	40	2022-08-29 16:14:20.885049	2022-08-29 16:14:20.885049	1	t
246	94	5	10	30	2022-08-29 16:14:20.898196	2022-08-29 16:14:20.898196	2	f
247	94	15	10	40	2022-08-29 16:14:20.913711	2022-08-29 16:14:20.913711	3	t
248	94	13	10	40	2022-08-29 16:14:20.926496	2022-08-29 16:14:20.926496	4	t
249	95	7	10	60	2022-08-29 16:14:20.952008	2022-08-29 16:14:20.952008	1	t
292	108	4	20	30	2022-08-30 10:59:40.460447	2022-08-30 10:59:56.562566	1	f
252	96	52	10	30	2022-08-29 16:14:21.003067	2022-08-29 16:14:21.003067	1	f
250	96	4	20	30	2022-08-29 16:14:20.976793	2022-08-29 16:14:21.029088	4	f
251	96	8	20	30	2022-08-29 16:14:20.989375	2022-08-29 16:14:21.029088	6	f
253	96	5	10	30	2022-08-29 16:14:21.022056	2022-08-29 16:14:21.022056	3	f
283	21	37	12	30	2022-08-30 10:45:36.793027	2022-08-30 18:21:47.181078	2	f
300	14	46	14	30	2022-08-30 18:54:33.930331	2022-08-30 18:55:08.627422	1	f
293	108	8	20	30	2022-08-30 11:00:05.169521	2022-08-30 11:00:12.385088	2	f
301	14	11	14	30	2022-08-30 18:54:33.939769	2022-10-12 12:16:21.464732	2	f
294	108	18	10	30	2022-08-30 11:00:49.829639	2022-08-30 11:00:52.623844	3	t
295	108	19	10	30	2022-08-30 11:00:49.839847	2022-08-30 11:00:54.037193	4	t
308	11	15	20	30	2022-08-30 20:38:26.741638	2022-08-31 07:16:26.333398	4	f
302	14	23	10	30	2022-08-30 18:55:26.554361	2022-08-30 18:55:33.214191	4	f
303	14	10	10	30	2022-08-30 18:55:26.567243	2022-10-12 12:16:21.466005	3	f
306	11	12	10	30	2022-08-30 20:37:31.042717	2022-08-30 20:38:34.657893	1	t
310	12	3	10	30	2022-08-30 20:39:32.719653	2022-08-30 20:39:32.719653	1	f
298	13	53	10	30	2022-08-30 18:51:50.760204	2022-10-12 12:16:12.512759	1	f
299	13	1	120	30	2022-08-30 18:52:10.611373	2022-10-12 12:16:12.51453	2	f
304	10	28	10	30	2022-08-30 19:51:35.494063	2022-08-31 07:16:04.237356	2	f
309	11	13	10	30	2022-08-30 20:38:26.752564	2022-08-30 20:38:48.095354	3	t
307	11	52	10	30	2022-08-30 20:37:46.747953	2022-08-30 20:37:46.747953	2	f
311	12	10	14	30	2022-08-30 20:39:45.93386	2022-08-30 20:39:47.661971	2	f
312	12	5	10	30	2022-08-30 20:39:58.538002	2022-08-30 20:39:58.538002	3	f
313	110	37	10	60	2022-08-30 20:41:22.757278	2022-08-30 20:41:27.210984	1	t
318	112	7	10	30	2022-08-31 07:04:17.582737	2022-08-31 07:04:17.638093	3	f
319	112	7	6	30	2022-08-31 07:04:17.598619	2022-08-31 07:04:17.638093	4	f
320	112	7	2	30	2022-08-31 07:04:17.615163	2022-08-31 07:04:17.638093	5	f
316	111	16	10	30	2022-08-31 07:04:17.527262	2022-08-31 07:06:06.584025	2	t
314	111	8	18	30	2022-08-31 07:04:17.49018	2022-08-31 07:06:06.587965	1	t
317	111	56	10	30	2022-08-31 07:04:17.550905	2022-08-31 07:07:11.045264	4	t
315	111	17	10	30	2022-08-31 07:04:17.50515	2022-08-31 07:07:11.046799	3	t
96	49	6	10	60	2022-08-21 15:13:21.296996	2022-08-21 15:13:44.808885	4	t
58	41	28	14	30	2022-08-20 16:08:33.634524	2022-08-20 16:08:36.332904	4	f
94	49	17	12	30	2022-08-21 15:13:21.274774	2022-08-21 15:13:49.097018	2	f
95	49	43	12	30	2022-08-21 15:13:21.286494	2022-08-21 15:13:51.558979	1	f
238	91	27	12	30	2022-08-29 16:14:05.954313	2022-08-29 16:14:05.972679	5	f
169	68	15	10	40	2022-08-24 01:45:57.482694	2022-08-24 15:02:10.5285	3	t
239	91	9	12	30	2022-08-29 16:14:05.96651	2022-08-29 16:14:05.96651	3	f
93	49	41	30	30	2022-08-21 15:13:21.264365	2022-08-21 16:18:16.998002	3	f
168	66	8	20	30	2022-08-24 01:45:55.509641	2022-08-24 01:46:02.157752	4	f
86	48	48	20	30	2022-08-21 15:06:12.703286	2022-08-21 16:42:29.940445	3	f
128	56	15	10	40	2022-08-23 16:58:14.776467	2022-08-23 16:59:45.655979	3	t
129	56	13	10	40	2022-08-23 16:58:14.783317	2022-08-23 16:59:45.655979	4	t
66	43	12	10	30	2022-08-20 16:14:18.074673	2022-08-20 16:17:23.820942	1	t
65	43	14	10	30	2022-08-20 16:14:18.066997	2022-08-20 16:18:21.446405	4	t
132	57	31	10	30	2022-08-23 17:00:30.117677	2022-08-23 17:00:39.017692	2	f
63	43	6	10	60	2022-08-20 16:14:18.045975	2022-08-20 20:23:34.844353	2	t
64	43	5	10	30	2022-08-20 16:14:18.053704	2022-08-20 20:23:34.856425	3	f
122	54	1	100	30	2022-08-23 16:41:13.066884	2022-08-23 16:41:36.4931	1	f
123	54	51	10	30	2022-08-23 16:44:08.232462	2022-08-23 16:44:13.749916	2	t
133	57	21	10	30	2022-08-23 17:00:30.124712	2022-08-23 17:00:39.021503	1	f
134	58	52	10	30	2022-08-23 17:03:30.596492	2022-08-23 17:03:30.596492	1	f
135	58	5	10	30	2022-08-23 17:03:56.271684	2022-08-23 17:04:30.901555	3	f
1225	685	7	16	30	2023-05-29 02:04:02.84978	2023-05-29 02:04:20.986097	1	f
258	98	53	12	30	2022-08-29 16:14:32.062737	2022-08-29 16:14:32.062737	1	f
1226	685	7	10	30	2023-05-29 02:04:35.361945	2023-05-29 02:04:35.361945	2	f
271	102	7	10	30	2022-08-29 16:14:32.293191	2022-08-29 16:14:32.293191	1	f
260	99	50	12	30	2022-08-29 16:14:32.106393	2022-08-29 16:14:32.106393	1	f
170	68	20	10	90	2022-08-24 01:45:57.49312	2022-08-24 01:46:14.889289	1	t
89	48	12	10	30	2022-08-21 15:06:12.731375	2022-08-21 15:09:47.051154	1	t
272	102	48	16	30	2022-08-29 16:14:32.308583	2022-08-29 16:14:32.308583	2	f
1227	685	7	6	30	2023-05-29 02:04:45.417257	2023-05-29 02:04:48.979725	3	f
1256	714	137	10	30	2023-06-11 11:30:47.067321	2023-06-11 11:30:47.067321	1	f
1257	714	161	10	30	2023-06-11 11:30:47.123458	2023-06-11 11:30:47.123458	2	f
155	63	53	12	30	2022-08-24 01:34:04.703348	2022-08-24 01:35:21.148787	1	f
223	87	12	10	30	2022-08-29 16:14:05.698219	2022-08-29 16:14:05.698219	1	t
88	48	37	16	30	2022-08-21 15:06:12.721766	2022-08-21 15:10:22.046202	2	f
221	87	25	12	30	2022-08-29 16:14:05.675143	2022-08-29 16:14:05.716299	7	f
222	87	48	20	30	2022-08-29 16:14:05.68672	2022-08-29 16:14:05.716299	5	f
224	87	37	16	30	2022-08-29 16:14:05.710151	2022-08-29 16:14:05.710151	2	f
159	65	38	10	30	2022-08-24 01:38:27.923968	2022-08-24 01:38:36.18359	2	t
160	65	37	10	30	2022-08-24 01:38:27.932465	2022-08-24 01:38:47.28387	4	t
161	65	16	10	30	2022-08-24 01:38:27.942404	2022-08-24 01:38:54.431306	3	t
158	65	41	30	30	2022-08-24 01:37:24.761894	2022-08-24 01:39:11.463896	1	t
230	89	43	12	30	2022-08-29 16:14:05.819187	2022-08-29 16:14:05.819187	1	f
228	89	6	10	60	2022-08-29 16:14:05.790578	2022-08-29 16:14:05.83855	7	t
229	89	17	12	30	2022-08-29 16:14:05.805916	2022-08-29 16:14:05.83855	4	f
231	89	41	30	30	2022-08-29 16:14:05.832853	2022-08-29 16:14:05.832853	3	f
273	102	6	10	60	2022-08-29 16:14:32.328028	2022-08-29 16:14:32.328028	3	t
233	90	5	10	30	2022-08-29 16:14:05.873915	2022-08-29 16:14:05.873915	1	f
232	90	8	20	30	2022-08-29 16:14:05.860238	2022-08-29 16:14:05.908216	4	f
234	90	30	12	30	2022-08-29 16:14:05.885985	2022-08-29 16:14:05.908216	5	f
235	90	32	12	30	2022-08-29 16:14:05.899528	2022-08-29 16:14:05.899528	3	f
236	91	21	10	30	2022-08-29 16:14:05.929672	2022-08-29 16:14:05.929672	1	f
237	91	31	6	30	2022-08-29 16:14:05.942647	2022-08-29 16:14:05.942647	2	f
263	100	38	10	30	2022-08-29 16:14:32.152492	2022-08-29 16:14:32.198146	3	t
264	100	37	10	30	2022-08-29 16:14:32.164834	2022-08-29 16:14:32.198146	6	t
265	100	16	10	30	2022-08-29 16:14:32.178161	2022-08-29 16:14:32.198146	4	t
266	100	41	30	30	2022-08-29 16:14:32.190419	2022-08-29 16:14:32.190419	1	t
267	101	43	12	30	2022-08-29 16:14:32.223037	2022-08-29 16:14:32.261497	3	f
274	103	5	20	30	2022-08-29 16:14:32.355588	2022-08-29 16:14:32.355588	1	f
269	101	44	10	30	2022-08-29 16:14:32.253906	2022-08-29 16:14:32.253906	1	f
268	101	29	16	30	2022-08-29 16:14:32.239879	2022-08-29 16:14:32.274117	5	f
270	101	8	20	30	2022-08-29 16:14:32.267463	2022-08-29 16:14:32.267463	4	f
282	21	1	120	30	2022-08-30 10:44:23.623898	2022-08-30 10:44:40.468645	1	f
285	19	17	10	30	2022-08-30 10:46:47.93264	2022-08-30 18:22:12.777576	3	t
284	19	16	10	30	2022-08-30 10:46:38.322986	2022-08-30 18:22:21.68626	1	t
286	19	56	10	30	2022-08-30 10:49:04.933794	2022-08-30 18:22:12.778948	4	t
321	112	7	14	30	2022-08-31 07:04:17.630687	2022-08-31 07:04:17.630687	1	f
322	113	37	12	30	2022-08-31 07:04:17.69668	2022-08-31 07:04:17.722349	3	f
323	113	1	120	30	2022-08-31 07:04:17.713999	2022-08-31 07:04:17.713999	1	f
324	114	4	20	30	2022-08-31 07:04:17.746246	2022-08-31 07:04:17.746246	1	f
325	114	8	20	30	2022-08-31 07:04:17.760908	2022-08-31 07:04:17.760908	2	f
326	114	18	10	30	2022-08-31 07:04:17.775758	2022-08-31 07:04:17.775758	3	t
327	114	19	10	30	2022-08-31 07:04:17.790289	2022-08-31 07:04:17.790289	4	t
328	115	39	10	60	2022-08-31 07:04:17.816872	2022-08-31 07:10:18.899288	2	t
364	126	48	16	30	2022-08-31 07:54:06.120398	2022-08-31 07:54:35.65845	2	f
329	115	37	10	60	2022-08-31 07:04:17.830403	2022-08-31 07:10:54.642269	1	t
330	116	4	20	30	2022-08-31 07:11:06.045954	2022-08-31 07:11:06.045954	1	f
331	116	8	20	30	2022-08-31 07:11:06.060684	2022-08-31 07:11:06.060684	2	f
332	116	18	10	30	2022-08-31 07:11:06.075911	2022-08-31 07:11:06.075911	3	t
333	116	19	10	30	2022-08-31 07:11:06.092468	2022-08-31 07:11:06.092468	4	t
334	117	8	18	30	2022-08-31 07:11:06.124226	2022-08-31 07:11:06.124226	1	t
336	117	16	10	30	2022-08-31 07:11:06.155616	2022-08-31 07:11:06.155616	2	t
335	117	17	10	30	2022-08-31 07:11:06.139759	2022-08-31 07:11:06.179952	5	t
337	117	56	10	30	2022-08-31 07:11:06.17281	2022-08-31 07:11:06.17281	4	t
338	118	37	12	30	2022-08-31 07:11:06.203808	2022-08-31 07:11:06.228358	4	f
339	118	1	120	30	2022-08-31 07:11:06.22071	2022-08-31 07:11:06.22071	1	f
340	119	7	10	30	2022-08-31 07:11:06.251553	2022-08-31 07:11:06.306005	4	f
341	119	7	6	30	2022-08-31 07:11:06.269615	2022-08-31 07:11:06.306005	5	f
342	119	7	2	30	2022-08-31 07:11:06.283914	2022-08-31 07:11:06.306005	6	f
343	119	7	14	30	2022-08-31 07:11:06.298388	2022-08-31 07:11:06.298388	1	f
344	120	39	10	60	2022-08-31 07:11:06.335858	2022-08-31 07:11:06.36068	3	t
345	120	37	10	60	2022-08-31 07:11:06.353523	2022-08-31 07:11:06.353523	1	t
297	109	37	10	60	2022-08-30 11:01:42.142398	2022-08-31 07:13:11.13413	2	t
373	130	29	20	30	2022-09-03 08:36:43.209253	2022-09-03 08:37:29.524148	2	f
365	126	29	20	30	2022-08-31 07:54:22.472191	2022-08-31 07:54:49.029991	3	f
385	136	52	10	30	2022-09-18 12:48:31.989831	2022-09-18 12:49:22.937907	2	f
204	83	1	82	30	2022-08-29 16:13:54.382218	2022-09-02 19:02:21.692761	1	f
369	128	5	10	30	2022-09-03 08:33:58.341302	2022-09-03 08:33:58.341302	3	f
374	130	4	20	30	2022-09-03 08:36:43.219587	2022-09-03 08:37:41.629945	3	f
386	136	5	10	30	2022-09-18 12:48:31.996699	2022-09-18 12:49:22.938768	1	f
362	110	38	10	60	2022-08-31 07:46:48.308237	2022-08-31 07:46:55.323599	2	t
366	126	56	10	30	2022-08-31 07:54:22.486605	2022-08-31 07:54:22.486605	4	f
368	128	10	16	30	2022-09-03 08:33:52.33936	2022-09-03 08:34:10.151041	2	f
363	126	8	30	30	2022-08-31 07:53:56.564977	2022-08-31 07:54:29.871173	1	f
370	129	12	10	60	2022-09-03 08:34:36.350029	2022-09-03 08:35:44.819262	1	t
371	129	15	10	60	2022-09-03 08:35:12.354783	2022-09-03 08:35:50.821475	2	t
377	131	3	6	30	2022-09-03 08:38:14.010906	2022-09-03 11:17:17.142242	1	f
375	129	13	10	60	2022-09-03 08:36:52.80267	2022-09-03 08:36:57.469236	3	t
376	130	56	10	30	2022-09-03 08:37:09.486554	2022-09-03 08:37:09.486554	4	f
372	130	8	30	30	2022-09-03 08:36:30.026737	2022-09-03 08:37:22.722487	1	f
367	128	3	6	30	2022-09-03 08:33:38.338895	2022-09-04 08:40:06.784641	1	f
18	28	5	10	30	2022-08-13 20:56:00.517448	2022-09-11 09:12:48.116223	3	f
384	135	1	100	30	2022-09-18 12:46:38.912815	2022-09-18 12:50:19.611827	1	f
383	135	21	12	30	2022-09-18 12:44:12.1879	2022-09-18 12:50:40.427291	2	f
387	137	6	10	60	2022-09-18 12:51:52.694888	2022-09-18 12:51:58.842677	1	t
388	137	12	10	30	2022-09-18 12:52:05.898765	2022-09-18 12:52:07.972063	2	t
389	137	15	10	30	2022-09-18 12:52:39.276083	2022-09-18 12:52:42.374821	3	t
390	137	13	10	30	2022-09-18 12:52:39.28275	2022-09-18 12:52:43.903649	4	t
393	138	17	20	30	2022-09-18 12:53:48.61907	2022-09-18 12:54:05.418603	3	f
395	139	7	12	30	2022-09-18 12:56:22.602299	2022-09-18 12:56:28.501283	1	f
391	138	56	20	30	2022-09-18 12:53:21.538018	2022-09-18 15:55:08.18402	1	f
429	158	48	16	30	2022-09-27 06:05:54.112633	2022-09-28 19:06:07.443996	3	t
430	158	56	10	30	2022-09-27 06:06:44.882971	2022-09-28 19:06:10.916835	1	t
428	158	8	10	30	2022-09-27 06:05:42.62809	2022-09-28 19:06:15.103925	4	t
1258	714	98	10	30	2023-06-11 11:30:47.14421	2023-06-11 11:30:47.14421	3	f
1259	714	148	10	30	2023-06-11 11:30:47.174951	2023-06-11 11:30:47.174951	4	f
1260	714	134	10	30	2023-06-11 11:30:47.214594	2023-06-11 11:30:47.214594	5	f
427	158	4	10	30	2022-09-27 06:05:26.661063	2022-09-28 19:06:19.494829	2	t
480	185	15	10	30	2022-10-04 08:23:03.398508	2022-10-04 08:23:03.398508	3	t
481	185	13	10	30	2022-10-04 08:23:03.428351	2022-10-04 08:23:03.428351	4	t
394	138	48	16	30	2022-09-18 12:55:24.79841	2022-09-18 12:56:01.018867	4	f
396	139	7	10	30	2022-09-18 12:56:35.192311	2022-09-18 12:56:35.192311	2	f
397	139	7	8	30	2022-09-18 12:56:43.184627	2022-09-18 12:56:44.351679	3	f
398	140	52	10	30	2022-09-18 13:03:23.275473	2022-09-18 13:03:23.294458	3	f
399	140	5	10	30	2022-09-18 13:03:23.288211	2022-09-18 13:03:23.288211	1	f
400	141	1	100	30	2022-09-18 13:03:23.312873	2022-09-18 13:03:23.312873	1	f
401	141	21	12	30	2022-09-18 13:03:23.325392	2022-09-18 13:03:23.325392	2	f
402	142	6	10	60	2022-09-18 13:03:23.354276	2022-09-18 13:03:23.354276	1	t
403	142	12	10	30	2022-09-18 13:03:23.368686	2022-09-18 13:03:23.368686	2	t
404	142	15	10	30	2022-09-18 13:03:23.379302	2022-09-18 13:03:23.379302	3	t
405	142	13	10	30	2022-09-18 13:03:23.389749	2022-09-18 13:03:23.389749	4	t
406	143	7	12	30	2022-09-18 13:03:23.411033	2022-09-18 13:03:23.411033	1	f
407	143	7	10	30	2022-09-18 13:03:23.421143	2022-09-18 13:03:23.421143	2	f
408	143	7	8	30	2022-09-18 13:03:23.4315	2022-09-18 13:03:23.4315	3	f
409	144	56	12	30	2022-09-18 13:03:23.457379	2022-09-18 13:03:23.457379	1	f
482	186	7	12	30	2022-10-04 08:23:03.476875	2022-10-04 08:23:03.476875	1	f
411	144	8	30	30	2022-09-18 13:03:23.480284	2022-09-18 13:03:23.480284	2	f
410	144	17	20	30	2022-09-18 13:03:23.469546	2022-09-18 13:03:23.498336	5	f
412	144	48	16	30	2022-09-18 13:03:23.492428	2022-09-18 13:03:23.492428	4	f
392	138	8	40	30	2022-09-18 12:53:34.139622	2022-09-18 15:55:14.81758	2	f
459	174	3	10	30	2022-09-30 06:31:28.370822	2022-09-30 06:31:28.370822	1	f
460	174	5	10	30	2022-09-30 06:31:39.381409	2022-09-30 06:31:39.381409	2	f
483	186	7	10	30	2022-10-04 08:23:03.4917	2022-10-04 08:23:03.4917	2	f
467	178	29	10	30	2022-10-02 16:03:17.244587	2022-10-02 16:08:45.854026	3	f
461	174	31	18	30	2022-09-30 06:31:59.051534	2022-09-30 06:32:02.47846	3	f
468	178	36	20	30	2022-10-02 16:03:17.255731	2022-10-02 16:08:45.854026	2	f
465	178	2	10	30	2022-10-02 15:58:13.730886	2022-10-02 16:07:36.970771	1	t
474	183	52	10	30	2022-10-04 08:23:03.087251	2022-10-04 08:23:03.22475	3	f
475	183	5	10	30	2022-10-04 08:23:03.218004	2022-10-04 08:23:03.218004	1	f
484	186	7	8	30	2022-10-04 08:23:03.516955	2022-10-04 08:23:03.516955	3	f
485	187	56	20	30	2022-10-04 08:23:03.564506	2022-10-04 08:23:03.564506	1	f
478	185	6	10	60	2022-10-04 08:23:03.366811	2022-10-04 08:23:03.366811	1	t
479	185	12	10	30	2022-10-04 08:23:03.382801	2022-10-04 08:23:03.382801	2	t
487	187	8	40	30	2022-10-04 08:23:03.621728	2022-10-04 08:23:03.621728	2	f
486	187	17	20	30	2022-10-04 08:23:03.607362	2022-10-04 08:23:03.643525	5	f
488	187	48	16	30	2022-10-04 08:23:03.636022	2022-10-04 08:23:03.636022	4	f
489	184	61	2	30	2022-10-04 08:25:05.168022	2022-10-04 08:25:19.29356	1	f
490	183	3	6	30	2022-10-04 08:25:51.977137	2022-10-04 08:25:56.752444	4	f
494	190	62	10	60	2022-10-05 13:20:22.599249	2022-10-05 13:20:50.042804	1	t
495	190	63	10	60	2022-10-05 13:20:27.771724	2022-10-05 13:21:51.190648	2	t
496	190	64	10	60	2022-10-05 13:20:37.95319	2022-10-05 13:23:33.309703	3	t
497	190	65	10	60	2022-10-05 13:20:44.037354	2022-10-05 13:23:36.897677	4	t
540	235	3	10	30	2022-10-15 08:43:29.352346	2022-10-15 08:43:29.352346	1	f
541	235	95	14	30	2022-10-15 09:05:05.377696	2022-10-15 09:05:15.087692	2	f
542	236	32	16	30	2022-10-15 09:05:38.367887	2022-10-15 09:05:42.171741	1	f
543	236	96	16	30	2022-10-15 09:06:46.157441	2022-10-15 09:06:50.577497	2	f
544	237	6	10	60	2022-10-15 09:08:17.105176	2022-10-15 09:08:22.254398	1	t
545	237	20	10	60	2022-10-15 09:08:30.58545	2022-10-15 09:08:34.251729	2	t
546	237	49	10	30	2022-10-15 09:09:01.580012	2022-10-15 09:09:26.539299	6	f
549	237	19	10	60	2022-10-15 09:09:01.671743	2022-10-15 09:09:36.43706	3	t
550	238	41	30	30	2022-10-15 09:10:02.715762	2022-10-15 09:10:08.950628	1	f
551	239	5	14	30	2022-10-15 09:11:26.675433	2022-10-15 09:11:40.763797	1	f
552	239	5	10	30	2022-10-15 09:11:33.036329	2022-10-15 09:11:46.038085	2	f
553	239	5	6	30	2022-10-15 09:11:38.241133	2022-10-15 09:11:49.159936	3	f
575	249	52	10	30	2022-10-22 08:52:28.050341	2022-10-22 08:52:34.890736	2	f
577	250	12	10	30	2022-10-22 08:53:29.300825	2022-10-22 08:55:07.035135	1	t
578	250	15	10	30	2022-10-22 08:54:58.005159	2022-10-22 08:55:07.838953	2	t
579	250	14	10	30	2022-10-22 08:54:58.014091	2022-10-22 08:55:08.492258	3	t
580	250	13	10	30	2022-10-22 08:55:03.526648	2022-10-22 08:55:09.189856	4	t
583	251	34	16	30	2022-10-22 08:56:32.734524	2022-10-22 08:56:52.418262	3	f
581	251	23	14	30	2022-10-22 08:55:58.395222	2022-10-22 08:56:37.514338	1	f
576	249	95	20	30	2022-10-22 08:52:50.613162	2022-10-22 09:00:14.651031	3	f
582	251	31	14	30	2022-10-22 08:55:58.404855	2022-10-22 08:56:41.427599	2	f
584	252	61	2	30	2022-10-22 08:57:32.925021	2022-10-22 08:57:37.499212	1	f
585	253	38	10	30	2022-10-22 08:58:37.741963	2022-10-22 08:58:40.225161	1	t
572	249	3	6	30	2022-10-22 08:50:24.462411	2022-10-22 09:00:06.636651	1	f
261	99	17	16	30	2022-08-29 16:14:32.118062	2022-10-26 07:19:00.44162	4	f
262	99	4	20	30	2022-08-29 16:14:32.129733	2022-10-26 07:19:00.44162	5	f
259	99	49	12	30	2022-08-29 16:14:32.093139	2022-10-26 07:19:00.442926	2	f
595	263	3	8	30	2022-11-01 08:40:22.99995	2022-11-01 08:40:25.058295	1	f
596	263	5	10	30	2022-11-01 08:40:34.11635	2022-11-01 08:40:34.11635	2	f
597	263	10	10	30	2022-11-01 08:40:44.72457	2022-11-01 08:40:44.72457	3	f
594	262	61	2	30	2022-11-01 08:39:20.216362	2022-11-01 08:39:26.342166	1	f
600	265	41	30	30	2022-11-03 05:56:54.54056	2022-11-10 08:16:16.656666	2	f
547	237	50	10	30	2022-10-15 09:09:01.602036	2022-11-11 07:48:03.935287	5	f
606	266	5	10	30	2022-11-03 06:02:08.164725	2022-11-03 06:02:08.164725	2	f
605	266	95	20	30	2022-11-03 06:01:59.970266	2022-11-03 06:02:13.184839	1	f
604	265	11	10	30	2022-11-03 06:00:34.226984	2022-11-10 08:16:16.657967	1	f
609	269	1	100	30	2022-11-06 07:14:39.95955	2022-11-06 07:14:39.95955	1	f
608	268	38	10	60	2022-11-03 06:05:05.272825	2022-11-03 06:05:21.95682	1	t
610	269	21	12	30	2022-11-06 07:14:39.986262	2022-11-06 07:14:39.986262	2	f
611	270	6	10	60	2022-11-06 07:14:40.037141	2022-11-06 07:14:40.037141	1	t
612	270	12	10	30	2022-11-06 07:14:40.062455	2022-11-06 07:14:40.062455	2	t
613	270	15	10	30	2022-11-06 07:14:40.076116	2022-11-06 07:14:40.076116	3	t
548	237	18	10	60	2022-10-15 09:09:01.620446	2022-11-11 07:48:03.936573	4	t
614	270	13	10	30	2022-11-06 07:14:40.089984	2022-11-06 07:14:40.089984	4	t
615	271	52	10	30	2022-11-06 07:14:40.118093	2022-11-06 07:14:40.139539	4	f
616	271	5	10	30	2022-11-06 07:14:40.132269	2022-11-06 07:14:40.132269	1	f
617	272	7	12	30	2022-11-06 07:14:40.159669	2022-11-06 07:14:40.159669	1	f
618	272	7	10	30	2022-11-06 07:14:40.17475	2022-11-06 07:14:40.17475	2	f
619	272	7	8	30	2022-11-06 07:14:40.188841	2022-11-06 07:14:40.188841	3	f
622	273	17	20	30	2022-11-06 07:14:40.250916	2022-11-06 07:14:40.272319	6	f
623	273	48	16	30	2022-11-06 07:14:40.265092	2022-11-06 07:14:40.265092	4	f
650	288	18	10	60	2022-11-11 07:48:14.420446	2022-11-11 08:10:57.670472	5	t
647	288	50	10	30	2022-11-11 07:48:14.382817	2022-11-11 08:10:57.671578	4	f
620	273	56	24	30	2022-11-06 07:14:40.222209	2022-11-06 09:00:28.894945	1	f
645	288	6	10	60	2022-11-11 07:48:14.357437	2022-11-12 15:36:57.111533	1	t
621	273	8	40	30	2022-11-06 07:14:40.235229	2022-11-06 09:01:07.667297	2	f
607	267	61	4	30	2022-11-03 06:02:51.702445	2022-11-08 10:15:38.943803	1	f
812	398	7	10	30	2022-12-30 09:51:29.861286	2022-12-30 09:51:29.861286	2	f
598	264	3	6	30	2022-11-03 05:55:18.345297	2022-11-09 09:56:17.364972	2	f
599	264	7	6	30	2022-11-03 05:56:04.440593	2022-11-09 09:56:17.366431	1	f
678	315	3	10	30	2022-11-22 15:43:58.316082	2022-11-22 15:43:58.316082	1	f
679	315	95	20	30	2022-11-22 15:44:11.895226	2022-11-22 15:44:15.752227	2	f
640	285	3	10	30	2022-11-11 07:48:14.251419	2022-11-11 07:48:14.251419	1	f
641	285	95	14	30	2022-11-11 07:48:14.26364	2022-11-11 07:48:14.26364	2	f
642	286	32	16	30	2022-11-11 07:48:14.295149	2022-11-11 07:48:14.295149	1	f
643	286	96	16	30	2022-11-11 07:48:14.306622	2022-11-11 07:48:14.306622	2	f
646	288	20	10	60	2022-11-11 07:48:14.370129	2022-11-11 07:48:14.370129	2	t
649	288	19	10	60	2022-11-11 07:48:14.409556	2022-11-11 07:48:14.409556	3	t
648	288	49	10	30	2022-11-11 07:48:14.396988	2022-11-11 07:48:14.425931	8	f
654	290	7	20	30	2022-11-11 07:49:35.674262	2022-11-11 07:49:40.55915	1	f
652	289	5	10	30	2022-11-11 07:48:14.457529	2022-11-11 07:49:51.454519	1	f
653	289	5	6	30	2022-11-11 07:48:14.47133	2022-11-11 07:49:51.454519	2	f
680	316	4	16	30	2022-11-22 15:45:17.958348	2022-11-22 15:45:31.69036	1	f
681	316	9	10	30	2022-11-22 15:45:45.203664	2022-11-22 15:45:45.203664	2	f
682	317	5	20	30	2022-11-22 15:46:26.682572	2022-11-22 15:46:31.836258	1	f
683	317	5	16	30	2022-11-22 15:46:38.568929	2022-11-22 15:46:47.865425	2	f
684	317	5	14	30	2022-11-22 15:46:54.5979	2022-11-22 15:46:57.890791	3	f
811	398	7	12	30	2022-12-30 09:51:23.963103	2022-12-30 09:51:38.494258	1	f
813	398	7	8	30	2022-12-30 09:51:35.391476	2022-12-30 09:51:40.865725	3	f
1370	803	207	12	30	2023-07-05 09:17:57.928624	2023-07-05 09:18:30.268747	3	f
1371	803	208	10	60	2023-07-05 09:18:15.371383	2023-07-05 09:18:36.889904	4	t
825	407	46	10	30	2023-01-06 07:41:13.807075	2023-01-06 07:41:13.807075	3	f
826	407	28	10	30	2023-01-06 07:41:13.838771	2023-01-06 07:41:13.838771	4	f
827	408	3	6	30	2023-01-06 07:41:13.890701	2023-01-06 07:41:13.890701	1	f
828	408	5	12	30	2023-01-06 07:41:13.911048	2023-01-06 07:41:13.911048	2	f
829	408	96	16	30	2023-01-06 07:41:13.938797	2023-01-06 07:41:13.938797	3	f
832	409	8	30	30	2023-01-06 07:41:14.029147	2023-01-06 07:41:14.029147	1	f
833	409	4	20	30	2023-01-06 07:41:14.048522	2023-01-06 07:41:14.048522	2	f
677	314	61	10	240	2022-11-22 15:43:06.012941	2022-11-25 09:53:23.017216	1	t
837	409	56	20	30	2023-01-06 07:42:56.305771	2023-01-06 07:43:08.583868	3	f
838	409	17	10	30	2023-01-06 07:43:19.202061	2023-01-06 07:43:19.202061	4	f
839	407	41	40	30	2023-01-06 07:43:46.430891	2023-01-06 07:43:58.392979	5	f
834	410	7	10	30	2023-01-06 07:41:14.090042	2023-01-06 07:44:11.658317	2	f
835	410	7	8	30	2023-01-06 07:41:14.117996	2023-01-06 07:44:11.658317	3	f
840	411	13	10	30	2023-01-06 07:45:00.777486	2023-01-06 07:45:14.600349	1	t
841	411	15	20	30	2023-01-06 07:45:11.635283	2023-01-06 07:45:20.791914	2	f
842	411	12	10	30	2023-01-06 07:45:31.57913	2023-01-06 07:45:32.992684	3	t
823	407	61	2	30	2023-01-06 07:41:13.758497	2023-01-06 09:17:09.188474	2	f
824	407	46	10	30	2023-01-06 07:41:13.780001	2023-01-06 09:17:09.191264	1	f
52	27	14	10	30	2022-08-16 20:19:21.929969	2022-12-06 12:54:06.067499	2	t
883	441	5	10	30	2023-02-04 13:54:35.286538	2023-02-04 13:54:35.286538	1	f
885	441	98	10	30	2023-02-04 13:56:35.305592	2023-02-04 13:56:35.305592	3	f
886	441	99	10	30	2023-02-04 13:56:35.348656	2023-02-04 13:56:35.348656	4	f
889	443	7	10	30	2023-02-04 13:58:10.602878	2023-02-04 13:58:10.602878	1	f
882	440	97	10	30	2023-02-04 13:53:43.665279	2023-02-04 13:53:43.665279	3	f
880	440	10	14	30	2023-02-04 13:50:34.073493	2023-02-04 14:00:52.353296	1	f
888	442	6	10	60	2023-02-04 13:57:52.42181	2023-02-04 13:58:44.085856	2	t
1084	620	12	10	30	2023-05-07 03:35:26.566388	2023-05-07 03:37:39.742118	2	t
1085	620	56	10	30	2023-05-07 03:35:34.471732	2023-05-07 03:37:39.742118	3	t
881	440	34	20	30	2023-02-04 13:51:38.088808	2023-02-04 14:00:55.822564	2	f
1086	620	8	30	30	2023-05-07 03:36:20.538952	2023-05-07 03:37:39.742118	5	f
1087	620	26	16	30	2023-05-07 03:36:20.56144	2023-05-07 03:37:39.742118	4	f
1102	628	20	10	30	2023-05-09 06:12:54.028116	2023-05-09 06:13:05.336632	1	t
1103	628	13	10	30	2023-05-09 06:12:54.046448	2023-05-09 06:13:09.195051	2	t
887	442	27	26	30	2023-02-04 13:57:46.250974	2023-02-04 13:59:29.859491	1	f
1104	628	14	10	30	2023-05-09 06:12:54.058291	2023-05-09 06:13:11.522496	3	t
884	441	3	6	30	2023-02-04 13:54:46.387451	2023-02-04 14:00:36.072033	2	f
1105	629	52	10	30	2023-05-09 06:13:39.84125	2023-05-09 06:13:39.84125	1	f
1112	631	7	10	30	2023-05-09 06:17:56.375577	2023-05-09 06:17:56.375577	1	f
1126	639	24	10	30	2023-05-11 14:13:34.863783	2023-05-11 14:13:34.863783	1	f
1127	639	48	10	30	2023-05-11 14:13:34.885829	2023-05-11 14:13:34.885829	2	f
1128	639	9	10	30	2023-05-11 14:13:34.901381	2023-05-11 14:13:34.901381	3	f
1129	639	16	10	30	2023-05-11 14:13:34.917804	2023-05-11 14:13:34.917804	4	f
1130	640	7	10	30	2023-05-11 14:13:53.020618	2023-05-11 14:13:53.020618	1	f
808	397	8	30	30	2022-12-30 09:50:18.717207	2022-12-30 09:50:38.949996	1	f
800	395	61	2	30	2022-12-30 09:44:58.158911	2022-12-30 09:45:05.508045	1	f
1124	638	15	10	40	2023-05-11 14:12:26.981977	2023-05-24 03:17:53.256473	1	t
1125	638	12	10	40	2023-05-11 14:12:27.249561	2023-05-24 03:17:53.256473	2	t
927	481	10	14	30	2023-02-17 15:04:30.581296	2023-02-17 15:04:30.581296	1	f
928	481	34	20	30	2023-02-17 15:04:30.604075	2023-02-17 15:04:30.604075	2	f
801	395	46	10	30	2022-12-30 09:45:32.751579	2022-12-30 09:45:32.751579	2	f
802	395	46	10	30	2022-12-30 09:45:55.305687	2022-12-30 09:45:55.305687	3	f
803	395	28	10	30	2022-12-30 09:46:09.17737	2022-12-30 09:46:09.17737	4	f
929	481	97	10	30	2023-02-17 15:04:30.622868	2023-02-17 15:04:30.622868	3	f
804	396	3	6	30	2022-12-30 09:46:34.044221	2022-12-30 09:46:36.823448	1	f
805	396	5	12	30	2022-12-30 09:46:48.87238	2022-12-30 09:47:53.73973	2	f
930	482	5	10	30	2023-02-17 15:04:30.664386	2023-02-17 15:04:30.664386	1	f
931	482	3	6	30	2023-02-17 15:04:30.683229	2023-02-17 15:04:30.683229	2	f
806	396	96	16	30	2022-12-30 09:47:46.947519	2022-12-30 09:47:56.638926	3	f
932	482	98	10	30	2023-02-17 15:04:30.703563	2023-02-17 15:04:30.703563	3	f
809	397	4	20	30	2022-12-30 09:50:18.731001	2022-12-30 09:50:45.244232	2	f
807	397	13	10	60	2022-12-30 09:50:18.691639	2022-12-30 09:50:56.768902	3	t
810	397	12	10	60	2022-12-30 09:50:18.750348	2022-12-30 09:50:58.6487	4	t
933	482	99	10	30	2023-02-17 15:04:30.725496	2023-02-17 15:04:30.725496	4	f
934	483	27	26	30	2023-02-17 15:04:30.762363	2023-02-17 15:04:30.762363	1	f
935	483	6	10	60	2023-02-17 15:04:30.779293	2023-02-17 15:04:30.779293	2	t
936	484	7	10	30	2023-02-17 15:04:30.814309	2023-02-17 15:04:30.814309	1	f
1368	803	205	14	30	2023-07-05 09:17:57.879492	2023-07-05 09:18:22.299425	1	f
1222	684	50	20	30	2023-05-29 01:58:42.418124	2023-05-29 02:02:24.22485	3	f
1221	684	49	20	30	2023-05-29 01:58:42.40456	2023-06-12 07:15:35.221421	2	f
1223	684	16	20	30	2023-05-29 01:58:42.430246	2023-05-29 02:50:54.073277	4	f
1369	803	209	12	30	2023-07-05 09:17:57.903599	2023-07-05 09:18:25.906033	2	f
1372	804	199	12	30	2023-07-05 09:19:11.796234	2023-07-05 09:19:33.600487	1	f
1277	720	11	10	30	2023-06-12 17:07:05.280498	2023-06-12 17:07:05.280498	4	f
1373	804	195	20	30	2023-07-05 09:19:11.815272	2023-07-05 10:12:43.205873	2	f
1374	804	64	20	30	2023-07-05 09:19:11.825679	2023-07-05 10:07:43.788156	3	f
1224	684	56	20	30	2023-05-29 01:58:42.440107	2023-05-29 02:50:49.620785	5	f
1278	720	21	10	30	2023-06-12 17:07:05.291812	2023-06-12 17:07:05.291812	5	f
1220	684	24	20	30	2023-05-29 01:58:42.365736	2023-06-12 12:25:48.476514	1	f
1282	721	144	10	30	2023-06-12 17:07:17.536923	2023-06-12 17:07:17.536923	4	f
1283	721	12	10	30	2023-06-12 17:07:17.569603	2023-06-12 17:07:17.569603	5	f
1284	722	7	10	30	2023-06-12 17:07:58.160147	2023-06-12 17:07:58.160147	1	f
1285	722	168	10	30	2023-06-12 17:07:58.202198	2023-06-12 17:07:58.202198	2	f
1286	722	51	10	30	2023-06-12 17:07:58.218742	2023-06-12 17:07:58.218742	3	f
1287	722	157	10	30	2023-06-12 17:07:58.240558	2023-06-12 17:07:58.240558	4	f
1082	619	5	10	30	2023-05-07 03:34:47.01622	2023-05-07 03:34:47.01622	1	f
1083	619	7	10	30	2023-05-07 03:35:01.430616	2023-05-07 03:35:01.430616	2	f
988	529	8	30	30	2023-03-08 06:27:27.441321	2023-03-08 06:27:27.441321	1	f
986	529	12	10	60	2023-03-08 06:27:27.338713	2023-03-08 06:27:27.507594	7	t
987	529	13	10	60	2023-03-08 06:27:27.375504	2023-03-08 06:27:27.507594	5	t
989	529	4	20	30	2023-03-08 06:27:27.489195	2023-03-08 06:27:27.489195	2	f
990	530	7	10	30	2023-03-08 06:27:27.569035	2023-03-08 06:27:27.669023	3	f
991	530	7	8	30	2023-03-08 06:27:27.612224	2023-03-08 06:27:27.669023	4	f
992	530	7	12	30	2023-03-08 06:27:27.655598	2023-03-08 06:27:27.655598	1	f
980	527	46	10	30	2023-03-08 06:27:26.999836	2023-03-08 06:29:18.918086	1	f
981	527	46	10	30	2023-03-08 06:27:27.043763	2023-03-08 06:29:18.918086	2	f
982	527	28	10	30	2023-03-08 06:27:27.078617	2023-03-08 06:29:18.918086	3	f
984	528	5	12	30	2023-03-08 06:27:27.195923	2023-03-08 06:29:37.272389	1	f
985	528	96	16	30	2023-03-08 06:27:27.235647	2023-03-08 06:29:37.272389	2	f
1088	620	14	10	30	2023-05-07 03:37:32.229415	2023-05-07 03:37:39.744317	1	f
1089	621	23	10	30	2023-05-07 03:37:59.024068	2023-05-07 03:37:59.024068	1	f
1090	621	96	10	30	2023-05-07 03:37:59.048568	2023-05-07 03:37:59.048568	2	f
1091	621	10	10	30	2023-05-07 03:37:59.06872	2023-05-07 03:37:59.06872	3	f
1275	720	142	12	30	2023-06-12 17:07:05.261129	2023-06-29 06:29:11.577455	1	t
1100	627	7	10	30	2023-05-09 06:00:14.274426	2023-05-09 06:00:17.833539	2	f
1139	647	16	10	30	2023-05-17 14:23:50.163273	2023-05-17 14:23:50.163273	1	t
1141	648	37	12	30	2023-05-17 14:23:50.226035	2023-05-17 14:23:50.254494	3	f
1142	648	1	120	30	2023-05-17 14:23:50.246689	2023-05-17 14:23:50.246689	1	f
1143	649	39	10	60	2023-05-17 14:23:50.291053	2023-05-17 14:23:50.291053	1	t
1144	649	37	10	60	2023-05-17 14:23:50.319029	2023-05-17 14:23:50.319029	2	t
1145	650	4	20	30	2023-05-17 14:23:50.356753	2023-05-17 14:23:50.356753	1	f
1146	650	8	20	30	2023-05-17 14:23:50.377752	2023-05-17 14:23:50.377752	2	f
1147	650	18	10	30	2023-05-17 14:23:50.398191	2023-05-17 14:23:50.398191	3	t
1148	650	19	10	30	2023-05-17 14:23:50.422824	2023-05-17 14:23:50.422824	4	t
1101	627	1	10	120	2023-05-09 06:00:14.295436	2023-05-09 06:01:11.456784	1	t
1106	629	38	10	30	2023-05-09 06:14:19.089734	2023-05-09 06:14:19.089734	2	f
1108	630	34	10	30	2023-05-09 06:15:59.410427	2023-05-09 06:15:59.410427	1	f
1152	651	7	14	30	2023-05-17 14:23:50.534294	2023-05-17 14:23:50.534294	1	f
1109	630	46	10	30	2023-05-09 06:15:59.427249	2023-05-09 06:16:18.082718	3	f
1111	630	97	10	30	2023-05-09 06:15:59.473328	2023-05-09 06:16:56.655678	4	t
1110	630	10	18	30	2023-05-09 06:15:59.440717	2023-05-09 06:17:11.143243	2	f
1113	629	5	10	30	2023-05-09 06:39:05.740762	2023-05-09 06:39:05.740762	4	f
1206	674	157	10	60	2023-05-24 02:53:05.768126	2023-06-19 19:15:25.290777	1	t
1280	721	147	10	30	2023-06-12 17:07:17.467041	2023-06-23 10:32:54.953376	1	f
1107	629	6	10	60	2023-05-09 06:14:19.138133	2023-05-09 06:39:28.446837	3	t
1281	721	145	10	30	2023-06-12 17:07:17.496119	2023-06-23 10:32:54.953376	2	f
1279	721	134	10	30	2023-06-12 17:07:17.436571	2023-06-23 10:32:54.954907	3	f
1274	720	23	12	30	2023-06-12 17:07:05.244183	2023-06-29 06:28:59.235888	3	f
1122	637	5	10	30	2023-05-11 14:05:45.60534	2023-05-11 14:05:45.60534	3	f
1276	720	143	10	30	2023-06-12 17:07:05.270713	2023-06-29 06:28:59.237264	2	f
1120	637	39	10	40	2023-05-11 14:05:23.429435	2023-05-11 14:09:51.108637	1	t
1121	637	38	10	40	2023-05-11 14:05:23.452213	2023-05-11 14:09:55.898782	2	t
1196	673	20	10	30	2023-05-24 02:48:04.886062	2023-05-24 02:48:34.011021	2	f
1185	671	7	10	30	2023-05-24 02:12:18.885948	2023-05-24 02:12:29.915634	1	f
1187	671	143	16	30	2023-05-24 02:12:18.927114	2023-05-24 03:17:53.474978	2	f
1188	672	24	20	30	2023-05-24 02:15:01.681208	2023-05-24 02:15:29.432256	1	f
1192	672	129	10	30	2023-05-24 02:15:01.744409	2023-05-24 02:17:30.29228	4	t
1189	672	48	16	30	2023-05-24 02:15:01.702303	2023-05-24 02:15:40.418404	2	f
1191	672	17	12	30	2023-05-24 02:15:01.731412	2023-05-24 02:17:33.48052	3	t
1193	673	15	10	30	2023-05-24 02:48:04.791961	2023-05-24 02:48:04.791961	1	f
1209	674	7	16	30	2023-05-24 02:54:19.521966	2023-05-24 02:54:23.004833	2	f
1205	673	13	10	30	2023-05-24 02:50:25.592118	2023-05-24 02:50:45.179589	3	f
77	46	5	8	30	2022-08-21 14:55:34.80184	2023-05-24 03:17:53.111232	1	f
257	98	1	120	30	2022-08-29 16:14:32.047961	2023-05-24 03:17:53.122957	3	f
147	63	1	120	30	2022-08-24 01:30:37.749622	2023-05-24 03:17:53.136423	2	f
225	88	34	10	30	2022-08-29 16:14:05.735355	2023-05-24 03:17:53.14333	4	f
226	88	5	8	30	2022-08-29 16:14:05.747634	2023-05-24 03:17:53.14333	2	f
1376	804	201	10	30	2023-07-05 09:19:11.847719	2023-07-05 09:19:26.175867	4	f
1377	805	7	20	30	2023-07-05 09:20:01.184003	2023-07-05 09:20:04.458607	1	f
1378	802	129	10	30	2023-07-09 16:37:42.745881	2023-07-09 16:37:42.745881	5	f
1318	741	170	10	30	2023-06-22 20:03:38.46189	2023-06-22 20:03:38.46189	1	f
1320	741	171	10	30	2023-06-22 20:03:38.501614	2023-06-22 20:03:38.501614	3	f
1319	741	172	12	30	2023-06-22 20:03:38.488169	2023-06-22 20:03:42.566797	2	f
1397	918	28	100	30	2023-08-31 07:25:48.74288	2023-08-31 07:26:33.212549	1	f
1386	21	43	10	30	2023-07-16 15:16:14.673585	2023-07-16 15:16:14.673585	3	f
1402	930	7	100	30	2023-09-08 16:30:10.697266	2023-09-08 16:31:07.40366	1	f
1398	919	211	20	30	2023-08-31 07:29:00.268698	2023-08-31 07:29:09.485586	1	f
1400	920	96	14	30	2023-08-31 07:29:58.732183	2023-08-31 07:30:18.788801	1	f
1399	920	31	14	30	2023-08-31 07:29:58.713532	2023-08-31 07:30:21.930785	2	f
1349	741	200	10	30	2023-06-29 06:29:44.877336	2023-06-29 06:29:44.877336	4	f
1350	741	64	10	30	2023-06-29 06:29:44.894803	2023-06-29 06:29:44.894803	5	f
1401	920	11	20	30	2023-08-31 07:29:58.745486	2023-08-31 07:57:40.986311	3	f
1407	932	41	100	30	2023-09-08 16:36:27.418043	2023-09-08 16:36:58.345977	1	f
1140	647	56	10	30	2023-05-17 14:23:50.183734	2025-02-02 18:58:17.588237	5	t
1138	647	17	10	30	2023-05-17 14:23:50.139378	2025-02-02 19:00:20.935065	3	t
1137	647	8	18	40	2023-05-17 14:23:50.117166	2025-02-02 19:00:20.937099	2	t
1405	931	17	16	30	2023-09-08 16:34:16.91903	2023-09-08 16:34:30.034446	3	f
1357	773	203	10	300	2023-06-29 08:10:25.349678	2023-06-29 08:10:49.677529	1	t
1406	931	36	16	30	2023-09-08 16:34:16.981064	2023-09-08 16:34:32.875278	4	f
1359	774	185	12	30	2023-06-29 08:11:46.016595	2023-06-29 08:12:04.262159	2	f
1360	774	187	12	30	2023-06-29 08:11:46.033888	2023-06-29 08:12:05.157912	3	f
1361	775	193	12	30	2023-06-29 08:12:41.06069	2023-06-29 08:12:44.294894	1	f
1362	775	192	12	30	2023-06-29 08:12:41.081067	2023-06-29 08:12:45.223018	2	f
1363	776	7	20	30	2023-06-29 08:13:01.447043	2023-06-29 08:13:05.103327	1	f
1358	774	170	12	30	2023-06-29 08:11:45.99229	2023-06-29 09:24:42.79246	1	f
1364	802	53	20	30	2023-07-05 09:13:59.299758	2023-07-05 09:14:29.206726	1	f
1365	802	132	10	30	2023-07-05 09:13:59.323953	2023-07-05 09:14:32.060191	2	t
1366	802	28	20	30	2023-07-05 09:14:25.180937	2023-07-05 09:14:44.784112	3	f
1443	1644	129	20	30	2024-12-13 07:35:25.417821	2024-12-13 07:35:37.489914	1	f
1435	1339	56	10	30	2024-03-29 10:42:15.532174	2024-08-19 07:41:41.885406	4	t
1417	1057	205	30	30	2024-01-09 08:48:11.602587	2024-01-09 10:22:36.671759	1	f
1404	931	31	18	30	2023-09-08 16:32:53.054629	2024-01-19 14:36:38.068258	2	f
1426	931	164	10	30	2024-01-19 14:36:47.497578	2024-01-19 14:36:47.497578	5	f
1403	931	23	16	30	2023-09-08 16:32:52.01372	2023-11-20 14:07:37.21387	1	f
1427	931	145	10	30	2024-01-19 14:36:47.516727	2024-01-19 14:36:47.516727	6	f
1413	1015	205	20	30	2023-12-02 17:30:25.486072	2023-12-02 17:30:43.651675	1	f
1414	1015	207	12	30	2023-12-02 17:30:25.512812	2023-12-02 17:30:46.12583	2	f
1415	1016	170	10	30	2023-12-02 17:31:04.6751	2023-12-02 17:31:04.6751	1	f
1416	1016	172	10	30	2023-12-02 17:31:04.693465	2023-12-02 17:31:04.693465	2	f
1149	651	7	10	30	2023-05-17 14:23:50.470593	2024-08-30 06:36:09.529741	2	f
1151	651	7	2	30	2023-05-17 14:23:50.514244	2024-08-30 07:44:49.439322	5	f
1150	651	7	6	30	2023-05-17 14:23:50.491505	2024-08-30 07:44:49.44315	3	f
1445	1644	8	30	30	2024-12-13 07:35:25.460772	2024-12-13 07:36:12.517919	3	f
1422	1058	171	12	30	2024-01-09 08:50:12.436163	2024-01-09 08:50:29.450583	1	f
1424	1058	10	10	30	2024-01-09 08:50:46.622286	2024-01-09 08:50:53.915193	2	f
1425	1059	212	2	30	2024-01-09 08:57:29.205908	2024-01-09 08:57:42.711165	1	f
1421	1057	208	10	60	2024-01-09 08:48:11.683255	2024-01-09 10:13:40.171979	3	t
1420	1057	207	12	30	2024-01-09 08:48:11.668411	2024-01-09 10:22:30.72845	2	f
1446	1644	26	10	30	2024-12-13 07:35:25.469758	2024-12-13 07:39:26.996996	4	f
1437	1340	5	16	30	2024-03-29 10:43:59.358569	2024-03-29 10:49:34.485267	1	f
1439	1341	15	10	30	2024-03-29 10:46:02.203852	2024-03-29 10:49:58.231018	1	t
1442	1341	12	10	30	2024-03-29 10:46:02.25493	2024-03-29 10:50:01.112391	3	t
1440	1341	14	10	30	2024-03-29 10:46:02.235676	2024-05-29 13:33:37.173654	2	t
1432	1339	49	20	30	2024-03-29 10:42:15.484213	2024-11-25 10:29:07.771607	1	f
1449	1645	13	10	30	2024-12-13 07:40:24.479752	2024-12-13 07:41:00.509859	2	t
1433	1339	50	14	30	2024-03-29 10:42:15.511112	2024-11-25 10:29:09.168564	2	f
1434	1339	16	28	50	2024-03-29 10:42:15.518973	2024-11-25 10:29:10.341193	3	t
1450	1645	12	14	30	2024-12-13 07:40:24.489176	2024-12-13 07:41:03.872417	3	t
1451	1645	14	10	30	2024-12-13 07:40:48.93431	2024-12-13 07:41:16.045685	4	t
1447	1645	15	20	30	2024-12-13 07:40:24.448521	2024-12-13 07:41:19.191683	1	t
1444	1644	35	10	30	2024-12-13 07:35:25.447417	2025-04-05 08:14:07.815755	2	f
\.


--
-- Data for Name: exercises; Type: TABLE DATA; Schema: public; Owner: st_gym_user
--

COPY public.exercises (id, name, description, created_at, updated_at, user_id) FROM stdin;
3	Pull up	How to: Stand under a pull-up bar, reaching up to grasp the bar with both hands, palms facing away from you and slightly wider than shoulder-width apart. Hang from the bar with your arms fully extended. Engage your core and pull your body upward by bending your elbows and squeezing your shoulder blades together until your chin is above the bar. Slowly lower back down to the starting position. \r\n\r\nAttention: Keep your body straight and avoid swinging or using momentum during the exercise.	2022-08-13 15:07:33.201702	2023-06-26 07:51:50.561381	1
21	Wide squats	Stand with your feet slightly wider than hip-width apart and lower your hips down into a squat.	2022-08-20 15:55:43.258492	2023-06-21 14:19:47.268794	1
4	Sit up	Lie down on your back with your knees bent and feet flat on the floor, keeping your hands at the sides of your head. Reach your torso up to touch your knees.	2022-08-13 15:07:33.206185	2023-06-21 08:45:40.231672	1
5	Push up	Start in a plank position on your hands and toes, then bend your elbows and lower your chest to the floor.	2022-08-13 15:07:33.210116	2023-06-21 08:45:40.234704	1
7	Burpee	Squat down and place your hands on the floor in front of you, then jump your feet back into a plank position. Return your feet to their starting position, then jump up and raise your arms overhead.	2022-08-13 15:07:33.219253	2023-06-21 08:45:40.237207	1
9	Leg raise	Lie on your back and raise your legs together until they are vertical, then lower them back to the starting position.	2022-08-13 15:07:33.22805	2023-06-21 08:45:40.239715	1
10	Squat	Stand with your feet hip-width apart and lower your hips down into a squat. Keep your back straight and your chest up.	2022-08-13 20:55:13.230326	2023-06-21 08:45:40.242159	1
12	Swim	Lie on your stomach with your arms and legs extended, then alternately lift one arm and the opposite leg, making sure your head and neck stay in line with your spine.	2022-08-15 20:42:35.511418	2023-06-21 08:45:40.244612	1
13	Cobra	Start on your stomach with your legs together and your arms extended in front of you, then press your chest off the ground and squeeze your shoulder blades together.	2022-08-15 20:43:23.375531	2023-06-21 08:45:40.24692	1
14	Scissors arms & legs	Lie on your back with your arms and legs extended, then alternately lift one arm and the opposite leg.	2022-08-15 20:45:41.445147	2023-06-21 08:45:40.249213	1
15	Arms & legs back raise	Lie on your stomach with your arms and legs extended, then raise your arms and legs up and off the floor.	2022-08-15 20:48:12.955634	2023-06-21 08:45:40.251796	1
17	Candle sit up	Sit up with your knees bent and feet flat, then reach your hands up and over your head, reaching for your feet.	2022-08-15 20:52:57.575362	2023-06-21 08:45:40.25423	1
18	Side plank left	Lie on your side with your feet together and one forearm on the ground, then raise your hips up off the ground, keeping your body in a straight line.	2022-08-15 20:57:51.200279	2023-06-21 08:45:40.256771	1
19	Side plank right	Same as above, but on the other side.	2022-08-15 20:58:02.649588	2023-06-21 08:45:40.259315	1
20	Back plank	Start in a push-up position, then lower your elbows to the floor, keeping your body in a straight line from your head to your feet.	2022-08-15 20:59:33.407171	2023-06-21 08:45:40.261844	1
22	Squat stay	Squat down and hold the position for 10-20 seconds.	2022-08-20 15:56:13.716124	2023-06-21 08:45:40.266767	1
23	3/4 squats 	Start in a standing position, then squat down until your thighs are parallel to the ground and hold for a few seconds.	2022-08-20 15:56:52.468866	2023-06-21 08:45:40.269152	1
25	High crunches	Lie on your back with your knees bent and feet flat, keeping your hands at the sides of your head. Reach your torso up, curling your body off the floor.	2022-08-20 16:00:10.422698	2023-06-21 08:45:40.271645	1
27	Crunches	Lie on your back with your knees bent and feet flat, then curl your torso up towards your knees.	2022-08-20 16:02:18.609906	2023-06-21 08:45:40.274649	1
28	Burpee baby	Squat down and place your hands on the floor in front of you, then jump your feet back into a plank position. Return your feet to their starting position, then jump up and raise your arms overhead.	2022-08-20 16:02:21.187647	2023-06-21 08:45:40.277615	1
29	Cross sit ups	Lie on your back with your legs bent and feet flat, keeping your hands crossed over your chest. Reach your torso up, curling your body off the floor.	2022-08-20 16:03:00.93393	2023-06-21 08:45:40.280281	1
30	Knees to chest	Lie on your back and bring both knees to your chest, then extend your legs back out.	2022-08-20 16:04:55.376527	2023-06-21 08:45:40.282904	1
31	Jumping squats	Stand with your feet hip-width apart and jump up into a squat position.	2022-08-20 16:05:44.601615	2023-06-21 08:45:40.285261	1
32	Static lunges	Stand with one foot forward and one foot back, then lower your hips down and back until your front knee is bent at a 90-degree angle.	2022-08-20 16:07:21.005156	2023-06-21 08:45:40.288038	1
35	Hollow body hold	Lie on your back with your arms and legs extended, then lift your arms and legs off the ground while keeping your head, neck, and back flat against the floor.	2022-08-20 16:14:30.36597	2023-06-21 08:45:40.290567	1
36	Cross V ups	Lie on your back with your arms and legs extended, then lift your arms and legs up and cross one arm over the other while bringing your legs up.	2022-08-20 16:16:36.336726	2023-06-21 08:45:40.293035	1
37	Mountain climber	Start in a plank position on your hands and toes, then bring one knee up to your chest and switch legs. Alternate between each leg.	2022-08-20 16:20:25.823693	2023-06-21 08:45:40.295932	1
38	Frog climber 🐸 🧗‍♀️ 	Start in a plank position on your hands and toes, then jump your feet forward until your torso is between your feet. Jump your feet back to the starting position.	2022-08-20 16:20:39.458072	2023-06-21 08:45:40.299731	1
41	Calf raise	Stand with your feet shoulder-width apart and raise up onto your toes, then lower your heels back down.	2022-08-21 00:08:08.542678	2023-06-21 08:45:40.303221	1
42	Hip raise	Lie on your back with your knees bent and feet flat, keeping your arms at your sides. Raise your hips up off the ground and squeeze your glutes.	2022-08-21 00:10:01.224201	2023-06-21 08:45:40.306515	1
43	Frog hip raise 🐸 	Start in a frog position on your hands and feet, then raise your hips up and squeeze your glutes.	2022-08-21 00:19:15.641143	2023-06-21 08:45:40.309845	1
44	Hip leg raise	Lie on your back with your legs bent and feet flat, then raise your hips up and lift one leg up towards the ceiling.	2022-08-21 00:19:57.973191	2023-06-21 08:45:40.312954	1
48	Bicycle crunches	Lie on your back with your hands at the back of your head. Alternately bring one knee up to your chest and touch it with the opposite elbow.	2022-08-21 15:04:41.234835	2023-06-21 08:45:40.315616	1
49	Side plank hip raise left	Lie on your left side with your feet together and one forearm on the ground, then raise your hips up off the ground while lifting your top leg.	2022-08-23 16:35:24.309588	2023-06-21 08:45:40.318435	1
50	Side plank hip raise right	Lie on your right side with your feet together and one forearm on the ground, then raise your hips up off the ground while lifting your top leg.	2022-08-23 16:36:01.698077	2023-06-21 08:45:40.321254	1
24	1 Leg raise	Lie on your back with one leg extended and the other raised, then lower the raised leg until it is almost touching the ground, then raise it back up.	2022-08-20 15:58:53.805146	2023-06-21 14:04:44.059385	1
190	Tricep Dips	Tricep dips target your triceps, shoulders, and chest muscles. \r\nHow-to: Sit on the edge of a bench or chair, with your hands placed beside your hips. Move your body forward off the bench, supporting your weight with your hands. Lower your body until your elbows are at a 90-degree angle, then push yourself back up to the starting position. \r\nFocus: Keep your elbows close to your body and maintain a controlled movement throughout the exercise.	2023-06-24 14:45:52.074478	2023-06-25 09:59:41.706519	1
192	Tricep Pushdowns	Tricep pushdowns isolate the triceps using a cable machine. \r\nHow-to: Stand in front of a cable machine with a straight or V-shaped bar attachment. Grasp the bar with an overhand grip, hands shoulder-width apart. Keep your elbows close to your body, and push the bar down until your arms are fully extended. Slowly return to the starting position. \r\nFocus: Keep your back straight and avoid using momentum to push the weight down.	2023-06-24 14:46:48.059641	2023-06-25 10:01:09.878271	1
55	Bulk up	Begin in a standing position with your feet hip-width apart and a weight in each hand. Bend your knees slightly, then press the weights up, driving your elbows and shoulders up.	2022-08-24 22:07:56.983833	2023-06-21 08:45:40.365807	1
61	🏃‍♀️Rounds of jogging	Start jogging at a steady pace and gradually increase your speed as you go.	2022-10-04 08:24:51.720843	2023-06-21 08:45:40.378915	1
62	Bike	Sit on a stationary bike and pedal for an allotted amount of time.	2022-10-05 13:19:41.334982	2023-06-21 08:45:40.382282	1
52	Dog push up	From your doward-looking dog, come forward with your head towards the floor and do a push up, with the main weight / push on your shoulders. Come back to dog position and repeat.	2022-08-23 17:03:02.532065	2023-06-21 08:45:40.324025	1
63	Ski	Stand on a ski simulator and mimick the motion of skiing.	2022-10-05 13:19:48.153414	2023-06-21 08:45:40.385804	1
65	Rest	Take a break and relax for a few minutes.	2022-10-05 13:20:15.463206	2023-06-21 08:45:40.392818	1
99	Tricep Extensions	Grab a pair of dumbbells and hold one in each hand. Bend your elbows and raise the dumbbells up to shoulder height. Keeping your elbows close to your body, extend your arms up and then lower back down.	2023-02-04 13:56:07.948551	2023-06-21 08:45:40.402035	1
53	Warm up leg raise	Stand up straight, raise knee up to 90 degrees, move knee to side, return, switch leg	2022-08-24 01:33:44.423205	2023-06-21 08:45:40.327428	1
96	Narrow squat	Same as normal squat, just with a narrow stance	2022-10-15 09:06:38.791792	2023-06-21 08:45:40.330061	1
95	Pull up (at angle)	Pull yourself up & down at a bar or TRX, stand at an angle relative to bar / TRX	2022-10-15 09:04:57.281287	2023-06-21 08:45:40.332829	1
1	Jumping jack	Jump up with the feet together and the hands over the head, then land with the feet apart and the hands at the sides.	2022-08-13 15:07:33.042783	2023-06-21 08:45:40.33541	1
2	Goblet squat	With a weight in both hands, stand with feet slightly wider than hip width and lower down into a squat position until the hips are lower than the knees.	2022-08-13 15:07:33.197382	2023-06-21 08:45:40.337847	1
6	Plank	Place your forearms on the floor, keeping your elbows below your shoulders, and hold your body in a straight line from your head to your feet.	2022-08-13 15:07:33.214824	2023-06-21 08:45:40.340466	1
8	Russian twist	Sit on the floor with your knees bent and feet flat, holding a weight in both hands. Lean back slightly and twist your torso from side to side.	2022-08-13 15:07:33.224178	2023-06-21 08:45:40.342948	1
11	Single-leg lunge	Stand with one foot forward and one foot back, then lower your hips down and back until your front knee is bent at a 90-degree angle.	2022-08-15 20:40:40.784824	2023-06-21 08:45:40.345168	1
16	Touch heels	Lie on your back with your legs extended and hands at your sides, then use your core to raise your legs and reach your hands to touch your toes.	2022-08-15 20:51:06.419972	2023-06-21 08:45:40.347464	1
26	V ups	Lie on your back with your legs and arms extended, then raise your legs and arms up and touch your toes.	2022-08-20 16:00:29.256979	2023-06-21 08:45:40.351838	1
34	Alternating lunges	Start in a standing position and take a large step forward with one leg, then lower your hips down and back until the front knee is bent at a 90-degree angle. Step back to the starting position and repeat with the other leg.	2022-08-20 16:08:49.401489	2023-06-21 08:45:40.354469	1
39	Cross mountain climber	Start in a plank position on your hands and toes, then bring one knee up to the opposite elbow and alternate between each side.	2022-08-20 16:21:09.217759	2023-06-21 08:45:40.356722	1
46	Forward lunge single sides	Stand with one foot forward and one foot back, then lower your hips down and back until your front knee is bent at a 90-degree angle. Step back up to the starting position.	2022-08-21 14:57:18.93215	2023-06-21 08:45:40.358856	1
51	Knee lift	Stand with your feet hip-width apart and raise one knee up to your chest, then lower it back to starting position. Repeat on the other side.	2022-08-23 16:43:56.805199	2023-06-21 08:45:40.361101	1
54	Kipping Muscle Up	Start in a hang position on a pull-up bar, then pull your body up and over the bar.	2022-08-24 15:25:22.94028	2023-06-21 08:45:40.363402	1
56	Wiper	Lie on your back with a weighted plate in both hands, then raise the plate above your head and slowly bring it down to one side without touching the ground, then return it to the starting position.	2022-08-30 10:48:55.548716	2023-06-21 08:45:40.368277	1
58	Hoppi hoppi	Start in a standing position and jump up with both feet, then land on the balls of your feet.	2022-09-03 10:24:58.672364	2023-06-21 08:45:40.370683	1
59	Incline bench press	Lie on an incline bench with a weight in both hands, then press the weight up, keeping your elbows at a 90-degree angle.	2022-09-03 11:12:52.285679	2023-06-21 08:45:40.373442	1
60	Barbell shoulder press	Stand with your feet hip-width apart and a barbell in both hands. Press the barbell up, keeping your elbows at a 90-degree angle.	2022-09-03 11:14:06.154718	2023-06-21 08:45:40.375923	1
97	Step-Up	Start standing in front of a bench or a sturdy chair. Step up with one foot onto the chair, then step back down	2023-02-04 13:53:21.943484	2023-06-21 08:45:40.396503	1
98	Bicep Curls	Stand with your feet shoulder-width apart and hold a dumbbell in each hand. Keep your elbows close to your body and curl the dumbbells up to shoulder height. Slowly lower the dumbbells back down.	2023-02-04 13:55:37.085611	2023-06-21 08:45:40.399425	1
194	Overhead Tricep Extension	The overhead tricep extension targets the triceps using a dumbbell or a cable machine. \r\nHow-to: Stand or sit with a dumbbell in both hands or a rope attachment on a cable machine. Extend your arms overhead with the weight above your head. Bend your elbows, lowering the weight behind your head. Extend your arms back to the starting position. \r\nFocus: Keep your elbows close to your head and avoid arching your lower back during the exercise.	2023-06-24 14:47:29.751521	2023-06-25 09:54:04.824084	1
185	Barbell Bicep Curls	To perform this exercise, hold a barbell with an underhand grip, with your hands shoulder-width apart. Keep your elbows close to your body. Slowly curl the barbell up towards your chest, contracting your biceps. Pause for a moment at the top, then slowly lower the barbell back to the starting position. Make sure to keep your upper arms stationary and focus on the bicep muscles doing the work.	2023-06-24 14:29:34.871101	2023-06-24 14:52:05.392549	1
191	Close-Grip Bench Press	The close-grip bench press targets the triceps and also engages the chest and shoulders. \r\nHow-to: Lie on a bench with a barbell in the rack. Grip the barbell with your hands shoulder-width apart or slightly narrower. Unrack the barbell and lower it to your chest while keeping your elbows close to your body. Push the barbell back up to the starting position. \r\nFocus: Maintain a controlled movement and avoid locking out your elbows at the top of the movement.	2023-06-24 14:46:27.634442	2023-06-24 14:55:05.199624	1
193	Skull Crushers	Skull crushers target the triceps using a barbell or dumbbells. \r\nHow-to: Lie on a bench with a barbell or a pair of dumbbells in your hands. Extend your arms straight above your chest. Bend your elbows and lower the weight towards your forehead, keeping your upper arms stationary. Extend your arms back to the starting position. \r\nFocus: Maintain a controlled movement and keep your elbows in line with your wrists throughout the exercise.	2023-06-24 14:47:07.225971	2023-06-25 09:58:41.804167	1
203	Rowing	User your upper body to generate the main momentum on a rowing machine.	2023-06-29 08:10:25.310282	2023-06-29 08:10:25.319659	1
136	L-Sit Pull-up	Perform a pull-up, but with your legs extended out in front of you in an L-shape.	2023-05-24 01:55:19.700431	2023-06-21 08:45:40.433922	1
137	Australian Pull-up	Lie underneath a bar at waist height and pull your chest up towards the bar, engaging your back and arms.	2023-05-24 01:55:19.723053	2023-06-21 08:45:40.436634	1
139	Wall Push-Up	A beginner-friendly push-up variation that targets the chest and triceps.	2023-05-24 01:55:19.795138	2023-06-21 08:45:40.440177	1
123	Spiderman Crawl	Get into a push-up position and bring one foot up to the outside of your hand. Alternate sides and move forward as you go.	2023-05-24 01:55:19.348559	2023-06-21 08:45:40.404636	1
125	Lateral Lunge	Take a big step to the side with one foot and bend the knee, keeping the other leg straight. Alternate sides.	2023-05-24 01:55:19.438289	2023-06-21 08:45:40.407247	1
126	Prone Scorpion	Lie on your stomach with your arms out to the sides. Bring one foot up towards your opposite hand, then switch sides.	2023-05-24 01:55:19.465964	2023-06-21 08:45:40.409524	1
127	Hip Circles	Stand with your feet shoulder-width apart and place your hands on your hips. Circle your hips in one direction, then switch directions.	2023-05-24 01:55:19.487013	2023-06-21 08:45:40.411945	1
129	Flutter Kicks	Lying on your back with your hands under your glutes, kick your legs up and down while keeping them straight.	2023-05-24 01:55:19.532216	2023-06-21 08:45:40.414415	1
130	Leg Raises	Lying on your back with your hands under your glutes, raise your legs straight up and slowly lower them back down without touching the ground.	2023-05-24 01:55:19.557327	2023-06-21 08:45:40.416587	1
131	Plank Knee to Elbow	Start in a high plank position, bring your right knee to your left elbow and then switch to your left knee to your right elbow while keeping your hips level and core tight.	2023-05-24 01:55:19.585546	2023-06-21 08:45:40.418998	1
132	Warm up plank	Hold a plank position for 30 seconds to warm up your core.	2023-05-24 01:55:19.613211	2023-06-21 08:45:40.421734	1
134	Chin-up	Hang from a bar with your palms facing towards you and pull yourself up to chin level.	2023-05-24 01:55:19.643001	2023-06-21 08:45:40.428282	1
141	Dive Bomber Push-Up	A full-body push-up variation that targets the chest, shoulders, and triceps.	2023-05-24 01:55:20.042729	2023-06-21 08:45:40.443452	1
143	Jump Squats	Jump squats are a powerful exercise that can help you burn fat, build strength, and improve your cardiovascular fitness.	2023-05-24 01:55:20.306501	2023-06-21 08:45:40.446724	1
144	Superman	Lie face down on the floor with arms and legs extended. Lift both arms and legs up simultaneously, hold for 2-3 seconds, then lower back down. Repeat for desired reps.	2023-05-24 01:55:20.329085	2023-06-21 08:45:40.45003	1
145	Reverse Snow Angels	Lie face down on the floor with arms at your sides. Lift your chest and arms off the ground, then move your arms up and down in a snow angel motion. Repeat for desired reps.	2023-05-24 01:55:20.418088	2023-06-21 08:45:40.452808	1
146	Inverted Rows	Find a sturdy horizontal bar (such as a table or low barbell rack) and lie underneath it. Grasp the bar with a shoulder-width, overhand grip and pull your body up towards the bar. Lower back down and repeat for desired reps.	2023-05-24 01:55:20.485231	2023-06-21 08:45:40.455665	1
147	Dolphin Kicks	Start in a plank position with forearms on the ground. Lift your hips up and kick your feet towards your hands, keeping your legs straight. Lower back down and repeat for desired reps.	2023-05-24 01:55:20.524808	2023-06-21 08:45:40.458292	1
148	Bodyweight Row	Find a sturdy horizontal bar (such as a table or low barbell rack) and lie underneath it. Grasp the bar with a shoulder-width, underhand grip and pull your body up towards the bar. Lower back down and repeat for desired reps.	2023-05-24 01:55:20.557734	2023-06-21 08:45:40.461074	1
149	Reverse Lunges	Reverse lunges target the glutes, hamstrings, and quads. They can help to improve balance and stability.	2023-05-24 01:55:20.580791	2023-06-21 08:45:40.464031	1
150	Single Leg Deadlifts	Single leg deadlifts are a great exercise to help improve balance and stability. They target the hamstrings and glutes.	2023-05-24 01:55:20.603723	2023-06-21 08:45:40.467342	1
142	High Knees	High knees is a simple but effective cardio exercise that can help you burn calories and improve your cardiovascular fitness. Raise your knees.	2023-05-24 01:55:20.182536	2023-06-21 08:45:40.470919	1
188	Concentration Curls	Sit on a bench with your legs apart and a dumbbell in one hand. Rest your elbow on the inside of your thigh, near your knee, with your palm facing up. Curl the dumbbell towards your chest, focusing on contracting the bicep. Slowly lower the dumbbell back to the starting position. Perform the exercise on one arm, then switch to the other. For maximum effect, keep your upper arm stationary and avoid using your body to create momentum.	2023-06-24 14:30:48.202502	2023-06-24 14:56:07.431488	1
187	Hammer Curls	Stand with your feet shoulder-width apart, holding a dumbbell in each hand with a neutral grip (palms facing your body). Keeping your elbows close to your body, curl the dumbbells up towards your shoulders. Pause for a moment at the top, then slowly lower the dumbbells back down. This exercise targets both the biceps and forearms, so make sure to keep your wrists straight and avoid any twisting.	2023-06-24 14:30:26.23144	2023-06-25 09:52:11.032226	1
189	Preacher Curls	Use a preacher curl bench and an EZ curl bar or dumbbells. Sit on the bench, with your chest against the pad and arms resting on the sloped section. Hold the bar or dumbbells with an underhand grip, hands shoulder-width apart. Curl the weight up towards your face, contracting your biceps. Slowly lower the weight back down to the starting position. Keep your upper arms against the pad throughout the exercise and avoid bouncing or swinging the weight.	2023-06-24 14:31:08.766272	2023-06-25 09:55:20.254822	1
186	Seated Alternating Dumbbell Curls	Sit on a bench with a dumbbell in each hand, palms facing forward. Keep your back straight and chest up. Curl one dumbbell to your shoulder, contracting the bicep. Slowly lower the dumbbell back to the starting position, and repeat with the other arm. Focus on keeping your elbows stationary and close to your body, and avoid swinging or using momentum.	2023-06-24 14:30:02.658659	2023-06-25 09:57:20.168234	1
211	TRX pull up	Pull yourself up at an agnle at a TRX.	2023-08-31 07:29:00.248678	2023-08-31 07:29:00.248678	1
151	Side Lunges	Side lunges target the inner and outer thighs and can help to improve hip mobility.	2023-05-24 01:55:20.624829	2023-06-21 08:45:40.474127	1
152	Diamond Push-Up	A push-up variation that targets the triceps and chest muscles	2023-05-24 01:55:20.649392	2023-06-21 08:45:40.477464	1
153	Plyometric Push-Up	A push-up variation that involves explosive movements to increase chest strength and power	2023-05-24 01:55:20.672122	2023-06-21 08:45:40.480655	1
154	Incline Push-Up	A push-up variation that targets the upper chest muscles	2023-05-24 01:55:20.696083	2023-06-21 08:45:40.483878	1
155	Dumbbell Fly	A chest exercise that targets the pectoral muscles and helps improve chest definition	2023-05-24 01:55:20.719848	2023-06-21 08:45:40.487079	1
156	Wide-Grip Push-Up	A push-up variation that targets the chest muscles and helps improve chest width	2023-05-24 01:55:20.745788	2023-06-21 08:45:40.496664	1
157	Plank Jacks	Start in a high plank position and jump your feet out and in like a jumping jack while maintaining a stable core.	2023-05-24 01:55:20.768395	2023-06-21 08:45:40.509446	1
158	Reverse Crunch	Lie on your back with your hands at your sides, lift your legs off the ground and pull your knees towards your chest while lifting your hips off the ground.	2023-05-24 01:55:20.791712	2023-06-21 08:45:40.512569	1
159	Spiderman Plank	Start in a high plank position and bring your right knee to your right elbow, then return to plank position and repeat on the other side.	2023-05-24 01:55:20.820569	2023-06-21 08:45:40.515715	1
160	Plank Up-Down	A plank variation where the body moves from a forearm plank to a high plank, emphasizing shoulders and triceps.	2023-05-24 01:55:20.858305	2023-06-21 08:45:40.518655	1
161	Bear Crawl	A full-body exercise where hands and feet support the body in a crawling position, emphasizing shoulders and arms.	2023-05-24 01:55:20.880083	2023-06-21 08:45:40.520839	1
162	Side Plank with Arm Reach	A side plank variation where the top arm reaches up and over the body, emphasizing shoulders and arms.	2023-05-24 01:55:20.902253	2023-06-21 08:45:40.522906	1
163	Pike Push-up	This exercise is similar to a traditional push-up but places more emphasis on the shoulders. Begin in a downward dog position with your hands shoulder-width apart and your feet hip-width apart. Slowly lower your head towards the ground, keeping your elbows close to your body. Push back up to the starting position.	2023-05-24 01:55:20.925131	2023-06-21 08:45:40.525025	1
164	Handstand Hold	This exercise requires strength and balance. Begin by facing a wall and placing your hands on the ground, shoulder-width apart. Walk your feet up the wall until your body is in a straight line. Hold this position for as long as possible.	2023-05-24 01:55:20.954263	2023-06-21 08:45:40.527254	1
165	Shoulder Taps	Start in a plank position with your hands shoulder-width apart. Lift one hand off the ground and tap the opposite shoulder. Return to the starting position and repeat with the other hand. Alternate sides for the desired number of repetitions.	2023-05-24 01:55:20.976635	2023-06-21 08:45:40.529174	1
166	Shoulder Circles	Stand with your feet shoulder-width apart and raise your arms straight out to the sides. Slowly make small circles with your arms, gradually increasing the size of the circles. Reverse the direction of the circles after a set number of repetitions.	2023-05-24 01:55:21.002577	2023-06-21 08:45:40.53122	1
167	Shoulder Blade Squeeze	Stand with your feet shoulder-width apart and your arms at your sides. Squeeze your shoulder blades together and hold for a few seconds before releasing. Repeat for the desired number of repetitions.	2023-05-24 01:55:21.029428	2023-06-21 08:45:40.533356	1
168	Jumping lunges	Start in a lunge position, then jump up and switch legs in mid-air before landing in a lunge on the opposite side.	2023-05-24 01:55:21.051891	2023-06-21 08:45:40.535769	1
169	Broad jump	Jump forward as far as you can while landing in a squat position. Repeat for reps.	2023-05-24 01:55:21.077865	2023-06-21 08:45:40.538038	1
170	Arnold press	Sit on a bench with dumbbells held in front of you, palms facing your shoulders as though you've just finished a bicep curl. Push the dumbbells up over your head while rotating your arms until your palms face away from you. Straighten your arms, pause, then reverse the movement.	2023-06-20 08:23:50.770483	2023-06-21 08:45:40.540279	1
171	Deadlift	The deadlift is a weight training exercise in which a loaded barbell or bar is lifted off the ground to the level of the hips, torso perpendicular to the floor, before being placed back on the ground. It is one of the three powerlifting exercises, along with the squat and bench press.	2023-06-20 08:26:32.690535	2023-06-21 08:45:40.542661	1
172	Benchpress (Barbell)	The bench press, or chest press, is a weight training exercise where a person presses a weight upwards while lying on a weight training bench. Although the bench press is a full-body exercise, the muscles primarily used are the pectoralis major, the anterior deltoids, and the triceps, among other stabilizing muscles.	2023-06-20 08:29:51.669831	2023-06-21 08:45:40.544913	1
198	Lat Pulldowns	How to: Sit at a lat pulldown machine, adjusting the thigh pads to fit snugly against your thighs. Grasp the bar with both hands, palms facing away from you and slightly wider than shoulder-width apart. Sit up tall with your chest out and shoulders back. Pull the bar downward by bending your elbows and squeezing your shoulder blades together until the bar reaches your collarbone. Slowly return to the starting position. \r\n\r\nAttention: Keep your core engaged and avoid leaning back excessively during the movement.	2023-06-26 07:52:26.654166	2023-07-05 08:57:15.443165	1
199	Bent-over Rows	How to: Stand with your feet hip-width apart, holding a barbell with both hands, palms facing your body. Bend your knees slightly and hinge at your hips to lower your torso forward, keeping your back straight and parallel to the floor. Hold the barbell with your arms fully extended. Pull the barbell upward by bending your elbows and squeezing your shoulder blades together, keeping your elbows close to your body. Slowly return to the starting position. \r\n\r\nAttention: Maintain a neutral spine and avoid rounding your back during the exercise.	2023-06-26 07:52:53.076874	2023-07-05 08:58:14.87544	1
200	Face Pulls	How to: Attach a rope handle to a cable machine at face level. Stand facing the machine, gripping the handle with both hands, palms facing each other. Step back and lean slightly backward, with your arms fully extended. Pull the handle toward your face by bending your elbows and squeezing your shoulder blades together. Separate the rope ends as you pull, so they end up on either side of your face. Slowly return to the starting position. \r\n\r\nAttention: Keep your core engaged and avoid using momentum or excessive body movement during the exercise.	2023-06-26 07:53:20.392166	2023-07-05 08:58:55.493272	1
201	T-Bar Rows	How to: Position a barbell in a landmine attachment or securely in a corner. Load the free end with weight plates. Stand facing the barbell, with your feet shoulder-width apart. Bend your knees slightly and hinge at your hips to lower your torso forward, keeping your back straight and parallel to the floor. Grasp the barbell with both hands, using a V-handle or a close-grip handle. Pull the barbell upward by bending your elbows and squeezing your shoulder blades together, keeping your elbows close to your body. Slowly return to the starting position. \r\n\r\nAttention: Maintain a neutral spine and avoid rounding your back during the exercise.	2023-06-26 07:53:44.888768	2023-07-05 09:00:14.267934	1
195	Hyperextensions (Back Extension)	How to: Position yourself on a hyperextension bench, with your thighs resting on the pads and feet firmly on the footplate. Cross your arms over your chest or place your hands behind your head. Bend your upper body forward, keeping your back straight. Return to the starting position by engaging your lower back muscles to lift your torso upward. \r\n\r\nAttention: Keep your movements slow and controlled, and avoid hyperextending your back at the top of the movement.	2023-06-26 07:15:05.408673	2023-07-05 09:03:26.085038	1
197	Good Mornings	How to: Stand with your feet shoulder-width apart, with a barbell resting on your upper back and shoulders. Hold the barbell with both hands, palms facing forward. Keeping your back straight and core tight, hinge at your hips and lower your torso forward until it's parallel with the floor. Slowly return to the starting position by engaging your lower back and hamstrings. \r\n\r\nAttention: Keep your knees slightly bent throughout the movement, and avoid rounding your back.	2023-06-26 07:45:13.323111	2023-07-05 09:05:24.715095	1
204	Pistol squat	(Optional: With a kettlebell or dumbbell at your chest) Stand on left leg, right leg held out straight and off the floor. Perform the pistol squat by sending hips down and back, keeping the chest tall and right leg lifted. Drive through left foot to stand back up. Repeat.	2023-07-05 08:52:55.934612	2023-07-05 08:52:55.943164	1
196	Seated Cable Rows	How to: Sit on the bench of a cable row machine with your feet on the footplate. Grasp the handle with both hands, palms facing each other. Sit up tall with your chest out and shoulders back. Pull the handle towards your abdomen by bending your elbows and squeezing your shoulder blades together, while keeping your torso stationary. Slowly return to the starting position. \r\n\r\nAttention: Keep your core engaged and avoid using momentum or excessive body movement during the exercise.	2023-06-26 07:44:30.46257	2023-07-05 09:04:27.144939	1
64	Kettlebell Swings	How to: Stand with your feet shoulder-width apart, with a barbell resting on your upper back and shoulders. Hold the barbell with both hands, palms facing forward. Keeping your back straight and core tight, hinge at your hips and lower your torso forward until it's parallel with the floor. Slowly return to the starting position by engaging your lower back and hamstrings. \r\n\r\nAttention: Keep your knees slightly bent throughout the movement, and avoid rounding your back.	2022-10-05 13:20:07.332608	2023-07-05 09:06:27.179931	1
205	Abdominal Crunches on a Stability Ball	Sit on a stability ball with your feet flat on the floor. Walk your feet forward, rolling your back onto the ball until your thighs and torso are parallel with the floor. With your hands behind your head, contract your abs to lift your torso off the ball, pulling the bottom of your ribcage down toward your hips. As you curl up, keep the ball stable and avoid using your lower body to push up. Return to starting position and repeat. This exercise is great for your upper abs.	2023-07-05 09:07:48.271306	2023-07-05 09:07:48.280231	1
206	Cable Rotation	Stand holding a cable with both hands out in front of you at just under shoulder height. Keeping your abs engaged and your torso stable, rotate your upper body to the left, then back to the center, and then to the right, and then back to the center. This is one rep. Pay close attention to keep your hips and legs stable, the movement should come from your abs and obliques.	2023-07-05 09:09:30.152955	2023-07-05 09:09:30.160092	1
207	Hanging Leg Raises	Using a pull-up bar, grip it shoulder-width apart with your palms facing away from you. Hang at arm's length. You can bend your knees slightly if that's comfortable. Now, brace your abs and raise your knees to your chest. Pause, then lower your legs back to the starting position. This exercise targets the entire abdominal region.	2023-07-05 09:10:17.866163	2023-07-05 09:10:17.871901	1
208	Plank on a BOSU ball	With the BOSU ball flat-side up, place your elbows and forearms on the BOSU. Extend your legs behind you, resting your toes on the ground. Your body should form a straight line from your shoulders to your ankles. Hold this position for up to 60 seconds. This exercise is excellent for the whole core, and especially the deep core muscles.	2023-07-05 09:11:24.669048	2023-07-05 09:11:24.677731	1
209	Captain's Chair Leg Raise	Stand on the captain's chair, grip handholds, press your back against the pad and hang your legs. Keeping your back flat against the pad, slowly raise your knees towards your chest. Pause for a moment then lower your legs back down. This exercise targets the lower abs.	2023-07-05 09:12:19.107824	2023-07-05 09:12:19.114688	1
210	Jumping rope	1. Keep your feet close together when jumping.\r\n2. Jump on the midsoles of your feet and land softly.\r\n3. Keep your jumping height low (½” - 1” off the ground)\r\n4. Keep your knees slightly bent at all times.\r\n5. Maintain a tall, neutral spine.\r\n6. Keep your head up, chest up, and head looking forward.	2023-07-05 09:16:50.583638	2023-07-05 09:16:50.583638	1
133	Dip	Place your hands on parallel bars and dip down, engaging your triceps.	2023-05-24 01:55:19.631009	2023-11-18 20:50:02.481033	1
212	Round of Egym	One full circle of Fitnesspark Egym	2024-01-09 08:57:29.149042	2024-01-09 08:57:29.149042	1
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: st_gym_user
--

COPY public.posts (id, title, user_id, subtitle, published, "position", created_at, updated_at) FROM stdin;
2	Is Veganism the Future of Fitness Nutrition?	1	Green Protein: The Vegan Turn in Fitness Nutrition	t	1	2023-06-28 13:06:46.799545	2023-06-29 07:18:06.682434
3	Do Fitness Apps Really Help, or Are They Just a Distraction?	1	Workout in your pocket: The power and pitfalls of fitness apps - Are we exercising or just scrolling?	t	0	2023-06-29 07:18:06.681553	2023-06-30 07:44:49.992008
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: st_gym_user
--

COPY public.schema_migrations (version) FROM stdin;
20220705231231
20220705233030
20220706231537
20220720221455
20220720221651
20220721000350
20220803200051
20220805182931
20220809010226
20220812115724
20220812130604
20220813163357
20220821185810
20220829151421
20221021073049
20221021073419
20230123130740
20230511092240
20230612055922
20230612140257
20230621072815
20230627160314
20230628063221
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: st_gym_user
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, admin, created_at, updated_at) FROM stdin;
2	schuzste@gmail.com	$2a$12$Sx8dRqUU73m8jIXV.UBHLeDAG06592Xp4jMfQKqjcOtUykxxOleXW	\N	\N	\N	f	2022-08-13 15:07:32.694375	2022-08-13 15:07:32.694375
3	test@gmail.com	$2a$12$7KxgB.qkd2l4iEzcsu75MuRP1fITXvn45.LeibZ15D2tHRHshWvZ6	\N	\N	\N	f	2022-08-13 15:07:32.950949	2022-08-13 15:07:32.950949
4	je.pellaton@icloud.com	$2a$12$kz/g/IXzQ1TEde5cabCyvOtO0p8JWkhCx0pMifdYefxuuxM.cMUH.	\N	\N	\N	f	2022-08-16 15:56:47.854721	2022-08-16 15:56:47.854721
5	naomi.caduff@gmail.com	$2a$12$fdvk/UTwAeLQicI.ka3Oc.WqPgOUnCRojStLPvZMS9E.1mHIvIEZi	\N	\N	2022-08-23 15:06:31.087336	f	2022-08-20 15:49:36.156503	2022-08-23 15:06:31.087829
6	inou@gmail.com	$2a$12$uLZaMz2WHfTNwzX2nhCZq.i76eGCaVXm1Ey.asxYWWhcRabylA3vW	\N	\N	\N	f	2022-08-24 15:04:58.899867	2022-08-24 15:04:58.899867
7	franz@heinrich.ch	$2a$12$M.fmTNN147V6m.xLyc.q/u9TZr/DX87UcLyuoki6SDeQL5zqm8pvu	\N	\N	\N	f	2022-10-19 13:55:01.085562	2022-10-19 13:55:01.085562
1	stephens@hey.com	$2a$12$eNzTf0SzFdEY4Yre2KlZxe8.5wveBwuqBaB3jmdkPkcVCYV/Cwhsa	\N	\N	2023-08-04 07:12:29.698568	t	2022-08-13 15:07:32.42263	2024-09-13 08:17:54.312776
\.


--
-- Data for Name: workouts; Type: TABLE DATA; Schema: public; Owner: st_gym_user
--

COPY public.workouts (id, name, description, created_at, updated_at, user_id, public, saved, original_workout, ahoy_visit_id) FROM stdin;
10	Il‘union session	Workout to kill Inou 🏋🏿‍♀️ 	2022-08-13 20:45:50.238192	2022-08-13 20:57:38.860562	1	t	f	\N	\N
11	Trends workout	Workout to just play around and have fun 🏋🏿‍♀️ 	2022-08-13 20:59:06.10889	2022-08-13 20:59:50.851694	1	t	f	\N	\N
78	Train your Belly 🔥	Workout to train Belly	2022-08-31 07:11:05.974689	2022-08-31 07:11:05.974689	5	f	t	77	\N
12	Roadtrip Spain workout 🏋️	Eusi super session in Spanie!	2022-08-15 19:05:52.594229	2022-08-15 20:38:28.512703	1	t	f	\N	\N
77	Train your Belly 🔥	Workout to train Belly	2022-08-31 07:04:17.415498	2022-08-31 07:12:07.7476	5	f	t	7	\N
71	Isla Pastores, Panama - Day 5 ca. 45min	50min workout after a day of indulgence 🙈	2022-08-29 16:14:32.008648	2022-09-01 04:20:23.719863	1	t	t	36	\N
69	Another full body workout 🦵💪🙌 ca. 35min	Isla Pastores, Panama - Day 2	2022-08-29 16:14:05.643308	2022-09-01 04:20:38.377192	1	t	t	19	\N
70	Tuesday in Panama 🇵🇦 ca. 30min	Legs and back workout!	2022-08-29 16:14:20.759795	2022-08-29 21:20:33.951783	1	t	t	32	\N
7	Train your Belly 🔥	Workout to train Belly	2022-08-13 15:07:33.939112	2022-08-30 10:58:32.894418	1	f	f	\N	\N
68	Full body workout 🏋️‍♀️ ca. 50min	Islas Pastores, Panama - Day 1	2022-08-29 16:13:54.199496	2022-09-01 04:20:52.294645	1	t	t	18	\N
2	Happy Push	Workout to train Push	2022-08-13 15:07:33.499985	2022-08-24 13:24:32.567958	1	f	f	\N	\N
84	Saturday morning	Full body workout in the park	2022-09-03 08:32:23.542744	2022-09-03 08:33:05.5254	1	t	f	\N	\N
3	Happy Cardio	Workout to train Cardio	2022-08-13 15:07:33.665915	2022-08-24 13:24:41.67893	1	f	f	\N	\N
5	Happy Legs	Workout to train Legs	2022-08-13 15:07:33.840193	2022-08-24 13:24:58.201004	1	f	f	\N	\N
6	Happy Chest	Workout to train Chest	2022-08-13 15:07:33.889332	2022-08-24 13:25:03.17892	1	f	f	\N	\N
8	Happy Arms	Workout to train Arms	2022-08-13 15:07:34.012014	2022-08-24 13:25:19.380867	1	f	f	\N	\N
9	Happy Shoulders	Workout to train Shoulders	2022-08-13 15:07:34.052039	2022-08-24 13:25:24.656546	1	f	f	\N	\N
36	Isla Pastores, Panama - Day 5 ca. 45min	50min workout after a day of indulgence 🙈	2022-08-24 01:28:19.556705	2022-08-24 17:52:58.246925	5	f	f	\N	\N
1	Happy Pull	Workout to train Pulll	2022-08-13 15:07:33.243884	2022-08-22 20:57:52.087881	1	f	f	\N	\N
222	Belly, September 27, 2022		2022-09-27 06:05:26.614513	2022-09-28 16:15:44.723741	1	f	f	\N	\N
19	Another full body workout 🦵💪🙌 ca. 35min	Isla Pastores, Panama - Day 2	2022-08-21 00:04:03.248786	2022-08-23 16:31:38.108207	5	f	f	\N	\N
209	Flo workout I		2022-09-18 12:44:11.654806	2022-09-28 21:25:16.203893	1	t	f	\N	\N
18	Full body workout 🏋️‍♀️ ca. 50min	Islas Pastores, Panama - Day 1	2022-08-20 15:53:33.391411	2022-08-23 16:37:12.278177	5	f	f	\N	\N
210	Flo workout I		2022-09-18 13:03:21.992549	2022-09-18 13:05:24.97353	4	f	t	209	\N
32	Tuesday in Panama 🇵🇦 ca. 30min	Legs and back workout!	2022-08-23 16:40:03.674612	2022-08-23 17:47:56.091414	5	f	f	\N	\N
233	Quick shoulders, September 30, 2022		2022-09-30 06:13:41.854343	2022-09-30 06:31:19.488948	1	t	f	\N	\N
4	Back training	Workout to train Back	2022-08-13 15:07:33.793287	2022-08-30 20:36:56.541761	1	f	f	\N	\N
237	Sunday, October  2, 2022	\N	2022-10-02 15:58:13.699522	2022-10-02 16:06:29.535016	1	t	f	\N	\N
240	4 Oct, Endorphins		2022-10-04 08:23:02.646894	2022-10-04 08:26:13.419313	1	t	t	209	\N
243	Triangle, October  5, 2022		2022-10-05 13:15:58.931164	2022-10-05 13:16:11.940991	1	t	f	\N	\N
305	Sunday refresh	6. November, 2022	2022-11-06 07:14:39.909955	2022-11-07 13:21:40.830762	1	f	t	210	239
295	Shoulders, back & legs	October 22, 2022	2022-10-22 08:50:24.332532	2022-10-28 12:56:44.758345	1	t	t	233	17
288	Full body refurbishment		2022-10-15 08:42:28.121305	2022-10-31 17:14:28.929021	1	f	f	\N	\N
315	End of lazy week	No workout all week, no good!	2022-11-11 07:48:14.219573	2022-11-11 07:48:59.723331	1	t	t	288	387
303	Easy Tuesday	Workout on Tuesday, November  1, 2022	2022-11-01 08:38:17.198496	2022-11-12 10:42:12.503236	1	f	f	\N	153
304	Thirsty Thursday	Workout on Thursday, November  3, 2022	2022-11-03 05:55:18.270618	2022-11-12 10:42:35.28307	1	f	f	\N	172
337	Only work, no workout 😭	Workout on Tuesday, November 22, 2022	2022-11-22 15:40:59.822779	2022-11-22 15:41:47.221751	1	t	f	\N	515
689	Full Body just with Randomizer	Workout on Monday, June 12, 2023	2023-06-12 17:06:17.03244	2023-06-27 09:24:37.969439	1	t	f	\N	3496
411	Friday workout	Full body workout - Friday, Jan 6, 2022 	2023-01-06 07:41:13.713829	2023-01-06 07:46:02.592968	1	t	t	403	1729
403	Post christmas blob	Friday, December 30, 2022 - Getting back into shape	2022-12-30 09:44:01.883543	2022-12-30 09:51:54.310176	1	t	f	\N	1517
620	Wake up call	Workout on Friday, May 12, 2023	2023-05-11 14:00:58.35655	2023-05-11 14:16:18.340365	1	f	f	\N	3079
614	Afternoon refresher	Workout on Tuesday, May  9, 2023	2023-05-09 05:58:57.653261	2023-05-11 14:16:26.511301	1	f	f	\N	3055
877	Italy, Summer 2023	Workout on Thursday, August 31, 2023	2023-08-31 07:23:53.671875	2023-08-31 07:24:12.994925	1	t	f	\N	5144
1593	Belly short	Workout on Friday, December 13, 2024	2024-12-13 07:34:16.733972	2024-12-13 07:34:32.459222	1	t	f	\N	15112
1595	Workout #58	Workout on Saturday, April 12, 2025	2025-04-12 14:33:29.070841	2025-04-12 14:33:29.070841	\N	t	f	\N	15187
646	🔥 Radomized Belly #1	Workout on Wednesday, May 24, 2023	2023-05-24 01:59:52.986937	2023-05-24 02:00:24.091168	1	t	f	\N	3228
887	Basque #1	Workout on Friday, September  8, 2023	2023-09-08 16:28:23.086083	2023-09-08 16:37:11.196964	1	t	f	\N	5185
1011	Gym	Little focus on belly and legs	2024-01-09 08:47:17.854724	2024-01-09 08:47:55.616698	1	t	f	\N	7845
438	Saturday workout	Getting in shape again and enjoy a good sauna afterwards.	2023-02-04 13:48:19.132805	2023-02-04 14:01:35.736777	1	f	f	\N	1983
476	Saturday workout	Getting in shape again and enjoy a good sauna afterwards.	2023-02-17 15:04:30.538301	2023-02-17 15:04:30.538301	1	f	t	438	2156
656	Kyoto Gym Belly Section	Workout on Monday, May 29, 2023	2023-05-29 01:58:04.551891	2023-05-29 01:59:50.536544	1	t	f	\N	3297
627	Belly 🔥	Morning workout against the Belly	2023-05-17 14:23:50.066494	2023-06-27 09:24:57.078965	1	f	t	7	3139
608	Quick refresher	Workout on Sunday, May  7, 2023	2023-05-07 03:34:22.453795	2023-05-11 14:16:34.013536	1	f	f	\N	3027
519	Quick and intense morning WO	Wed, March 8, 2023	2023-03-08 06:27:26.829163	2023-05-11 14:16:44.647478	1	f	t	403	2346
738	Quick gym - arms	Workout on Thursday, June 29, 2023	2023-06-29 08:08:35.760667	2023-06-29 08:13:23.740364	1	f	f	\N	3763
1594	Workout #57	Workout on Thursday, February 20, 2025	2025-02-20 06:23:18.267042	2025-02-20 06:23:18.267042	\N	t	f	\N	\N
764	Belly Gym	Workout on Wednesday, July  5, 2023	2023-07-05 09:13:11.375877	2023-07-05 09:13:23.820413	1	f	f	\N	3915
1290	Workout #49	Workout on Friday, March 29, 2024	2024-03-29 10:40:56.241598	2024-03-29 10:40:56.241598	1	t	f	\N	10940
970	Sat Gym	Workout on Saturday, December  2, 2023	2023-12-02 17:29:28.944624	2023-12-02 17:29:43.336151	1	t	f	\N	7173
\.


--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st_gym_user
--

SELECT pg_catalog.setval('public.action_text_rich_texts_id_seq', 3, true);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st_gym_user
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 49, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st_gym_user
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 53, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st_gym_user
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, false);


--
-- Name: ahoy_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st_gym_user
--

SELECT pg_catalog.setval('public.ahoy_events_id_seq', 6885, true);


--
-- Name: ahoy_visits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st_gym_user
--

SELECT pg_catalog.setval('public.ahoy_visits_id_seq', 15192, true);


--
-- Name: blocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st_gym_user
--

SELECT pg_catalog.setval('public.blocks_id_seq', 1647, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st_gym_user
--

SELECT pg_catalog.setval('public.categories_id_seq', 13, true);


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st_gym_user
--

SELECT pg_catalog.setval('public.contacts_id_seq', 28, true);


--
-- Name: exercise_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st_gym_user
--

SELECT pg_catalog.setval('public.exercise_categories_id_seq', 455, true);


--
-- Name: exercise_instances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st_gym_user
--

SELECT pg_catalog.setval('public.exercise_instances_id_seq', 1451, true);


--
-- Name: exercises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st_gym_user
--

SELECT pg_catalog.setval('public.exercises_id_seq', 212, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st_gym_user
--

SELECT pg_catalog.setval('public.posts_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st_gym_user
--

SELECT pg_catalog.setval('public.users_id_seq', 7, true);


--
-- Name: workouts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st_gym_user
--

SELECT pg_catalog.setval('public.workouts_id_seq', 1595, true);


--
-- Name: action_text_rich_texts action_text_rich_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.action_text_rich_texts
    ADD CONSTRAINT action_text_rich_texts_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ahoy_events ahoy_events_pkey; Type: CONSTRAINT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.ahoy_events
    ADD CONSTRAINT ahoy_events_pkey PRIMARY KEY (id);


--
-- Name: ahoy_visits ahoy_visits_pkey; Type: CONSTRAINT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.ahoy_visits
    ADD CONSTRAINT ahoy_visits_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: blocks blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.blocks
    ADD CONSTRAINT blocks_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: exercise_categories exercise_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.exercise_categories
    ADD CONSTRAINT exercise_categories_pkey PRIMARY KEY (id);


--
-- Name: exercise_instances exercise_instances_pkey; Type: CONSTRAINT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.exercise_instances
    ADD CONSTRAINT exercise_instances_pkey PRIMARY KEY (id);


--
-- Name: exercises exercises_pkey; Type: CONSTRAINT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.exercises
    ADD CONSTRAINT exercises_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: workouts workouts_pkey; Type: CONSTRAINT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.workouts
    ADD CONSTRAINT workouts_pkey PRIMARY KEY (id);


--
-- Name: index_action_text_rich_texts_uniqueness; Type: INDEX; Schema: public; Owner: st_gym_user
--

CREATE UNIQUE INDEX index_action_text_rich_texts_uniqueness ON public.action_text_rich_texts USING btree (record_type, record_id, name);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: st_gym_user
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: st_gym_user
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: st_gym_user
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: st_gym_user
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_ahoy_events_on_name_and_time; Type: INDEX; Schema: public; Owner: st_gym_user
--

CREATE INDEX index_ahoy_events_on_name_and_time ON public.ahoy_events USING btree (name, "time");


--
-- Name: index_ahoy_events_on_properties; Type: INDEX; Schema: public; Owner: st_gym_user
--

CREATE INDEX index_ahoy_events_on_properties ON public.ahoy_events USING gin (properties jsonb_path_ops);


--
-- Name: index_ahoy_events_on_user_id; Type: INDEX; Schema: public; Owner: st_gym_user
--

CREATE INDEX index_ahoy_events_on_user_id ON public.ahoy_events USING btree (user_id);


--
-- Name: index_ahoy_events_on_visit_id; Type: INDEX; Schema: public; Owner: st_gym_user
--

CREATE INDEX index_ahoy_events_on_visit_id ON public.ahoy_events USING btree (visit_id);


--
-- Name: index_ahoy_visits_on_user_id; Type: INDEX; Schema: public; Owner: st_gym_user
--

CREATE INDEX index_ahoy_visits_on_user_id ON public.ahoy_visits USING btree (user_id);


--
-- Name: index_ahoy_visits_on_visit_token; Type: INDEX; Schema: public; Owner: st_gym_user
--

CREATE UNIQUE INDEX index_ahoy_visits_on_visit_token ON public.ahoy_visits USING btree (visit_token);


--
-- Name: index_blocks_on_workout_id; Type: INDEX; Schema: public; Owner: st_gym_user
--

CREATE INDEX index_blocks_on_workout_id ON public.blocks USING btree (workout_id);


--
-- Name: index_exercise_categories_on_category_id; Type: INDEX; Schema: public; Owner: st_gym_user
--

CREATE INDEX index_exercise_categories_on_category_id ON public.exercise_categories USING btree (category_id);


--
-- Name: index_exercise_categories_on_exercise_id; Type: INDEX; Schema: public; Owner: st_gym_user
--

CREATE INDEX index_exercise_categories_on_exercise_id ON public.exercise_categories USING btree (exercise_id);


--
-- Name: index_exercise_instances_on_block_id; Type: INDEX; Schema: public; Owner: st_gym_user
--

CREATE INDEX index_exercise_instances_on_block_id ON public.exercise_instances USING btree (block_id);


--
-- Name: index_exercise_instances_on_exercise_id; Type: INDEX; Schema: public; Owner: st_gym_user
--

CREATE INDEX index_exercise_instances_on_exercise_id ON public.exercise_instances USING btree (exercise_id);


--
-- Name: index_exercises_on_user_id; Type: INDEX; Schema: public; Owner: st_gym_user
--

CREATE INDEX index_exercises_on_user_id ON public.exercises USING btree (user_id);


--
-- Name: index_posts_on_user_id; Type: INDEX; Schema: public; Owner: st_gym_user
--

CREATE INDEX index_posts_on_user_id ON public.posts USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: st_gym_user
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: st_gym_user
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_workouts_on_user_id; Type: INDEX; Schema: public; Owner: st_gym_user
--

CREATE INDEX index_workouts_on_user_id ON public.workouts USING btree (user_id);


--
-- Name: exercise_categories fk_rails_04faf0bb2e; Type: FK CONSTRAINT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.exercise_categories
    ADD CONSTRAINT fk_rails_04faf0bb2e FOREIGN KEY (exercise_id) REFERENCES public.exercises(id);


--
-- Name: blocks fk_rails_098e356e63; Type: FK CONSTRAINT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.blocks
    ADD CONSTRAINT fk_rails_098e356e63 FOREIGN KEY (workout_id) REFERENCES public.workouts(id);


--
-- Name: exercise_instances fk_rails_3a6b7a18de; Type: FK CONSTRAINT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.exercise_instances
    ADD CONSTRAINT fk_rails_3a6b7a18de FOREIGN KEY (block_id) REFERENCES public.blocks(id);


--
-- Name: workouts fk_rails_40b8fd8af6; Type: FK CONSTRAINT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.workouts
    ADD CONSTRAINT fk_rails_40b8fd8af6 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: exercise_instances fk_rails_4d133e6de6; Type: FK CONSTRAINT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.exercise_instances
    ADD CONSTRAINT fk_rails_4d133e6de6 FOREIGN KEY (exercise_id) REFERENCES public.exercises(id);


--
-- Name: posts fk_rails_5b5ddfd518; Type: FK CONSTRAINT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT fk_rails_5b5ddfd518 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: exercise_categories fk_rails_9705a7c5a0; Type: FK CONSTRAINT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.exercise_categories
    ADD CONSTRAINT fk_rails_9705a7c5a0 FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: exercises fk_rails_f4f6893528; Type: FK CONSTRAINT; Schema: public; Owner: st_gym_user
--

ALTER TABLE ONLY public.exercises
    ADD CONSTRAINT fk_rails_f4f6893528 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: st_gym_user
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

