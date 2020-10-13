-- FUNCTION: get_shard_from_gfid(id bigint)

-- DROP FUNCTION get_shard_from_gfid(id bigint);

CREATE OR REPLACE FUNCTION get_shard_from_gfid(
	id bigint)
    RETURNS smallint
    LANGUAGE 'sql'

    COST 100
    IMMUTABLE 
    
AS $BODY$
  SELECT ((id<<40)>>51)::smallint;    -- unsigned shard id will returned between 0-8191
$BODY$;

ALTER FUNCTION get_shard_from_gfid(id bigint)  
    OWNER TO postgres;

COMMENT ON FUNCTION get_shard_from_gfid(id bigint)
    IS '13 bits from goldflake id representing shard';
