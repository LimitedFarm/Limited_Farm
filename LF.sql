DROP TABLE Customer;
DROP TABLE Admin;
DROP TABLE seller;
DROP TABLE PList;
DROP TABLE FAQ;
DROP TABLE Review;
DROP TABLE Notice;
DROP TABLE Answer;
DROP TABLE Question;
DROP TABLE CReportList;
DROP TABLE SReportList;
DROP TABLE dAddress;
DROP TABLE SList;
DROP TABLE Category;
DROP TABLE pAttachment;
DROP TABLE SList;

CREATE TABLE "Customer" (
	"cId"	NUMBER		NOT NULL,
	"userId"	NVARCHAR2(12)		NOT NULL,
	"userPwd"	NVARCHAR2(20)		NOT NULL,
	"address"	NVARCHAR2(50)		NOT NULL,
	"phone"	NUMBER(11)		NOT NULL,
	"email"	NVARCHAR2(50)		NOT NULL,
	"joinDate"	DATE	DEFAULT SYSDATE	NOT NULL,
	"modifyDate"	DATE	DEFAULT SYSDATE	NOT NULL,
	"status"	CHAR DEFAULT 'Y'
);

COMMENT ON COLUMN "Customer"."cId" IS '�������� ���� ȸ����ȣ';

COMMENT ON COLUMN "Customer"."userId" IS 'ȸ�����̵�';

COMMENT ON COLUMN "Customer"."userPwd" IS 'ȸ����й�ȣ';

COMMENT ON COLUMN "Customer"."address" IS 'ȸ�� �ּ�';

COMMENT ON COLUMN "Customer"."phone" IS 'ȸ�� ��ȭ��ȣ';

COMMENT ON COLUMN "Customer"."email" IS 'ȸ�� �̸���';

COMMENT ON COLUMN "Customer"."joinDate" IS 'ȸ����������';

COMMENT ON COLUMN "Customer"."modifyDate" IS '���� ��������';

COMMENT ON COLUMN "Customer"."status" IS 'ȸ�� ��������(Ż��� N)';

