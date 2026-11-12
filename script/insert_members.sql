INSERT INTO member SELECT i, 'member_' || i FROM generate_series(1, 1000) AS i;
