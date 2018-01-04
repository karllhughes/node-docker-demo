-- Poor man's migrations --

-- 12/18/17 --
CREATE TABLE public.colleges
(
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR NOT NULL,
    created_at TIMESTAMP DEFAULT NULL ,
    updated_at TIMESTAMP DEFAULT NULL
);
