CREATE TABLE `carshop_display` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop` varchar(60) NOT NULL,
  `index` int(11) NOT NULL,
  `model` varchar(60) NOT NULL,
  `commission` int(11) NOT NULL DEFAULT 15,
  `seller` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

INSERT INTO `carshop_display` (`shop`, `index`, `model`, `commission`, `seller`) VALUES
	('pdm', 1, 'cyclone', 15, '0'),
    ('pdm', 2, 'baller3', 15, '0'),
    ('pdm', 3, 'elegy2', 15, '0'),
    ('pdm', 4, 'cogcabrio', 15, '0'),
    ('pdm', 5, 'kanjo', 15, '0'),
    ('pdm', 6, 'dominator', 15, '0'),
    ('tuner', 1, '370Z', 15, '0'),
    ('tuner', 2, 'LWGTR', 15, '0'),
    ('tuner', 3, 's15rb', 15, '0'),
    ('tuner', 4, 'm4', 15, '0'),
    ('tuner', 5, 'gt63', 15, '0'),
    ('tuner', 6, 'evo9', 15, '0');

CREATE TABLE `carshop_vehicles` (
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `shop` varchar(60) NOT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `carshop_vehicles` (`model`, `price`, `category`, `stock`, `shop`) VALUES
	('benson', 69, 'trucks', 0, 'pdm'),
    ('hauler', 69, 'trucks', 0, 'pdm'),
    ('mule', 69, 'trucks', 0, 'pdm'),
    ('mule2', 69, 'trucks', 0, 'pdm'),
    ('mule3', 69, 'trucks', 0, 'pdm'),
    ('mule4', 69, 'trucks', 0, 'pdm'),
    ('packer', 69, 'trucks', 0, 'pdm'),
    ('phantom', 69, 'trucks', 0, 'pdm'),
    ('phantom3', 69, 'trucks', 0, 'pdm'),
    ('pounder', 69, 'trucks', 0, 'pdm'),
    ('pounder2', 69, 'trucks', 0, 'pdm'),
    ('towtruck', 69, 'trucks', 0, 'pdm'),
    ('towtruck2', 69, 'trucks', 0, 'pdm'),
    ('flatbed', 69, 'trucks', 0, 'pdm'),
    ('asbo', 69, 'compacts', 0, 'pdm'),
    ('blista', 69, 'compacts', 0, 'pdm'),
    ('brioso', 69, 'compacts', 0, 'pdm'),
    ('club', 69, 'compacts', 0, 'pdm'),
    ('dilettante', 69, 'compacts', 0, 'pdm'),
    ('kanjo', 69, 'compacts', 0, 'pdm'),
    ('issi2', 69, 'compacts', 0, 'pdm'),
    ('issi3', 69, 'compacts', 0, 'pdm'),
    ('panto', 69, 'compacts', 0, 'pdm'),
    ('prairie', 69, 'compacts', 0, 'pdm'),
    ('rhapsody', 69, 'compacts', 0, 'pdm'),
    ('brioso2', 69, 'compacts', 0, 'pdm'),
    ('weevil', 69, 'compacts', 0, 'pdm'),
    ('cogcabrio', 69, 'coupes', 0, 'pdm'),
    ('exemplar', 69, 'coupes', 0, 'pdm'),
    ('f620', 69, 'coupes', 0, 'pdm'),
    ('felon', 69, 'coupes', 0, 'pdm'),
    ('felon2', 69, 'coupes', 0, 'pdm'),
    ('jackal', 69, 'coupes', 0, 'pdm'),
    ('oracle', 69, 'coupes', 0, 'pdm'),
    ('oracle2', 69, 'coupes', 0, 'pdm'),
    ('sentinel', 69, 'coupes', 0, 'pdm'),
    ('sentinel2', 69, 'coupes', 0, 'pdm'),
    ('windsor', 69, 'coupes', 0, 'pdm'),
    ('windsor2', 69, 'coupes', 0, 'pdm'),
    ('zion', 69, 'coupes', 0, 'pdm'),
    ('zion2', 69, 'coupes', 0, 'pdm'),
    ('bulldozer', 69, 'industrials', 0, 'pdm'),
    ('cutter', 69, 'industrials', 0, 'pdm'),
    ('dump', 69, 'industrials', 0, 'pdm'),
    ('guardian', 69, 'industrials', 0, 'pdm'),
    ('handler', 69, 'industrials', 0, 'pdm'),
    ('mixer', 69, 'industrials', 0, 'pdm'),
    ('mixer2', 69, 'industrials', 0, 'pdm'),
    ('rubble', 69, 'industrials', 0, 'pdm'),
    ('tiptruck', 69, 'industrials', 0, 'pdm'),
    ('tiptruck2', 69, 'industrials', 0, 'pdm'),
    ('akuma', 69, 'motorcycles', 0, 'pdm'),
    ('avarus', 69, 'motorcycles', 0, 'pdm'),
    ('bagger', 69, 'motorcycles', 0, 'pdm'),
    ('bati', 69, 'motorcycles', 0, 'pdm'),
    ('bati2', 69, 'motorcycles', 0, 'pdm'),
    ('bf400', 69, 'motorcycles', 0, 'pdm'),
    ('carbonrs', 69, 'motorcycles', 0, 'pdm'),
    ('chimera', 69, 'motorcycles', 0, 'pdm'),
    ('cliffhanger', 69, 'motorcycles', 0, 'pdm'),
    ('daemon', 69, 'motorcycles', 0, 'pdm'),
    ('daemon2', 69, 'motorcycles', 0, 'pdm'),
    ('defiler', 69, 'motorcycles', 0, 'pdm'),
    ('diablous', 69, 'motorcycles', 0, 'pdm'),
    ('diablous2', 69, 'motorcycles', 0, 'pdm'),
    ('double', 69, 'motorcycles', 0, 'pdm'),
    ('enduro', 69, 'motorcycles', 0, 'pdm'),
    ('esskey', 69, 'motorcycles', 0, 'pdm'),
    ('faggio', 69, 'motorcycles', 0, 'pdm'),
    ('faggio2', 69, 'motorcycles', 0, 'pdm'),
    ('faggio3', 69, 'motorcycles', 0, 'pdm'),
    ('fcr', 69, 'motorcycles', 0, 'pdm'),
    ('fcr2', 69, 'motorcycles', 0, 'pdm'),
    ('gargoyle', 69, 'motorcycles', 0, 'pdm'),
    ('hakuchou', 69, 'motorcycles', 0, 'pdm'),
    ('hakuchou2', 69, 'motorcycles', 0, 'pdm'),
    ('hexer', 69, 'motorcycles', 0, 'pdm'),
    ('innovation', 69, 'motorcycles', 0, 'pdm'),
    ('lectro', 69, 'motorcycles', 0, 'pdm'),
    ('manchez', 69, 'motorcycles', 0, 'pdm'),
    ('nemesis', 69, 'motorcycles', 0, 'pdm'),
    ('nightblade', 69, 'motorcycles', 0, 'pdm'),
    ('pcj', 69, 'motorcycles', 0, 'pdm'),
    ('ratbike', 69, 'motorcycles', 0, 'pdm'),
    ('ruffian', 69, 'motorcycles', 0, 'pdm'),
    ('rrocket', 69, 'motorcycles', 0, 'pdm'),
    ('sanchez', 69, 'motorcycles', 0, 'pdm'),
    ('sanchez2', 69, 'motorcycles', 0, 'pdm'),
    ('sanctus', 69, 'motorcycles', 0, 'pdm'),
    ('shotaro', 69, 'motorcycles', 0, 'pdm'),
    ('sovereign', 69, 'motorcycles', 0, 'pdm'),
    ('stryder', 69, 'motorcycles', 0, 'pdm'),
    ('thrust', 69, 'motorcycles', 0, 'pdm'),
    ('vader', 69, 'motorcycles', 0, 'pdm'),
    ('vindicator', 69, 'motorcycles', 0, 'pdm'),
    ('vortex', 69, 'motorcycles', 0, 'pdm'),
    ('wolfsbane', 69, 'motorcycles', 0, 'pdm'),
    ('zombiea', 69, 'motorcycles', 0, 'pdm'),
    ('zombieb', 69, 'motorcycles', 0, 'pdm'),
    ('manchez2', 69, 'motorcycles', 0, 'pdm'),
    ('blade', 69, 'muscles', 0, 'pdm'),
    ('buccaneer', 69, 'muscles', 0, 'pdm'),
    ('buccaneer2', 69, 'muscles', 0, 'pdm'),
    ('chino', 69, 'muscles', 0, 'pdm'),
    ('chino2', 69, 'muscles', 0, 'pdm'),
    ('clique', 69, 'muscles', 0, 'pdm'),
    ('coquette3', 69, 'muscles', 0, 'pdm'),
    ('deviant', 69, 'muscles', 0, 'pdm'),
    ('dominator', 69, 'muscles', 0, 'pdm'),
    ('dominator2', 69, 'muscles', 0, 'pdm'),
    ('dominator3', 69, 'muscles', 0, 'pdm'),
    ('dukes', 69, 'muscles', 0, 'pdm'),
    ('dukes2', 69, 'muscles', 0, 'pdm'),
    ('dukes3', 69, 'muscles', 0, 'pdm'),
    ('faction', 69, 'muscles', 0, 'pdm'),
    ('faction2', 69, 'muscles', 0, 'pdm'),
    ('faction3', 69, 'muscles', 0, 'pdm'),
    ('ellie', 69, 'muscles', 0, 'pdm'),
    ('gauntlet', 69, 'muscles', 0, 'pdm'),
    ('gauntlet2', 69, 'muscles', 0, 'pdm'),
    ('gauntlet3', 69, 'muscles', 0, 'pdm'),
    ('gauntlet4', 69, 'muscles', 0, 'pdm'),
    ('gauntlet5', 69, 'muscles', 0, 'pdm'),
    ('hermes', 69, 'muscles', 0, 'pdm'),
    ('hotknife', 69, 'muscles', 0, 'pdm'),
    ('hustler', 69, 'muscles', 0, 'pdm'),
    ('impaler', 69, 'muscles', 0, 'pdm'),
    ('lurcher', 69, 'muscles', 0, 'pdm'),
    ('nightshade', 69, 'muscles', 0, 'pdm'),
    ('peyote2', 69, 'muscles', 0, 'pdm'),
    ('phoenix', 69, 'muscles', 0, 'pdm'),
    ('picador', 69, 'muscles', 0, 'pdm'),
    ('ruiner', 69, 'muscles', 0, 'pdm'),
    ('ruiner2', 69, 'muscles', 0, 'pdm'),
    ('ruiner3', 69, 'muscles', 0, 'pdm'),
    ('sabregt', 69, 'muscles', 0, 'pdm'),
    ('sabregt2', 69, 'muscles', 0, 'pdm'),
    ('stalion', 69, 'muscles', 0, 'pdm'),
    ('stalion2', 69, 'muscles', 0, 'pdm'),
    ('tampa', 69, 'muscles', 0, 'pdm'),
    ('tampa3', 69, 'muscles', 0, 'pdm'),
    ('tulip', 69, 'muscles', 0, 'pdm'),
    ('vamos', 69, 'muscles', 0, 'pdm'),
    ('vigero', 69, 'muscles', 0, 'pdm'),
    ('virgo', 69, 'muscles', 0, 'pdm'),
    ('virgo2', 69, 'muscles', 0, 'pdm'),
    ('virgo3', 69, 'muscles', 0, 'pdm'),
    ('voodoo', 69, 'muscles', 0, 'pdm'),
    ('voodoo2', 69, 'muscles', 0, 'pdm'),
    ('bfinjection', 69, 'offroads', 0, 'pdm'),
    ('bifta', 69, 'offroads', 0, 'pdm'),
    ('blazer', 69, 'offroads', 0, 'pdm'),
    ('blazer2', 69, 'offroads', 0, 'pdm'),
    ('blazer3', 69, 'offroads', 0, 'pdm'),
    ('blazer4', 69, 'offroads', 0, 'pdm'),
    ('blazer5', 69, 'offroads', 0, 'pdm'),
    ('bodhi2', 69, 'offroads', 0, 'pdm'),
    ('brawler', 69, 'offroads', 0, 'pdm'),
    ('caracara2', 69, 'offroads', 0, 'pdm'),
    ('dloader', 69, 'offroads', 0, 'pdm'),
    ('dubsta3', 69, 'offroads', 0, 'pdm'),
    ('dune', 69, 'offroads', 0, 'pdm'),
    ('dune2', 69, 'offroads', 0, 'pdm'),
    ('dune3', 69, 'offroads', 0, 'pdm'),
    ('everon', 69, 'offroads', 0, 'pdm'),
    ('freecrawler', 69, 'offroads', 0, 'pdm'),
    ('hellion', 69, 'offroads', 0, 'pdm'),
    ('kalahari', 69, 'offroads', 0, 'pdm'),
    ('kamacho', 69, 'offroads', 0, 'pdm'),
    ('marshall', 69, 'offroads', 0, 'pdm'),
    ('mesa3', 69, 'offroads', 0, 'pdm'),
    ('monster', 69, 'offroads', 0, 'pdm'),
    ('outlaw', 69, 'offroads', 0, 'pdm'),
    ('rancherxl', 69, 'offroads', 0, 'pdm'),
    ('rancherxl2', 69, 'offroads', 0, 'pdm'),
    ('rebel', 69, 'offroads', 0, 'pdm'),
    ('rebel2', 69, 'offroads', 0, 'pdm'),
    ('riata', 69, 'offroads', 0, 'pdm'),
    ('sandking', 69, 'offroads', 0, 'pdm'),
    ('sandking2', 69, 'offroads', 0, 'pdm'),
    ('trophytruck', 69, 'offroads', 0, 'pdm'),
    ('trophytruck2', 69, 'offroads', 0, 'pdm'),
    ('vagrant', 69, 'offroads', 0, 'pdm'),
    ('zhaba', 69, 'offroads', 0, 'pdm'),
    ('verus', 69, 'offroads', 0, 'pdm'),
    ('winky', 69, 'offroads', 0, 'pdm'),
    ('ratloader', 69, 'offroads', 0, 'pdm'),
    ('ratloader2', 69, 'offroads', 0, 'pdm'),
    ('slamvan', 69, 'offroads', 0, 'pdm'),
    ('slamvan2', 69, 'offroads', 0, 'pdm'),
    ('slamvan3', 69, 'offroads', 0, 'pdm'),
    ('yosemite', 69, 'offroads', 0, 'pdm'),
    ('yosemite2', 69, 'offroads', 0, 'pdm'),
    ('yosemite3', 69, 'offroads', 0, 'pdm'),
    ('sadler', 69, 'offroads', 0, 'pdm'),
    ('baller', 69, 'suvs', 0, 'pdm'),
    ('baller2', 69, 'suvs', 0, 'pdm'),
    ('baller3', 69, 'suvs', 0, 'pdm'),
    ('baller4', 69, 'suvs', 0, 'pdm'),
    ('bjx1', 69, 'suvs', 0, 'pdm'),
    ('cavalcade', 69, 'suvs', 0, 'pdm'),
    ('cavalcade2', 69, 'suvs', 0, 'pdm'),
    ('contender', 69, 'suvs', 0, 'pdm'),
    ('dubsta', 69, 'suvs', 0, 'pdm'),
    ('dubsta2', 69, 'suvs', 0, 'pdm'),
    ('fq2', 69, 'suvs', 0, 'pdm'),
    ('granger', 69, 'suvs', 0, 'pdm'),
    ('gresley', 69, 'suvs', 0, 'pdm'),
    ('habanero', 69, 'suvs', 0, 'pdm'),
    ('huntley', 69, 'suvs', 0, 'pdm'),
    ('landstalker', 69, 'suvs', 0, 'pdm'),
    ('landstalker2', 69, 'suvs', 0, 'pdm'),
    ('mesa', 69, 'suvs', 0, 'pdm'),
    ('novak', 69, 'suvs', 0, 'pdm'),
    ('patriot', 69, 'suvs', 0, 'pdm'),
    ('patriot2', 69, 'suvs', 0, 'pdm'),
    ('radi', 69, 'suvs', 0, 'pdm'),
    ('rebla', 69, 'suvs', 0, 'pdm'),
    ('rocoto', 69, 'suvs', 0, 'pdm'),
    ('seminole', 69, 'suvs', 0, 'pdm'),
    ('seminole2', 69, 'suvs', 0, 'pdm'),
    ('serrano', 69, 'suvs', 0, 'pdm'),
    ('toros', 69, 'suvs', 0, 'pdm'),
    ('xls', 69, 'suvs', 0, 'pdm'),
    ('xls2', 69, 'suvs', 0, 'pdm'),
    ('squaddie', 69, 'suvs', 0, 'pdm'),
    ('asea', 69, 'sedans', 0, 'pdm'),
    ('asterope', 69, 'sedans', 0, 'pdm'),
    ('cog55', 69, 'sedans', 0, 'pdm'),
    ('cog552', 69, 'sedans', 0, 'pdm'),
    ('cognoscenti', 69, 'sedans', 0, 'pdm'),
    ('cognoscenti2', 69, 'sedans', 0, 'pdm'),
    ('emperor', 69, 'sedans', 0, 'pdm'),
    ('emperor2', 69, 'sedans', 0, 'pdm'),
    ('fugitive', 69, 'sedans', 0, 'pdm'),
    ('glendale', 69, 'sedans', 0, 'pdm'),
    ('glendale2', 69, 'sedans', 0, 'pdm'),
    ('ingot', 69, 'sedans', 0, 'pdm'),
    ('intruder', 69, 'sedans', 0, 'pdm'),
    ('premier', 69, 'sedans', 0, 'pdm'),
    ('primo', 69, 'sedans', 0, 'pdm'),
    ('primo2', 69, 'sedans', 0, 'pdm'),
    ('regina', 69, 'sedans', 0, 'pdm'),
    ('romero', 69, 'sedans', 0, 'pdm'),
    ('stafford', 69, 'sedans', 0, 'pdm'),
    ('stainier', 69, 'sedans', 0, 'pdm'),
    ('stratum', 69, 'sedans', 0, 'pdm'),
    ('stretch', 69, 'sedans', 0, 'pdm'),
    ('superd', 69, 'sedans', 0, 'pdm'),
    ('surge', 69, 'sedans', 0, 'pdm'),
    ('tailgater', 69, 'sedans', 0, 'pdm'),
    ('warrener', 69, 'sedans', 0, 'pdm'),
    ('washington', 69, 'sedans', 0, 'pdm'),
    ('airbus', 69, 'services', 0, 'pdm'),
    ('bus', 69, 'services', 0, 'pdm'),
    ('coach', 69, 'services', 0, 'pdm'),
    ('rentalbus', 69, 'services', 0, 'pdm'),
    ('taxi', 69, 'services', 0, 'pdm'),
    ('tourbus', 69, 'services', 0, 'pdm'),
    ('alpha', 69, 'sports', 0, 'pdm'),
    ('banshee', 69, 'sports', 0, 'pdm'),
    ('bestiagts', 69, 'sports', 0, 'pdm'),
    ('blista2', 69, 'sports', 0, 'pdm'),
    ('blista3', 69, 'sports', 0, 'pdm'),
    ('buffalo', 69, 'sports', 0, 'pdm'),
    ('buffalo2', 69, 'sports', 0, 'pdm'),
    ('buffalo3', 69, 'sports', 0, 'pdm'),
    ('carbonizzare', 69, 'sports', 0, 'pdm'),
    ('comet2', 69, 'sports', 0, 'pdm'),
    ('comet3', 69, 'sports', 0, 'pdm'),
    ('comet4', 69, 'sports', 0, 'pdm'),
    ('comet5', 69, 'sports', 0, 'pdm'),
    ('coquette', 69, 'sports', 0, 'pdm'),
    ('coquette4', 69, 'sports', 0, 'pdm'),
    ('drafter', 69, 'sports', 0, 'pdm'),
    ('deveste', 69, 'sports', 0, 'pdm'),
    ('elegy', 69, 'sports', 0, 'pdm'),
    ('elegy2', 69, 'sports', 0, 'pdm'),
    ('feltzer2', 69, 'sports', 0, 'pdm'),
    ('flashgt', 69, 'sports', 0, 'pdm'),
    ('furoregt', 69, 'sports', 0, 'pdm'),
    ('fusilade', 69, 'sports', 0, 'pdm'),
    ('futo', 69, 'sports', 0, 'pdm'),
    ('gb200', 69, 'sports', 0, 'pdm'),
    ('hotring', 69, 'sports', 0, 'pdm'),
    ('komoda', 69, 'sports', 0, 'pdm'),
    ('imorgon', 69, 'sports', 0, 'pdm'),
    ('issi7', 69, 'sports', 0, 'pdm'),
    ('italigto', 69, 'sports', 0, 'pdm'),
    ('jugular', 69, 'sports', 0, 'pdm'),
    ('jester', 69, 'sports', 0, 'pdm'),
    ('jester2', 69, 'sports', 0, 'pdm'),
    ('jester3', 69, 'sports', 0, 'pdm'),
    ('khamelion', 69, 'sports', 0, 'pdm'),
    ('kuruma', 69, 'sports', 0, 'pdm'),
    ('locust', 69, 'sports', 0, 'pdm'),
    ('lynx', 69, 'sports', 0, 'pdm'),
    ('massacro', 69, 'sports', 0, 'pdm'),
    ('massacro2', 69, 'sports', 0, 'pdm'),
    ('neo', 69, 'sports', 0, 'pdm'),
    ('neon', 69, 'sports', 0, 'pdm'),
    ('ninef', 69, 'sports', 0, 'pdm'),
    ('ninef2', 69, 'sports', 0, 'pdm'),
    ('omnis', 69, 'sports', 0, 'pdm'),
    ('paragon', 69, 'sports', 0, 'pdm'),
    ('paragon2', 69, 'sports', 0, 'pdm'),
    ('pariah', 69, 'sports', 0, 'pdm'),
    ('penumbra', 69, 'sports', 0, 'pdm'),
    ('penumbra2', 69, 'sports', 0, 'pdm'),
    ('raiden', 69, 'sports', 0, 'pdm'),
    ('rapidgt', 69, 'sports', 0, 'pdm'),
    ('rapidgt2', 69, 'sports', 0, 'pdm'),
    ('raptor', 69, 'sports', 0, 'pdm'),
    ('revolter', 69, 'sports', 0, 'pdm'),
    ('ruston', 69, 'sports', 0, 'pdm'),
    ('shafter2', 69, 'sports', 0, 'pdm'),
    ('shafter3', 69, 'sports', 0, 'pdm'),
    ('shafter4', 69, 'sports', 0, 'pdm'),
    ('schafter5', 69, 'sports', 0, 'pdm'),
    ('schafter6', 69, 'sports', 0, 'pdm'),
    ('schlagen', 69, 'sports', 0, 'pdm'),
    ('schwarzer', 69, 'sports', 0, 'pdm'),
    ('sentinel3', 69, 'sports', 0, 'pdm'),
    ('seven70', 69, 'sports', 0, 'pdm'),
    ('specter', 69, 'sports', 0, 'pdm'),
    ('specter2', 69, 'sports', 0, 'pdm'),
    ('streiter', 69, 'sports', 0, 'pdm'),
    ('sugoi', 69, 'sports', 0, 'pdm'),
    ('sultan', 69, 'sports', 0, 'pdm'),
    ('sultan2', 69, 'sports', 0, 'pdm'),
    ('surano', 69, 'sports', 0, 'pdm'),
    ('tampa2', 69, 'sports', 0, 'pdm'),
    ('tropos', 69, 'sports', 0, 'pdm'),
    ('verlierer2', 69, 'sports', 0, 'pdm'),
    ('vstr', 69, 'sports', 0, 'pdm'),
    ('italirsx', 69, 'sports', 0, 'pdm'),
    ('veto', 69, 'sports', 0, 'pdm'),
    ('veto2', 69, 'sports', 0, 'pdm'),
    ('ardent', 69, 'sportsclassics', 0, 'pdm'),
    ('btype', 69, 'sportsclassics', 0, 'pdm'),
    ('btype2', 69, 'sportsclassics', 0, 'pdm'),
    ('btype3', 69, 'sportsclassics', 0, 'pdm'),
    ('casco', 69, 'sportsclassics', 0, 'pdm'),
    ('cheetah2', 69, 'sportsclassics', 0, 'pdm'),
    ('coquette2', 69, 'sportsclassics', 0, 'pdm'),
    ('deluxo', 69, 'sportsclassics', 0, 'pdm'),
    ('dynasty', 69, 'sportsclassics', 0, 'pdm'),
    ('fagaloa', 69, 'sportsclassics', 0, 'pdm'),
    ('feltzer3', 69, 'sportsclassics', 0, 'pdm'),
    ('gt500', 69, 'sportsclassics', 0, 'pdm'),
    ('infernus2', 69, 'sportsclassics', 0, 'pdm'),
    ('jb700', 69, 'sportsclassics', 0, 'pdm'),
    ('jb7002', 69, 'sportsclassics', 0, 'pdm'),
    ('mamba', 69, 'sportsclassics', 0, 'pdm'),
    ('manana', 69, 'sportsclassics', 0, 'pdm'),
    ('manana2', 69, 'sportsclassics', 0, 'pdm'),
    ('michelli', 69, 'sportsclassics', 0, 'pdm'),
    ('monroe', 69, 'sportsclassics', 0, 'pdm'),
    ('nebula', 69, 'sportsclassics', 0, 'pdm'),
    ('peyote', 69, 'sportsclassics', 0, 'pdm'),
    ('peyote3', 69, 'sportsclassics', 0, 'pdm'),
    ('pigalle', 69, 'sportsclassics', 0, 'pdm'),
    ('rapidgt3', 69, 'sportsclassics', 0, 'pdm'),
    ('retinue', 69, 'sportsclassics', 0, 'pdm'),
    ('retinue2', 69, 'sportsclassics', 0, 'pdm'),
    ('savestra', 69, 'sportsclassics', 0, 'pdm'),
    ('stinger', 69, 'sportsclassics', 0, 'pdm'),
    ('stingergt', 69, 'sportsclassics', 0, 'pdm'),
    ('stromberg', 69, 'sportsclassics', 0, 'pdm'),
    ('swinger', 69, 'sportsclassics', 0, 'pdm'),
    ('torero', 69, 'sportsclassics', 0, 'pdm'),
    ('tornado', 69, 'sportsclassics', 0, 'pdm'),
    ('tornado2', 69, 'sportsclassics', 0, 'pdm'),
    ('tornado3', 69, 'sportsclassics', 0, 'pdm'),
    ('tornado4', 69, 'sportsclassics', 0, 'pdm'),
    ('tornado5', 69, 'sportsclassics', 0, 'pdm'),
    ('tornado6', 69, 'sportsclassics', 0, 'pdm'),
    ('turismo2', 69, 'sportsclassics', 0, 'pdm'),
    ('viseris', 69, 'sportsclassics', 0, 'pdm'),
    ('z190', 69, 'sportsclassics', 0, 'pdm'),
    ('ztype', 69, 'sportsclassics', 0, 'pdm'),
    ('zion3', 69, 'sportsclassics', 0, 'pdm'),
    ('cheburek', 69, 'sportsclassics', 0, 'pdm'),
    ('toreador', 69, 'sportsclassics', 0, 'pdm'),
    ('adder', 69, 'supers', 0, 'pdm'),
    ('autarch', 69, 'supers', 0, 'pdm'),
    ('banshee2', 69, 'supers', 0, 'pdm'),
    ('bullet', 69, 'supers', 0, 'pdm'),
    ('cheetah', 69, 'supers', 0, 'pdm'),
    ('cyclone', 69, 'supers', 0, 'pdm'),
    ('entity2', 69, 'supers', 0, 'pdm'),
    ('entityxf', 69, 'supers', 0, 'pdm'),
    ('emerus', 69, 'supers', 0, 'pdm'),
    ('fmj', 69, 'supers', 0, 'pdm'),
    ('furia', 69, 'supers', 0, 'pdm'),
    ('gp1', 69, 'supers', 0, 'pdm'),
    ('infernus', 69, 'supers', 0, 'pdm'),
    ('italigtb', 69, 'supers', 0, 'pdm'),
    ('italigtb2', 69, 'supers', 0, 'pdm'),
    ('krieger', 69, 'supers', 0, 'pdm'),
    ('le7b', 69, 'supers', 0, 'pdm'),
    ('nero', 69, 'supers', 0, 'pdm'),
    ('nero2', 69, 'supers', 0, 'pdm'),
    ('osiris', 69, 'supers', 0, 'pdm'),
    ('penetrator', 69, 'supers', 0, 'pdm'),
    ('pfister811', 69, 'supers', 0, 'pdm'),
    ('prototipo', 69, 'supers', 0, 'pdm'),
    ('reaper', 69, 'supers', 0, 'pdm'),
    ('s80', 69, 'supers', 0, 'pdm'),
    ('sc1', 69, 'supers', 0, 'pdm'),
    ('scramjet', 69, 'supers', 0, 'pdm'),
    ('sheava', 69, 'supers', 0, 'pdm'),
    ('sultanrs', 69, 'supers', 0, 'pdm'),
    ('t20', 69, 'supers', 0, 'pdm'),
    ('taipan', 69, 'supers', 0, 'pdm'),
    ('tempesta', 69, 'supers', 0, 'pdm'),
    ('tezeract', 69, 'supers', 0, 'pdm'),
    ('thrax', 69, 'supers', 0, 'pdm'),
    ('tigon', 69, 'supers', 0, 'pdm'),
    ('turismor', 69, 'supers', 0, 'pdm'),
    ('tyrant', 69, 'supers', 0, 'pdm'),
    ('tyrus', 69, 'supers', 0, 'pdm'),
    ('vacca', 69, 'supers', 0, 'pdm'),
    ('vagner', 69, 'supers', 0, 'pdm'),
    ('vigilante', 69, 'supers', 0, 'pdm'),
    ('visione', 69, 'supers', 0, 'pdm'),
    ('voltic', 69, 'supers', 0, 'pdm'),
    ('voltic2', 69, 'supers', 0, 'pdm'),
    ('xa21', 69, 'supers', 0, 'pdm'),
    ('zentorno', 69, 'supers', 0, 'pdm'),
    ('zorrusso', 69, 'supers', 0, 'pdm'),
    ('bison', 69, 'vans', 0, 'pdm'),
    ('bison2', 69, 'vans', 0, 'pdm'),
    ('bison3', 69, 'vans', 0, 'pdm'),
    ('bobcatxl', 69, 'vans', 0, 'pdm'),
    ('boxville', 69, 'vans', 0, 'pdm'),
    ('boxville2', 69, 'vans', 0, 'pdm'),
    ('boxville3', 69, 'vans', 0, 'pdm'),
    ('boxville4', 69, 'vans', 0, 'pdm'),
    ('burrito', 69, 'vans', 0, 'pdm'),
    ('burrito2', 69, 'vans', 0, 'pdm'),
    ('burrito3', 69, 'vans', 0, 'pdm'),
    ('burrito4', 69, 'vans', 0, 'pdm'),
    ('burrito5', 69, 'vans', 0, 'pdm'),
    ('camper', 69, 'vans', 0, 'pdm'),
    ('gburrito', 69, 'vans', 0, 'pdm'),
    ('gburrito2', 69, 'vans', 0, 'pdm'),
    ('journey', 69, 'vans', 0, 'pdm'),
    ('minivan', 69, 'vans', 0, 'pdm'),
    ('minivan2', 69, 'vans', 0, 'pdm'),
    ('paradise', 69, 'vans', 0, 'pdm'),
    ('pony', 69, 'vans', 0, 'pdm'),
    ('pony2', 69, 'vans', 0, 'pdm'),
    ('rumpo', 69, 'vans', 0, 'pdm'),
    ('rumpo2', 69, 'vans', 0, 'pdm'),
    ('rumpo3', 69, 'vans', 0, 'pdm'),
    ('speedo', 69, 'vans', 0, 'pdm'),
    ('speedo2', 69, 'vans', 0, 'pdm'),
    ('speedo4', 69, 'vans', 0, 'pdm'),
    ('surfer', 69, 'vans', 0, 'pdm'),
    ('surfer2', 69, 'vans', 0, 'pdm'),
    ('taco', 69, 'vans', 0, 'pdm'),
    ('youga', 69, 'vans', 0, 'pdm'),
    ('youga2', 69, 'vans', 0, 'pdm'),
    ('youga3', 69, 'vans', 0, 'pdm'),
    ('moonbeam', 69, 'vans', 0, 'pdm'),
    ('moonbeam2', 69, 'vans', 0, 'pdm'),
    ('sentinelsg4', 69, 'imports', 0, 'pdm'),
    ('lp700r', 69, 'imports', 0, 'pdm'),
    ('911turbos', 69, 'imports', 0, 'pdm'),
    ('ff4wrx', 69, 'imports', 0, 'pdm'),
    ('delsoleg', 69, 'imports', 0, 'pdm'),
    ('acs8', 69, 'imports', 0, 'pdm'),
    ('66fastback', 69, 'imports', 0, 'pdm'),
    ('E46', 69, 'imports', 0, 'pdm'),
    ('na6', 69, 'imports', 0, 'pdm'),
    ('mustang19', 69, 'imports', 0, 'pdm'),
    ('r1', 69, 'imports', 0, 'pdm'),
    ('audirs6tk', 69, 'imports', 0, 'pdm'),
    ('c7', 69, 'imports', 0, 'pdm'),
    ('focusrs', 69, 'imports', 0, 'pdm'),
    ('f150', 69, 'imports', 0, 'pdm'),
    ('srt8b', 69, 'imports', 0, 'pdm'),
    ('panamera17turbo', 69, 'imports', 0, 'pdm'),
    ('exor', 69, 'imports', 0, 'pdm'),
    ('zx10', 69, 'imports', 0, 'pdm'),
    ('primoard', 69, 'imports', 0, 'pdm'),
    ('filthynsx', 69, 'imports', 0, 'pdm'),
    ('bluecunt', 69, 'imports', 0, 'pdm'),
    ('mbw124', 69, 'imports', 0, 'pdm'),
    ('esv', 69, 'imports', 0, 'pdm'),
    ('wraith', 69, 'imports', 0, 'pdm'),
    ('c63', 69, 'imports', 0, 'pdm'),
    ('rudiharley', 69, 'imports', 0, 'pdm'),
    ('m5e60', 69, 'imports', 0, 'pdm'),
    ('hellion6str', 69, 'imports', 0, 'pdm'),
    ('sentinel6str', 69, 'drift', 0, 'pdm'),
    ('pigalle6str', 69, 'drift', 0, 'pdm'),
    ('sultanrsv8', 69, 'drift', 0, 'pdm'),
    ('stratumc', 69, 'drift', 0, 'pdm'),
    ('futo2', 69, 'drift', 0, 'pdm'),
    ('tampa5', 69, 'drift', 0, 'pdm'),
    ('z190custom', 69, 'drift', 0, 'pdm'),
    ('ruiner6str', 69, 'drift', 0, 'pdm'),
    ('schwarzer2', 69, 'drift', 0, 'pdm'),

    -- Tuner
    ('rx7rb', 69, 'sports', 0, 'tuner'),
    ('subwrx', 69, 'sports', 0, 'tuner'),
    ('rmodmustang', 69, 'sports', 0, 'tuner'),
    ('fnf4r34', 69, 'sports', 0, 'tuner'),
    ('ap2', 69, 'sports', 0, 'tuner'),
    ('evo10', 69, 'sports', 0, 'tuner'),
    ('510', 69, 'sports', 0, 'tuner'),
    ('LWGTR', 69, 'sports', 0, 'tuner'),
    ('a80', 69, 'sports', 0, 'tuner'),
    ('370Z', 69, 'sports', 0, 'tuner'),
    ('gt63', 69, 'sports', 0, 'tuner'),
    ('69charger', 69, 'sports', 0, 'tuner'),
    ('650slw', 69, 'sports', 0, 'tuner'),
    ('fnfrx7', 69, 'sports', 0, 'tuner'),
    ('s15rb', 69, 'sports', 0, 'tuner'),
    ('fk8', 69, 'sports', 0, 'tuner'),
    ('gt3rs', 69, 'sports', 0, 'tuner'),
    ('lp670', 69, 'sports', 0, 'tuner'),
    ('gt2rwb', 69, 'sports', 0, 'tuner'),
    ('revolution6str2', 69, 'sports', 0, 'tuner'),
    ('dc5', 69, 'sports', 0, 'tuner'),
    ('eclipse', 69, 'sports', 0, 'tuner'),
    ('bdragon', 69, 'sports', 0, 'tuner'),
    ('por930', 69, 'sports', 0, 'tuner'),
    ('gtrc', 69, 'sports', 0, 'tuner'),
    ('e36prb', 69, 'sports', 0, 'tuner'),
    ('cp9a', 69, 'sports', 0, 'tuner'),
    ('na1', 69, 'sports', 0, 'tuner'),
    ('gtr', 69, 'sports', 0, 'tuner'),
    ('raid', 69, 'sports', 0, 'tuner'),
    ('z32', 69, 'sports', 0, 'tuner'),
    ('500gtrlam', 69, 'sports', 0, 'tuner'),
    ('granlb', 69, 'sports', 0, 'tuner'),
    ('300zw', 69, 'sports', 0, 'tuner'),
    ('m3e46', 69, 'sports', 0, 'tuner'),
    ('monroec', 69, 'sports', 0, 'tuner'),
    ('hustler6str', 69, 'sports', 0, 'tuner'),
    ('zr3806str', 69, 'sports', 0, 'tuner'),
    ('ellie6str', 69, 'sports', 0, 'tuner'),
    ('gauntlet6str', 69, 'sports', 0, 'tuner'),
    ('ladybird6str', 69, 'sports', 0, 'tuner'),
    ('sentinel6str2', 69, 'sports', 0, 'tuner'),
    ('tempesta2', 69, 'sports', 0, 'tuner'),
    ('golfp', 69, 'sports', 0, 'tuner'),
    ('m4', 69, 'sports', 0, 'tuner'),
    ('rcf', 69, 'sports', 0, 'tuner'),
    ('r35', 69, 'sports', 0, 'tuner'),
    ('evo9', 69, 'drift', 0, 'tuner'),
    ('m235', 69, 'drift', 0, 'tuner'),
    ('nis13', 69, 'drift', 0, 'tuner'),
    ('fc3s', 69, 'drift', 0, 'tuner'),
    ('er34', 69, 'drift', 0, 'tuner'),
    ('lwlp670', 69, 'drift', 0, 'tuner');

CREATE TABLE `carshop_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `financed` tinyint(1) NOT NULL,
  `commission` int(11) NOT NULL,
  `shop` varchar(255) NOT NULL,
  `buyer` int(11) NOT NULL,
  `seller` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;