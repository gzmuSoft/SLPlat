/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/1/30 22:55:26                           */
/*==============================================================*/

/*==============================================================*/
/* Table: administrative_post                                   */
/*==============================================================*/
create table administrative_post
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table administrative_post comment '行政职务';

/*==============================================================*/
/* Index: administrative_post_index                             */
/*==============================================================*/
create unique index administrative_post_index on administrative_post
(
   id_
);

/*==============================================================*/
/* Index: administrative_post_name_index                        */
/*==============================================================*/
create index administrative_post_name_index on administrative_post
(
   name_
);

/*==============================================================*/
/* Table: answer_for_completion                                 */
/*==============================================================*/
create table answer_for_completion
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `completion_id`         bigint comment '填空题编号',
   `answer_`                varchar(254) comment '答案',
   `synonyms`              varchar(500) comment '同义词(答案的同义词组)',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table answer_for_completion comment '填空题答案';

/*==============================================================*/
/* Index: answer_for_completion_index                           */
/*==============================================================*/
create unique index answer_for_completion_index on answer_for_completion
(
   id_
);

/*==============================================================*/
/* Index: answer_for_completion_completion_index                */
/*==============================================================*/
create index answer_for_completion_completion_index on answer_for_completion
(
   completion_id
);

/*==============================================================*/
/* Table: attachment                                            */
/*==============================================================*/
create table attachment
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `type_id`               bigint not null comment '类型',
   `path_`                 varchar(1000) not null comment '路径',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table attachment comment '附件文档';

/*==============================================================*/
/* Index: attachment_index                                      */
/*==============================================================*/
create unique index attachment_index on attachment
(
   id_
);

/*==============================================================*/
/* Index: attachment_name_index                                 */
/*==============================================================*/
create index attachment_name_index on attachment
(
   name_
);

/*==============================================================*/
/* Table: attachment_type                                       */
/*==============================================================*/
create table attachment_type
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table attachment_type comment '附件类型';

/*==============================================================*/
/* Index: attachment_type_index                                 */
/*==============================================================*/
create unique index attachment_type_index on attachment_type
(
   id_
);

/*==============================================================*/
/* Index: attachment_type_name_index                            */
/*==============================================================*/
create index attachment_type_name_index on attachment_type
(
   name_
);

/*==============================================================*/
/* Table: authority                                             */
/*==============================================================*/
create table authority
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `prent_id`              bigint not null default 0 comment '所属上级',
   `type_`                 bigint not null default 1 comment '类型(1:目录,2:菜单,3:按钮)',
   `permission_value`      varchar(254) comment '权限值',
   `uri_`                  varchar(1000) not null comment '路径',
   `icon_`                 varchar(254) comment '图标',
   `status_`               tinyint not null default true comment '状态(true:正常, false:禁止)',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table authority comment '权限';

/*==============================================================*/
/* Index: authority_index                                       */
/*==============================================================*/
create unique index authority_index on authority
(
   id_
);

/*==============================================================*/
/* Index: authority_name_index                                  */
/*==============================================================*/
create index authority_name_index on authority
(
   name_
);

/*==============================================================*/
/* Index: authority_parent_id_index                             */
/*==============================================================*/
create index authority_parent_id_index on authority
(
   prent_id
);

/*==============================================================*/
/* Index: authority_type_index                                  */
/*==============================================================*/
create index authority_type_index on authority
(
   type_
);

/*==============================================================*/
/* Table: batch                                                 */
/*==============================================================*/
create table batch
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table batch comment '批次';

/*==============================================================*/
/* Index: batch_index                                           */
/*==============================================================*/
create unique index batch_index on batch
(
   id_
);

/*==============================================================*/
/* Index: batch_name_index                                      */
/*==============================================================*/
create index batch_name_index on batch
(
   name_
);

/*==============================================================*/
/* Table: book_resource                                         */
/*==============================================================*/
create table book_resource
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `specialty_id`          bigint comment '专业编号',
   `type_`                 varchar(254) comment '图书形式：电子图书、纸质图书',
   `number_`               bigint comment '图书数量',
   `publisher_id`          bigint comment '出版社',
   `publish_time`          date comment '出版时间',
   `ISBN_`                 varchar(254) comment 'ISBN',
   `introdution_`          varchar(5000) comment '简介',
   `authors_`              varchar(254) comment '编者',
   `href_`                 varchar(254) comment '电子书超链接',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table book_resource comment '图书资料';

/*==============================================================*/
/* Table: cee_annual_score                                      */
/*==============================================================*/
create table cee_annual_score
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `year_`                  bigint not null comment '年份',
   `province_id`           bigint not null comment '省份编号',
   `category_id`           bigint not null comment '考生类别编号',
   `batch_id`              bigint not null comment '批次编号',
   `min_score_line`        float not null comment '最低分数线',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table cee_annual_score comment '历年分数线';

/*==============================================================*/
/* Index: cee_annual_score_index                                 */
/*==============================================================*/
create unique index cee_annual_score_index on cee_annual_score
(
   id_
);

/*==============================================================*/
/* Index: cee_annual_score_year_index                            */
/*==============================================================*/
create index cee_annual_score_year_index on cee_annual_score
(
   year_
);

/*==============================================================*/
/* Index: cee_annual_score_province_index                        */
/*==============================================================*/
create index cee_annual_score_province_index on cee_annual_score
(
   province_id
);

/*==============================================================*/
/* Index: cee_annual_score_category_index                        */
/*==============================================================*/
create index cee_annual_score_category_index on cee_annual_score
(
   category_id
);

/*==============================================================*/
/* Index: cee_annual_score_batch_index                           */
/*==============================================================*/
create index cee_annual_score_batch_index on cee_annual_score
(
   batch_id
);

/*==============================================================*/
/* Table: certificate                                           */
/*==============================================================*/
create table certificate
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) comment '名称',
   `spell_`                varchar(254) comment '名称全拼',
   `certificate_no`        varchar(254) comment '证书编号',
   `owner_id`              bigint comment '拥有者编号',
   `level_`                varchar(254) comment '级别：初级、中级、高级',
   `type_`                 varchar(254) comment '类型：企业认证、国家认证',
   `time_`                 datetime comment '获得时间：保存年份、月份',
   `student_id`            varchar(254) comment '学生编号',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table certificate comment '相关行业证书';

