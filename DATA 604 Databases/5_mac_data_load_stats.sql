Use Stats;

-- Populate table Tests
INSERT INTO Stats.Tests(testid) VALUES ('Test ABC');
INSERT INTO Stats.Tests(testid) VALUES ('Test XYZ');

-- Populate table Scores
INSERT INTO Stats.Scores(testid, studentid, score) VALUES
  ('Test ABC', 'Student A', 95);
INSERT INTO Stats.Scores(testid, studentid, score) VALUES
  ('Test ABC', 'Student B', 80);
INSERT INTO Stats.Scores(testid, studentid, score) VALUES
  ('Test ABC', 'Student C', 55);
INSERT INTO Stats.Scores(testid, studentid, score) VALUES
  ('Test ABC', 'Student D', 55);
INSERT INTO Stats.Scores(testid, studentid, score) VALUES
  ('Test ABC', 'Student E', 50);
INSERT INTO Stats.Scores(testid, studentid, score) VALUES
  ('Test ABC', 'Student F', 80);
INSERT INTO Stats.Scores(testid, studentid, score) VALUES
  ('Test ABC', 'Student G', 95);
INSERT INTO Stats.Scores(testid, studentid, score) VALUES
  ('Test ABC', 'Student H', 65);
INSERT INTO Stats.Scores(testid, studentid, score) VALUES
  ('Test ABC', 'Student I', 75);
INSERT INTO Stats.Scores(testid, studentid, score) VALUES
  ('Test XYZ', 'Student A', 95);
INSERT INTO Stats.Scores(testid, studentid, score) VALUES
  ('Test XYZ', 'Student B', 80);
INSERT INTO Stats.Scores(testid, studentid, score) VALUES
  ('Test XYZ', 'Student C', 55);
INSERT INTO Stats.Scores(testid, studentid, score) VALUES
  ('Test XYZ', 'Student D', 55);
INSERT INTO Stats.Scores(testid, studentid, score) VALUES
  ('Test XYZ', 'Student E', 50);
INSERT INTO Stats.Scores(testid, studentid, score) VALUES
  ('Test XYZ', 'Student F', 80);
INSERT INTO Stats.Scores(testid, studentid, score) VALUES
  ('Test XYZ', 'Student G', 95);
INSERT INTO Stats.Scores(testid, studentid, score) VALUES
  ('Test XYZ', 'Student H', 65);
INSERT INTO Stats.Scores(testid, studentid, score) VALUES
  ('Test XYZ', 'Student I', 75);
INSERT INTO Stats.Scores(testid, studentid, score) VALUES
  ('Test XYZ', 'Student J', 95);


-- truncate Nums; 

INSERT INTO Stats.Nums VALUES(1);

DROP PROCEDURE IF EXISTS Create_Nums_Tbl;

DELIMITER //

CREATE PROCEDURE Create_Nums_Tbl()
BEGIN
  SET @max_Value = 100000;
  SET @rc = 1;
  -- select n, @rc from Nums;

  test_loop : LOOP
    IF ((@rc * 2 > @max_value)) THEN
      LEAVE test_loop;
    END IF;
	-- select n, @rc from Nums;
    INSERT INTO Stats.Nums SELECT n + @rc FROM Stats.Nums;
    SET @rc = @rc * 2; 
  END LOOP; 
END //

DELIMITER ;

call Create_Nums_Tbl;

-- select * from Stats.nums;