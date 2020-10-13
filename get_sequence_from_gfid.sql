-- FUNCTION: get_sequence_from_gfid(id bigint)

-- DROP FUNCTION get_sequence_from_gfid(id bigint);

CREATE OR REPLACE FUNCTION get_sequence_from_gfid(
	id bigint)
    RETURNS smallint
    LANGUAGE 'sql'

    COST 100
    IMMUTABLE 
    
AS $BODY$
  SELECT ((id & (1<<11)-1))::smallint;   -- unsigned sequence will be returned between 0-2047
$BODY$;

ALTER FUNCTION get_sequence_from_gfid(bigint)
    OWNER TO postgres;

COMMENT ON FUNCTION get_sequence_from_gfid(bigint)
    IS '11 bits from goldflake id representing sequence';
