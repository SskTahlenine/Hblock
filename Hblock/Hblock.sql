INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_hblock', 'hblock', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_hblock', 'hblock', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_hblock', 'hblock', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('hblock', 'hblock')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('hblock',0,'recruit','Recrue',20,'{}','{}'),
	('hblock',1,'gangster','Gangster',40,'{}','{}'),
	('hblock',2,'bandit','Bandit',60,'{}','{}'),
	('hblock',3,'boss','Chef du Gang',100,'{}','{}')
;