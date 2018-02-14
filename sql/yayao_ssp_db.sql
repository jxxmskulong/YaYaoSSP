# 数据库 
#创建数据库
DROP DATABASE IF EXISTS yayao_ssp_db;
CREATE DATABASE yayao_ssp_db;

#使用数据库 
use yayao_ssp_db;

#创建角色表
CREATE TABLE role_tb(
role_id int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
name varchar(255) COMMENT '角色名',
duty varchar(255) COMMENT '角色职责',
update_date datetime COMMENT '更新时间',
PRIMARY KEY (role_id)
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='角色表';

#创建账户表 
CREATE TABLE account_tb(
account_id int(11) NOT NULL AUTO_INCREMENT COMMENT '账户id',
nickname varchar(255) COMMENT '昵称',
icon varchar(255) COMMENT '图像',
scale decimal(11,2) DEFAULT 0 COMMENT '合伙人收益比例',
sex tinyint(4) DEFAULT 0 COMMENT '性别,默认为0未知，为1男性，为2女性',
country varchar(255) COMMENT '国家',
province varchar(255) COMMENT '省',
city varchar(255) COMMENT '城市',
realname varchar(255) COMMENT '真实姓名',
phone varchar(255) COMMENT '电话',
email varchar(255) COMMENT 'email',
password varchar(255) COMMENT '密码',
identity_cards varchar(255) COMMENT '身份证',
qq varchar(255) COMMENT 'QQ',
wechat varchar(255) COMMENT '微信号',
microblog varchar(255) COMMENT '微博',
alipay varchar(255) COMMENT '支付宝账号',
create_date datetime COMMENT '创建时间',
login_date datetime COMMENT '登陆时间',
status tinyint DEFAULT 0 COMMENT '状态，默认0正常，1锁定，2，异常',
role_id int(11) COMMENT '角色id外键',
role_name varchar(255) COMMENT '角色名',
PRIMARY KEY (account_id)
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='账户表';

#创建财务表 
CREATE TABLE finance_tb(
finance_id int(11) NOT NULL AUTO_INCREMENT COMMENT '财务id',
money decimal(11,2) DEFAULT 0 COMMENT '余额',
recharge decimal(11,2) DEFAULT 0 COMMENT '充值金额',
consume decimal(11,2) DEFAULT 0 COMMENT '消费金额',
withdrawals decimal(11,2) DEFAULT 0 COMMENT '提现金额',
self_profit decimal(11,2) DEFAULT 0 COMMENT '自身总收益',
base_profit decimal(11,2) DEFAULT 0 COMMENT '赠送金钱',
bank_user_name varchar(255) COMMENT '开户人',
bank_name varchar(255) COMMENT '开户银行',
bank_account varchar(255) COMMENT '银行账号',
bank_address varchar(255) COMMENT '开户银行地址',
update_date datetime COMMENT '更新时间',
account_id int(11) COMMENT '账户id外键',
PRIMARY KEY (finance_id)
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='财务表';

#创建流水信息表 
CREATE TABLE flow_water_tb(
flow_water_id int(11) NOT NULL AUTO_INCREMENT COMMENT '流水信息id',
name varchar(255) COMMENT '名称',
type tinyint(4) COMMENT '类型',
subtype tinyint(4) COMMENT '子类型',
money decimal(11,2) COMMENT '金钱，正为获得，负为失去',
create_date datetime COMMENT '创建时间',
account_id int(11) COMMENT '账户id外键',
PRIMARY KEY (flow_water_id),
INDEX INDEX_ACCOUNTID (account_id) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='流水信息表';

#创建公告表 
CREATE TABLE notice_tb(
notice_id int(11) NOT NULL AUTO_INCREMENT COMMENT '公告id',
title varchar(255) COMMENT '标题',
img_address varchar(255) COMMENT '图片地址',
content longtext COMMENT '内容',
update_date datetime COMMENT '更新日期',
PRIMARY KEY (notice_id)
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='公告表';

#创建广告表 
CREATE TABLE advertise_tb(
advertise_id int(11) NOT NULL AUTO_INCREMENT COMMENT '广告id',
name varchar(255) COMMENT '名称',
platform tinyint(4) COMMENT '投放平台,1js,2android,3ios,4api',
type tinyint(4) COMMENT '类型,0全部，1文学资讯,2影视音乐,3娱乐图片,4网络游戏,5动漫在线,6软件下载,7交友婚介,8聊天论坛,9运动体育,10男性网站,11女性网站,12地域门户,13网站导航,14电子商务,15电脑网络,16教育培训,17休闲旅游,18综合站点,19游戏外挂,20军事站点,100其他'
show_type tinyint(4) COMMENT '显示类型，1悬浮，2信息流，3弹窗',
billing_mode tinyint(4) COMMENT '计费模式,1CPC,2CPM,3CPA',
region tinyint(4) COMMENT '地域0全国,1北京市,2天津市,3上海市,4重庆市,5河北省,6河南省,7云南省,8辽宁省,9黑龙江省,10湖南省,11安徽省,12山东省,13新疆维吾尔,14江苏省,15浙江省,16江西省,17湖北省,18广西壮族,19甘肃省,20山西省,21内蒙古,22陕西省,23吉林省,24福建省,25贵州省,26广东省,27青海省,28西藏,29四川省,30宁夏回族,31海南省,32台湾省,33香港特别行政区,34澳门特别行政区',
title varchar(255) COMMENT '标题',
link varchar(255) COMMENT '链接地址',
unit_price decimal(11,2) COMMENT '单价',
unit_delivery_number int(11) COMMENT '投放次数',
now_unit_delivery_number int(11) COMMENT '消耗的投放次数',
unit_money decimal(11,2) COMMENT '广告金额',
now_unit_money decimal(11,2) COMMENT '消耗的广告金额',
status tinyint(4) COMMENT '广告状态',
start_delivery_date datetime COMMENT '投放开始时间',
end_delivery_date datetime COMMENT '投放结束时间',
create_date datetime COMMENT '创建时间',
update_date datetime COMMENT '更新时间',
account_id int(11) COMMENT '账户id外键',
PRIMARY KEY (advertise_id),
INDEX INDEX_ACCOUNTID (account_id) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='广告表';

#创建广告图片表 
CREATE TABLE advertise_img_tb(
advertise_img_id int(11) NOT NULL AUTO_INCREMENT COMMENT '广告图片id',
img_address varchar(255) COMMENT '图片地址',
number int(11) COMMENT '图片顺序，最多三张',
advertise_id int(11) COMMENT '广告id外键',
PRIMARY KEY (advertise_img_id)
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='广告图片表';

#创建广告日数据表 
CREATE TABLE advertise_daily_data_tb(
advertise_daily_data_id int(11) NOT NULL AUTO_INCREMENT COMMENT '广告日数据id',
pvs bigint(20) COMMENT 'pvs',
uvs bigint(20) COMMENT 'uvs',
ips bigint(20) COMMENT 'ips',
reading_number bigint(20) COMMENT '阅读数',
create_date datetime COMMENT '创建时间',
advertise_id int(11) COMMENT '广告id',
account_id int(11) COMMENT '账户id外键',
PRIMARY KEY (advertise_daily_data_id),
INDEX INDEX_CREATEDATE (create_date) USING BTREE,
INDEX INDEX_ADVERTISEID (advertise_id) USING BTREE,
INDEX INDEX_ACCOUNTID (account_id) USING BTREE,
UNIQUE INDEX INDEX_DAY_DATA (create_date,advertise_id,account_id) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='广告日数据表';

#创建广告数据表 
CREATE TABLE advertise_data_tb(
advertise_data_id int(11) NOT NULL AUTO_INCREMENT COMMENT '广告数据id',
pvs bigint(20) COMMENT 'pvs',
uvs bigint(20) COMMENT 'uvs',
ips bigint(20) COMMENT 'ips',
reading_number bigint(20) COMMENT '阅读数',
create_date datetime COMMENT '创建时间',
advertise_id int(11) COMMENT '广告id',
account_id int(11) COMMENT '账户id外键',
PRIMARY KEY (advertise_data_id),
INDEX INDEX_CREATEDATE (create_date) USING BTREE,
INDEX INDEX_ADVERTISEID (advertise_id) USING BTREE,
INDEX INDEX_ACCOUNTID (account_id) USING BTREE,
UNIQUE INDEX INDEX_TIME_DATA (create_date,advertise_id,account_id) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='广告数据表';

#创建网站表 
CREATE TABLE website_tb(
website_id int(11) NOT NULL AUTO_INCREMENT COMMENT '网站id',
name varchar(255) COMMENT '名称',
type varchar(255) COMMENT '类型',
url varchar(255) COMMENT '网站url',
status varchar(255) COMMENT '网站状态',
remark varchar(255) COMMENT '备注',
update_date datetime COMMENT '更新时间',
account_id int(11) COMMENT '账户id外键',
PRIMARY KEY (website_id),
INDEX INDEX_ACCOUNTID (account_id) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='网站表';

#创建广告位表 
CREATE TABLE advertise_space_tb(
advertise_space_id int(11) NOT NULL AUTO_INCREMENT COMMENT '广告位id',
name varchar(255) COMMENT '名称',
platform tinyint(4) COMMENT '投放平台,1js,2android,3ios,4api',
type tinyint(4) COMMENT '类型,0全部，1文学资讯,2影视音乐,3娱乐图片,4网络游戏,5动漫在线,6软件下载,7交友婚介,8聊天论坛,9运动体育,10男性网站,11女性网站,12地域门户,13网站导航,14电子商务,15电脑网络,16教育培训,17休闲旅游,18综合站点,19游戏外挂,20军事站点,100其他',
show_type tinyint(4) COMMENT '显示类型，1悬浮，2信息流，3弹窗',
billing_mode tinyint(4) COMMENT '计费模式,1CPC,2CPM,3CPA',
region tinyint(4) COMMENT '地域0全国,1北京市,2天津市,3上海市,4重庆市,5河北省,6河南省,7云南省,8辽宁省,9黑龙江省,10湖南省,11安徽省,12山东省,13新疆维吾尔,14江苏省,15浙江省,16江西省,17湖北省,18广西壮族,19甘肃省,20山西省,21内蒙古,22陕西省,23吉林省,24福建省,25贵州省,26广东省,27青海省,28西藏,29四川省,30宁夏回族,31海南省,32台湾省,33香港特别行政区,34澳门特别行政区',
location tinyint(4) COMMENT '广告位置，1顶部，2底部',
unit_price decimal(11,2) COMMENT '单价',
now_unit_delivery_number int(11) COMMENT '获取的点击次数',
now_unit_money decimal(11,2) COMMENT '获取的广告位金额',
status tinyint(4) COMMENT '广告位状态',
update_date datetime COMMENT '更新时间',
account_id int(11) COMMENT '账户id外键',
PRIMARY KEY (advertise_space_id),
INDEX INDEX_ACCOUNTID (account_id) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='广告位表';

#创建广告位日数据表 
CREATE TABLE advertise_space_daily_data_tb(
advertise_space_daily_data_id int(11) NOT NULL AUTO_INCREMENT COMMENT '广告位日数据id',
pvs bigint(20) COMMENT 'pvs',
uvs bigint(20) COMMENT 'uvs',
ips bigint(20) COMMENT 'ips',
reading_number bigint(20) COMMENT '阅读数',
create_date datetime COMMENT '创建时间',
advertise_space_id int(11) COMMENT '广告位id',
account_id int(11) COMMENT '账户id外键',
PRIMARY KEY (advertise_space_daily_data_id),
INDEX INDEX_CREATEDATE (create_date) USING BTREE,
INDEX INDEX_ADVERTISESPACEID (advertise_space_id) USING BTREE,
INDEX INDEX_ACCOUNTID (account_id) USING BTREE,
UNIQUE INDEX INDEX_DAY_DATA (create_date,advertise_space_id,account_id) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='广告位日数据表';

#创建广告位数据表 
CREATE TABLE advertise_space_data_tb(
advertise_space_data_id int(11) NOT NULL AUTO_INCREMENT COMMENT '广告位数据id',
pvs bigint(20) COMMENT 'pvs',
uvs bigint(20) COMMENT 'uvs',
ips bigint(20) COMMENT 'ips',
reading_number bigint(20) COMMENT '阅读数',
create_date datetime COMMENT '创建时间',
advertise_space_id int(11) COMMENT '广告位id',
account_id int(11) COMMENT '账户id外键',
PRIMARY KEY (advertise_space_data_id),
INDEX INDEX_CREATEDATE (create_date) USING BTREE,
INDEX INDEX_ADVERTISESPACEID (advertise_space_id) USING BTREE,
INDEX INDEX_ACCOUNTID (account_id) USING BTREE,
UNIQUE INDEX INDEX_TIME_DATA (create_date,advertise_space_id,account_id) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='广告位数据表';

#创建充值项表 
CREATE TABLE recharge_term_tb(
recharge_term_id int(11) NOT NULL AUTO_INCREMENT COMMENT '充值项id',
title varchar(255) COMMENT '附加标题',
recharge_money decimal(11,2) COMMENT '充值真钱',
give_money decimal(11,2) COMMENT '赠送真钱',
create_date datetime   COMMENT '创建时间',
update_date datetime   COMMENT '更新时间',
status tinyint(4) DEFAULT 0 COMMENT '0下架，默认为1上架',
PRIMARY KEY (recharge_term_id),
INDEX INDEX_CREATEDATE (create_date) USING BTREE,
INDEX INDEX_UPDATEDATE (update_date) USING BTREE,
INDEX INDEX_STATUS (status) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='充值项表 ';

#创建充值记录表 
CREATE TABLE recharge_record_tb(
recharge_record_id int(11) NOT NULL AUTO_INCREMENT COMMENT '充值记录id',
type tinyint(4) COMMENT '充值类型，1支付宝支付，2微信支付，3银联支付',
recharge_money decimal(11,2) DEFAULT 0 COMMENT '充值真钱',
give_money decimal(11,2) DEFAULT 0 COMMENT '赠送真钱',
create_date datetime   COMMENT '创建时间',
update_date datetime   COMMENT '更新时间',
status tinyint(4) DEFAULT 0 COMMENT '默认为1成功，2失败',
account_id int(11) COMMENT '账户id,外键',
PRIMARY KEY (recharge_record_id),
INDEX INDEX_ACCOUNTID (account_id) USING BTREE,
INDEX INDEX_CREATEDATE (create_date) USING BTREE,
INDEX INDEX_UPDATEDATE (update_date) USING BTREE,
INDEX INDEX_STATUS (status) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='充值记录表 ';




#设置初始角色
INSERT IGNORE INTO role_tb (name,duty,update_date) 
VALUES ("超级管理员","超级管理员",now());
INSERT IGNORE INTO role_tb (name,duty,update_date) 
VALUES ("运营管理员","运营管理员",now());
INSERT IGNORE INTO role_tb (name,duty,update_date) 
VALUES ("渠道主","投放广告位",now());
INSERT IGNORE INTO role_tb (name,duty,update_date) 
VALUES ("广告主","推广广告",now());

#设置初始管理员密码MD5加密123456
INSERT IGNORE INTO account_tb (nickname,scale,phone,email,password,create_date,login_date,role_id) 
VALUES ("聂跃",0,"15111336587","278076304@qq.com","11874bb6149dd45428da628c9766b252",now(),now(),"1000"); 
#财务
INSERT IGNORE INTO finance_tb (money,recharge,consume,withdrawals,update_date,account_id) 
VALUES (0,0,0,0,now(),1000);  