-- Group [Group]
create table "public"."group" (
   "oid"  int4  not null,
   "groupname"  varchar(255),
  primary key ("oid")
);


-- Module [Module]
create table "public"."module" (
   "oid"  int4  not null,
   "moduleid"  varchar(255),
   "modulename"  varchar(255),
  primary key ("oid")
);


-- User [User]
create table "public"."user" (
   "oid"  int4  not null,
   "username"  varchar(255),
   "password"  varchar(255),
   "email"  varchar(255),
   "name"  varchar(255),
   "birthdate"  date,
   "piggybank"  int4,
   "type"  varchar(255),
  primary key ("oid")
);


-- Task [ent2]
create table "public"."task" (
   "oid"  int4  not null,
   "execstamp"  timestamp,
   "exectime"  time,
   "reward"  int4,
   "description"  text,
   "title"  varchar(255),
  primary key ("oid")
);


-- Items [ent3]
create table "public"."items" (
   "oid"  int4  not null,
   "title"  varchar(255),
   "caption"  varchar(255),
   "image"  varchar(255),
  primary key ("oid")
);


-- Annotation Campaigns [ent5]
create table "public"."annotation_campaigns" (
   "oid"  int4  not null,
   "name"  varchar(255),
   "budget"  int4,
   "status"  bool,
  primary key ("oid")
);


-- Annotation [ent6]
create table "public"."annotation" (
   "oid"  int4  not null,
   "label"  varchar(255),
   "confidence"  int4,
  primary key ("oid")
);


-- Skills [ent7]
create table "public"."skills" (
   "oid"  int4  not null,
   "skill"  varchar(255),
  primary key ("oid")
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table "public"."group"  add column  "module_oid"  int4;


-- Group_Module [Group2Module_Module2Group]
create table "public"."group_module" (
   "group_oid"  int4 not null,
   "module_oid"  int4 not null,
  primary key ("group_oid", "module_oid")
);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "public"."user"  add column  "group_oid"  int4;


-- User_Group [User2Group_Group2User]
create table "public"."user_group" (
   "user_oid"  int4 not null,
   "group_oid"  int4 not null,
  primary key ("user_oid", "group_oid")
);


-- User_Skills [rel2]
create table "public"."user_skills" (
   "user_oid"  int4 not null,
   "skills_oid"  int4 not null,
  primary key ("user_oid", "skills_oid")
);


-- Task_Skills [rel5]
create table "public"."task_skills" (
   "task_oid"  int4 not null,
   "skills_oid"  int4 not null,
  primary key ("task_oid", "skills_oid")
);


-- Task_Annotation Campaigns [rel6]
alter table "public"."annotation_campaigns"  add column  "task_oid"  int4;


-- User_Task [rel7]
create table "public"."user_task" (
   "user_oid"  int4 not null,
   "task_oid"  int4 not null,
  primary key ("user_oid", "task_oid")
);


-- Task_Items [rel8]
create table "public"."task_items" (
   "task_oid"  int4 not null,
   "items_oid"  int4 not null,
  primary key ("task_oid", "items_oid")
);


-- Items_Annotation [rel9]
create table "public"."items_annotation" (
   "items_oid"  int4 not null,
   "annotation_oid"  int4 not null,
  primary key ("items_oid", "annotation_oid")
);


