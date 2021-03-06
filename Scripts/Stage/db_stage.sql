use master
go

if db_id ('Stage') is not null
drop database Stage;
go

create database Stage 
on primary (name = 'stage_fg1'
, filename = 'd:\disk\data1\stage_fg1.mdf'
, size = 5 MB, filegrowth = 1 MB)
, filegroup stage_fg2 (name = 'stage_fg2'
, filename = 'd:\disk\data2\stage_fg2.ndf'
, size = 5 MB, filegrowth = 1 MB)
, filegroup stage_fg3 (name = 'stage_fg3'
, filename = 'd:\disk\data3\stage_fg3.ndf'
, size = 5 MB, filegrowth = 1 MB)
, filegroup stage_fg4 (name = 'stage_fg4'
, filename = 'd:\disk\data4\stage_fg4.ndf'
, size = 5 MB, filegrowth = 1 MB)
log on (name = 'stage_log'
, filename = 'd:\disk\log3\stage_log.ldf'
, size = 2 MB, filegrowth = 512 KB)
collate SQL_Latin1_General_CP1_CI_AS
go

alter database Stage set recovery simple 
go
alter database Stage set auto_shrink off
go
alter database Stage set auto_create_statistics off
go
alter database Stage set auto_update_statistics off
go

