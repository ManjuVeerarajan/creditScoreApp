INSERT INTO creditchecker_sysconfig (name,value,description,createdAt,UpdatedAt) VALUES
	 ('experian-trigger-time','5000','Triggering Experian For Every Sec',now(), now()),
	 ('experian-trigger-count','5','Experian Retival Count for Reconnect',now(), now()),
	 ('daysExpire','30 DAY','To check the date interval',now(), now());