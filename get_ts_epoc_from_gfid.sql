-- FUNCTION: get_ts_epoc_from_gfid(id bigint)

-- DROP FUNCTION get_ts_epoc_from_gfid(id bigint);

CREATE OR REPLACE FUNCTION get_ts_epoc_from_gfid(
	id bigint)
    RETURNS timestamp without time zone
    LANGUAGE 'sql'

    COST 100
    IMMUTABLE 
    
AS $BODY$
  SELECT ((id >> 24) + 1601784910000 );
$BODY$;

ALTER FUNCTION get_ts_epoc_from_gfid(id bigint)
    OWNER TO postgres;

COMMENT ON FUNCTION get_ts_epoc_from_gfid(id bigint)
    IS '39 bits from goldflake id representing timestamp epoc';