CREATE TABLE "Admin" (
	"aId"	NUMBER		NOT NULL,
	"admin_Level"	NUMBER	DEFAULT 1	NOT NULL,
	"cId"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "Admin"."aId" IS '�����ڹ�ȣ';

COMMENT ON COLUMN "Admin"."admin_Level" IS '�����ڱ��� 0 �Ǵ� 1';

COMMENT ON COLUMN "Admin"."cId" IS '�������� ���� ȸ����ȣ';

CREATE TABLE "seller" (
	"sId"	NUMBER		NOT NULL,
	"bStatus"	CHAR(1) CHECK(status in ('Y', 'N'))	DEFAULT N	NOT NULL,
	"bNum"	NUMBER(11)		NOT NULL,
	"cId"	NUMBER		NOT NULL,
	"fId"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "seller"."sId" IS '�Ǹ��� ȸ����ȣ';

COMMENT ON COLUMN "seller"."bStatus" IS '��ǰ�Ǹ� ���� ���ο���';

COMMENT ON COLUMN "seller"."bNum" IS '����� ��ȣ';

COMMENT ON COLUMN "seller"."cId" IS '�������� ���� ȸ����ȣ';

COMMENT ON COLUMN "seller"."fId" IS '���� ��ȣ';

CREATE TABLE "pAttachment" (
	"fId"	NUMBER		NOT NULL,
	"file_name"	NVARCHAR2(20)		NOT NULL,
	"change_name"	NVARCHAR2(100)		NOT NULL,
	"file_path"	NVARCHAR2(100)		NOT NULL,
	"upload_date"	DATE	DEFAULT SYSDATE	NOT NULL,
	"status"	CHAR(1) CHECK(status in ('Y', 'N'))	DEFAULT Y	NOT NULL
);

COMMENT ON COLUMN "pAttachment"."fId" IS '���� ��ȣ';

COMMENT ON COLUMN "pAttachment"."file_name" IS '���� �̸�';

COMMENT ON COLUMN "pAttachment"."change_name" IS '������ ���� �̸�';

COMMENT ON COLUMN "pAttachment"."file_path" IS '���� ���';

COMMENT ON COLUMN "pAttachment"."upload_date" IS '���ε� ��¥';

COMMENT ON COLUMN "pAttachment"."status" IS '���� ���� ����';

CREATE TABLE "PList" (
	"pId"	NUMBER		NOT NULL,
	"sId"	NUMBER		NOT NULL,
	"pName"	NVARCHAR2(20)		NULL,
	"pPrice"	NUMBER		NOT NULL,
	"pCount"	NUMBER		NOT NULL,
	"pAddress"	NVARCHAR2(50)		NOT NULL,
	"pDay"	DATE		NULL,
	"pPreiode"	DATE		NULL,
	"pContent"	NVARCHAR2(500)		NOT NULL,
	"status"	CHAR(1) CHECK(status in ('Y', 'N'))	DEFAULT Y	NOT NULL,
	"fId"	NUMBER		NOT NULL,
	"cateId"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "PList"."pId" IS '��ǰ ��ȣ';

COMMENT ON COLUMN "PList"."sId" IS '�Ǹ��� ȸ����ȣ';

COMMENT ON COLUMN "PList"."pName" IS '��ǰ��';

COMMENT ON COLUMN "PList"."pPrice" IS '��ǰ ����';

COMMENT ON COLUMN "PList"."pCount" IS '��ǰ ���';

COMMENT ON COLUMN "PList"."pAddress" IS '��ǰ ������';

COMMENT ON COLUMN "PList"."pDay" IS '��ǰ ��������';

COMMENT ON COLUMN "PList"."pPreiode" IS '��ǰ �������';

COMMENT ON COLUMN "PList"."pContent" IS '��ǰ����';

COMMENT ON COLUMN "PList"."status" IS '��ǰ �Ǹ� ����';

COMMENT ON COLUMN "PList"."fId" IS '���� ��ȣ';

COMMENT ON COLUMN "PList"."cateId" IS 'ī�װ� ��ȣ';

CREATE TABLE "FAQ" (
	"FAQId"	NUMBER		NOT NULL,
	"FAQTitle"	NVARCHAR2(50)		NULL,
	"FAQContent"	NVARCHAR2(500)		NULL,
	"status"	CHAR(1) CHECK(status in ('Y', 'N'))	DEFAULT Y NULL,
	"aId"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "FAQ"."FAQId" IS 'FAQ��ȣ';

COMMENT ON COLUMN "FAQ"."FAQTitle" IS 'FAQ ����';

COMMENT ON COLUMN "FAQ"."FAQContent" IS 'FAQ ����';

COMMENT ON COLUMN "FAQ"."status" IS 'FAQ ����';

COMMENT ON COLUMN "FAQ"."aId" IS '�����ڹ�ȣ';

CREATE TABLE "Review" (
	"reId"	NUMBER		NOT NULL,
	"reContent"	NVARCHAR2(500)		NOT NULL,
	"grade"	NUMBER	DEFAULT 5	NOT NULL,
	"status"	CHAR(1) CHECK(status in ('Y', 'N'))	DEFAULT Y	NULL,
	"sale_Id"	NUMBER		NOT NULL,
	"cId"	NUMBER		NOT NULL,
	"review_date"	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "Review"."reId" IS '���� ��ȣ';

COMMENT ON COLUMN "Review"."reContent" IS '���䳻��';

COMMENT ON COLUMN "Review"."grade" IS '��ǰ ����';

COMMENT ON COLUMN "Review"."status" IS '���� ����';

COMMENT ON COLUMN "Review"."sale_Id" IS '�Ǹ� ��ȣ';

COMMENT ON COLUMN "Review"."cId" IS '�������� ���� ȸ����ȣ';

COMMENT ON COLUMN "Review"."review_date" IS '���� ��¥';

CREATE TABLE "Notice" (
	"nId"	NUMBER		NOT NULL,
	"nTitle"	NVARCHAR2(20)		NOT NULL,
	"nContent"	NVARCHAR2(500)		NOT NULL,
	"nrgDate"	DATE	DEFAULT SYSDATE	NOT NULL,
	"nmodiDate"	DATE	DEFAULT SYSDATE	NOT NULL,
	"status"	CHAR(1) CHECK(status in ('Y', 'N'))	DEFAULT Y	NOT NULL,
	"aId"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "Notice"."nId" IS '�������� �ε�����ȣ';

COMMENT ON COLUMN "Notice"."nTitle" IS '�������� ����';

COMMENT ON COLUMN "Notice"."nContent" IS '�������� ����';

COMMENT ON COLUMN "Notice"."nrgDate" IS '�������� �ۼ�����';

COMMENT ON COLUMN "Notice"."nmodiDate" IS '�������� ��������';

COMMENT ON COLUMN "Notice"."status" IS '�������� ����, ����� ����';

COMMENT ON COLUMN "Notice"."aId" IS '�����ڹ�ȣ';

CREATE TABLE "CReportList" (
	"noId"	NUMBER		NOT NULL,
	"cId"	NUMBER		NOT NULL,
	"noContent"	NVARCHAR2(500)		NULL,
	"report_date"	DATE	DEFAULT SYSDATE	NOT NULL,
	"status"	CHAR(1) CHECK(status in ('Y', 'N'))	DEFAULT Y	NULL,
	"sale_Id"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "CReportList"."noId" IS '�Ű��ȣ';

COMMENT ON COLUMN "CReportList"."cId" IS '�������� ���� ȸ����ȣ';

COMMENT ON COLUMN "CReportList"."noContent" IS '�Ű���';

COMMENT ON COLUMN "CReportList"."report_date" IS '�Ű� ���� ��¥';

COMMENT ON COLUMN "CReportList"."status" IS '�Ű� ���� ����';

COMMENT ON COLUMN "CReportList"."sale_Id" IS '�Ǹ� ��ȣ';

CREATE TABLE "Answer" (
	"anId"	NUMBER		NOT NULL,
	"anContent"	NVARCHAR2(500)		NULL,
	"answer_date"	DATE	DEFAULT SYSDATE	NOT NULL,
	"status"	CHAR(1) CHECK(status in ('Y', 'N'))	DEFAULT Y	NOT NULL,
	"aId"	NUMBER		NOT NULL,
	"qId"	NUMBER		NOT NULL,
	"cId"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "Answer"."anId" IS '�亯��ȣ';

COMMENT ON COLUMN "Answer"."anContent" IS '�亯����';

COMMENT ON COLUMN "Answer"."answer_date" IS '�亯 ��¥';

COMMENT ON COLUMN "Answer"."status" IS '�亯 ����';

COMMENT ON COLUMN "Answer"."aId" IS '�����ڹ�ȣ';

COMMENT ON COLUMN "Answer"."qId" IS '���ǹ�ȣ';

COMMENT ON COLUMN "Answer"."cId" IS '�������� ���� ȸ����ȣ';

CREATE TABLE "SList" (
	"sale_Id"	NUMBER		NOT NULL,
	"status"	CHAR(1) CHECK(status in ('Y', 'N'))	DEFAULT Y	NOT NULL,
	"sale_date"	DATE	DEFAULT SYSDATE	NOT NULL,
	"sCount"	VARCHAR(255)		NOT NULL,
	"pId"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "SList"."sale_Id" IS '�Ǹ� ��ȣ';

COMMENT ON COLUMN "SList"."status" IS '�Ǹ� ����';

COMMENT ON COLUMN "SList"."sale_date" IS '�Ǹ� ��¥';

COMMENT ON COLUMN "SList"."sCount" IS '�Ǹ� ��ǰ ����';

COMMENT ON COLUMN "SList"."pId" IS '��ǰ ��ȣ';



CREATE TABLE "dAddress" (
	"daId"	NUMBER		NOT NULL,
	"cId"	NUMBER		NOT NULL,
	"daName"	NVARCHAR2(50)		NOT NULL,
	"daAddress"	NVARCHAR2(50)		NOT NULL,
	"status"	CHAR(1) CHECK(status in ('Y', 'N'))	DEFAULT Y	NULL
);

COMMENT ON COLUMN "dAddress"."daId" IS '����� ��ȣ';

COMMENT ON COLUMN "dAddress"."cId" IS '�������� ���� ȸ����ȣ';

COMMENT ON COLUMN "dAddress"."daName" IS '�������';

COMMENT ON COLUMN "dAddress"."daAddress" IS '����� �ּ�';

COMMENT ON COLUMN "dAddress"."status" IS '����� ��� ����';

CREATE TABLE "Category" (
	"cateId"	NUMBER		NOT NULL,
	"category"	NVARCHAR2(50)		NOT NULL
);

COMMENT ON COLUMN "Category"."cateId" IS 'ī�װ� ��ȣ';

COMMENT ON COLUMN "Category"."category" IS 'ī�װ� �̸�';





CREATE TABLE "SReportList" (
	"noId"	NUMBER		NOT NULL,
	"reId"	NUMBER		NOT NULL,
	"noContent"	NVARCHAR2(500)		NULL,
	"report_date"	DATE	DEFAULT SYSDATE	NOT NULL,
	"status"	CHAR(1) CHECK(status in ('Y', 'N'))	DEFAULT Y	NOT NULL,
	"sale_Id"	NUMBER		NOT NULL,
	"sId"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "SReportList"."noId" IS '�Ű��ȣ';

COMMENT ON COLUMN "SReportList"."reId" IS '���� ��ȣ';

COMMENT ON COLUMN "SReportList"."noContent" IS '�Ű���';

COMMENT ON COLUMN "SReportList"."report_date" IS '�Ű� ��¥';

COMMENT ON COLUMN "SReportList"."status" IS '�Ǹ��� �Ű� ����';

COMMENT ON COLUMN "SReportList"."sale_Id" IS '�Ǹ� ��ȣ';

COMMENT ON COLUMN "SReportList"."sId" IS '�Ǹ��� ȸ����ȣ';

CREATE TABLE "Question" (
	"qId"	NUMBER		NOT NULL,
	"cId"	NUMBER		NOT NULL,
	"qTitle"	NVARCHAR2(50)		NOT NULL,
	"qContent"	NVARCHAR2(500)		NULL,
	"question_date"	DATE	DEFAULT SYSDATE	NOT NULL,
	"status"	CHAR(1) CHECK(status in ('Y', 'N'))	DEFAULT Y	NOT NULL
);

COMMENT ON COLUMN "Question"."qId" IS '���ǹ�ȣ';

COMMENT ON COLUMN "Question"."cId" IS '�������� ���� ȸ����ȣ';

COMMENT ON COLUMN "Question"."qTitle" IS '��������';

COMMENT ON COLUMN "Question"."qContent" IS '���ǳ���';

COMMENT ON COLUMN "Question"."question_date" IS '���� ��¥';

COMMENT ON COLUMN "Question"."status" IS '���� ����';

ALTER TABLE "FAQ" ADD CONSTRAINT "PK_FAQ" PRIMARY KEY (
	"FAQId"
);

ALTER TABLE "Review" ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY (
	"reId"
);

ALTER TABLE "seller" ADD CONSTRAINT "PK_SELLER" PRIMARY KEY (
	"sId"
);

ALTER TABLE "Notice" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY (
	"nId"
);

ALTER TABLE "CReportList" ADD CONSTRAINT "PK_CREPORTLIST" PRIMARY KEY (
	"noId",
	"cId"
);

ALTER TABLE "PList" ADD CONSTRAINT "PK_PLIST" PRIMARY KEY (
	"pId",
	"sId"
);

ALTER TABLE "Answer" ADD CONSTRAINT "PK_ANSWER" PRIMARY KEY (
	"anId"
);

ALTER TABLE "SList" ADD CONSTRAINT "PK_SLIST" PRIMARY KEY (
	"sale_Id"
);

ALTER TABLE "Customer" ADD CONSTRAINT "PK_CUSTOMER" PRIMARY KEY (
	"cId"
);

ALTER TABLE "dAddress" ADD CONSTRAINT "PK_DADDRESS" PRIMARY KEY (
	"daId",
	"cId"
);

ALTER TABLE "Category" ADD CONSTRAINT "PK_CATEGORY" PRIMARY KEY (
	"cateId"
);

ALTER TABLE "pAttachment" ADD CONSTRAINT "PK_PATTACHMENT" PRIMARY KEY (
	"fId"
);

ALTER TABLE "Admin" ADD CONSTRAINT "PK_ADMIN" PRIMARY KEY (
	"aId"
);

ALTER TABLE "SReportList" ADD CONSTRAINT "PK_SREPORTLIST" PRIMARY KEY (
	"noId",
	"reId"
);

ALTER TABLE "Question" ADD CONSTRAINT "PK_QUESTION" PRIMARY KEY (
	"qId",
	"cId"
);

ALTER TABLE "CReportList" ADD CONSTRAINT "FK_Customer_TO_CReportList_1" FOREIGN KEY (
	"cId"
)
REFERENCES "Customer" (
	"cId"
);

ALTER TABLE "PList" ADD CONSTRAINT "FK_seller_TO_PList_1" FOREIGN KEY (
	"sId"
)
REFERENCES "seller" (
	"sId"
);

ALTER TABLE "dAddress" ADD CONSTRAINT "FK_Customer_TO_dAddress_1" FOREIGN KEY (
	"cId"
)
REFERENCES "Customer" (
	"cId"
);

ALTER TABLE "SReportList" ADD CONSTRAINT "FK_Review_TO_SReportList_1" FOREIGN KEY (
	"reId"
)
REFERENCES "Review" (
	"reId"
);

ALTER TABLE "Question" ADD CONSTRAINT "FK_Customer_TO_Question_1" FOREIGN KEY (
	"cId"
)
REFERENCES "Customer" (
	"cId"
);

