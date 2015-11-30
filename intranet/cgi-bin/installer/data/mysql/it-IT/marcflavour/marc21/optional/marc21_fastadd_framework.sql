INSERT IGNORE INTO biblio_framework VALUES
		('FA', 'Cat. veloce');

INSERT IGNORE INTO `marc_tag_structure` (`tagfield`, `liblibrarian`, `libopac`, `repeatable`, `mandatory`, `authorised_value`, `frameworkcode`) VALUES
		('000', 'LEADER', 'LEADER', 0, 1, '', 'FA'),
		('008', 'Elementi di lunghezza fissa--Informazione generale', 'Elementi di lunghezza fissa--Informazione generale', 0, 1, '', 'FA'),
		('010', 'Numero di controllo della Library of Congress', 'Numero di controllo della Library of Congress', 0, 0, '', 'FA'),
		('020', 'ISBN (International Standard Book Number)', 'ISBN (International Standard Book Number)', 1, 0, NULL, 'FA'),
		('022', 'ISSN (International Standard Serial Number)', 'ISSN (International Standard Serial Number)', 1, 0, NULL, 'FA'),
		('050', 'Numero di chiamata (collocazione) della Library of Congress', 'Numero di chiamata (collocazione) della Library of Congress', 1, 0, NULL, 'FA'),
		('090', 'LOCALLY ASSIGNED LC-TYPE CALL NUMBER (OCLC); LOCAL CALL NUMBER (RLIN)', 'LOCALLY ASSIGNED LC-TYPE CALL NUMBER (OCLC); LOCAL CALL NUMBER (RLIN)', 1, 0, '', 'FA'),
		('099', 'LOCAL FREE-TEXT CALL NUMBER (OCLC)', 'LOCAL FREE-TEXT CALL NUMBER (OCLC)', 1, 0, '', 'FA'),
		('100', 'Accesso principale -- nome di persona', 'Accesso principale -- nome di persona', 0, 0, NULL, 'FA'),
		('245', 'Formulazione del titolo', 'Formulazione del titolo', 0, 1, '', 'FA'),
		('250', 'Formulazione di edizione', 'Formulazione di edizione', 0, 0, NULL, 'FA'),
		('260', 'Pubblicazione, distribuzione, ecc. (stampa)', 'Pubblicazione, distribuzione, ecc. (stampa)', 1, 0, NULL, 'FA'),
		('300', 'Descrizione fisica', 'Descrizione fisica', 1, 0, NULL, 'FA'),
		('500', 'Nota generale', 'Nota generale', 1, 0, NULL, 'FA'),
		('942', 'Dati aggiuntivi (Koha)', 'Dati aggiuntivi (Koha)', 0, 0, '', 'FA'),
		('952', 'Dati di copia (Koha)', 'Dati di copia (Koha)', 1, 0, '', 'FA'),
		('999', 'Sys Number locale (Koha)', 'Sys Number locale (Koha)', 1, 0, '', 'FA');