/*==============================================================*/
/* Table: chapter_and_sections                                  */
/*==============================================================*/
create table chapter_and_sections
(
   `id_`                   bigint not null auto_increment comment '编号',
   `course_id`             bigint not null comment '课程编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `overview_`             varchar(10000) comment '概述',
   `parent_id`             bigint comment '所属父章节编号',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table chapter_and_sections comment '章节';

/*==============================================================*/
/* Index: chapter_and_sections_index                            */
/*==============================================================*/
create unique index chapter_and_sections_index on chapter_and_sections
(
   id_
);

/*==============================================================*/
/* Index: chapter_and_sections_course_index                     */
/*==============================================================*/
create index chapter_and_sections_course_index on chapter_and_sections
(
   course_id
);

/*==============================================================*/
/* Index: chapter_and_sections_name_index                       */
/*==============================================================*/
create index chapter_and_sections_name_index on chapter_and_sections
(
   name_
);

/*==============================================================*/
/* Index: chapter_and_sections_parent_index                     */
/*==============================================================*/
create index chapter_and_sections_parent_index on chapter_and_sections
(
   parent_id
);

/*==============================================================*/
/* Table: city                                                  */
/*==============================================================*/
create table city
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `province_id`           bigint not null comment '省份编号',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table city comment '市';

/*==============================================================*/
/* Index: city_index                                            */
/*==============================================================*/
create unique index city_index on city
(
   id_
);

/*==============================================================*/
/* Index: city_name_index                                       */
/*==============================================================*/
create index city_name_index on city
(
   name_
);

/*==============================================================*/
/* Index: city_province_index                                   */
/*==============================================================*/
create index city_province_index on city
(
   province_id
);

/*==============================================================*/
/* Table: class                                                 */
/*==============================================================*/
create table class
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `specialty_id`          bigint not null comment '专业编号',
   `adviser_id`            bigint comment '班主任编号',
   `monitor_id`            bigint comment '班长编号',
   `secretary_id`          bigint comment '学习委员编号',
   `entrance_date`         datetime comment '入学日期',
   `students_number`       bigint comment '学生人数',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table class comment '班级';

/*==============================================================*/
/* Index: class_index                                           */
/*==============================================================*/
create unique index class_index on class
(
   id_
);

/*==============================================================*/
/* Index: class_name_index                                      */
/*==============================================================*/
create index class_name_index on class
(
   name_
);

/*==============================================================*/
/* Index: class_adviser_index                                   */
/*==============================================================*/
create index class_adviser_index on class
(
   adviser_id
);

/*==============================================================*/
/* Index: class_specialty_index                                 */
/*==============================================================*/
create index class_specialty_index on class
(
   `specialty_id`
);

/*==============================================================*/
/* Table: college                                               */
/*==============================================================*/
create table college
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `school_id`             bigint not null comment '学校编号',
   `college_profile`       varchar(10000) comment '学院概况',
   `college_code`          varchar(254) comment '学院代码',
   `students_number`       bigint comment '在校生人数',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table college comment '学院';

/*==============================================================*/
/* Index: college_index                                         */
/*==============================================================*/
create unique index college_index on college
(
   id_
);

/*==============================================================*/
/* Index: college_name_index                                    */
/*==============================================================*/
create index college_name_index on college
(
   name_
);

/*==============================================================*/
/* Index: college_code_index                                    */
/*==============================================================*/
create index college_code_index on college
(
   college_code
);

/*==============================================================*/
/* Index: college_school_index                                  */
/*==============================================================*/
create index college_school_index on college
(
   school_id
);

/*==============================================================*/
/* Table: completion                                            */
/*==============================================================*/
create table completion
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(1000) comment '名称',
   `spell_`                varchar(1000) comment '名称的全拼',
   `difficult_degree`      bigint comment '难度系数',
   `is_required`           tinyint default false comment '是否必选(true:是, false:否)',
   `section_id`            bigint comment '所属章节',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table completion comment '填空题';

/*==============================================================*/
/* Index: completion_index                                      */
/*==============================================================*/
create unique index completion_index on completion
(
   id_
);

/*==============================================================*/
/* Index: completion_difficult_degree_index                     */
/*==============================================================*/
create index completion_difficult_degree_index on completion
(
   difficult_degree
);

/*==============================================================*/
/* Index: completion_is_required_index                          */
/*==============================================================*/
create index completion_is_required_index on completion
(
   is_required
);

/*==============================================================*/
/* Index: completion_section_index                              */
/*==============================================================*/
create index completion_section_index on completion
(
   section_id
);

/*==============================================================*/
/* Table: content                                               */
/*==============================================================*/
create table content
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `year_`                 bigint not null comment '年份',
   `index_`                varchar(254) comment '指标：定性指标、定量指标',
   `specialty_id`          bigint not null comment '专业编号',
   `professor_id`          bigint not null comment '专家编号',
   `estimate_`             varchar(5000) not null comment '评价',
   `score_`                bigint comment '分值',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table content comment '评价内容';

/*==============================================================*/
/* Index: content_index                                         */
/*==============================================================*/
create unique index content_index on content
(
   id_
);

/*==============================================================*/
/* Index: content_year_index                                    */
/*==============================================================*/
create index content_year_index on content
(
   year_
);

/*==============================================================*/
/* Index: content_specialty_index                               */
/*==============================================================*/
create index content_specialty_index on content
(
   specialty_id
);

/*==============================================================*/
/* Index: content_professor_index                               */
/*==============================================================*/
create index content_professor_index on content
(
   professor_id
);

/*==============================================================*/
/* Table: content_detailed_grading_item                         */
/*==============================================================*/
create table content_detailed_grading_item
(
   `id_`                       bigint not null comment '编号',
   `name_`                     varchar(254) comment '名称',
   `spell_`                    varchar(254) comment '名称的全拼',
   `content_id`                bigint not null comment '评价内容编号',
   `detailed_grading_item_id`   bigint not null comment '评分细则编号',
   `create_by`                 bigint comment '创建用户编号',
   `create_time`               datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`                 bigint comment '更新用户编号',
   `update_time`               datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`                   int default 1 comment '排序',
   `remark_`                   varchar(254) comment '备注',
   `enable_`                   tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table content_detailed_grading_item comment '评价内容与评分规则关联';

/*==============================================================*/
/* Index: content_detailed_grading_item_contentID_index         */
/*==============================================================*/
create index content_detailed_grading_item_contentID_index on content_detailed_grading_item
(
   content_id
);

/*====================================================================*/
/* Index: content_detailed_grading_item_detailed_grading_item_id_index */
/*====================================================================*/
create index content_detailed_grading_item_detailed_grading_item_id_index on content_detailed_grading_item
(
   detailed_grading_item_id
);

/*==============================================================*/
/* Table: copyright                                             */
/*==============================================================*/
create table copyright
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `certificate_id`        varchar(254) comment '证书号',
   `completion_date`       datetime comment '开发完成日期',
   `release_date`          datetime comment '首次发表日期',
   `acquisition_mode`      datetime comment '权利取得方式',
   `interest_field`        varchar(1000) comment '权利范围',
   `register_no`           varchar(254) comment '登记号',
   `licence_date`          datetime comment '发证日期',
   `attachment_id`         bigint comment '附件文档',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table copyright comment '著作权';

/*==============================================================*/
/* Index: copyright_index                                       */
/*==============================================================*/
create index copyright_index on copyright
(
   id_
);

/*==============================================================*/
/* Index: copyright_name_index                                  */
/*==============================================================*/
create index copyright_name_index on copyright
(
   name_
);

/*==============================================================*/
/* Table: copyright_owner                                       */
/*==============================================================*/
create table copyright_owner
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `copyright_no`          bigint not null comment '著作权编号',
   `owner_id`              bigint not null comment '拥有者编号',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table copyright_owner comment '著作权与拥有者（著作权人）关联';

/*==============================================================*/
/* Index: copyright_owner_copyright_index                       */
/*==============================================================*/
create index copyright_owner_copyright_index on copyright_owner
(
   copyright_no
);

/*==============================================================*/
/* Index: copyright_owner_owner_index                           */
/*==============================================================*/
create index copyright_owner_owner_index on copyright_owner
(
   owner_id
);

/*==============================================================*/
/* Table: county                                                */
/*==============================================================*/
create table county
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `city_id`              bigint not null comment '市编号',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table county comment '区县';

/*==============================================================*/
/* Index: county_index                                          */
/*==============================================================*/
create unique index county_index on county
(
   id_
);

/*==============================================================*/
/* Index: county_name_index                                     */
/*==============================================================*/
create index county_name_index on county
(
   name_
);

/*==============================================================*/
/* Index: county_city_index                                     */
/*==============================================================*/
create index county_city_index on county
(
   city_id
);

/*==============================================================*/
/* Table: course                                                */
/*==============================================================*/
create table course
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `specialty_id`         bigint not null comment '专业编号',
   `code_`                 varchar(254) not null comment '课程代码',
   `credit_`               bigint not null comment '学分',
   `class_hours`          bigint not null comment '学时',
   `start_time`           datetime comment '开课时间',
   `theory_hours`         bigint not null comment '理论课时',
   `practical_hours`      bigint not null comment '实践课时',
   `type_id`              bigint comment '课程类型编号',
   `course_property`      varchar(254) comment '课程性质',
   `is_boutique_course`   tinyint default false comment '是否精品课程(true:是, false:否)',
   `introduction_`         varchar(10000) comment '课程简介',
   `target_`               varchar(10000) comment '课程目标',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table course comment '课程';

/*==============================================================*/
/* Index: course_index                                          */
/*==============================================================*/
create unique index course_index on course
(
   id_
);

/*==============================================================*/
/* Index: course_name_index                                     */
/*==============================================================*/
create index course_name_index on course
(
   name_
);

/*==============================================================*/
/* Index: course_specialty_index                                */
/*==============================================================*/
create index course_specialty_index on course
(
   specialty_id
);

/*==============================================================*/
/* Index: course_code_index                                     */
/*==============================================================*/
create index course_code_index on course
(
   code_
);

/*==============================================================*/
/* Index: course_type_index                                     */
/*==============================================================*/
create index course_type_index on course
(
   type_id
);

/*==============================================================*/
/* Index: course_is_boutique_course_index                       */
/*==============================================================*/
create index course_is_boutique_course_index on course
(
   is_boutique_course
);

/*==============================================================*/
/* Table: course_material                                       */
/*==============================================================*/
create table course_material
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `publisher_id`         bigint comment '出版社编号',
   `editor_`               varchar(254) comment '编者',
   `ISBN_`                 varchar(254) comment 'ISBN',
   `price_`                numeric(8,0) comment '定价',
   `feature_`              varchar(10000) comment '教材特色',
   `publish_date`         datetime comment '出版日期',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table course_material comment '课程教材';

/*==============================================================*/
/* Index: course_material_index                                 */
/*==============================================================*/
create unique index course_material_index on course_material
(
   id_
);

/*==============================================================*/
/* Index: course_material_name_index                            */
/*==============================================================*/
create index course_material_name_index on course_material
(
   name_
);

/*==============================================================*/
/* Index: course_material_editor_index                          */
/*==============================================================*/
create index course_material_editor_index on course_material
(
   editor_
);

/*==============================================================*/
/* Index: course_material_iSBN_index                            */
/*==============================================================*/
create index course_material_iSBN_index on course_material
(
   ISBN_
);

/*==============================================================*/
/* Table: course_teaching                                       */
/*==============================================================*/
create table course_teaching
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `course_id`             bigint comment '课程编号',
   `tutor_id`              bigint comment '授课老师编号',
   `counselor_id`          bigint comment '辅导老师编号',
   `lecturer_id`           bigint comment '授课班级编号',
   `semester_id`           bigint comment '开课学期编号',
   `course_material_id`    bigint comment '所用教材编号',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table course_teaching comment '课程讲授';

/*==============================================================*/
/* Index: course_teaching_index                                 */
/*==============================================================*/
create unique index course_teaching_index on course_teaching
(
   id_
);

/*==============================================================*/
/* Index: course_teaching_name_index                            */
/*==============================================================*/
create index course_teaching_name_index on course_teaching
(
   name_
);

/*==============================================================*/
/* Index: course_teaching_course_index                          */
/*==============================================================*/
create index course_teaching_course_index on course_teaching
(
   course_id
);

/*==============================================================*/
/* Index: course_teaching_tutor_index                           */
/*==============================================================*/
create index course_teaching_tutor_index on course_teaching
(
   tutor_id
);

/*==============================================================*/
/* Index: course_teaching_counselor_index                       */
/*==============================================================*/
create index course_teaching_counselor_index on course_teaching
(
   counselor_id
);

/*==============================================================*/
/* Index: course_teaching_lecturer_index                        */
/*==============================================================*/
create index course_teaching_lecturer_index on course_teaching
(
   lecturer_id
);

/*==============================================================*/
/* Index: course_teaching_semester_index                        */
/*==============================================================*/
create index course_teaching_semester_index on course_teaching
(
   semester_id
);

/*==============================================================*/
/* Table: course_type                                           */
/*==============================================================*/
create table course_type
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table course_type comment '课程类型';

/*==============================================================*/
/* Index: course_type_index                                     */
/*==============================================================*/
create unique index course_type_index on course_type
(
   id_
);

/*==============================================================*/
/* Index: course_type_name_index                                */
/*==============================================================*/
create index course_type_name_index on course_type
(
   name_
);

/*==============================================================*/
/* Table: detailed_grading_item                                 */
/*==============================================================*/
create table detailed_grading_item
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(5000) comment '名称',
   `spell_`                varchar(5000) comment '名称的全拼',
   `description_`          varchar(10000) comment '规则说明',
   `third_rule_id`         bigint not null comment '三级目录编号',
   `year_`                 bigint not null comment '年份',
   `specialty_id`          bigint not null comment '专业编号',
   `data_source`           varchar(500) comment '数据来源',
   `computing_method`      varchar(500) comment '计算方法',
   `score_`                bigint comment '所占分值',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table detailed_grading_item comment '评分细则';

/*==============================================================*/
/* Index: detailed_grading_item_index                           */
/*==============================================================*/
create unique index detailed_grading_item_index on detailed_grading_item
(
   id_
);

/*==============================================================*/
/* Table: education_program                                     */
/*==============================================================*/
create table education_program
(
   `id_`                           bigint not null auto_increment comment '编号',
   `name_`                         varchar(254) comment '名称',
   `spell_`                        varchar(254) comment '名称的全拼',
   `year_`                         bigint comment '年份',
   `specialty_id`                  bigint not null comment '专业编号',
   `theoretical_teaching_credit`   bigint comment '理论教学学分',
   `practice_teaching_credit`      bigint comment '实践教学学分',
   `brief_introduction`            varchar(10000) comment '简介',
   `attachment_id`                 bigint comment '附件文档',
   `create_by`                     bigint comment '创建用户编号',
   `create_time`                   datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`                     bigint comment '更新用户编号',
   `update_time`                   datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`                       int default 1 comment '排序',
   `remark_`                       varchar(254) comment '备注',
   `enable_`                       tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table education_program comment '培养方案';

/*==============================================================*/
/* Index: education_program_index                               */
/*==============================================================*/
create unique index education_program_index on education_program
(
   id_
);

/*==============================================================*/
/* Index: education_program_name_index                          */
/*==============================================================*/
create index education_program_name_index on education_program
(
   name_
);

/*==============================================================*/
/* Index: education_program_year_index                          */
/*==============================================================*/
create index education_program_year_index on education_program
(
   year_
);

/*==============================================================*/
/* Index: education_program_specialty_index                     */
/*==============================================================*/
create index education_program_specialty_index on education_program
(
   specialty_id
);

/*==============================================================*/
/* Table: employment_situation                                  */
/*==============================================================*/
create table employment_situation
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `student_id`            bigint not null comment '学生编号',
   `time_`                 datetime comment '时间',
   `company_`              varchar(254) comment '企业',
   `orientation_`          varchar(254) comment '方向',
   `status_`               tinyint default true comment 'true：签约，false：毁约',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table employment_situation comment '就业情况';

/*==============================================================*/
/* Index: employment_situation_index                            */
/*==============================================================*/
create unique index employment_situation_index on employment_situation
(
   id_
);

/*==============================================================*/
/* Index: employment_situation_student_index                    */
/*==============================================================*/
create index employment_situation_student_index on employment_situation
(
   student_id
);

/*==============================================================*/
/* Table: equipment                                             */
/*==============================================================*/
create table equipment
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `number_`               bigint comment '台数',
   `specialty_id`          bigint comment '专业编号',
   `price_`                bigint comment '单价',
   `is_nearly_add`         tinyint default false comment '是否近四年新增(true:是, false:否)',
   `use_rate`              float comment '本专业使用比例',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table equipment comment '仪器设备';

/*==============================================================*/
/* Table: examinee_category                                     */
/*==============================================================*/
create table examinee_category
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table examinee_category comment '考生类别';

/*==============================================================*/
/* Index: examinee_category_index                               */
/*==============================================================*/
create unique index examinee_category_index on examinee_category
(
   id_
);

/*==============================================================*/
/* Index: examinee_category_name_index                          */
/*==============================================================*/
create index examinee_category_name_index on examinee_category
(
   name_
);

/*==============================================================*/
/* Table: gender                                                */
/*==============================================================*/
create table gender
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table gender comment '性别';

/*==============================================================*/
/* Index: gender_index                                          */
/*==============================================================*/
create unique index gender_index on gender
(
   id_
);

/*==============================================================*/
/* Index: gender_name_index                                     */
/*==============================================================*/
create index gender_name_index on gender
(
   name_
);

/*==============================================================*/
/* Table: high_school_category                                  */
/*==============================================================*/
create table high_school_category
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table high_school_category comment '高中类别';

/*==============================================================*/
/* Index: high_school_category_index                            */
/*==============================================================*/
create unique index high_school_category_index on high_school_category
(
   id_
);

/*==============================================================*/
/* Index: high_school_category_name_index                       */
/*==============================================================*/
create index high_school_category_name_index on high_school_category
(
   name_
);

/*==============================================================*/
/* Table: judgment                                              */
/*==============================================================*/
create table judgment
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(2000) not null comment '名称',
   `spell_`                varchar(2000) comment '名称的全拼',
   `answer_`               tinyint comment '参考答案',
   `difficult_degree`      bigint comment '难度系数',
   `is_required`           tinyint default false comment '是否必选(true:是, false:否)',
   `section_id`            bigint comment '所属章节',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table judgment comment '判断题';

/*==============================================================*/
/* Index: judgment_index                                        */
/*==============================================================*/
create unique index judgment_index on judgment
(
   id_
);

/*==============================================================*/
/* Index: judgment_difficult_degree_index                       */
/*==============================================================*/
create index judgment_difficult_degree_index on judgment
(
   difficult_degree
);

/*==============================================================*/
/* Index: judgment_is_required_index                            */
/*==============================================================*/
create index judgment_is_required_index on judgment
(
   is_required
);

/*==============================================================*/
/* Index: judgment_section_index                                */
/*==============================================================*/
create index judgment_section_index on judgment
(
   section_id
);

/*==============================================================*/
/* Table: knowledge_point                                       */
/*==============================================================*/
create table knowledge_point
(
   `id_`                          bigint not null auto_increment comment '编号',
   `name_`                        varchar(254) comment '名称',
   `spell_`                       varchar(254) comment '名称的全拼',
   `overview_`                    varchar(10000) comment '知识概述',
   `difficult_degree`             bigint comment '知识难度',
   `parent_knowledge_point_id`    bigint comment '所属父知识点编号',
   `create_by`                    bigint comment '创建用户编号',
   `create_time`                  datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`                    bigint comment '更新用户编号',
   `update_time`                  datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`                      int default 1 comment '排序',
   `remark_`                      varchar(254) comment '备注',
   `enable_`                      tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table knowledge_point comment '知识点';

/*==============================================================*/
/* Index: knowledge_point_index                                  */
/*==============================================================*/
create unique index knowledge_point_index on knowledge_point
(
   id_
);

/*==============================================================*/
/* Index: knowledge_point_name_index                             */
/*==============================================================*/
create index knowledge_point_name_index on knowledge_point
(
   name_
);

/*==============================================================*/
/* Index: knowledge_point_difficult_degree_index                 */
/*==============================================================*/
create index knowledge_point_difficult_degree_index on knowledge_point
(
   difficult_degree
);

/*==============================================================*/
/* Index: knowledge_point_parent_index                           */
/*==============================================================*/
create index knowledge_point_parent_index on knowledge_point
(
   parent_knowledge_point_id
);

/*==============================================================*/
/* Table: multi_select                                          */
/*==============================================================*/
create table multi_select
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(2000) not null comment '名称',
   `spell_`                varchar(2000) comment '名称的全拼',
   `difficult_degree`      bigint comment '难度系数',
   `is_required`           tinyint default false comment '是否必选(true:是, false:否)',
   `section_id`            bigint comment '所属章节',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table multi_select comment '多项选择题';

/*==============================================================*/
/* Index: multi_select_index                                    */
/*==============================================================*/
create unique index multi_select_index on multi_select
(
   id_
);

/*==============================================================*/
/* Index: multi_select_difficult_degree_index                   */
/*==============================================================*/
create index multi_select_difficult_degree_index on multi_select
(
   difficult_degree
);

/*==============================================================*/
/* Index: multi_select_is_required_index                        */
/*==============================================================*/
create index multi_select_is_required_index on multi_select
(
   is_required
);

/*==============================================================*/
/* Index: multi_select_section_index                            */
/*==============================================================*/
create index multi_select_section_index on multi_select
(
   section_id
);

/*==============================================================*/
/* Table: nation                                                */
/*==============================================================*/
create table nation
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table nation comment '民族';

/*==============================================================*/
/* Index: nation_index                                          */
/*==============================================================*/
create unique index nation_index on nation
(
   id_
);

/*==============================================================*/
/* Index: nation_name_index                                     */
/*==============================================================*/
create index nation_name_index on nation
(
   name_
);

/*==============================================================*/
/* Table: owner                                                 */
/*==============================================================*/
create table owner
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `flag_`                 bigint not null default 0 comment '值为0代表学生，1代表教师，2代表学院，3代表学校',
   `student_id`            bigint not null comment '学生',
   `teacher_id`            bigint not null comment '教师',
   `college_id`            bigint comment '学院编号',
   `school_id`             bigint comment '学校编号',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table owner comment '拥有者';

/*==============================================================*/
/* Index: owner_index                                           */
/*==============================================================*/
create unique index owner_index on owner
(
   id_
);

/*==============================================================*/
/* Index: owner_student_id_index                                */
/*==============================================================*/
create index owner_student_id_index on owner
(
   student_id
);

/*==============================================================*/
/* Index: owner_teacher_index                                   */
/*==============================================================*/
create index owner_teacher_index on owner
(
   teacher_id
);

/*==============================================================*/
/* Index: owner_college_index                                   */
/*==============================================================*/
create index owner_college_index on owner
(
   college_id
);

/*==============================================================*/
/* Index: owner_school_index                                    */
/*==============================================================*/
create index owner_school_index on owner
(
   school_id
);

/*==============================================================*/
/* Table: patent                                                */
/*==============================================================*/
create table patent
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `patent_type_id`        bigint comment '类型编号',
   `patent_no`             varchar(254) comment '专利号',
   `patent_date`           datetime comment '专利申请日',
   `auth_date`             datetime comment '授权公告日',
   `patent_deadline`       datetime comment '截止日期',
   `domain_`               varchar(254) comment '所属技术领域',
   `content_`              varchar(5000) comment '专利简介',
   `attachment_id`         bigint comment '附件文档',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table patent comment '专利';

/*==============================================================*/
/* Index: patent_index                                          */
/*==============================================================*/
create unique index patent_index on patent
(
   id_
);

/*==============================================================*/
/* Index: patent_name_index                                     */
/*==============================================================*/
create index patent_name_index on patent
(
   name_
);

/*==============================================================*/
/* Index: patent_type_index                                     */
/*==============================================================*/
create index patent_type_index on patent
(
   patent_type_id
);

/*==============================================================*/
/* Table: patent_inventor_owner                                 */
/*==============================================================*/
create table patent_inventor_owner
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `patent_no`             bigint not null comment '专利编号',
   `owner_id`              bigint not null comment '拥有者编号',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table patent_inventor_owner comment '专利发明人（设计人）与拥有者关联';

/*==============================================================*/
/* Index: patent_inventor_owner_index                           */
/*==============================================================*/
create unique index patent_inventor_owner_index on patent_inventor_owner
(
   id_
);

/*==============================================================*/
/* Table: patent_type                                           */
/*==============================================================*/
create table patent_type
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table patent_type comment '专利类型';

/*==============================================================*/
/* Index: patent_type_index                                     */
/*==============================================================*/
create unique index patent_type_index on patent_type
(
   id_
);

/*==============================================================*/
/* Index: patent_type_name_index                                */
/*==============================================================*/
create index patent_type_name_index on patent_type
(
   name_
);

/*==============================================================*/
/* Table: project                                               */
/*==============================================================*/
create table project
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `type_id`               bigint comment '类型编号',
   `leader_id`             bigint comment '负责人',
   `field_`                varchar(254) comment '涉及领域',
   `approve_time`          datetime comment '批准时间：年',
   `start_time`            datetime comment '开始时间：年',
   `finish_time`           datetime comment '结束时间：年',
   `duration_`             datetime comment '持续时间：年',
   `funds_`                float comment '经费（万）',
   `status_`               tinyint comment '是否结项',
   `source_`               varchar(254) comment '来源',
   `leader_department`     varchar(254) comment '所属单位',
   `attachment_id`         bigint comment '附件文档',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table project comment '项目';

/*==============================================================*/
/* Index: project_index                                         */
/*==============================================================*/
create unique index project_index on project
(
   id_
);

/*==============================================================*/
/* Index: project_name_index                                    */
/*==============================================================*/
create index project_name_index on project
(
   name_
);

/*==============================================================*/
/* Index: project_type_index                                    */
/*==============================================================*/
create index project_type_index on project
(
   type_id
);

/*==============================================================*/
/* Index: project_leader_index                                  */
/*==============================================================*/
create index project_leader_index on project
(
   leader_id
);

/*==============================================================*/
/* Table: project_owner                                         */
/*==============================================================*/
create table project_owner
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `peoject_id`            bigint not null comment '项目编号',
   `owner_id`              bigint not null comment '拥有者编号',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table project_owner comment '项目与拥有者（主要参与者）关联';

/*==============================================================*/
/* Index: project_owner_peoject_index                           */
/*==============================================================*/
create index project_owner_peoject_index on project_owner
(
   peoject_id
);

/*==============================================================*/
/* Index: project_owner_owner_index                             */
/*==============================================================*/
create index project_owner_owner_index on project_owner
(
   owner_id
);

/*==============================================================*/
/* Table: person                                                */
/*==============================================================*/
create table person
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `is_teacher`            tinyint not null default false comment '值为false代表学生，true代表教师',
   `student_id`            bigint not null comment '学生',
   `teacher_id`            bigint not null comment '教师',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table person comment '人员';

/*==============================================================*/
/* Index: person_index                                          */
/*==============================================================*/
create unique index person_index on person
(
   id_
);

/*==============================================================*/
/* Index: person_student_id_index                               */
/*==============================================================*/
create index person_student_id_index on person
(
   student_id
);

/*==============================================================*/
/* Index: person_teacher_id_index                               */
/*==============================================================*/
create index person_teacher_id_index on person
(
   teacher_id
);

/*==============================================================*/
/* Table: political_status                                      */
/*==============================================================*/
create table political_status
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table political_status comment '政治面貌';

/*==============================================================*/
/* Index: political_status_index                                */
/*==============================================================*/
create unique index political_status_index on political_status
(
   id_
);

/*==============================================================*/
/* Index: political_status_name_index                           */
/*==============================================================*/
create index political_status_name_index on political_status
(
   name_
);

/*==============================================================*/
/* Table: postgraduate_situation                                */
/*==============================================================*/
create table postgraduate_situation
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `student_id`           bigint not null comment '学生编号',
   `time_`                 datetime comment '时间',
   `school_`               varchar(254) comment '学校',
   `specialty_`            varchar(254) comment '专业',
   `is_adjust`            tinyint default true comment 'true：第一志愿，false：调剂',
   `status_`               tinyint default true comment 'true：录取，false：未录取',
   `create_by`             bigint comment '创建用户编号',
   `create_time`          datetime default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`          datetime default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table postgraduate_situation comment '考研情况';

/*==============================================================*/
/* Index: postgraduate_situation_index                          */
/*==============================================================*/
create unique index postgraduate_situation_index on postgraduate_situation
(
   id_
);

/*==============================================================*/
/* Index: postgraduate_situation_student_index                  */
/*==============================================================*/
create index postgraduate_situation_student_index on postgraduate_situation
(
   student_id
);

/*==============================================================*/
/* Table: practice_basement                                     */
/*==============================================================*/
create table practice_basement
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `enterprise_`           varchar(254) comment '依托企业',
   `number_`               bigint comment '实习学生数量',
   `specialty_id`          bigint comment '专业编号',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table practice_basement comment '校外实习基地';

/*==============================================================*/
/* Table: professional_title                                    */
/*==============================================================*/
create table professional_title
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table professional_title comment '职称';

/*==============================================================*/
/* Index: professional_title_index                              */
/*==============================================================*/
create unique index professional_title_index on professional_title
(
   id_
);

/*==============================================================*/
/* Index: professional_title_name_index                         */
/*==============================================================*/
create index professional_title_name_index on professional_title
(
   name_
);

/*==============================================================*/
/* Table: professor                                             */
/*==============================================================*/
create table professor
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `gender_id`             bigint not null comment '性别编号',
   `phone_`                varchar(254) comment '联系电话',
   `email_`                varchar(254) comment '电子邮件',
   `address_`              varchar(1000) comment '家庭住址',
   `employer_Unit`         varchar(254) comment '任职单位',
   `unit_address`          varchar(1000) comment '单位地址',
   `unit_phone`            varchar(254) comment '单位电话',
   `major_field`           varchar(254) comment '专业方向',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table professor comment '专家';

/*==============================================================*/
/* Index: professor_index                                       */
/*==============================================================*/
create unique index professor_index on professor
(
   id_
);

/*==============================================================*/
/* Index: professor_name_index                                  */
/*==============================================================*/
create index professor_name_index on professor
(
   name_
);

/*==============================================================*/
/* Table: program                                               */
/*==============================================================*/
create table program
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(2000) not null comment '名称',
   `spell_`                varchar(2000) comment '名称的全拼',
   `answer_`               text comment '参考答案',
   `difficult_degree`      bigint comment '难度系数',
   `is_required`           tinyint default false comment '是否必选(true:是, false:否)',
   `section_id`            bigint comment '所属章节',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table program comment '编程题';

/*==============================================================*/
/* Index: program_index                                         */
/*==============================================================*/
create unique index program_index on program
(
   id_
);

/*==============================================================*/
/* Index: program_difficult_degree_index                        */
/*==============================================================*/
create index program_difficult_degree_index on program
(
   difficult_degree
);

/*==============================================================*/
/* Index: program_is_required_index                             */
/*==============================================================*/
create index program_is_required_index on program
(
   is_required
);

/*==============================================================*/
/* Index: program_section_index                                 */
/*==============================================================*/
create index program_section_index on program
(
   section_id
);

/*==============================================================*/
/* Table: project_type                                          */
/*==============================================================*/
create table project_type
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `level_`                varchar(254) not null comment '级别：国家级、省级、校级',
   `type_`                 varchar(254) comment '类别：',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table project_type comment '项目类型：科研课题：国家级（科技部课题、国家自然基金课题、国家社科基金课题等）';

/*==============================================================*/
/* Index: project_type_index                                    */
/*==============================================================*/
create unique index project_type_index on project_type
(
   id_
);

/*==============================================================*/
/* Index: project_type_name_index                               */
/*==============================================================*/
create index project_type_name_index on project_type
(
   name_
);

/*==============================================================*/
/* Table: province                                              */
/*==============================================================*/
create table province
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table province comment '省份';

/*==============================================================*/
/* Index: province_index                                        */
/*==============================================================*/
create unique index province_index on province
(
   id_
);

/*==============================================================*/
/* Index: province_name_index                                   */
/*==============================================================*/
create index province_name_index on province
(
   name_
);

/*==============================================================*/
/* Table: publisher                                             */
/*==============================================================*/
create table publisher
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table publisher comment '出版社';

/*==============================================================*/
/* Index: publisher_index                                       */
/*==============================================================*/
create unique index publisher_index on publisher
(
   id_
);

/*==============================================================*/
/* Index: publisher_name_index                                  */
/*==============================================================*/
create index publisher_name_index on publisher
(
   name_
);

/*==============================================================*/
/* Table: question_knowledge_point                              */
/*==============================================================*/
create table question_knowledge_point
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `question_type`         bigint not null default 0 comment '0：单项选择题，1：多项选择题，2：填空题，3：填空题，4：简答题，5：编程题',
   `question_id`           bigint not null comment '题目编号',
   `knowledge_point_id`    bigint not null comment '知识点编号',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table question_knowledge_point comment '题目与知识点关联';

/*==============================================================*/
/* Index: question_knowledge_point_index                        */
/*==============================================================*/
create unique index question_knowledge_point_index on question_knowledge_point
(
   id_
);

/*==============================================================*/
/* Index: question_knowledge_point_question_type_index          */
/*==============================================================*/
create index question_knowledge_point_question_type_index on question_knowledge_point
(
   question_type
);

/*==============================================================*/
/* Index: question_knowledge_point_question_id_index            */
/*==============================================================*/
create index question_knowledge_point_question_id_index on question_knowledge_point
(
   question_id
);

/*==============================================================*/
/* Index: question_knowledge_point_knowledge_point_index         */
/*==============================================================*/
create index question_knowledge_point_knowledge_point_index on question_knowledge_point
(
   knowledge_point_id
);

/*==============================================================*/
/* Table: reward                                                */
/*==============================================================*/
create table reward
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `certificate_no`        varchar(254) comment '证书编号',
   `award_date`            datetime comment '获奖日期',
   `award_class`           varchar(254),
   `type_id`               bigint comment '类别编号',
   `complete_department`   varchar(254),
   `departments_`          varchar(254) comment '颁奖部门',
   `attachment_id`         bigint comment '附件文档',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table reward comment '奖励';

/*==============================================================*/
/* Index: reward_index                                          */
/*==============================================================*/
create unique index reward_index on reward
(
   id_
);

/*==============================================================*/
/* Index: reward_name_index                                     */
/*==============================================================*/
create index reward_name_index on reward
(
   name_
);

/*==============================================================*/
/* Index: reward_type_index                                     */
/*==============================================================*/
create index reward_type_index on reward
(
   type_id
);

/*==============================================================*/
/* Table: reward_owner                                          */
/*==============================================================*/
create table reward_owner
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `reward_id`             bigint not null comment '奖励编号',
   `owner_id`              bigint not null comment '拥有者编号',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table reward_owner comment '奖励与拥有者（获奖人）关联';

/*==============================================================*/
/* Index: reward_owner_reward_index                             */
/*==============================================================*/
create index reward_owner_reward_index on reward_owner
(
   reward_id
);

/*==============================================================*/
/* Index: reward_owner_owner_index                              */
/*==============================================================*/
create index reward_owner_owner_index on reward_owner
(
   owner_id
);

/*==============================================================*/
/* Table: reward_type                                           */
/*==============================================================*/
create table reward_type
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table reward_type comment '奖励类别：国家自然科学奖、技术发明奖、科技进步奖、教育部高校科研成果奖（科学技术、人文社科）；省政府科技进步奖、技术发明';

/*==============================================================*/
/* Index: reward_type_index                                     */
/*==============================================================*/
create unique index reward_type_index on reward_type
(
   id_
);

/*==============================================================*/
/* Index: reward_type_name_index                                */
/*==============================================================*/
create index reward_type_name_index on reward_type
(
   name_
);

/*==============================================================*/
/* Table: role                                                  */
/*==============================================================*/
create table role
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `description_`          varchar(1000) comment '角色描述',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table role comment '角色';

/*==============================================================*/
/* Index: role_index                                            */
/*==============================================================*/
create unique index role_index on role
(
   id_
);

/*==============================================================*/
/* Index: role_name_index                                       */
/*==============================================================*/
create index role_name_index on role
(
   name_
);

/*==============================================================*/
/* Table: role_authority                                        */
/*==============================================================*/
create table role_authority
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `role_id`               bigint not null comment '角色编号',
   `authority_id`          bigint not null comment '权限编号',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table role_authority comment '角色权限关联';

/*==============================================================*/
/* Index: roleauthority_role_index                              */
/*==============================================================*/
create index roleauthority_role_index on role_authority
(
   role_id
);

/*==============================================================*/
/* Index: roleauthority_authority_index                         */
/*==============================================================*/
create index roleauthority_authority_index on role_authority
(
   authority_id
);

/*==============================================================*/
/* Table: school                                                */
/*==============================================================*/
create table school
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `school_profiles`       varchar(10000) comment '学校概况',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table school comment '学校';

/*==============================================================*/
/* Index: school_index                                          */
/*==============================================================*/
create unique index school_index on school
(
   id_
);

/*==============================================================*/
/* Index: school_name_index                                     */
/*==============================================================*/
create index school_name_index on school
(
   name_
);

/*==============================================================*/
/* Table: second_rule_categories                                */
/*==============================================================*/
create table second_rule_categories
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(5000) not null comment '名称',
   `spell_`                varchar(5000) comment '名称的全拼',
   `top_rule_id`           bigint not null comment '一级目录编号',
   `total_score`           bigint comment '所占分值',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table second_rule_categories comment '评分二级目录';

/*==============================================================*/
/* Index: second_rule_categories_index                          */
/*==============================================================*/
create unique index second_rule_categories_index on second_rule_categories
(
   id_
);

/*==============================================================*/
/* Index: second_rule_categories_toprule_index                  */
/*==============================================================*/
create index second_rule_categories_toprule_index on second_rule_categories
(
   top_rule_id
);

/*==============================================================*/
/* Table: select_options                                        */
/*==============================================================*/
create table select_options
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(2000) not null comment '名称',
   `spell_`                varchar(2000) comment '名称的全拼',
   `question_type`        tinyint default true comment '题目类型(true:单选, false:多选)',
   `question_id`          bigint comment '题目编号',
   `is_answer`            tinyint default false comment '是否为答案(true:是, false:否)',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table select_options comment '选择题选项';

/*==============================================================*/
/* Index: selectoptions_index                                   */
/*==============================================================*/
create unique index selectoptions_index on select_options
(
   id_
);

/*==============================================================*/
/* Index: selectoptions_question_type_index                     */
/*==============================================================*/
create index selectoptions_question_type_index on select_options
(
   question_type
);

/*==============================================================*/
/* Index: selectoptions_question_id_index                       */
/*==============================================================*/
create index selectoptions_question_id_index on select_options
(
   question_id
);

/*==============================================================*/
/* Table: semester                                              */
/*==============================================================*/
create table semester
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `start_date`            datetime not null comment '开始日期',
   `end_date`              datetime not null comment '结束日期',
   `total_Weeks`           bigint comment '总周数',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table semester comment '学期';

/*==============================================================*/
/* Index: semester_index                                        */
/*==============================================================*/
create unique index semester_index on semester
(
   id_
);

/*==============================================================*/
/* Index: semester_name_index                                   */
/*==============================================================*/
create index semester_name_index on semester
(
   name_
);

/*==============================================================*/
/* Table: short_answer_question                                 */
/*==============================================================*/
create table short_answer_question
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(2000) not null comment '名称',
   `spell_`                varchar(2000) comment '名称的全拼',
   `answer_`               varchar(10000) comment '参考答案',
   `difficult_degree`      bigint comment '难度系数',
   `is_required`           tinyint default false comment '是否必选(true:是, false:否)',
   `section_id`            bigint comment '所属章节',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               bigint comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   `create_by`             bigint comment '创建用户编号',
   `update_by`             bigint comment '更新用户编号',
   primary key (id_)
);

alter table short_answer_question comment '简答题';

/*==============================================================*/
/* Index: short_answer_question_index                           */
/*==============================================================*/
create unique index short_answer_question_index on short_answer_question
(
   id_
);

/*==============================================================*/
/* Index: short_answer_question_difficult_degree_index          */
/*==============================================================*/
create index short_answer_question_difficult_degree_index on short_answer_question
(
   difficult_degree
);

/*==============================================================*/
/* Index: short_`answer_`_question_is_required_index               */
/*==============================================================*/
create index short_answer_question_is_required_index on short_answer_question
(
   is_required
);

/*==============================================================*/
/* Index: short_answer_question_section_index                   */
/*==============================================================*/
create index short_answer_question_section_index on short_answer_question
(
   section_id
);

/*==============================================================*/
/* Table: single_select                                         */
/*==============================================================*/
create table single_select
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(2000) not null comment '名称',
   `spell_`                varchar(2000) comment '名称的全拼',
   `difficult_degree`      bigint comment '难度系数',
   `is_required`           tinyint default false comment '是否必选(true:是, false:否)',
   `section_id`            bigint comment '所属章节',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table single_select comment '单项选择题';

/*==============================================================*/
/* Index: single_select_index                                   */
/*==============================================================*/
create unique index single_select_index on single_select
(
   id_
);

/*==============================================================*/
/* Index: single_select_difficult_degree_index                  */
/*==============================================================*/
create index single_select_difficult_degree_index on single_select
(
   difficult_degree
);

/*==============================================================*/
/* Index: single_select_is_required_index                       */
/*==============================================================*/
create index single_select_is_required_index on single_select
(
   is_required
);

/*==============================================================*/
/* Index: single_select_section_index                           */
/*==============================================================*/
create index single_select_section_index on single_select
(
   section_id
);

/*==============================================================*/
/* Table: specialty                                             */
/*==============================================================*/
create table specialty
(
   `id_`                   bigint not null auto_increment comment '编号',
   `major_code`            varchar(254),
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `college_id`            bigint not null comment '学院编号',
   `school_year`           bigint comment '学制',
   `category_`             varchar(254) comment '类别',
   `major_leader_id`       bigint comment '主要负责人编号',
   `introduction_`         varchar(10000) comment '简介',
   `students_number`       bigint comment '在校生人数',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table specialty comment '专业';

/*==============================================================*/
/* Index: specialty_index                                       */
/*==============================================================*/
create unique index specialty_index on specialty
(
   id_
);

/*==============================================================*/
/* Index: specialty_name_index                                  */
/*==============================================================*/
create index specialty_name_index on specialty
(
   name_
);

/*==============================================================*/
/* Index: specialty_college_index                               */
/*==============================================================*/
create index specialty_college_index on specialty
(
   college_id
);

/*==============================================================*/
/* Table: student                                               */
/*==============================================================*/
create table student
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `no_`                   varchar(254) comment '学号',
   `birthdady_`            date comment '出生日期',
   `gender_id`             bigint comment '性别编号',
   `nation_id`             bigint comment '民族编号',
   `political_status_id`   bigint comment '政治面貌编号',
   `college_id`            bigint comment '学院编号',
   `specialty_id`          bigint comment '专业编号',
   `class_own_id`          bigint comment '班级编号',
   `entrance_date`         date comment '入学日期',
   `age_`                  int comment '年龄',
   `idcard_no`             varchar(254) comment '身份证号',
   `phone_`                varchar(254) comment '电话',
   `email_`                varchar(254) comment '电子邮箱',
   `college_enexam_scores` float comment '高考分数',
   `province_id`           bigint comment '省编号',
   `city_id`               bigint comment '市编号',
   `county_id`             bigint comment '县/区编号',
   `town_id`               bigint comment '镇编号',
   `address_`              varchar(254) comment '家庭住址',
   `high_school`           varchar(254) comment '就读高中',
   `high_school_category_id` bigint comment '高中类别编号',
   `postgraduate_info_id`  bigint comment '考研信息编号',
   `head_img_id`           bigint comment '头像',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table student comment '学生';

/*==============================================================*/
/* Index: student_index                                         */
/*==============================================================*/
create unique index student_index on student
(
   id_
);

/*==============================================================*/
/* Index: student_name_index                                    */
/*==============================================================*/
create index student_name_index on student
(
   name_
);

/*==============================================================*/
/* Index: student_no_index                                      */
/*==============================================================*/
create index student_no_index on student
(
   no_
);

/*==============================================================*/
/* Index: student_college_index                                 */
/*==============================================================*/
create index student_college_index on student
(
   college_id
);

/*==============================================================*/
/* Index: student_specialty_index                               */
/*==============================================================*/
create index student_specialty_index on student
(
   specialty_id
);

/*==============================================================*/
/* Index: student_class_index                                   */
/*==============================================================*/
create index student_class_index on student
(
   class_own_id
);

/*==============================================================*/
/* Table: teacher                                               */
/*==============================================================*/
create table teacher
(
   `id_`                    bigint not null comment '编号',
   `job_no`                 varchar(254) comment '工号',
   `name_`                  varchar(254) not null comment '名称',
   `spell_`                 varchar(254) comment '名称的全拼',
   `type_`                 varchar(254) comment '教师类别（幼儿园教师、小学教师、初级中学教师、高级中学教师、中等职业学校教师、中等职业学校实习指导教师、高等学校教师）',
   `college_id`             bigint comment '学院编号',
   `entry_data`             date comment '入职时间',
   `research_area`          varchar(254) comment '研究方向',
   `gender_id`              bigint comment '性别编号',
   `nation_id`              bigint comment '民族编号',
   `political_status_id`    bigint comment '政治面貌编号',
   `certificate_type`       varchar(254) comment '证件类型',
   `certificate_no`         varchar(254) comment '证件号码',
   `birthday_`              date comment '出生年月',
   `administrative_post_id` bigint comment '行政职务编号',
   `professional_title_id`  bigint comment '专业职称编号',
   `is_external`            tinyint comment '是否外聘',
   `terminal_degree`        varchar(254) comment '最终学位',
   `undergraduate_major`    varchar(254) comment '本科专业',
   `gain_time_of_terminal_degree` date comment '最终学位获取时间',
   `gain_time_of_Undergraduate`   date comment '本科专业学位获取时间',
   `bachelor_degree`        varchar(254) comment '本科学位：哲学、经济学、法学、教育学、文学、历史学、理学、工学、农学、医学、管理学、艺术学、军事学',
   `is_master_tutor`        tinyint default false comment '是否硕士导师(true:是, false:否)',
   `is_study_abroad`        tinyint default false comment '是否海外留学(true:是, false:否)',
   `is_academician`         tinyint default false comment '是否院士(true:是, false:否)',
   `is_changjiang_scholar`  tinyint default false comment '是否长江学者(true:是, false:否)',
   `is_tOYP`                tinyint default false comment '是否杰青(true:是, false:否)',
   `is_province_tube_expert` tinyint default false comment '是否省管专家(true:是, false:否)',
   `is_industry_experience`  tinyint default false comment '是否有行业经历(true:是, false:否)',
   `is_practice_train`       tinyint default false comment '是否有实践教学能力培训(true:是, false:否)',
   `other_honorary_title`   varchar(254) comment '其他荣誉称号',
   `phone_`                 varchar(254) comment '电话',
   `email_`                 varchar(254) comment '电子邮箱',
   `individual_resume`      varchar(10000) comment '个人简介',
   `head_img_id`            bigint comment '头像',
   `create_by`              bigint comment '创建用户编号',
   `create_time`            datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`              bigint comment '更新用户编号',
   `update_time`            datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`                int default 1 comment '排序',
   `remark_`                varchar(254) comment '备注',
   `enable_`                tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table teacher comment '教师';

/*==============================================================*/
/* Index: teacher_index                                         */
/*==============================================================*/
create unique index teacher_index on teacher
(
   id_
);

/*==============================================================*/
/* Index: teacher_jobnumber_index                               */
/*==============================================================*/
create index teacher_jobnumber_index on teacher
(
   job_no
);

/*==============================================================*/
/* Index: teacher_name_index                                    */
/*==============================================================*/
create index teacher_name_index on teacher
(
   name_
);

/*==============================================================*/
/* Index: teacher_college_index                                 */
/*==============================================================*/
create index teacher_college_index on teacher
(
   college_id
);

/*==============================================================*/
/* Table: text_book                                             */
/*==============================================================*/
create table text_book
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `chief_editor_id`       bigint comment '主编编号',
   `domain_`               varchar(254) comment '领域',
   `publisher_id`          bigint comment '出版社编号',
   `introduction_`         varchar(5000) comment '简介',
   `ISBN_`                 varchar(254) comment 'ISBN',
   `is_national_plan`      tinyint default false comment '默认：false否，true是',
   `award_situation`       varchar(254) comment '获奖情况',
   `publish_date`          datetime comment '出版日期',
   `attachment_id`         bigint comment '附件文档',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table text_book comment '教材';

/*==============================================================*/
/* Index: text_book_index                                       */
/*==============================================================*/
create unique index text_book_index on text_book
(
   id_
);

/*==============================================================*/
/* Index: text_book_name_index                                  */
/*==============================================================*/
create index text_book_name_index on text_book
(
   name_
);

/*==============================================================*/
/* Index: text_book_chiefEditor_index                           */
/*==============================================================*/
create index text_book_chiefEditor_index on text_book
(
   chief_editor_id
);

/*==============================================================*/
/* Table: text_book_person                                      */
/*==============================================================*/
create table text_book_person
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `text_book_id`          bigint not null comment '教材编号',
   `person_id`             bigint not null comment '人员编号',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table text_book_person comment '教材与人员（副主编）关联';

/*==============================================================*/
/* Index: text_book_person_text_book_index                      */
/*==============================================================*/
create index text_book_person_text_book_index on text_book_person
(
   text_book_id
);

/*==============================================================*/
/* Index: text_book_person_person_index                         */
/*==============================================================*/
create index text_book_person_person_index on text_book_person
(
   person_id
);

/*==============================================================*/
/* Table: thesis                                                */
/*==============================================================*/
create table thesis
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `journal_title`         varchar(254) comment '期刊名称与会议名称二选一',
   `conference_name`       varchar(254) comment '会议名称',
   `publication_year`      datetime not null comment '年份',
   `volume_`               bigint comment '卷',
   `no_`                   bigint comment '期',
   `pages_`                varchar(254) comment '起止页码',
   `type_id`               bigint not null comment '类型编号',
   `accession_number`      varchar(254) comment '索引号',
   `is_research_paper`     tinyint default false comment '(true:是, false:否)',
   `impact_Factor`         float comment '影响因子（可选信息）',
   `attachment_id`         bigint comment '附件文档',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   `recommend_count`       integer,
   primary key (id_)
);

alter table thesis comment '论文';

/*==============================================================*/
/* Index: thesis_index                                          */
/*==============================================================*/
create unique index thesis_index on thesis
(
   id_
);

/*==============================================================*/
/* Index: thesis_name_index                                     */
/*==============================================================*/
create index thesis_name_index on thesis
(
   name_
);

/*==============================================================*/
/* Index: thesis_type_index                                     */
/*==============================================================*/
create index thesis_type_index on thesis
(
   type_id
);

/*==============================================================*/
/* Table: thesis_person                                         */
/*==============================================================*/
create table thesis_person
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `thesis_id`             bigint not null comment '论文编号',
   `person_id`             bigint not null comment '人员编号',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table thesis_person comment '论文与人员（作者）关联';

/*==============================================================*/
/* Index: thesis_person_thesis_index                            */
/*==============================================================*/
create index thesis_person_thesis_index on thesis_person
(
   thesis_id
);

/*==============================================================*/
/* Index: thesis_person_person_index                            */
/*==============================================================*/
create index thesis_person_person_index on thesis_person
(
   person_id
);

/*==============================================================*/
/* Table: thesis_type                                           */
/*==============================================================*/
create table thesis_type
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table thesis_type comment '用以表明论文的类型，比如：普通论文、科技核心、中文核心、ISTP、EI、SCI等';

/*==============================================================*/
/* Index: thesis_type_index                                     */
/*==============================================================*/
create unique index thesis_type_index on thesis_type
(
   id_
);

/*==============================================================*/
/* Index: thesis_type_name_index                                */
/*==============================================================*/
create index thesis_type_name_index on thesis_type
(
   name_
);

/*==============================================================*/
/* Table: Third_rule_categories                                 */
/*==============================================================*/
create table Third_rule_categories
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(5000) not null comment '名称',
   `spell_`                varchar(5000) comment '名称的全拼',
   `second_rule_id`        bigint not null comment '二级目录编号',
   `total_score`           int comment '所占分值',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table Third_rule_categories comment '评分三级目录';

/*==============================================================*/
/* Index: second_rule_categories_index                          */
/*==============================================================*/
create unique index second_rule_categories_index on Third_rule_categories
(
   id_
);

/*==============================================================*/
/* Table: top_rule_categories                                   */
/*==============================================================*/
create table top_rule_categories
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(5000) not null comment '名称',
   `spell_`                varchar(5000) comment '名称的全拼',
   `year_`                 int not null comment '年份',
   `total_score`           int comment '所占分值',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table top_rule_categories comment '评分一级目录';

/*==============================================================*/
/* Index: top_rule_categories_index                             */
/*==============================================================*/
create unique index top_rule_categories_index on top_rule_categories
(
   id_
);

/*==============================================================*/
/* Index: top_rule_categories_year_index                        */
/*==============================================================*/
create index top_rule_categories_year_index on top_rule_categories
(
   year_
);

/*==============================================================*/
/* Table: town                                                  */
/*==============================================================*/
create table town
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `county_id`             bigint not null comment '区县编号',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table town comment '镇';

/*==============================================================*/
/* Index: town_index                                            */
/*==============================================================*/
create unique index town_index on town
(
   id_
);

/*==============================================================*/
/* Index: town_name_index                                       */
/*==============================================================*/
create index town_name_index on town
(
   name_
);

/*==============================================================*/
/* Index: town_county_index                                     */
/*==============================================================*/
create index town_county_index on town
(
   county_id
);

/*==============================================================*/
/* Table: treatises                                             */
/*==============================================================*/
create table treatises
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) not null comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `author_id`             bigint comment '作者编号',
   `domain_`               varchar(254) comment '领域',
   `publisher_id`          bigint comment '出版社编号',
   `introduction_`         varchar(254) comment '简介',
   `ISBN_`                 varchar(254) comment 'ISBN',
   `publish_date`          date comment '出版日期',
   `attachment_id`         bigint comment '附件文档',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table treatises comment '专著';

/*==============================================================*/
/* Index: treatises_index                                       */
/*==============================================================*/
create unique index treatises_index on treatises
(
   id_
);

/*==============================================================*/
/* Index: treatises_name_index                                  */
/*==============================================================*/
create index treatises_name_index on treatises
(
   name_
);

/*==============================================================*/
/* Index: treatises_author_index                                */
/*==============================================================*/
create index treatises_author_index on treatises
(
   author_id
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `source_of_user`        bigint not null default 0 comment '用户来源（0：学生、1：教师、2：专家）',
   `user_entity_id`        bigint not null comment '用户实体编号',
   `login_name`            varchar(254) comment '帐号',
   `password_`             varchar(254) not null comment '密码MD5(密码+盐)',
   `salt_`                 varchar(254) not null comment '盐',
   `head_img_id`           bigint default 0 comment '头像',
   `phone_`                varchar(254) comment '电话',
   `email_`                varchar(254) comment '邮箱',
   `gender_id`             bigint comment '性别',
   `is_locked`             tinyint not null comment '状态(true:正常, false:禁止)',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table user comment '用户';

/*==============================================================*/
/* Index: user_index                                            */
/*==============================================================*/
create unique index user_index on user
(
   id_
);

/*==============================================================*/
/* Index: user_name_index                                       */
/*==============================================================*/
create index user_name_index on user
(
   name_
);

/*==============================================================*/
/* Index: user_userName_index                                   */
/*==============================================================*/
create index user_userName_index on user
(
   login_name
);

/*==============================================================*/
/* Index: user_entity_index                                     */
/*==============================================================*/
create index user_entity_index on user
(
   user_entity_id
);

/*==============================================================*/
/* Table: user_role                                             */
/*==============================================================*/
create table user_role
(
   `id_`                   bigint not null auto_increment comment '编号',
   `name_`                 varchar(254) comment '名称',
   `spell_`                varchar(254) comment '名称的全拼',
   `user_id`               bigint not null comment '用户编号',
   `role_id`               bigint not null comment '角色编号',
   `create_by`             bigint comment '创建用户编号',
   `create_time`           datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   `update_by`             bigint comment '更新用户编号',
   `update_time`           datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   `sort_no`               int default 1 comment '排序',
   `remark_`               varchar(254) comment '备注',
   `enable_`               tinyint default 1 comment '是否可用(true:是, false:否)',
   primary key (id_)
);

alter table user_role comment '用户角色关联';

/*==============================================================*/
/* Index: user_role_user_index                                  */
/*==============================================================*/
create index user_role_user_index on user_role
(
   user_id
);

/*==============================================================*/
/* Index: user_role_role_index                                  */
/*==============================================================*/
create index user_role_role_index on user_role
(
   role_id
);

alter table answer_for_completion add constraint fk_answer_for_completion_completion_reference foreign key (completion_id)
      references completion (id_) on delete cascade on update cascade;

alter table attachment add constraint fk_attachment_createByuser_reference foreign key (create_by)
      references user (id_) on delete cascade on update cascade;

alter table attachment_type add constraint fk_attachment_type_createByuser_reference foreign key (create_by)
      references user (id_) on delete cascade on update cascade;

alter table attachment_type add constraint fk_attachment_type_UpdateByuser_reference foreign key (update_by)
      references user (id_) on delete cascade on update cascade;

alter table attachment add constraint fk_attachment_type_reference foreign key (type_id)
      references attachment_type (id_) on delete cascade on update cascade;

alter table attachment add constraint fk_attachment_UpdateByuser_reference foreign key (update_by)
      references user (id_) on delete restrict on update restrict;


alter table authority add constraint fk_authority_createByuser_reference foreign key (create_by)
      references user (id_) on delete cascade on update cascade;

alter table authority add constraint fk_authority_UpdateByuser_reference foreign key (update_by)
      references user (id_) on delete cascade on update cascade;

alter table book_resource add constraint fk_book_resource_createByuser_reference foreign key (create_by)
      references user (id_) on delete cascade on update cascade;

alter table book_resource add constraint fk_book_resource_publisher_reference foreign key (publisher_id)
      references publisher (id_) on delete restrict on update restrict;

alter table book_resource add constraint fk_book_resource_specialty_reference foreign key (specialty_id)
      references specialty (id_) on delete restrict on update restrict;

alter table book_resource add constraint fk_book_resource_UpdateByuser_reference foreign key (update_by)
      references user (id_) on delete cascade on update cascade;

alter table CEE_annual_score add constraint fk_cEEAnnual_score_batch_reference foreign key (batch_id)
      references batch (id_) on delete cascade on update cascade;

alter table CEE_annual_score add constraint fk_cEEAnnual_score_examinee_category_reference foreign key (category_id)
      references examinee_category (id_) on delete cascade on update cascade;

alter table CEE_annual_score add constraint fk_cEEAnnual_score_province_reference foreign key (province_id)
      references province (id_) on delete cascade on update cascade;

alter table certificate add constraint fk_certificate_owner_reference foreign key (owner_id)
      references owner (id_) on delete restrict on update restrict;

alter table chapter_and_sections add constraint fk_chapter_and_sections_course_reference foreign key (course_id)
      references course (id_) on delete cascade on update cascade;

alter table city add constraint fk_city_province_reference foreign key (province_id)
      references province (id_) on delete cascade on update cascade;

alter table class add constraint fk_class_teacher_reference foreign key (adviser_id)
      references teacher (id_) on delete set null on update cascade;

alter table class add constraint fk_monitorstudent_class_reference foreign key (monitor_id)
      references student (id_) on delete set null on update cascade;

alter table class add constraint fk_secretarystudent_class_reference foreign key (secretary_id)
      references student (id_) on delete set null on update cascade;

alter table class add constraint fk_specialty_class_reference foreign key (specialty_id)
      references specialty (id_) on delete cascade on update cascade;

alter table college add constraint fk_school_college_reference foreign key (school_id)
      references school (id_) on delete cascade on update cascade;

alter table completion add constraint fk_completion_chapter_and_sections_reference foreign key (section_id)
      references chapter_and_sections (id_) on delete cascade on update cascade;

alter table content add constraint fk_content_createByuser_reference foreign key (create_by)
      references user (id_) on delete cascade on update cascade;

alter table content add constraint fk_content_professor_reference foreign key (professor_id)
      references professor (id_) on delete restrict on update restrict;

alter table content add constraint fk_content_UpdateByuser_reference foreign key (update_by)
      references user (id_) on delete cascade on update cascade;

alter table content_detailed_grading_item add constraint fk_content_detailed_grading_item_content_reference foreign key (content_id)
      references content (id_) on delete restrict on update restrict;

alter table content_detailed_grading_item add constraint fk_content_detailed_grading_item_createByuser_reference foreign key (create_by)
      references user (id_) on delete cascade on update cascade;

alter table content_detailed_grading_item add constraint fk_content_detailed_grading_item_detailed_grading_item_reference foreign key (detailed_grading_item_id)
      references detailed_grading_item (id_) on delete restrict on update restrict;

alter table content_detailed_grading_item add constraint fk_content_detailed_grading_item_UpdateByuser_reference foreign key (update_by)
      references user (id_) on delete cascade on update cascade;

alter table copyright add constraint fk_copyright_attachment_reference foreign key (attachment_id)
      references attachment (id_) on delete cascade on update cascade;

alter table copyright_owner add constraint fk_copyright_owner_copyright_reference foreign key (copyright_no)
      references copyright (id_) on delete cascade on update cascade;

alter table copyright_owner add constraint fk_copyright_owner_owner_reference foreign key (owner_id)
      references owner (id_) on delete cascade on update cascade;

alter table county add constraint fk_city_county_reference foreign key (city_id)
      references city (id_) on delete cascade on update cascade;

alter table course add constraint fk_course_course_type_reference foreign key (type_id)
      references course_type (id_) on delete cascade on update cascade;

alter table course add constraint fk_course_specialty_reference foreign key (specialty_id)
      references specialty (id_) on delete cascade on update cascade;

alter table course_teaching add constraint fk_course_teaching_class_reference foreign key (lecturer_id)
      references class (id_) on delete set null on update cascade;

alter table course_teaching add constraint fk_course_teaching_counselor_reference foreign key (counselor_id)
      references teacher (id_) on delete set null on update cascade;

alter table course_teaching add constraint fk_course_teaching_course_material_reference foreign key (course_material_id)
      references course_material (id_) on delete set null on update cascade;

alter table course_teaching add constraint fk_course_teaching_course_reference foreign key (course_id)
      references course (id_) on delete set null on update cascade;

alter table course_teaching add constraint fk_course_teaching_semester_reference foreign key (semester_id)
      references semester (id_) on delete set null on update cascade;

alter table course_teaching add constraint fk_course_teaching_tutor_reference foreign key (tutor_id)
      references teacher (id_) on delete set null on update cascade;

alter table detailed_grading_item add constraint fk_detailed_grading_item_createByuser_reference foreign key (create_by)
      references user (id_) on delete cascade on update cascade;

alter table detailed_grading_item add constraint fk_detailed_grading_item_third_rule_categories_reference foreign key (third_rule_id)
      references Third_rule_categories (id_) on delete restrict on update restrict;

alter table detailed_grading_item add constraint fk_detailed_grading_item_UpdateByuser_reference foreign key (update_by)
      references user (id_) on delete cascade on update cascade;

alter table education_program add constraint fk_education_program_attachment_reference foreign key (attachment_id)
      references attachment (id_) on delete cascade on update cascade;

alter table education_program add constraint fk_education_program_specialty_reference foreign key (specialty_id)
      references specialty (id_) on delete cascade on update cascade;

alter table employment_situation add constraint fk_employment_situation_student_reference foreign key (student_id)
      references student (id_) on delete cascade on update cascade;

alter table equipment add constraint fk_equipment_createByuser_reference foreign key (create_by)
      references user (id_) on delete cascade on update cascade;

alter table equipment add constraint fk_equipment_specialty_reference foreign key (specialty_id)
      references specialty (id_) on delete restrict on update restrict;

alter table equipment add constraint fk_equipment_UpdateByuser_reference foreign key (update_by)
      references user (id_) on delete cascade on update cascade;

alter table judgment add constraint fk_judgment_chapter_and_sections_reference foreign key (section_id)
      references chapter_and_sections (id_) on delete cascade on update cascade;

alter table multi_select add constraint fk_multi_select_chapter_and_sections_reference foreign key (section_id)
      references chapter_and_sections (id_) on delete cascade on update cascade;

alter table owner add constraint fk_owner_college_reference foreign key (college_id)
      references college (id_) on delete cascade on update cascade;

alter table owner add constraint fk_owner_school_reference foreign key (school_id)
      references school (id_) on delete cascade on update cascade;

alter table owner add constraint fk_owner_student_reference foreign key (student_id)
      references student (id_) on delete cascade on update cascade;

alter table owner add constraint fk_owner_teacher_reference foreign key (teacher_id)
      references teacher (id_) on delete cascade on update cascade;

alter table patent add constraint fk_patent_attachment_reference foreign key (attachment_id)
      references attachment (id_) on delete cascade on update cascade;

alter table patent add constraint fk_patent_patent_type_reference foreign key (patent_type_id)
      references patent_type (id_) on delete cascade on update cascade;

alter table patent_inventor_owner add constraint fk_patent_inventor_owner_owner_reference foreign key (owner_id)
      references owner (id_) on delete cascade on update cascade;

alter table patent_inventor_owner add constraint fk_patent_inventor_owner_patent_reference foreign key (patent_no)
      references patent (id_) on delete cascade on update cascade;

alter table project add constraint fk_peoject_owner_reference foreign key (leader_id)
      references owner (id_) on delete cascade on update cascade;

alter table project add constraint fk_peoject_peojectType_reference foreign key (type_id)
      references project_type (id_) on delete cascade on update cascade;

alter table project add constraint fk_project_attachment_reference foreign key (attachment_id)
      references attachment (id_) on delete cascade on update cascade;

alter table project_owner add constraint fk_peoject_owner_owner_reference foreign key (owner_id)
      references owner (id_) on delete cascade on update cascade;

alter table project_owner add constraint fk_peoject_owner_peoject_reference foreign key (peoject_id)
      references project (id_) on delete cascade on update cascade;

alter table person add constraint fk_person_student_reference foreign key (student_id)
      references student (id_) on delete cascade on update cascade;

alter table person add constraint fk_person_teacher_reference foreign key (teacher_id)
      references teacher (id_) on delete cascade on update cascade;

alter table postgraduate_situation add constraint fk_postgraduate_situation_student_reference foreign key (student_id)
      references student (id_) on delete cascade on update cascade;

alter table practice_basement add constraint fk_practice_basement_createByuser_reference foreign key (create_by)
      references user (id_) on delete cascade on update cascade;

alter table practice_basement add constraint fk_practice_basement_specialty_reference foreign key (specialty_id)
      references specialty (id_) on delete restrict on update restrict;

alter table practice_basement add constraint fk_practice_basement_UpdateByuser_reference foreign key (update_by)
      references user (id_) on delete cascade on update cascade;

alter table professor add constraint fk_professor_createByuser_reference foreign key (create_by)
      references user (id_) on delete cascade on update cascade;

alter table professor add constraint fk_professor_gender_reference foreign key (gender_id)
      references gender (id_) on delete cascade on update cascade;

alter table professor add constraint fk_professor_UpdateByuser_reference foreign key (update_by)
      references user (id_) on delete cascade on update cascade;

alter table program add constraint fk_program_chapter_and_sections_reference foreign key (section_id)
      references chapter_and_sections (id_) on delete cascade on update cascade;

alter table question_knowledge_point add constraint fk_question_and_knowledge_point_reference foreign key (knowledge_point_id)
      references knowledge_point (id_) on delete cascade on update cascade;

alter table reward add constraint fk_reward_attachment_reference foreign key (attachment_id)
      references attachment (id_) on delete cascade on update cascade;

alter table reward add constraint fk_reward_reward_type_reference foreign key (type_id)
      references reward_type (id_) on delete cascade on update cascade;

alter table reward_owner add constraint fk_reward_owner_owner_reference foreign key (owner_id)
      references owner (id_) on delete cascade on update cascade;

alter table reward_owner add constraint fk_reward_owner_reward_reference foreign key (reward_id)
      references reward (id_) on delete cascade on update cascade;

alter table role add constraint fk_role_createByuser_reference foreign key (create_by)
      references user (id_) on delete cascade on update cascade;

alter table role add constraint fk_role_UpdateByuser_reference foreign key (update_by)
      references user (id_) on delete cascade on update cascade;

alter table role_authority add constraint fk_roleauthority_authority_reference foreign key (authority_id)
      references authority (id_) on delete cascade on update cascade;

alter table role_authority add constraint fk_roleauthority_role_reference foreign key (role_id)
      references role (id_) on delete cascade on update cascade;

alter table role_authority add constraint fk_role_authority_createByuser_reference foreign key (create_by)
      references user (id_) on delete cascade on update cascade;

alter table role_authority add constraint fk_role_authority_UpdateByuser_reference foreign key (update_by)
      references user (id_) on delete cascade on update cascade;

alter table second_rule_categories add constraint fk_secondrule_toprule_reference foreign key (top_rule_id)
      references top_rule_categories (id_) on delete cascade on update cascade;

alter table second_rule_categories add constraint fk_second_rule_categories_createByuser_reference foreign key (create_by)
      references user (id_) on delete cascade on update cascade;

alter table second_rule_categories add constraint fk_second_rule_categories_UpdateByuser_reference foreign key (update_by)
      references user (id_) on delete cascade on update cascade;

alter table short_answer_question add constraint fk_short_answer_question_chapter_and_sections_reference foreign key (section_id)
      references chapter_and_sections (id_) on delete cascade on update cascade;

alter table single_select add constraint fk_single_select_chapter_and_sections_reference foreign key (section_id)
      references chapter_and_sections (id_) on delete cascade on update cascade;

alter table specialty add constraint fk_college_specialty_reference foreign key (college_id)
      references college (id_) on delete cascade on update cascade;

alter table specialty add constraint fk_specialtyteacher_reference foreign key (major_leader_id)
      references teacher (id_) on delete set null on update cascade;

alter table student add constraint fk_student_attachment_reference foreign key (head_img_id)
      references attachment (id_) on delete cascade on update cascade;

alter table student add constraint fk_student_city_reference foreign key (city_id)
      references city (id_) on delete set null on update cascade;

alter table student add constraint fk_student_class_reference foreign key (class_own_id)
      references class (id_) on delete set null on update cascade;

alter table student add constraint fk_student_college_reference foreign key (college_id)
      references college (id_) on delete cascade on update cascade;

alter table student add constraint fk_student_county_reference foreign key (county_id)
      references county (id_) on delete set null on update cascade;

alter table student add constraint fk_student_gender_reference foreign key (gender_id)
      references gender (id_) on delete set null on update cascade;

alter table student add constraint fk_student_high_school_category_reference foreign key (id_)
      references high_school_category (id_) on delete restrict on update restrict;

alter table student add constraint fk_student_nation_reference foreign key (nation_id)
      references nation (id_) on delete set null on update cascade;

alter table student add constraint fk_student_political_status_reference foreign key (political_status_id)
      references political_status (id_) on delete set null on update cascade;

alter table student add constraint fk_student_province_reference foreign key (province_id)
      references province (id_) on delete set null on update cascade;

alter table student add constraint fk_student_specialty_reference foreign key (specialty_id)
      references specialty (id_) on delete cascade on update cascade;

alter table student add constraint fk_student_town_reference foreign key (town_id)
      references town (id_) on delete set null on update cascade;

alter table teacher add constraint fk_teacher_administrative_post_reference foreign key (administrative_post_id)
      references administrative_post (id_) on delete set null on update cascade;

alter table teacher add constraint fk_teacher_attachment_reference foreign key (head_img_id)
      references attachment (id_) on delete cascade on update cascade;

alter table teacher add constraint fk_teacher_college_reference foreign key (college_id)
      references college (id_) on delete cascade on update cascade;

alter table teacher add constraint fk_teacher_gender_reference foreign key (gender_id)
      references gender (id_) on delete set null on update cascade;

alter table teacher add constraint fk_teacher_nation_reference foreign key (nation_id)
      references nation (id_) on delete set null on update cascade;

alter table teacher add constraint fk_teacher_political_status_reference foreign key (political_status_id)
      references political_status (id_) on delete set null on update cascade;

alter table teacher add constraint fk_teacher_professional_title_reference foreign key (professional_title_id)
      references professional_title (id_) on delete set null on update cascade;

alter table text_book add constraint fk_text_book_attachment_reference foreign key (attachment_id)
      references attachment (id_) on delete cascade on update cascade;

alter table text_book add constraint fk_text_book_person_reference foreign key (chief_editor_id)
      references person (id_) on delete cascade on update cascade;

alter table text_book add constraint fk_text_book_publisher_reference foreign key (publisher_id)
      references publisher (id_) on delete cascade on update cascade;

alter table text_book_person add constraint fk_text_book_person_person_reference foreign key (person_id)
      references person (id_) on delete cascade on update cascade;

alter table text_book_person add constraint fk_text_book_person_text_book_reference foreign key (text_book_id)
      references text_book (id_) on delete cascade on update cascade;

alter table thesis add constraint fk_thesis_attachment_reference foreign key (attachment_id)
      references attachment (id_) on delete cascade on update cascade;

alter table thesis add constraint fk_thesis_thesis_type_reference foreign key (type_id)
      references thesis_type (id_) on delete cascade on update cascade;

alter table thesis_person add constraint fk_thesis_person_person_reference foreign key (person_id)
      references person (id_) on delete cascade on update cascade;

alter table thesis_person add constraint fk_thesis_person_thesis_reference foreign key (thesis_id)
      references thesis (id_) on delete cascade on update cascade;

alter table Third_rule_categories add constraint fk_thirdrule_secondrule_reference foreign key (second_rule_id)
      references second_rule_categories (id_) on delete restrict on update restrict;

alter table Third_rule_categories add constraint fk_third_rule_categories_createByuser_reference foreign key (create_by)
      references user (id_) on delete cascade on update cascade;

alter table Third_rule_categories add constraint fk_third_rule_categories_UpdateByuser_reference foreign key (update_by)
      references user (id_) on delete cascade on update cascade;

alter table top_rule_categories add constraint fk_top_rule_categories_createByuser_reference foreign key (create_by)
      references user (id_) on delete cascade on update cascade;

alter table top_rule_categories add constraint fk_top_rule_categories_UpdateByuser_reference foreign key (update_by)
      references user (id_) on delete cascade on update cascade;

alter table town add constraint fk_town_county_reference foreign key (county_id)
      references county (id_) on delete cascade on update cascade;

alter table treatises add constraint fk_treatises_attachment_reference foreign key (attachment_id)
      references attachment (id_) on delete cascade on update cascade;

alter table treatises add constraint fk_treatises_publisher_reference foreign key (publisher_id)
      references publisher (id_) on delete cascade on update cascade;

alter table treatises add constraint fk_treatises_teacher_reference foreign key (author_id)
      references teacher (id_) on delete cascade on update cascade;

alter table user add constraint fk_userHeadImg_attachment_reference foreign key (head_img_id)
      references attachment (id_) on delete cascade on update cascade;

alter table user add constraint fk_user_professor_reference foreign key (source_of_user)
      references professor (id_) on delete restrict on update restrict;

alter table user add constraint fk_user_student_reference foreign key (source_of_user)
      references student (id_) on delete restrict on update restrict;

alter table user add constraint fk_user_teacher_reference foreign key (source_of_user)
      references teacher (id_) on delete restrict on update restrict;

alter table user_role add constraint fk_user_role_createByuser_reference foreign key (create_by)
      references user (id_) on delete cascade on update cascade;

alter table user_role add constraint fk_user_role_role_reference foreign key (role_id)
      references role (id_) on delete cascade on update cascade;

alter table user_role add constraint fk_user_role_UpdateByuser_reference foreign key (update_by)
      references user (id_) on delete cascade on update cascade;

alter table user_role add constraint fk_user_role_user_reference foreign key (user_id)
      references user (id_) on delete cascade on update cascade;
      
commit; 