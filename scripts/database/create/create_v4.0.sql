CREATE TABLE AUTHENTICATEDUSER (ID  SERIAL NOT NULL, AFFILIATION VARCHAR(255), EMAIL VARCHAR(255) NOT NULL UNIQUE, FIRSTNAME VARCHAR(255), LASTNAME VARCHAR(255), MODIFICATIONTIME TIMESTAMP, NAME VARCHAR(255), POSITION VARCHAR(255), SUPERUSER BOOLEAN, USERIDENTIFIER VARCHAR(255) NOT NULL UNIQUE, PRIMARY KEY (ID));
CREATE TABLE DATATABLE (ID  SERIAL NOT NULL, CASEQUANTITY BIGINT, ORIGINALFILEFORMAT VARCHAR(255), ORIGINALFORMATVERSION VARCHAR(255), RECORDSPERCASE BIGINT, UNF VARCHAR(255) NOT NULL, VARQUANTITY BIGINT, DATAFILE_ID BIGINT NOT NULL, PRIMARY KEY (ID));
CREATE INDEX INDEX_DATATABLE_datafile_id ON DATATABLE (datafile_id);
CREATE TABLE DATAVERSETHEME (ID  SERIAL NOT NULL, BACKGROUNDCOLOR VARCHAR(255), LINKCOLOR VARCHAR(255), LINKURL VARCHAR(255), LOGO VARCHAR(255), LOGOALIGNMENT VARCHAR(255), LOGOBACKGROUNDCOLOR VARCHAR(255), LOGOFORMAT VARCHAR(255), TAGLINE VARCHAR(255), TEXTCOLOR VARCHAR(255), dataverse_id BIGINT, PRIMARY KEY (ID));
CREATE INDEX INDEX_DATAVERSETHEME_dataverse_id ON DATAVERSETHEME (dataverse_id);
CREATE TABLE DATAFILECATEGORY (ID  SERIAL NOT NULL, NAME VARCHAR(255) NOT NULL, DATASET_ID BIGINT NOT NULL, PRIMARY KEY (ID));
CREATE INDEX INDEX_DATAFILECATEGORY_dataset_id ON DATAFILECATEGORY (dataset_id);
CREATE TABLE ROLEASSIGNMENT (ID  SERIAL NOT NULL, ASSIGNEEIDENTIFIER VARCHAR(255) NOT NULL, DEFINITIONPOINT_ID BIGINT NOT NULL, ROLE_ID BIGINT NOT NULL, PRIMARY KEY (ID));
CREATE TABLE INGESTREPORT (ID  SERIAL NOT NULL, ENDTIME TIMESTAMP, REPORT VARCHAR(255), STARTTIME TIMESTAMP, STATUS INTEGER, TYPE INTEGER, DATAFILE_ID BIGINT NOT NULL, PRIMARY KEY (ID));
CREATE INDEX INDEX_INGESTREPORT_datafile_id ON INGESTREPORT (datafile_id);
CREATE TABLE AUTHENTICATIONPROVIDERROW (ID VARCHAR(255) NOT NULL, ENABLED BOOLEAN, FACTORYALIAS VARCHAR(255), FACTORYDATA TEXT, SUBTITLE VARCHAR(255), TITLE VARCHAR(255), PRIMARY KEY (ID));
CREATE TABLE FOREIGNMETADATAFIELDMAPPING (ID  SERIAL NOT NULL, datasetfieldName TEXT, foreignFieldXPath TEXT, ISATTRIBUTE BOOLEAN, FOREIGNMETADATAFORMATMAPPING_ID BIGINT, PARENTFIELDMAPPING_ID BIGINT, PRIMARY KEY (ID));
CREATE TABLE FILEMETADATA (ID  SERIAL NOT NULL, DESCRIPTION TEXT, LABEL VARCHAR(255) NOT NULL, RESTRICTED BOOLEAN, VERSION BIGINT, DATAFILE_ID BIGINT NOT NULL, DATASETVERSION_ID BIGINT NOT NULL, PRIMARY KEY (ID));
CREATE INDEX INDEX_FILEMETADATA_datafile_id ON FILEMETADATA (datafile_id);
CREATE INDEX INDEX_FILEMETADATA_datasetversion_id ON FILEMETADATA (datasetversion_id);
CREATE TABLE CUSTOMQUESTIONVALUE (ID  SERIAL NOT NULL, DISPLAYORDER INTEGER, VALUESTRING VARCHAR(255) NOT NULL, CUSTOMQUESTION_ID BIGINT NOT NULL, PRIMARY KEY (ID));
CREATE TABLE DATAVERSELINKINGDATAVERSE (ID  SERIAL NOT NULL, LINKCREATETIME TIMESTAMP, DATAVERSE_ID BIGINT NOT NULL, LINKINGDATAVERSE_ID BIGINT NOT NULL, PRIMARY KEY (ID));
CREATE INDEX INDEX_DATAVERSELINKINGDATAVERSE_dataverse_id ON DATAVERSELINKINGDATAVERSE (dataverse_id);
CREATE INDEX INDEX_DATAVERSELINKINGDATAVERSE_linkingDataverse_id ON DATAVERSELINKINGDATAVERSE (linkingDataverse_id);
CREATE TABLE DVOBJECT (ID  SERIAL NOT NULL, DTYPE VARCHAR(31), CREATEDATE TIMESTAMP NOT NULL, INDEXTIME TIMESTAMP, MODIFICATIONTIME TIMESTAMP NOT NULL, PERMISSIONINDEXTIME TIMESTAMP, PERMISSIONMODIFICATIONTIME TIMESTAMP, PUBLICATIONDATE TIMESTAMP, CREATOR_ID BIGINT, OWNER_ID BIGINT, RELEASEUSER_ID BIGINT, PRIMARY KEY (ID));
CREATE INDEX INDEX_DVOBJECT_owner_id ON DVOBJECT (owner_id);
CREATE INDEX INDEX_DVOBJECT_creator_id ON DVOBJECT (creator_id);
CREATE INDEX INDEX_DVOBJECT_releaseuser_id ON DVOBJECT (releaseuser_id);
CREATE TABLE SUMMARYSTATISTIC (ID  SERIAL NOT NULL, TYPE INTEGER, VALUE VARCHAR(255), DATAVARIABLE_ID BIGINT NOT NULL, PRIMARY KEY (ID));
CREATE INDEX INDEX_SUMMARYSTATISTIC_datavariable_id ON SUMMARYSTATISTIC (datavariable_id);
CREATE TABLE worldmapauth_token (ID  SERIAL NOT NULL, CREATED TIMESTAMP NOT NULL, HASEXPIRED BOOLEAN NOT NULL, LASTREFRESHTIME TIMESTAMP NOT NULL, MODIFIED TIMESTAMP NOT NULL, TOKEN VARCHAR(255), APPLICATION_ID BIGINT NOT NULL, DATAFILE_ID BIGINT NOT NULL, DATAVERSEUSER_ID BIGINT NOT NULL, PRIMARY KEY (ID));
CREATE UNIQUE INDEX token_value ON worldmapauth_token (token);
CREATE TABLE PERSISTEDGLOBALGROUP (ID BIGINT NOT NULL, DTYPE VARCHAR(31), DESCRIPTION VARCHAR(255), DISPLAYNAME VARCHAR(255), PERSISTEDGROUPALIAS VARCHAR(255) UNIQUE, PRIMARY KEY (ID));
CREATE TABLE METADATABLOCK (ID  SERIAL NOT NULL, DISPLAYNAME VARCHAR(255) NOT NULL, NAME VARCHAR(255) NOT NULL, owner_id BIGINT, PRIMARY KEY (ID));
CREATE TABLE PASSWORDRESETDATA (ID  SERIAL NOT NULL, CREATED TIMESTAMP NOT NULL, EXPIRES TIMESTAMP NOT NULL, REASON VARCHAR(255), TOKEN VARCHAR(255), BUILTINUSER_ID BIGINT NOT NULL, PRIMARY KEY (ID));
CREATE TABLE CONTROLLEDVOCABULARYVALUE (ID  SERIAL NOT NULL, DISPLAYORDER INTEGER, IDENTIFIER VARCHAR(255), STRVALUE TEXT, DATASETFIELDTYPE_ID BIGINT, PRIMARY KEY (ID));
CREATE TABLE DATASETLINKINGDATAVERSE (ID  SERIAL NOT NULL, LINKCREATETIME TIMESTAMP NOT NULL, DATASET_ID BIGINT NOT NULL, LINKINGDATAVERSE_ID BIGINT NOT NULL, PRIMARY KEY (ID));
CREATE INDEX INDEX_DATASETLINKINGDATAVERSE_dataset_id ON DATASETLINKINGDATAVERSE (dataset_id);
CREATE INDEX INDEX_DATASETLINKINGDATAVERSE_linkingDataverse_id ON DATASETLINKINGDATAVERSE (linkingDataverse_id);
CREATE TABLE DATAVERSE (ID BIGINT NOT NULL, AFFILIATION VARCHAR(255), ALIAS VARCHAR(255) NOT NULL UNIQUE, DATAVERSETYPE VARCHAR(255) NOT NULL, description TEXT, FACETROOT BOOLEAN, GUESTBOOKROOT BOOLEAN, METADATABLOCKROOT BOOLEAN, NAME VARCHAR(255) NOT NULL, PERMISSIONROOT BOOLEAN, TEMPLATEROOT BOOLEAN, THEMEROOT BOOLEAN, DEFAULTCONTRIBUTORROLE_ID BIGINT NOT NULL, DEFAULTTEMPLATE_ID BIGINT, PRIMARY KEY (ID));
CREATE TABLE DATASET (ID BIGINT NOT NULL, AUTHORITY VARCHAR(255), DOISEPARATOR VARCHAR(255), FILEACCESSREQUEST BOOLEAN, GLOBALIDCREATETIME TIMESTAMP, IDENTIFIER VARCHAR(255) NOT NULL, PROTOCOL VARCHAR(255), guestbook_id BIGINT, thumbnailfile_id BIGINT, PRIMARY KEY (ID));
CREATE INDEX INDEX_DATASET_guestbook_id ON DATASET (guestbook_id);
CREATE INDEX INDEX_DATASET_thumbnailfile_id ON DATASET (thumbnailfile_id);
CREATE TABLE IPV6RANGE (ID BIGINT NOT NULL, BOTTOMA BIGINT, BOTTOMB BIGINT, BOTTOMC BIGINT, BOTTOMD BIGINT, TOPA BIGINT, TOPB BIGINT, TOPC BIGINT, TOPD BIGINT, OWNER_ID BIGINT, PRIMARY KEY (ID));
CREATE TABLE worldmapauth_tokentype (ID  SERIAL NOT NULL, CONTACTEMAIL VARCHAR(255), CREATED TIMESTAMP NOT NULL, HOSTNAME VARCHAR(255), IPADDRESS VARCHAR(255), MAPITLINK VARCHAR(255) NOT NULL, MD5 VARCHAR(255) NOT NULL, MODIFIED TIMESTAMP NOT NULL, NAME VARCHAR(255) NOT NULL, timeLimitMinutes int default 30, timeLimitSeconds bigint default 1800, PRIMARY KEY (ID));
CREATE UNIQUE INDEX application_name ON worldmapauth_tokentype (name);
CREATE TABLE DATAFILETAG (ID  SERIAL NOT NULL, TYPE INTEGER NOT NULL, DATAFILE_ID BIGINT NOT NULL, PRIMARY KEY (ID));
CREATE INDEX INDEX_DATAFILETAG_datafile_id ON DATAFILETAG (datafile_id);
CREATE TABLE AUTHENTICATEDUSERLOOKUP (ID  SERIAL NOT NULL, AUTHENTICATIONPROVIDERID VARCHAR(255), PERSISTENTUSERID VARCHAR(255), AUTHENTICATEDUSER_ID BIGINT NOT NULL UNIQUE, PRIMARY KEY (ID));
CREATE TABLE INGESTREQUEST (ID  SERIAL NOT NULL, CONTROLCARD VARCHAR(255), LABELSFILE VARCHAR(255), TEXTENCODING VARCHAR(255), datafile_id BIGINT, PRIMARY KEY (ID));
CREATE INDEX INDEX_INGESTREQUEST_datafile_id ON INGESTREQUEST (datafile_id);
CREATE TABLE SAVEDSEARCHFILTERQUERY (ID  SERIAL NOT NULL, FILTERQUERY TEXT, SAVEDSEARCH_ID BIGINT NOT NULL, PRIMARY KEY (ID));
CREATE TABLE DATAVERSEFACET (ID  SERIAL NOT NULL, DISPLAYORDER INTEGER, datasetfieldtype_id BIGINT, dataverse_id BIGINT, PRIMARY KEY (ID));
CREATE TABLE DATAVERSEFEATUREDDATAVERSE (ID  SERIAL NOT NULL, DISPLAYORDER INTEGER, dataverse_id BIGINT, featureddataverse_id BIGINT, PRIMARY KEY (ID));
CREATE TABLE APITOKEN (ID  SERIAL NOT NULL, CREATETIME TIMESTAMP NOT NULL, DISABLED BOOLEAN NOT NULL, EXPIRETIME TIMESTAMP NOT NULL, TOKENSTRING VARCHAR(255) NOT NULL UNIQUE, AUTHENTICATEDUSER_ID BIGINT NOT NULL, PRIMARY KEY (ID));
CREATE INDEX INDEX_APITOKEN_authenticateduser_id ON APITOKEN (authenticateduser_id);
CREATE TABLE DATASETFIELDVALUE (ID  SERIAL NOT NULL, DISPLAYORDER INTEGER, value TEXT, DATASETFIELD_ID BIGINT NOT NULL, PRIMARY KEY (ID));
CREATE INDEX INDEX_DATASETFIELDVALUE_datasetfield_id ON DATASETFIELDVALUE (datasetfield_id);
CREATE TABLE SETTING (NAME VARCHAR(255) NOT NULL, CONTENT TEXT, PRIMARY KEY (NAME));
CREATE TABLE DATAVERSECONTACT (ID  SERIAL NOT NULL, CONTACTEMAIL VARCHAR(255) NOT NULL, DISPLAYORDER INTEGER, dataverse_id BIGINT, PRIMARY KEY (ID));
CREATE TABLE CUSTOMQUESTION (ID  SERIAL NOT NULL, DISPLAYORDER INTEGER, HIDDEN BOOLEAN, QUESTIONSTRING VARCHAR(255) NOT NULL, QUESTIONTYPE VARCHAR(255) NOT NULL, REQUIRED BOOLEAN, GUESTBOOK_ID BIGINT NOT NULL, PRIMARY KEY (ID));
CREATE INDEX INDEX_CUSTOMQUESTION_guestbook_id ON CUSTOMQUESTION (guestbook_id);
CREATE TABLE VARIABLERANGEITEM (ID  SERIAL NOT NULL, VALUE DECIMAL(38), DATAVARIABLE_ID BIGINT NOT NULL, PRIMARY KEY (ID));
CREATE INDEX INDEX_VARIABLERANGEITEM_datavariable_id ON VARIABLERANGEITEM (datavariable_id);
CREATE TABLE VARIABLECATEGORY (ID  SERIAL NOT NULL, CATORDER INTEGER, FREQUENCY FLOAT, LABEL VARCHAR(255), MISSING BOOLEAN, VALUE VARCHAR(255), DATAVARIABLE_ID BIGINT NOT NULL, PRIMARY KEY (ID));
CREATE INDEX INDEX_VARIABLECATEGORY_datavariable_id ON VARIABLECATEGORY (datavariable_id);
CREATE TABLE VARIABLERANGE (ID  SERIAL NOT NULL, BEGINVALUE VARCHAR(255), BEGINVALUETYPE INTEGER, ENDVALUE VARCHAR(255), ENDVALUETYPE INTEGER, DATAVARIABLE_ID BIGINT NOT NULL, PRIMARY KEY (ID));
CREATE INDEX INDEX_VARIABLERANGE_datavariable_id ON VARIABLERANGE (datavariable_id);
CREATE TABLE DATAVARIABLE (ID  SERIAL NOT NULL, FILEENDPOSITION BIGINT, FILEORDER INTEGER, FILESTARTPOSITION BIGINT, FORMAT VARCHAR(255), FORMATCATEGORY VARCHAR(255), INTERVAL INTEGER, LABEL TEXT, NAME VARCHAR(255), NUMBEROFDECIMALPOINTS BIGINT, ORDEREDFACTOR BOOLEAN, RECORDSEGMENTNUMBER BIGINT, TYPE INTEGER, UNF VARCHAR(255), UNIVERSE VARCHAR(255), WEIGHTED BOOLEAN, DATATABLE_ID BIGINT NOT NULL, PRIMARY KEY (ID));
CREATE INDEX INDEX_DATAVARIABLE_datatable_id ON DATAVARIABLE (datatable_id);
CREATE TABLE CONTROLLEDVOCABALTERNATE (ID  SERIAL NOT NULL, STRVALUE TEXT, CONTROLLEDVOCABULARYVALUE_ID BIGINT NOT NULL, DATASETFIELDTYPE_ID BIGINT NOT NULL, PRIMARY KEY (ID));
CREATE TABLE SHIBGROUP (ID  SERIAL NOT NULL, ATTRIBUTE VARCHAR(255) NOT NULL, NAME VARCHAR(255) NOT NULL, PATTERN VARCHAR(255) NOT NULL, PRIMARY KEY (ID));
CREATE TABLE DATASETFIELD (ID  SERIAL NOT NULL, DATASETFIELDTYPE_ID BIGINT NOT NULL, DATASETVERSION_ID BIGINT, PARENTDATASETFIELDCOMPOUNDVALUE_ID BIGINT, TEMPLATE_ID BIGINT, PRIMARY KEY (ID));
CREATE INDEX INDEX_DATASETFIELD_datasetfieldtype_id ON DATASETFIELD (datasetfieldtype_id);
CREATE INDEX INDEX_DATASETFIELD_datasetversion_id ON DATASETFIELD (datasetversion_id);
CREATE INDEX INDEX_DATASETFIELD_parentdatasetfieldcompoundvalue_id ON DATASETFIELD (parentdatasetfieldcompoundvalue_id);
CREATE INDEX INDEX_DATASETFIELD_template_id ON DATASETFIELD (template_id);
CREATE TABLE IPV4RANGE (ID BIGINT NOT NULL, BOTTOMASLONG BIGINT, TOPASLONG BIGINT, OWNER_ID BIGINT, PRIMARY KEY (ID));
CREATE TABLE DATAFILE (ID BIGINT NOT NULL, CONTENTTYPE VARCHAR(255) NOT NULL, FILESYSTEMNAME VARCHAR(255) NOT NULL, FILESIZE BIGINT, INGESTSTATUS CHAR(1), MD5 VARCHAR(255) NOT NULL, NAME VARCHAR(255), RESTRICTED BOOLEAN, PRIMARY KEY (ID));
CREATE TABLE DATASETVERSION (ID  SERIAL NOT NULL, UNF VARCHAR(255), ARCHIVENOTE VARCHAR(1000), ARCHIVETIME TIMESTAMP, AVAILABILITYSTATUS TEXT, CITATIONREQUIREMENTS TEXT, CONDITIONS TEXT, CONFIDENTIALITYDECLARATION TEXT, CONTACTFORACCESS TEXT, CREATETIME TIMESTAMP NOT NULL, DATAACCESSPLACE TEXT, DEACCESSIONLINK VARCHAR(255), DEPOSITORREQUIREMENTS TEXT, DISCLAIMER TEXT, FILEACCESSREQUEST BOOLEAN, INREVIEW BOOLEAN, LASTUPDATETIME TIMESTAMP NOT NULL, LICENSE VARCHAR(255), MINORVERSIONNUMBER BIGINT, ORIGINALARCHIVE TEXT, RELEASETIME TIMESTAMP, RESTRICTIONS TEXT, SIZEOFCOLLECTION TEXT, SPECIALPERMISSIONS TEXT, STUDYCOMPLETION TEXT, TERMSOFACCESS TEXT, TERMSOFUSE TEXT, VERSION BIGINT, VERSIONNOTE VARCHAR(1000), VERSIONNUMBER BIGINT, VERSIONSTATE VARCHAR(255), DATASET_ID BIGINT, PRIMARY KEY (ID));
CREATE INDEX INDEX_DATASETVERSION_dataset_id ON DATASETVERSION (dataset_id);
CREATE TABLE DATAVERSEFIELDTYPEINPUTLEVEL (ID  SERIAL NOT NULL, INCLUDE BOOLEAN, REQUIRED BOOLEAN, datasetfieldtype_id BIGINT, dataverse_id BIGINT, PRIMARY KEY (ID));
CREATE TABLE BUILTINUSER (ID  SERIAL NOT NULL, AFFILIATION VARCHAR(255), EMAIL VARCHAR(255) NOT NULL UNIQUE, ENCRYPTEDPASSWORD VARCHAR(255), FIRSTNAME VARCHAR(255), LASTNAME VARCHAR(255), PASSWORDENCRYPTIONVERSION INTEGER, POSITION VARCHAR(255), USERNAME VARCHAR(255) NOT NULL UNIQUE, PRIMARY KEY (ID));
CREATE TABLE USERNOTIFICATION (ID  SERIAL NOT NULL, EMAILED BOOLEAN, OBJECTID BIGINT, READNOTIFICATION BOOLEAN, SENDDATE TIMESTAMP, TYPE INTEGER NOT NULL, USER_ID BIGINT NOT NULL, PRIMARY KEY (ID));
CREATE INDEX INDEX_USERNOTIFICATION_user_id ON USERNOTIFICATION (user_id);
CREATE TABLE CUSTOMFIELDMAP (ID  SERIAL NOT NULL, SOURCEDATASETFIELD VARCHAR(255), SOURCETEMPLATE VARCHAR(255), TARGETDATASETFIELD VARCHAR(255), PRIMARY KEY (ID));
CREATE TABLE HARVESTINGDATAVERSECONFIG (ID BIGINT NOT NULL, ARCHIVEDESCRIPTION TEXT, ARCHIVEURL VARCHAR(255), HARVESTSTYLE VARCHAR(255), HARVESTTYPE VARCHAR(255), HARVESTINGSET VARCHAR(255), HARVESTINGURL VARCHAR(255), dataverse_id BIGINT, PRIMARY KEY (ID));
CREATE TABLE DATASETFIELDCOMPOUNDVALUE (ID  SERIAL NOT NULL, DISPLAYORDER INTEGER, PARENTDATASETFIELD_ID BIGINT, PRIMARY KEY (ID));
CREATE INDEX INDEX_DATASETFIELDCOMPOUNDVALUE_parentdatasetfield_id ON DATASETFIELDCOMPOUNDVALUE (parentdatasetfield_id);
CREATE TABLE DATASETVERSIONUSER (ID  SERIAL NOT NULL, LASTUPDATEDATE TIMESTAMP NOT NULL, authenticatedUser_id BIGINT, datasetversion_id BIGINT, PRIMARY KEY (ID));
CREATE TABLE GUESTBOOKRESPONSE (ID  SERIAL NOT NULL, DOWNLOADTYPE VARCHAR(255), EMAIL VARCHAR(255), INSTITUTION VARCHAR(255), NAME VARCHAR(255), POSITION VARCHAR(255), RESPONSETIME TIMESTAMP, SESSIONID VARCHAR(255), AUTHENTICATEDUSER_ID BIGINT, DATAFILE_ID BIGINT NOT NULL, DATASET_ID BIGINT NOT NULL, DATASETVERSION_ID BIGINT, GUESTBOOK_ID BIGINT NOT NULL, PRIMARY KEY (ID));
CREATE INDEX INDEX_GUESTBOOKRESPONSE_guestbook_id ON GUESTBOOKRESPONSE (guestbook_id);
CREATE INDEX INDEX_GUESTBOOKRESPONSE_datafile_id ON GUESTBOOKRESPONSE (datafile_id);
CREATE INDEX INDEX_GUESTBOOKRESPONSE_dataset_id ON GUESTBOOKRESPONSE (dataset_id);
CREATE TABLE CUSTOMQUESTIONRESPONSE (ID  SERIAL NOT NULL, RESPONSE VARCHAR(255), CUSTOMQUESTION_ID BIGINT NOT NULL, GUESTBOOKRESPONSE_ID BIGINT NOT NULL, PRIMARY KEY (ID));
CREATE INDEX INDEX_CUSTOMQUESTIONRESPONSE_guestbookresponse_id ON CUSTOMQUESTIONRESPONSE (guestbookresponse_id);
CREATE TABLE GUESTBOOK (ID  SERIAL NOT NULL, CREATETIME TIMESTAMP NOT NULL, EMAILREQUIRED BOOLEAN, ENABLED BOOLEAN, INSTITUTIONREQUIRED BOOLEAN, NAME VARCHAR(255), NAMEREQUIRED BOOLEAN, POSITIONREQUIRED BOOLEAN, DATAVERSE_ID BIGINT, PRIMARY KEY (ID));
CREATE TABLE ACTIONLOGRECORD (ID VARCHAR(36) NOT NULL, ACTIONRESULT VARCHAR(255), ACTIONSUBTYPE VARCHAR(255), ACTIONTYPE VARCHAR(255), ENDTIME TIMESTAMP, INFO VARCHAR(1024), STARTTIME TIMESTAMP, USERIDENTIFIER VARCHAR(255), PRIMARY KEY (ID));
CREATE TABLE MAPLAYERMETADATA (ID  SERIAL NOT NULL, EMBEDMAPLINK VARCHAR(255) NOT NULL, LAYERLINK VARCHAR(255) NOT NULL, LAYERNAME VARCHAR(255) NOT NULL, MAPIMAGELINK VARCHAR(255), WORLDMAPUSERNAME VARCHAR(255) NOT NULL, DATASET_ID BIGINT NOT NULL, DATAFILE_ID BIGINT NOT NULL UNIQUE, PRIMARY KEY (ID));
CREATE TABLE SAVEDSEARCH (ID  SERIAL NOT NULL, QUERY TEXT, CREATOR_ID BIGINT NOT NULL, DEFINITIONPOINT_ID BIGINT NOT NULL, PRIMARY KEY (ID));
CREATE TABLE EXPLICITGROUP (ID  SERIAL NOT NULL, DESCRIPTION VARCHAR(1024), DISPLAYNAME VARCHAR(255), GROUPALIAS VARCHAR(255) UNIQUE, GROUPALIASINOWNER VARCHAR(255), OWNER_ID BIGINT, PRIMARY KEY (ID));
CREATE TABLE TEMPLATE (ID  SERIAL NOT NULL, CREATETIME TIMESTAMP NOT NULL, NAME VARCHAR(255) NOT NULL, USAGECOUNT BIGINT, DATAVERSE_ID BIGINT, PRIMARY KEY (ID));
CREATE TABLE DATASETLOCK (ID  SERIAL NOT NULL, INFO VARCHAR(255), STARTTIME TIMESTAMP, USER_ID BIGINT NOT NULL, DATASET_ID BIGINT NOT NULL, PRIMARY KEY (ID));
CREATE TABLE FOREIGNMETADATAFORMATMAPPING (ID  SERIAL NOT NULL, DISPLAYNAME VARCHAR(255) NOT NULL, NAME VARCHAR(255) NOT NULL, SCHEMALOCATION VARCHAR(255), STARTELEMENT VARCHAR(255), PRIMARY KEY (ID));
CREATE TABLE DATAVERSEROLE (ID  SERIAL NOT NULL, ALIAS VARCHAR(255) NOT NULL UNIQUE, DESCRIPTION VARCHAR(255), NAME VARCHAR(255) NOT NULL, PERMISSIONBITS BIGINT, OWNER_ID BIGINT, PRIMARY KEY (ID));
CREATE TABLE DATASETFIELDDEFAULTVALUE (ID  SERIAL NOT NULL, DISPLAYORDER INTEGER, STRVALUE TEXT, DATASETFIELD_ID BIGINT NOT NULL, DEFAULTVALUESET_ID BIGINT NOT NULL, PARENTDATASETFIELDDEFAULTVALUE_ID BIGINT, PRIMARY KEY (ID));
CREATE TABLE DATASETFIELDTYPE (ID  SERIAL NOT NULL, ADVANCEDSEARCHFIELDTYPE BOOLEAN, ALLOWCONTROLLEDVOCABULARY BOOLEAN, ALLOWMULTIPLES BOOLEAN, description TEXT, DISPLAYFORMAT VARCHAR(255), DISPLAYONCREATE BOOLEAN, DISPLAYORDER INTEGER, FACETABLE BOOLEAN, FIELDTYPE VARCHAR(255) NOT NULL, name TEXT, REQUIRED BOOLEAN, title TEXT, WATERMARK VARCHAR(255), METADATABLOCK_ID BIGINT, PARENTDATASETFIELDTYPE_ID BIGINT, PRIMARY KEY (ID));
CREATE INDEX INDEX_DATASETFIELDTYPE_metadatablock_id ON DATASETFIELDTYPE (metadatablock_id);
CREATE INDEX INDEX_DATASETFIELDTYPE_parentdatasetfieldtype_id ON DATASETFIELDTYPE (parentdatasetfieldtype_id);
CREATE TABLE DEFAULTVALUESET (ID  SERIAL NOT NULL, NAME VARCHAR(255) NOT NULL, PRIMARY KEY (ID));
CREATE TABLE FILEMETADATA_DATAFILECATEGORY (fileCategories_ID BIGINT NOT NULL, fileMetadatas_ID BIGINT NOT NULL, PRIMARY KEY (fileCategories_ID, fileMetadatas_ID));
CREATE INDEX INDEX_FILEMETADATA_DATAFILECATEGORY_filecategories_id ON FILEMETADATA_DATAFILECATEGORY (filecategories_id);
CREATE INDEX INDEX_FILEMETADATA_DATAFILECATEGORY_filemetadatas_id ON FILEMETADATA_DATAFILECATEGORY (filemetadatas_id);
CREATE TABLE dataversesubjects (dataverse_id BIGINT NOT NULL, controlledvocabularyvalue_id BIGINT NOT NULL, PRIMARY KEY (dataverse_id, controlledvocabularyvalue_id));
CREATE TABLE DATAVERSE_METADATABLOCK (Dataverse_ID BIGINT NOT NULL, metadataBlocks_ID BIGINT NOT NULL, PRIMARY KEY (Dataverse_ID, metadataBlocks_ID));
CREATE TABLE DATASETFIELD_CONTROLLEDVOCABULARYVALUE (DatasetField_ID BIGINT NOT NULL, controlledVocabularyValues_ID BIGINT NOT NULL, PRIMARY KEY (DatasetField_ID, controlledVocabularyValues_ID));
CREATE INDEX INDEX_DATASETFIELD_CONTROLLEDVOCABULARYVALUE_datasetfield_id ON DATASETFIELD_CONTROLLEDVOCABULARYVALUE (datasetfield_id);
CREATE INDEX INDEX_DATASETFIELD_CONTROLLEDVOCABULARYVALUE_controlledvocabularyvalues_id ON DATASETFIELD_CONTROLLEDVOCABULARYVALUE (controlledvocabularyvalues_id);
CREATE TABLE fileaccessrequests (datafile_id BIGINT NOT NULL, authenticated_user_id BIGINT NOT NULL, PRIMARY KEY (datafile_id, authenticated_user_id));
CREATE TABLE ExplicitGroup_CONTAINEDROLEASSIGNEES (ExplicitGroup_ID BIGINT, CONTAINEDROLEASSIGNEES VARCHAR(255));
CREATE TABLE EXPLICITGROUP_AUTHENTICATEDUSER (ExplicitGroup_ID BIGINT NOT NULL, containedAuthenticatedUsers_ID BIGINT NOT NULL, PRIMARY KEY (ExplicitGroup_ID, containedAuthenticatedUsers_ID));
CREATE TABLE explicitgroup_explicitgroup (explicitgroup_id BIGINT NOT NULL, containedexplicitgroups_id BIGINT NOT NULL, PRIMARY KEY (explicitgroup_id, containedexplicitgroups_id));
ALTER TABLE ROLEASSIGNMENT ADD CONSTRAINT UNQ_ROLEASSIGNMENT_0 UNIQUE (assigneeIdentifier, role_id, definitionPoint_id);
ALTER TABLE FOREIGNMETADATAFIELDMAPPING ADD CONSTRAINT UNQ_FOREIGNMETADATAFIELDMAPPING_0 UNIQUE (foreignMetadataFormatMapping_id, foreignFieldXpath);
ALTER TABLE DATASET ADD CONSTRAINT UNQ_DATASET_0 UNIQUE (authority,protocol,identifier,doiseparator);
ALTER TABLE AUTHENTICATEDUSERLOOKUP ADD CONSTRAINT UNQ_AUTHENTICATEDUSERLOOKUP_0 UNIQUE (persistentuserid, authenticationproviderid);
ALTER TABLE DATATABLE ADD CONSTRAINT FK_DATATABLE_DATAFILE_ID FOREIGN KEY (DATAFILE_ID) REFERENCES DVOBJECT (ID);
ALTER TABLE DATAVERSETHEME ADD CONSTRAINT FK_DATAVERSETHEME_dataverse_id FOREIGN KEY (dataverse_id) REFERENCES DVOBJECT (ID);
ALTER TABLE DATAFILECATEGORY ADD CONSTRAINT FK_DATAFILECATEGORY_DATASET_ID FOREIGN KEY (DATASET_ID) REFERENCES DVOBJECT (ID);
ALTER TABLE ROLEASSIGNMENT ADD CONSTRAINT FK_ROLEASSIGNMENT_ROLE_ID FOREIGN KEY (ROLE_ID) REFERENCES DATAVERSEROLE (ID);
ALTER TABLE ROLEASSIGNMENT ADD CONSTRAINT FK_ROLEASSIGNMENT_DEFINITIONPOINT_ID FOREIGN KEY (DEFINITIONPOINT_ID) REFERENCES DVOBJECT (ID);
ALTER TABLE INGESTREPORT ADD CONSTRAINT FK_INGESTREPORT_DATAFILE_ID FOREIGN KEY (DATAFILE_ID) REFERENCES DVOBJECT (ID);
ALTER TABLE FOREIGNMETADATAFIELDMAPPING ADD CONSTRAINT FK_FOREIGNMETADATAFIELDMAPPING_FOREIGNMETADATAFORMATMAPPING_ID FOREIGN KEY (FOREIGNMETADATAFORMATMAPPING_ID) REFERENCES FOREIGNMETADATAFORMATMAPPING (ID);
ALTER TABLE FOREIGNMETADATAFIELDMAPPING ADD CONSTRAINT FK_FOREIGNMETADATAFIELDMAPPING_PARENTFIELDMAPPING_ID FOREIGN KEY (PARENTFIELDMAPPING_ID) REFERENCES FOREIGNMETADATAFIELDMAPPING (ID);
ALTER TABLE FILEMETADATA ADD CONSTRAINT FK_FILEMETADATA_DATASETVERSION_ID FOREIGN KEY (DATASETVERSION_ID) REFERENCES DATASETVERSION (ID);
ALTER TABLE FILEMETADATA ADD CONSTRAINT FK_FILEMETADATA_DATAFILE_ID FOREIGN KEY (DATAFILE_ID) REFERENCES DVOBJECT (ID);
ALTER TABLE CUSTOMQUESTIONVALUE ADD CONSTRAINT FK_CUSTOMQUESTIONVALUE_CUSTOMQUESTION_ID FOREIGN KEY (CUSTOMQUESTION_ID) REFERENCES CUSTOMQUESTION (ID);
ALTER TABLE DATAVERSELINKINGDATAVERSE ADD CONSTRAINT FK_DATAVERSELINKINGDATAVERSE_DATAVERSE_ID FOREIGN KEY (DATAVERSE_ID) REFERENCES DVOBJECT (ID);
ALTER TABLE DATAVERSELINKINGDATAVERSE ADD CONSTRAINT FK_DATAVERSELINKINGDATAVERSE_LINKINGDATAVERSE_ID FOREIGN KEY (LINKINGDATAVERSE_ID) REFERENCES DVOBJECT (ID);
ALTER TABLE DVOBJECT ADD CONSTRAINT FK_DVOBJECT_CREATOR_ID FOREIGN KEY (CREATOR_ID) REFERENCES AUTHENTICATEDUSER (ID);
ALTER TABLE DVOBJECT ADD CONSTRAINT FK_DVOBJECT_RELEASEUSER_ID FOREIGN KEY (RELEASEUSER_ID) REFERENCES AUTHENTICATEDUSER (ID);
ALTER TABLE DVOBJECT ADD CONSTRAINT FK_DVOBJECT_OWNER_ID FOREIGN KEY (OWNER_ID) REFERENCES DVOBJECT (ID);
ALTER TABLE SUMMARYSTATISTIC ADD CONSTRAINT FK_SUMMARYSTATISTIC_DATAVARIABLE_ID FOREIGN KEY (DATAVARIABLE_ID) REFERENCES DATAVARIABLE (ID);
ALTER TABLE worldmapauth_token ADD CONSTRAINT FK_worldmapauth_token_DATAVERSEUSER_ID FOREIGN KEY (DATAVERSEUSER_ID) REFERENCES AUTHENTICATEDUSER (ID);
ALTER TABLE worldmapauth_token ADD CONSTRAINT FK_worldmapauth_token_DATAFILE_ID FOREIGN KEY (DATAFILE_ID) REFERENCES DVOBJECT (ID);
ALTER TABLE worldmapauth_token ADD CONSTRAINT FK_worldmapauth_token_APPLICATION_ID FOREIGN KEY (APPLICATION_ID) REFERENCES worldmapauth_tokentype (ID);
ALTER TABLE METADATABLOCK ADD CONSTRAINT FK_METADATABLOCK_owner_id FOREIGN KEY (owner_id) REFERENCES DVOBJECT (ID);
ALTER TABLE PASSWORDRESETDATA ADD CONSTRAINT FK_PASSWORDRESETDATA_BUILTINUSER_ID FOREIGN KEY (BUILTINUSER_ID) REFERENCES BUILTINUSER (ID);
ALTER TABLE CONTROLLEDVOCABULARYVALUE ADD CONSTRAINT FK_CONTROLLEDVOCABULARYVALUE_DATASETFIELDTYPE_ID FOREIGN KEY (DATASETFIELDTYPE_ID) REFERENCES DATASETFIELDTYPE (ID);
ALTER TABLE DATASETLINKINGDATAVERSE ADD CONSTRAINT FK_DATASETLINKINGDATAVERSE_DATASET_ID FOREIGN KEY (DATASET_ID) REFERENCES DVOBJECT (ID);
ALTER TABLE DATASETLINKINGDATAVERSE ADD CONSTRAINT FK_DATASETLINKINGDATAVERSE_LINKINGDATAVERSE_ID FOREIGN KEY (LINKINGDATAVERSE_ID) REFERENCES DVOBJECT (ID);
ALTER TABLE DATAVERSE ADD CONSTRAINT FK_DATAVERSE_DEFAULTTEMPLATE_ID FOREIGN KEY (DEFAULTTEMPLATE_ID) REFERENCES TEMPLATE (ID);
ALTER TABLE DATAVERSE ADD CONSTRAINT FK_DATAVERSE_ID FOREIGN KEY (ID) REFERENCES DVOBJECT (ID);
ALTER TABLE DATAVERSE ADD CONSTRAINT FK_DATAVERSE_DEFAULTCONTRIBUTORROLE_ID FOREIGN KEY (DEFAULTCONTRIBUTORROLE_ID) REFERENCES DATAVERSEROLE (ID);
ALTER TABLE DATASET ADD CONSTRAINT FK_DATASET_ID FOREIGN KEY (ID) REFERENCES DVOBJECT (ID);
ALTER TABLE DATASET ADD CONSTRAINT FK_DATASET_guestbook_id FOREIGN KEY (guestbook_id) REFERENCES GUESTBOOK (ID);
ALTER TABLE DATASET ADD CONSTRAINT FK_DATASET_thumbnailfile_id FOREIGN KEY (thumbnailfile_id) REFERENCES DVOBJECT (ID);
ALTER TABLE IPV6RANGE ADD CONSTRAINT FK_IPV6RANGE_OWNER_ID FOREIGN KEY (OWNER_ID) REFERENCES PERSISTEDGLOBALGROUP (ID);
ALTER TABLE DATAFILETAG ADD CONSTRAINT FK_DATAFILETAG_DATAFILE_ID FOREIGN KEY (DATAFILE_ID) REFERENCES DVOBJECT (ID);
ALTER TABLE AUTHENTICATEDUSERLOOKUP ADD CONSTRAINT FK_AUTHENTICATEDUSERLOOKUP_AUTHENTICATEDUSER_ID FOREIGN KEY (AUTHENTICATEDUSER_ID) REFERENCES AUTHENTICATEDUSER (ID);
ALTER TABLE INGESTREQUEST ADD CONSTRAINT FK_INGESTREQUEST_datafile_id FOREIGN KEY (datafile_id) REFERENCES DVOBJECT (ID);
ALTER TABLE SAVEDSEARCHFILTERQUERY ADD CONSTRAINT FK_SAVEDSEARCHFILTERQUERY_SAVEDSEARCH_ID FOREIGN KEY (SAVEDSEARCH_ID) REFERENCES SAVEDSEARCH (ID);
ALTER TABLE DATAVERSEFACET ADD CONSTRAINT FK_DATAVERSEFACET_datasetfieldtype_id FOREIGN KEY (datasetfieldtype_id) REFERENCES DATASETFIELDTYPE (ID);
ALTER TABLE DATAVERSEFACET ADD CONSTRAINT FK_DATAVERSEFACET_dataverse_id FOREIGN KEY (dataverse_id) REFERENCES DVOBJECT (ID);
ALTER TABLE DATAVERSEFEATUREDDATAVERSE ADD CONSTRAINT FK_DATAVERSEFEATUREDDATAVERSE_dataverse_id FOREIGN KEY (dataverse_id) REFERENCES DVOBJECT (ID);
ALTER TABLE DATAVERSEFEATUREDDATAVERSE ADD CONSTRAINT FK_DATAVERSEFEATUREDDATAVERSE_featureddataverse_id FOREIGN KEY (featureddataverse_id) REFERENCES DVOBJECT (ID);
ALTER TABLE APITOKEN ADD CONSTRAINT FK_APITOKEN_AUTHENTICATEDUSER_ID FOREIGN KEY (AUTHENTICATEDUSER_ID) REFERENCES AUTHENTICATEDUSER (ID);
ALTER TABLE DATASETFIELDVALUE ADD CONSTRAINT FK_DATASETFIELDVALUE_DATASETFIELD_ID FOREIGN KEY (DATASETFIELD_ID) REFERENCES DATASETFIELD (ID);
ALTER TABLE DATAVERSECONTACT ADD CONSTRAINT FK_DATAVERSECONTACT_dataverse_id FOREIGN KEY (dataverse_id) REFERENCES DVOBJECT (ID);
ALTER TABLE CUSTOMQUESTION ADD CONSTRAINT FK_CUSTOMQUESTION_GUESTBOOK_ID FOREIGN KEY (GUESTBOOK_ID) REFERENCES GUESTBOOK (ID);
ALTER TABLE VARIABLERANGEITEM ADD CONSTRAINT FK_VARIABLERANGEITEM_DATAVARIABLE_ID FOREIGN KEY (DATAVARIABLE_ID) REFERENCES DATAVARIABLE (ID);
ALTER TABLE VARIABLECATEGORY ADD CONSTRAINT FK_VARIABLECATEGORY_DATAVARIABLE_ID FOREIGN KEY (DATAVARIABLE_ID) REFERENCES DATAVARIABLE (ID);
ALTER TABLE VARIABLERANGE ADD CONSTRAINT FK_VARIABLERANGE_DATAVARIABLE_ID FOREIGN KEY (DATAVARIABLE_ID) REFERENCES DATAVARIABLE (ID);
ALTER TABLE DATAVARIABLE ADD CONSTRAINT FK_DATAVARIABLE_DATATABLE_ID FOREIGN KEY (DATATABLE_ID) REFERENCES DATATABLE (ID);
ALTER TABLE CONTROLLEDVOCABALTERNATE ADD CONSTRAINT FK_CONTROLLEDVOCABALTERNATE_DATASETFIELDTYPE_ID FOREIGN KEY (DATASETFIELDTYPE_ID) REFERENCES DATASETFIELDTYPE (ID);
ALTER TABLE CONTROLLEDVOCABALTERNATE ADD CONSTRAINT FK_CONTROLLEDVOCABALTERNATE_CONTROLLEDVOCABULARYVALUE_ID FOREIGN KEY (CONTROLLEDVOCABULARYVALUE_ID) REFERENCES CONTROLLEDVOCABULARYVALUE (ID);
ALTER TABLE DATASETFIELD ADD CONSTRAINT FK_DATASETFIELD_DATASETFIELDTYPE_ID FOREIGN KEY (DATASETFIELDTYPE_ID) REFERENCES DATASETFIELDTYPE (ID);
ALTER TABLE DATASETFIELD ADD CONSTRAINT FK_DATASETFIELD_TEMPLATE_ID FOREIGN KEY (TEMPLATE_ID) REFERENCES TEMPLATE (ID);
ALTER TABLE DATASETFIELD ADD CONSTRAINT FK_DATASETFIELD_DATASETVERSION_ID FOREIGN KEY (DATASETVERSION_ID) REFERENCES DATASETVERSION (ID);
ALTER TABLE DATASETFIELD ADD CONSTRAINT FK_DATASETFIELD_PARENTDATASETFIELDCOMPOUNDVALUE_ID FOREIGN KEY (PARENTDATASETFIELDCOMPOUNDVALUE_ID) REFERENCES DATASETFIELDCOMPOUNDVALUE (ID);
ALTER TABLE IPV4RANGE ADD CONSTRAINT FK_IPV4RANGE_OWNER_ID FOREIGN KEY (OWNER_ID) REFERENCES PERSISTEDGLOBALGROUP (ID);
ALTER TABLE DATAFILE ADD CONSTRAINT FK_DATAFILE_ID FOREIGN KEY (ID) REFERENCES DVOBJECT (ID);
ALTER TABLE DATASETVERSION ADD CONSTRAINT FK_DATASETVERSION_DATASET_ID FOREIGN KEY (DATASET_ID) REFERENCES DVOBJECT (ID);
ALTER TABLE DATAVERSEFIELDTYPEINPUTLEVEL ADD CONSTRAINT FK_DATAVERSEFIELDTYPEINPUTLEVEL_dataverse_id FOREIGN KEY (dataverse_id) REFERENCES DVOBJECT (ID);
ALTER TABLE DATAVERSEFIELDTYPEINPUTLEVEL ADD CONSTRAINT FK_DATAVERSEFIELDTYPEINPUTLEVEL_datasetfieldtype_id FOREIGN KEY (datasetfieldtype_id) REFERENCES DATASETFIELDTYPE (ID);
ALTER TABLE USERNOTIFICATION ADD CONSTRAINT FK_USERNOTIFICATION_USER_ID FOREIGN KEY (USER_ID) REFERENCES AUTHENTICATEDUSER (ID);
ALTER TABLE HARVESTINGDATAVERSECONFIG ADD CONSTRAINT FK_HARVESTINGDATAVERSECONFIG_dataverse_id FOREIGN KEY (dataverse_id) REFERENCES DVOBJECT (ID);
ALTER TABLE DATASETFIELDCOMPOUNDVALUE ADD CONSTRAINT FK_DATASETFIELDCOMPOUNDVALUE_PARENTDATASETFIELD_ID FOREIGN KEY (PARENTDATASETFIELD_ID) REFERENCES DATASETFIELD (ID);
ALTER TABLE DATASETVERSIONUSER ADD CONSTRAINT FK_DATASETVERSIONUSER_authenticatedUser_id FOREIGN KEY (authenticatedUser_id) REFERENCES AUTHENTICATEDUSER (ID);
ALTER TABLE DATASETVERSIONUSER ADD CONSTRAINT FK_DATASETVERSIONUSER_datasetversion_id FOREIGN KEY (datasetversion_id) REFERENCES DATASETVERSION (ID);
ALTER TABLE GUESTBOOKRESPONSE ADD CONSTRAINT FK_GUESTBOOKRESPONSE_DATAFILE_ID FOREIGN KEY (DATAFILE_ID) REFERENCES DVOBJECT (ID);
ALTER TABLE GUESTBOOKRESPONSE ADD CONSTRAINT FK_GUESTBOOKRESPONSE_DATASETVERSION_ID FOREIGN KEY (DATASETVERSION_ID) REFERENCES DATASETVERSION (ID);
ALTER TABLE GUESTBOOKRESPONSE ADD CONSTRAINT FK_GUESTBOOKRESPONSE_GUESTBOOK_ID FOREIGN KEY (GUESTBOOK_ID) REFERENCES GUESTBOOK (ID);
ALTER TABLE GUESTBOOKRESPONSE ADD CONSTRAINT FK_GUESTBOOKRESPONSE_AUTHENTICATEDUSER_ID FOREIGN KEY (AUTHENTICATEDUSER_ID) REFERENCES AUTHENTICATEDUSER (ID);
ALTER TABLE GUESTBOOKRESPONSE ADD CONSTRAINT FK_GUESTBOOKRESPONSE_DATASET_ID FOREIGN KEY (DATASET_ID) REFERENCES DVOBJECT (ID);
ALTER TABLE CUSTOMQUESTIONRESPONSE ADD CONSTRAINT FK_CUSTOMQUESTIONRESPONSE_CUSTOMQUESTION_ID FOREIGN KEY (CUSTOMQUESTION_ID) REFERENCES CUSTOMQUESTION (ID);
ALTER TABLE CUSTOMQUESTIONRESPONSE ADD CONSTRAINT FK_CUSTOMQUESTIONRESPONSE_GUESTBOOKRESPONSE_ID FOREIGN KEY (GUESTBOOKRESPONSE_ID) REFERENCES GUESTBOOKRESPONSE (ID);
ALTER TABLE GUESTBOOK ADD CONSTRAINT FK_GUESTBOOK_DATAVERSE_ID FOREIGN KEY (DATAVERSE_ID) REFERENCES DVOBJECT (ID);
ALTER TABLE MAPLAYERMETADATA ADD CONSTRAINT FK_MAPLAYERMETADATA_DATAFILE_ID FOREIGN KEY (DATAFILE_ID) REFERENCES DVOBJECT (ID);
ALTER TABLE MAPLAYERMETADATA ADD CONSTRAINT FK_MAPLAYERMETADATA_DATASET_ID FOREIGN KEY (DATASET_ID) REFERENCES DVOBJECT (ID);
ALTER TABLE SAVEDSEARCH ADD CONSTRAINT FK_SAVEDSEARCH_DEFINITIONPOINT_ID FOREIGN KEY (DEFINITIONPOINT_ID) REFERENCES DVOBJECT (ID);
ALTER TABLE SAVEDSEARCH ADD CONSTRAINT FK_SAVEDSEARCH_CREATOR_ID FOREIGN KEY (CREATOR_ID) REFERENCES AUTHENTICATEDUSER (ID);
ALTER TABLE EXPLICITGROUP ADD CONSTRAINT FK_EXPLICITGROUP_OWNER_ID FOREIGN KEY (OWNER_ID) REFERENCES DVOBJECT (ID);
ALTER TABLE TEMPLATE ADD CONSTRAINT FK_TEMPLATE_DATAVERSE_ID FOREIGN KEY (DATAVERSE_ID) REFERENCES DVOBJECT (ID);
ALTER TABLE DATASETLOCK ADD CONSTRAINT FK_DATASETLOCK_DATASET_ID FOREIGN KEY (DATASET_ID) REFERENCES DVOBJECT (ID);
ALTER TABLE DATASETLOCK ADD CONSTRAINT FK_DATASETLOCK_USER_ID FOREIGN KEY (USER_ID) REFERENCES AUTHENTICATEDUSER (ID);
ALTER TABLE DATAVERSEROLE ADD CONSTRAINT FK_DATAVERSEROLE_OWNER_ID FOREIGN KEY (OWNER_ID) REFERENCES DVOBJECT (ID);
ALTER TABLE DATASETFIELDDEFAULTVALUE ADD CONSTRAINT FK_DATASETFIELDDEFAULTVALUE_DEFAULTVALUESET_ID FOREIGN KEY (DEFAULTVALUESET_ID) REFERENCES DEFAULTVALUESET (ID);
ALTER TABLE DATASETFIELDDEFAULTVALUE ADD CONSTRAINT FK_DATASETFIELDDEFAULTVALUE_DATASETFIELD_ID FOREIGN KEY (DATASETFIELD_ID) REFERENCES DATASETFIELDTYPE (ID);
ALTER TABLE DATASETFIELDDEFAULTVALUE ADD CONSTRAINT FK_DATASETFIELDDEFAULTVALUE_PARENTDATASETFIELDDEFAULTVALUE_ID FOREIGN KEY (PARENTDATASETFIELDDEFAULTVALUE_ID) REFERENCES DATASETFIELDDEFAULTVALUE (ID);
ALTER TABLE DATASETFIELDTYPE ADD CONSTRAINT FK_DATASETFIELDTYPE_PARENTDATASETFIELDTYPE_ID FOREIGN KEY (PARENTDATASETFIELDTYPE_ID) REFERENCES DATASETFIELDTYPE (ID);
ALTER TABLE DATASETFIELDTYPE ADD CONSTRAINT FK_DATASETFIELDTYPE_METADATABLOCK_ID FOREIGN KEY (METADATABLOCK_ID) REFERENCES METADATABLOCK (ID);
ALTER TABLE FILEMETADATA_DATAFILECATEGORY ADD CONSTRAINT FK_FILEMETADATA_DATAFILECATEGORY_fileMetadatas_ID FOREIGN KEY (fileMetadatas_ID) REFERENCES FILEMETADATA (ID);
ALTER TABLE FILEMETADATA_DATAFILECATEGORY ADD CONSTRAINT FK_FILEMETADATA_DATAFILECATEGORY_fileCategories_ID FOREIGN KEY (fileCategories_ID) REFERENCES DATAFILECATEGORY (ID);
ALTER TABLE dataversesubjects ADD CONSTRAINT FK_dataversesubjects_dataverse_id FOREIGN KEY (dataverse_id) REFERENCES DVOBJECT (ID);
ALTER TABLE dataversesubjects ADD CONSTRAINT FK_dataversesubjects_controlledvocabularyvalue_id FOREIGN KEY (controlledvocabularyvalue_id) REFERENCES CONTROLLEDVOCABULARYVALUE (ID);
ALTER TABLE DATAVERSE_METADATABLOCK ADD CONSTRAINT FK_DATAVERSE_METADATABLOCK_Dataverse_ID FOREIGN KEY (Dataverse_ID) REFERENCES DVOBJECT (ID);
ALTER TABLE DATAVERSE_METADATABLOCK ADD CONSTRAINT FK_DATAVERSE_METADATABLOCK_metadataBlocks_ID FOREIGN KEY (metadataBlocks_ID) REFERENCES METADATABLOCK (ID);
ALTER TABLE DATASETFIELD_CONTROLLEDVOCABULARYVALUE ADD CONSTRAINT FK_DATASETFIELD_CONTROLLEDVOCABULARYVALUE_DatasetField_ID FOREIGN KEY (DatasetField_ID) REFERENCES DATASETFIELD (ID);
ALTER TABLE DATASETFIELD_CONTROLLEDVOCABULARYVALUE ADD CONSTRAINT DTASETFIELDCONTROLLEDVOCABULARYVALUEcntrolledVocabularyValuesID FOREIGN KEY (controlledVocabularyValues_ID) REFERENCES CONTROLLEDVOCABULARYVALUE (ID);
ALTER TABLE fileaccessrequests ADD CONSTRAINT FK_fileaccessrequests_datafile_id FOREIGN KEY (datafile_id) REFERENCES DVOBJECT (ID);
ALTER TABLE fileaccessrequests ADD CONSTRAINT FK_fileaccessrequests_authenticated_user_id FOREIGN KEY (authenticated_user_id) REFERENCES AUTHENTICATEDUSER (ID);
ALTER TABLE ExplicitGroup_CONTAINEDROLEASSIGNEES ADD CONSTRAINT FK_ExplicitGroup_CONTAINEDROLEASSIGNEES_ExplicitGroup_ID FOREIGN KEY (ExplicitGroup_ID) REFERENCES EXPLICITGROUP (ID);
ALTER TABLE EXPLICITGROUP_AUTHENTICATEDUSER ADD CONSTRAINT FK_EXPLICITGROUP_AUTHENTICATEDUSER_ExplicitGroup_ID FOREIGN KEY (ExplicitGroup_ID) REFERENCES EXPLICITGROUP (ID);
ALTER TABLE EXPLICITGROUP_AUTHENTICATEDUSER ADD CONSTRAINT EXPLICITGROUP_AUTHENTICATEDUSER_containedAuthenticatedUsers_ID FOREIGN KEY (containedAuthenticatedUsers_ID) REFERENCES AUTHENTICATEDUSER (ID);
ALTER TABLE explicitgroup_explicitgroup ADD CONSTRAINT FK_explicitgroup_explicitgroup_explicitgroup_id FOREIGN KEY (explicitgroup_id) REFERENCES EXPLICITGROUP (ID);
ALTER TABLE explicitgroup_explicitgroup ADD CONSTRAINT FK_explicitgroup_explicitgroup_containedexplicitgroups_id FOREIGN KEY (containedexplicitgroups_id) REFERENCES EXPLICITGROUP (ID);
CREATE TABLE SEQUENCE (SEQ_NAME VARCHAR(50) NOT NULL, SEQ_COUNT DECIMAL(38), PRIMARY KEY (SEQ_NAME));
INSERT INTO SEQUENCE(SEQ_NAME, SEQ_COUNT) values ('SEQ_GEN', 0);
