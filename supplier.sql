DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `supplierID` mediumint default NULL,
  `supplierName` TEXT default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO `supplier` (`supplierID`,`supplierName`)
VALUES
  (384057,"mattis semper,"),
  (600413,"sem."),
  (614361,"ac turpis egestas."),
  (572948,"elit, pharetra ut,"),
  (877474,"Donec tempus,"),
  (358152,"amet ante."),
  (888932,"scelerisque mollis. Phasellus"),
  (223550,"turpis."),
  (602670,"elit fermentum"),
  (975100,"in");
INSERT INTO `supplier` (`supplierID`,`supplierName`)
VALUES
  (270677,"nibh"),
  (883256,"et"),
  (668485,"justo sit"),
  (649796,"in felis."),
  (239102,"accumsan sed,"),
  (582463,"lectus."),
  (861662,"lectus rutrum urna,"),
  (496702,"nisi dictum"),
  (668958,"molestie"),
  (550057,"fringilla cursus purus.");