INSERT IGNORE INTO `marc_subfield_structure` (`tagfield`, `tagsubfield`, `liblibrarian`, `libopac`, `repeatable`, `mandatory`, `kohafield`, `tab`, `authorised_value`, `authtypecode`, `value_builder`, `isurl`, `hidden`, `frameworkcode`, `seealso`, `link`, `defaultvalue`) VALUES
		('000', '@', 'campo di controllo lung. fissa', 'campo di controllo lung. fissa', 0, 1, '', 0, '', '', 'marc21_leader.pl', NULL, 0, 'FA', '', NULL, NULL),
		('008', '@', 'campo di controllo lung. fissa', 'campo di controllo lung. fissa', 0, 1, '', 0, '', '', 'marc21_field_008.pl', NULL, 0, 'FA', '', NULL, NULL),
		('010', '8', 'Numero di collegamento e di sequenza di campi', 'Numero di collegamento e di sequenza di campi', 1, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('010', 'a', 'Numero di controllo della LC', 'Numero di controllo della LC', 0, 0, 'biblioitems.lccn', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('010', 'b', 'Numero di controllo del NUCMC', 'Numero di controllo del NUCMC', 1, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('010', 'z', 'Numero di controllo della LC cancellato o errato', 'Numero di controllo della LC cancellato o errato', 1, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('020', '6', 'Collegamento', 'Collegamento', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('020', '8', 'Numero di collegamento e di sequenza di campi', 'Numero di collegamento e di sequenza di campi', 1, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('020', 'a', 'ISBN (International Standard Book Number)', 'ISBN (International Standard Book Number)', 0, 0, 'biblioitems.isbn', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('020', 'c', 'Termini di disponibilità', 'Termini di disponibilità', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('020', 'z', 'ISBN cancellato o errato', 'ISBN cancellato o errato', 1, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('050', 'a', 'Numero di classificazione', 'Numero di classificazione', 1, 0, '', 0, '', '', '', 0, 0, 'FA', '', '', NULL),
		('050', 'b', 'Numero d\'item', 'Numero d\'item', 0, 0, '', 0, '', '', '', 0, 0, 'FA', '', '', NULL),
		('082', '2', 'Numero dell\'edizione', 'Numero dell\'edizione', 0, 0, '', 0, '', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('082', '6', 'Collegamento', 'Collegamento', 0, 0, '', 0, '', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('082', '8', 'Numero di collegamento e di sequenza di campi', 'Numero di collegamento e di sequenza di campi', 1, 0, '', 0, '', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('082', 'a', 'Numero di classificazione', 'Numero di classificazione', 1, 0, '', 0, '', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('082', 'b', 'Numero d\'item', 'Numero d\'item', 0, 0, '', 0, '', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('090', 'a', 'Classification number (OCLC) (R) ; Classification number, CALL (RLIN) (NR)', 'Classification number (OCLC) (R) ; Classification number, CALL (RLIN) (NR)', 1, 0, '', 0, '', '', '', 0, 5, 'FA', '', '', NULL),
		('090', 'b', 'Local cutter number (OCLC) ; Book number/undivided call number, CALL (RLIN)', 'Local cutter number (OCLC) ; Book number/undivided call number, CALL (RLIN)', 0, 0, '', 0, '', '', '', 0, 5, 'FA', '', '', NULL),
		('100', '4', 'Codice di ruolo', 'Codice di ruolo', 1, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('100', '6', 'Collegamento', 'Collegamento', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('100', '8', 'Numero di collegamento e di sequenza di campi', 'Numero di collegamento e di sequenza di campi', 1, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('100', '9', '9 (RLIN)', '9 (RLIN)', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
        ('100', 'a', 'Personal name', 'Personal name', 0, 0, 'biblio.author', 0, '', 'PERSO_NAME', '', 0, 0, 'FA', NULL, '', ''),
		('100', 'b', 'Numerazione', 'Numerazione', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('100', 'c', 'Titoli e altre parole associate al nome', 'Titoli e altre parole associate al nome', 1, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('100', 'd', 'Date associate al nome', 'Date associate al nome', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('100', 'e', 'Termine di ruolo', 'Termine di ruolo', 1, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('100', 'f', 'Data dell\'opera', 'Data dell\'opera', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('100', 'g', 'Informazione miscellanea', 'Informazione miscellanea', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('100', 'j', 'Qualificazione d\'attribuzione', 'Qualificazione d\'attribuzione', 1, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('100', 'k', 'Sottointestazione formale', 'Sottointestazione formale', 1, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('100', 'l', 'Lingua dell\'opera', 'Lingua dell\'opera', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('100', 'n', 'Numero di parte/sezione dell\'opera', 'Numero di parte/sezione dell\'opera', 1, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('100', 'p', 'Nome di parte/sezione dell\'opera', 'Nome di parte/sezione dell\'opera', 1, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('100', 'q', 'Forma completa del nome', 'Forma completa del nome', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('100', 't', 'Titolo dell\'opera', 'Titolo dell\'opera', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('100', 'u', 'Affiliazione', 'Affiliazione', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('245', '6', 'Collegamento', 'Collegamento', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('245', '8', 'Numero di collegamento e di sequenza di campi', 'Numero di collegamento e di sequenza di campi', 1, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('245', 'a', 'Titolo', 'Titolo', 0, 1, 'biblio.title', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('245', 'b', 'Complemento del titolo', 'Complemento del titolo', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('245', 'c', 'Formulazione di responsabilità, ecc.', 'Formulazione di responsabilità, ecc.', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('245', 'd', 'Designation of section/part/series (SE) [OBSOLETE]', 'Designation of section/part/series (SE) [OBSOLETE]', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('245', 'e', 'Name of part/section/series (SE) [OBSOLETE]', 'Name of part/section/series (SE) [OBSOLETE]', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('245', 'f', 'Date inclusive', 'Date inclusive', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('245', 'g', 'Date preponderanti', 'Date preponderanti', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('245', 'h', 'Supporto', 'Supporto', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('245', 'k', 'Forma', 'Forma', 1, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('245', 'n', 'Numero di parte/sezione dell\'opera', 'Numero di parte/sezione dell\'opera', 1, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('245', 'p', 'Nome di parte/sezione dell\'opera', 'Nome di parte/sezione dell\'opera', 1, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('245', 's', 'Versione', 'Versione', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('250', '6', 'Collegamento', 'Collegamento', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('250', '8', 'Numero di collegamento e di sequenza di campi', 'Numero di collegamento e di sequenza di campi', 1, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('250', 'a', 'Formulazione di edizione', 'Formulazione di edizione', 0, 0, 'biblioitems.editionstatement', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('250', 'b', 'Restante parte della formulazione di edizione', 'Restante parte della formulazione di edizione', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('260', '6', 'Collegamento', 'Collegamento', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('260', '8', 'Numero di collegamento e di sequenza di campi', 'Numero di collegamento e di sequenza di campi', 1, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('260', 'a', 'Luogo di pubblicazione, distribuzione, ecc.', 'Luogo di pubblicazione, distribuzione, ecc.', 1, 0, 'biblioitems.place', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('260', 'b', 'Nome dell\'editore, distributore, ecc.', 'Nome dell\'editore, distributore, ecc.', 1, 0, 'biblioitems.publishercode', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('260', 'c', 'Data di pubblicazione, distribuzione, ecc.', 'Data di pubblicazione, distribuzione, ecc.', 1, 0, 'biblio.copyrightdate', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('260', 'd', 'Plate or publisher\'s number for music (Pre-AACR 2) [OBSOLETE, CAN/MARC], [LOCAL, USA]', 'Plate or publisher\'s number for music (Pre-AACR 2) [OBSOLETE, CAN/MARC], [LOCAL, USA]', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('260', 'e', 'Luogo di stampa', 'Luogo di stampa', 1, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('260', 'f', 'Stampatore', 'Stampatore', 1, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('260', 'g', 'Data di stampa', 'Data di stampa', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('260', 'k', 'Identification/manufacturer number [OBSOLETE, CAN/MARC]', 'Identification/manufacturer number [OBSOLETE, CAN/MARC]', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('260', 'l', 'Matrix and/or take number [OBSOLETE, CAN/MARC]', 'Matrix and/or take number [OBSOLETE, CAN/MARC]', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('500', '3', 'Materiale specificato', 'Materiale specificato', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('500', '5', 'Istituzione a cui si applica il campo', 'Istituzione a cui si applica il campo', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('500', '6', 'Collegamento', 'Collegamento', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('500', '8', 'Numero di collegamento e di sequenza di campi', 'Numero di collegamento e di sequenza di campi', 1, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('500', 'a', 'Nota generale', 'Nota generale', 0, 0, 'biblio.notes', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('500', 'l', 'Library of Congress call number (SE) [OBSOLETE]', 'Library of Congress call number (SE) [OBSOLETE]', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('500', 'n', 'n (RLIN) [OBSOLETE]', 'n (RLIN) [OBSOLETE]', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('500', 'x', 'International Standard Serial Number (SE) [OBSOLETE]', 'International Standard Serial Number (SE) [OBSOLETE]', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('500', 'z', 'Source of note information (AM SE) [OBSOLETE]', 'Source of note information (AM SE) [OBSOLETE]', 0, 0, '', 0, '', '', '', 0, 0, 'FA', NULL, '', ''),
		('942', '0', 'Numero prestiti (tutte le copie)', 'Numero prestiti (tutte le copie)', 0, 0, 'biblioitems.totalissues', 9, '', '', '', NULL, 5, 'FA', '', '', NULL),
		('942', 'c', 'Tipo copia default (Koha)', 'Tipo copia default (Koha)', 0, 1, 'biblioitems.itemtype', 9, 'itemtypes', '', '', NULL, 5, 'FA', '', '', NULL),
		('942', 'n', 'Nasconto in Opac', 'Nasconto in Opac', 0, 0, NULL, 9, '', '', '', 0, 5, 'FA', '', '', NULL),
		('942', 's', 'Flag seriale', 'Flag seriale', 0, 0, 'biblio.serial', 9, '', '', '', NULL, 5, 'FA', '', '', NULL),
		('952', '0', 'Ritirato (status)', 'Ritirato (status)', 0, 0, 'items.withdrawn', 10, 'WITHDRAWN', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('952', '1', 'Perso (status)', 'Perso (status)', 0, 0, 'items.itemlost', 10, 'LOST', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('952', '2', 'Fonte della classificazione o dello schema di collocazione (segnatura)', 'Fonte della classificazione o dello schema di collocazione (segnatura)', 0, 0, 'items.cn_source', 10, 'cn_source', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('952', '3', 'Materiali specifici (rilegati o simili)', 'Materiali specifici (rilegati o simili)', 0, 0, 'items.materials', 10, '', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('952', '4', 'Danneggiato (status)', 'Danneggiato (status)', 0, 0, 'items.damaged', 10, 'DAMAGED', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('952', '5', 'Use restrictions', 'Use restrictions', 0, 0, 'items.restricted', 10, 'RESTRICTED', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('952', '6', 'Class. Normalizzata per ordinamento', 'Class. Normalizzata per ordinamento', 0, 0, 'items.cn_sort', 10, '', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('952', '7', 'Non per il presito', 'Non per il presito', 0, 0, 'items.notforloan', 10, 'NOT_LOAN', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('952', '8', 'Codice collezione', 'Codice collezione', 0, 0, 'items.ccode', 10, 'CCODE', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('952', '9', 'Numero di copia (ID autogenerato)', 'Numero di copia (ID autogenerato)', 0, 0, 'items.itemnumber', -1, '', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('952', 'a', 'Biblioteca proprietaria', 'Biblioteca proprietaria', 0, 0, 'items.homebranch', 10, 'branches', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('952', 'b', 'Biblioteca in cui si trova', 'Biblioteca in cui si trova', 0, 0, 'items.holdingbranch', 10, 'branches', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('952', 'c', 'Localizzazione a scaffale', 'Localizzazione a scaffale', 0, 0, 'items.location', 10, 'LOC', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('952', 'd', 'Data d\'acquisizione', 'Data d\'acquisizione', 0, 0, 'items.dateaccessioned', 10, '', '', 'dateaccessioned.pl', NULL, 0, 'FA', '', NULL, NULL),
		('952', 'e', 'Fonte d\'acquisto', 'Fonte d\'acquisto', 0, 0, 'items.booksellerid', 10, '', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('952', 'f', 'Qualificatore di localizzazione codificato', 'Qualificatore di localizzazione codificato', 0, 0, 'items.coded_location_qualifier', 10, '', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('952', 'g', 'Costo, prezzo di acquisto', 'Costo, prezzo di acquisto', 0, 0, 'items.price', 10, '', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('952', 'h', 'Enumerazione seriale / cronologia', 'Enumerazione seriale / cronologia', 0, 0, 'items.enumchron', 10, '', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('952', 'i', 'Numero di inventario', 'Numero di inventario', 0, 0, 'items.stocknumber', 10, '', '', '', 0, 0, 'FA', '', NULL, NULL),
		('952', 'j', 'Collocazione (segnatura)', 'Collocazione (segnatura)', 0, 0, 'items.stack', 10, 'STACK', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('952', 'l', 'Totale prestiti', 'Totale prestiti', 0, 0, 'items.issues', 10, '', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('952', 'm', 'Totale rinnovi', 'Totale rinnovi', 0, 0, 'items.renewals', 10, '', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('952', 'n', 'Totale prenotazioni', 'Totale prenotazioni', 0, 0, 'items.reserves', 10, '', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('952', 'o', 'Collocazione', 'Collocazione', 0, 0, 'items.itemcallnumber', 10, '', '', NULL, NULL, 0, 'FA', '', NULL, NULL),
		('952', 'p', 'Codice a barre', 'Codice a barre', 0, 0, 'items.barcode', 10, '', '', 'barcode.pl', NULL, 0, 'FA', '', NULL, NULL),
		('952', 'q', 'Prestito', 'Prestito', 0, 0, 'items.onloan', 10, '', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('952', 'r', 'Data ultima operazione', 'Data ultima operazione', 0, 0, 'items.datelastseen', 10, '', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('952', 's', 'Data ultimo prestito', 'Data ultimo prestito', 0, 0, 'items.datelastborrowed', 10, '', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('952', 't', 'Numero di copia', 'Numero di copia', 0, 0, 'items.copynumber', 10, '', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('952', 'u', 'URI (Uniform Resource Identifier)', 'URI (Uniform Resource Identifier)', 0, 0, 'items.uri', 10, '', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('952', 'v', 'Costo, costo di riacquisto', 'Costo, costo di riacquisto', 0, 0, 'items.replacementprice', 10, '', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('952', 'w', 'Prezzo in vigore dal', 'Prezzo in vigore dal', 0, 0, 'items.replacementpricedate', 10, '', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('952', 'x', 'Nota non pubblica', 'Nota non pubblica', 1, 0, 'items.paidfor', 10, '', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('952', 'y', 'Tipo copia default (Koha)', 'Tipo copia default (Koha)', 0, 0, 'items.itype', 10, 'itemtypes', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('952', 'z', 'Nota pubblica', 'Nota pubblica', 0, 0, 'items.itemnotes', 10, '', '', '', NULL, 0, 'FA', '', NULL, NULL),
		('999', 'c', 'Koha biblionumber', 'Koha biblionumber', 0, 0, 'biblio.biblionumber', -1, NULL, NULL, '', NULL, -5, 'FA', '', '', NULL),
		('999', 'd', 'Koha biblioitemnumber', 'Koha biblioitemnumber', 0, 0, 'biblioitems.biblioitemnumber', -1, NULL, NULL, '', NULL, -5, 'FA', '', '', NULL);