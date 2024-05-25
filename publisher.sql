DROP TABLE IF EXISTS `publisher`;

CREATE TABLE `publisher` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `PublisherD` mediumint default NULL,
  `PublisherName` TEXT default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO `publisher` (`PublisherD`,`PublisherName`)
VALUES
  (872449,"enim nisl"),
  (731153,"Quisque fringilla"),
  (835663,"pharetra, felis"),
  (886677,"cursus luctus,"),
  (867753,"sit amet, faucibus"),
  (909556,"libero est,"),
  (555905,"turpis. Aliquam"),
  (854104,"tincidunt vehicula"),
  (254077,"Phasellus libero mauris,"),
  (258364,"vitae");
INSERT INTO `publisher` (`PublisherD`,`PublisherName`)
VALUES
  (368302,"Cum sociis"),
  (694020,"augue malesuada"),
  (510059,"eleifend,"),
  (814303,"nibh. Quisque"),
  (888941,"dui"),
  (802432,"amet"),
  (548751,"Mauris vestibulum,"),
  (165745,"id, libero."),
  (983562,"massa. Integer"),
  (963521,"commodo");
