-- SEQUENCE: table_gfid_sequence

-- DROP SEQUENCE table_gfid_sequence;

CREATE SEQUENCE table_gfid_sequence
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE table_gfid_sequence
    OWNER TO postgres;