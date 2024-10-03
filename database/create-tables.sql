CREATE TABLE IF NOT EXISTS public.pluviometros
(
    id integer NOT NULL DEFAULT nextval('pluviometros_id_seq'::regclass),
    geom geometry(Point,4326),
    acc24hr double precision,
    acc48hr double precision,
    acc72hr double precision,
    acc96hr double precision,
    CONSTRAINT pluviometros_pkey PRIMARY KEY (id)
);

CREATE INDEX IF NOT EXISTS sidx_pluviometros_geom
    ON public.pluviometros USING gist
    (geom)
    TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS public.pontos_interesse
(
    id integer NOT NULL DEFAULT nextval('pontos_interesse_id_seq'::regclass),
    geom geometry(Point,4326),
    CONSTRAINT pontos_interesse_pkey PRIMARY KEY (id)
);

CREATE INDEX IF NOT EXISTS sidx_pontos_interesse_geom
    ON public.pontos_interesse USING gist
    (geom)
    TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS public.municipios
(
    id integer NOT NULL DEFAULT nextval('municipios_id_seq'::regclass),
    geom geometry(MultiPolygon,4326),
    index character varying COLLATE pg_catalog."default",
    cd_mun character varying COLLATE pg_catalog."default",
    nm_mun character varying COLLATE pg_catalog."default",
    sigla_uf character varying COLLATE pg_catalog."default",
    area_km2 double precision,
    CONSTRAINT municipios_pkey PRIMARY KEY (id)
);

CREATE INDEX IF NOT EXISTS sidx_municipios_geom
    ON public.municipios USING gist
    (geom)
    TABLESPACE pg_default;