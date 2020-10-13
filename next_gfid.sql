-- FUNCTION: next_gfid()

-- DROP FUNCTION next_gfid();

CREATE OR REPLACE FUNCTION next_gfid(
	OUT result bigint)
    RETURNS bigint
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    
AS $BODY$
DECLARE
    our_epoch bigint := 1601784910000; 
    sequence_id bigint;
    now_10th_millis bigint;
    shard_id int := 1234;
BEGIN
   SELECT nextval('table_gfid_sequence') % 2048 INTO sequence_id;
    SELECT FLOOR(EXTRACT(EPOCH FROM clock_timestamp()) * 1000/10) INTO now_10th_millis;
    result := (now_10th_millis - our_epoch) << (63-39);  --  39 bit for time will gives us 174 years lifetime
    result := result | (shard_id << (63-39-13)); -- 13 bit for machine or shard id will gives us 0-8191 shards/db instances to generate IDs
    result := result | (sequence_id);  -- 11 bit for sequence id will gives us 2^11 i.e. 2048 unique id in 10 milliseconds i.e. 204800 IDs in 1 second
END;
    $BODY$;

ALTER FUNCTION next_gfid()
    OWNER TO postgres;
