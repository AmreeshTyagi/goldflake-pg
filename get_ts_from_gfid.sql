-- FUNCTION: get_ts_from_gfid(id bigint)

-- DROP FUNCTION get_ts_from_gfid(id bigint);

CREATE OR REPLACE FUNCTION get_ts_from_gfid(
	id bigint)
    RETURNS timestamp without time zone
    LANGUAGE 'sql'

    COST 100
    IMMUTABLE 
    
AS $BODY$
  SELECT to_timestamp(((id >> 24) + 1601784910000 ) / 1000 )::timestamp without time zone;
$BODY$;

ALTER FUNCTION get_ts_from_gfid(id bigint)
    OWNER TO postgres;

COMMENT ON FUNCTION get_ts_from_gfid(id bigint)
    IS '39 bits from goldflake id representing timestamp';
