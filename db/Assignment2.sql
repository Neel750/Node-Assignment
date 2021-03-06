PGDMP                 	        y            NodeAssignment    13.1    13.1 )    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    24576    NodeAssignment    DATABASE     t   CREATE DATABASE "NodeAssignment" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
     DROP DATABASE "NodeAssignment";
                postgres    false                        2615    24577    Assignment2    SCHEMA        CREATE SCHEMA "Assignment2";
    DROP SCHEMA "Assignment2";
                postgres    false            �            1259    24598    car    TABLE     y   CREATE TABLE "Assignment2".car (
    id integer NOT NULL,
    "carName" text,
    makeid integer,
    modelid integer
);
    DROP TABLE "Assignment2".car;
       Assignment2         heap    postgres    false    4            �            1259    24596 
   car_id_seq    SEQUENCE     �   CREATE SEQUENCE "Assignment2".car_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE "Assignment2".car_id_seq;
       Assignment2          postgres    false    4    206            �           0    0 
   car_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE "Assignment2".car_id_seq OWNED BY "Assignment2".car.id;
          Assignment2          postgres    false    205            �            1259    32770    carimage    TABLE     �   CREATE TABLE "Assignment2".carimage (
    imageid integer NOT NULL,
    carid integer,
    imagename character varying,
    createddate date
);
 #   DROP TABLE "Assignment2".carimage;
       Assignment2         heap    postgres    false    4            �            1259    32777    carimage_imageid_seq    SEQUENCE     �   CREATE SEQUENCE "Assignment2".carimage_imageid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE "Assignment2".carimage_imageid_seq;
       Assignment2          postgres    false    4    207            �           0    0    carimage_imageid_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE "Assignment2".carimage_imageid_seq OWNED BY "Assignment2".carimage.imageid;
          Assignment2          postgres    false    208            �            1259    24580    make    TABLE     V   CREATE TABLE "Assignment2".make (
    makeid integer NOT NULL,
    "makeName" text
);
    DROP TABLE "Assignment2".make;
       Assignment2         heap    postgres    false    4            �            1259    24578    make_id_seq    SEQUENCE     �   CREATE SEQUENCE "Assignment2".make_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE "Assignment2".make_id_seq;
       Assignment2          postgres    false    4    202            �           0    0    make_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE "Assignment2".make_id_seq OWNED BY "Assignment2".make.makeid;
          Assignment2          postgres    false    201            �            1259    24589    model    TABLE     Y   CREATE TABLE "Assignment2".model (
    modelid integer NOT NULL,
    "modelName" text
);
     DROP TABLE "Assignment2".model;
       Assignment2         heap    postgres    false    4            �            1259    24587    model_id_seq    SEQUENCE     �   CREATE SEQUENCE "Assignment2".model_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE "Assignment2".model_id_seq;
       Assignment2          postgres    false    4    204            �           0    0    model_id_seq    SEQUENCE OWNED BY     P   ALTER SEQUENCE "Assignment2".model_id_seq OWNED BY "Assignment2".model.modelid;
          Assignment2          postgres    false    203            �            1259    40962    users    TABLE     {   CREATE TABLE "Assignment2".users (
    id integer NOT NULL,
    email character varying,
    password character varying
);
     DROP TABLE "Assignment2".users;
       Assignment2         heap    postgres    false    4            �            1259    40960    users_id_seq    SEQUENCE     �   CREATE SEQUENCE "Assignment2".users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE "Assignment2".users_id_seq;
       Assignment2          postgres    false    4    210            �           0    0    users_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE "Assignment2".users_id_seq OWNED BY "Assignment2".users.id;
          Assignment2          postgres    false    209            B           2604    24601    car id    DEFAULT     n   ALTER TABLE ONLY "Assignment2".car ALTER COLUMN id SET DEFAULT nextval('"Assignment2".car_id_seq'::regclass);
 <   ALTER TABLE "Assignment2".car ALTER COLUMN id DROP DEFAULT;
       Assignment2          postgres    false    205    206    206            C           2604    32779    carimage imageid    DEFAULT     �   ALTER TABLE ONLY "Assignment2".carimage ALTER COLUMN imageid SET DEFAULT nextval('"Assignment2".carimage_imageid_seq'::regclass);
 F   ALTER TABLE "Assignment2".carimage ALTER COLUMN imageid DROP DEFAULT;
       Assignment2          postgres    false    208    207            @           2604    24583    make makeid    DEFAULT     t   ALTER TABLE ONLY "Assignment2".make ALTER COLUMN makeid SET DEFAULT nextval('"Assignment2".make_id_seq'::regclass);
 A   ALTER TABLE "Assignment2".make ALTER COLUMN makeid DROP DEFAULT;
       Assignment2          postgres    false    201    202    202            A           2604    24592    model modelid    DEFAULT     w   ALTER TABLE ONLY "Assignment2".model ALTER COLUMN modelid SET DEFAULT nextval('"Assignment2".model_id_seq'::regclass);
 C   ALTER TABLE "Assignment2".model ALTER COLUMN modelid DROP DEFAULT;
       Assignment2          postgres    false    204    203    204            D           2604    40965    users id    DEFAULT     r   ALTER TABLE ONLY "Assignment2".users ALTER COLUMN id SET DEFAULT nextval('"Assignment2".users_id_seq'::regclass);
 >   ALTER TABLE "Assignment2".users ALTER COLUMN id DROP DEFAULT;
       Assignment2          postgres    false    209    210    210            �          0    24598    car 
   TABLE DATA           D   COPY "Assignment2".car (id, "carName", makeid, modelid) FROM stdin;
    Assignment2          postgres    false    206            �          0    32770    carimage 
   TABLE DATA           Q   COPY "Assignment2".carimage (imageid, carid, imagename, createddate) FROM stdin;
    Assignment2          postgres    false    207            �          0    24580    make 
   TABLE DATA           9   COPY "Assignment2".make (makeid, "makeName") FROM stdin;
    Assignment2          postgres    false    202            �          0    24589    model 
   TABLE DATA           <   COPY "Assignment2".model (modelid, "modelName") FROM stdin;
    Assignment2          postgres    false    204            �          0    40962    users 
   TABLE DATA           ;   COPY "Assignment2".users (id, email, password) FROM stdin;
    Assignment2          postgres    false    210            �           0    0 
   car_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('"Assignment2".car_id_seq', 40, true);
          Assignment2          postgres    false    205            �           0    0    carimage_imageid_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('"Assignment2".carimage_imageid_seq', 4, true);
          Assignment2          postgres    false    208            �           0    0    make_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('"Assignment2".make_id_seq', 23, true);
          Assignment2          postgres    false    201            �           0    0    model_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('"Assignment2".model_id_seq', 32, true);
          Assignment2          postgres    false    203            �           0    0    users_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('"Assignment2".users_id_seq', 1, true);
          Assignment2          postgres    false    209            J           2606    32787 
   car car_pk 
   CONSTRAINT     O   ALTER TABLE ONLY "Assignment2".car
    ADD CONSTRAINT car_pk PRIMARY KEY (id);
 ;   ALTER TABLE ONLY "Assignment2".car DROP CONSTRAINT car_pk;
       Assignment2            postgres    false    206            F           2606    24606    make make_pk 
   CONSTRAINT     U   ALTER TABLE ONLY "Assignment2".make
    ADD CONSTRAINT make_pk PRIMARY KEY (makeid);
 =   ALTER TABLE ONLY "Assignment2".make DROP CONSTRAINT make_pk;
       Assignment2            postgres    false    202            H           2606    24608    model model_pk 
   CONSTRAINT     X   ALTER TABLE ONLY "Assignment2".model
    ADD CONSTRAINT model_pk PRIMARY KEY (modelid);
 ?   ALTER TABLE ONLY "Assignment2".model DROP CONSTRAINT model_pk;
       Assignment2            postgres    false    204            K           2606    24609 
   car car_fk    FK CONSTRAINT     y   ALTER TABLE ONLY "Assignment2".car
    ADD CONSTRAINT car_fk FOREIGN KEY (makeid) REFERENCES "Assignment2".make(makeid);
 ;   ALTER TABLE ONLY "Assignment2".car DROP CONSTRAINT car_fk;
       Assignment2          postgres    false    202    2886    206            L           2606    24614    car car_fk_1    FK CONSTRAINT     ~   ALTER TABLE ONLY "Assignment2".car
    ADD CONSTRAINT car_fk_1 FOREIGN KEY (modelid) REFERENCES "Assignment2".model(modelid);
 =   ALTER TABLE ONLY "Assignment2".car DROP CONSTRAINT car_fk_1;
       Assignment2          postgres    false    204    206    2888            M           2606    32788    carimage carimage_fk    FK CONSTRAINT     }   ALTER TABLE ONLY "Assignment2".carimage
    ADD CONSTRAINT carimage_fk FOREIGN KEY (carid) REFERENCES "Assignment2".car(id);
 E   ALTER TABLE ONLY "Assignment2".carimage DROP CONSTRAINT carimage_fk;
       Assignment2          postgres    false    207    206    2890            �      x�5�A�0��1'ɥ���������b���sKs��xb�֌��d�P]���-��`	rl�Â���B�ۢ�:��zXpT�r��r��@�R��CX�OaSW��{���(f0�      �   c   x�e�1�0D�:�K"τ�{�-V$��@�@h����jZ����0 ԛ��Z�}N�G�f(�V[g*��!5ў�~%f�^֣o�?��9���a֐���	��!�      �   `   x�=�1�@k�1h������PP���-h��<RbO-��wcf�Y|gv6�E4� �t�e
��$S�z��ݰA��*�u���C��ck�+p9�.+      �   ]   x�Eͱ�0C��b_.�l@	��;�b)ݓ��i��&�����%p�
��
�%D�A�TMB9�LAˠ[��K"\ˊp-�Z63�d�4      �   #   x�3�LL���sH�M���K�υ����b���� �W	U      )    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    24576    NodeAssignment    DATABASE     t   CREATE DATABASE "NodeAssignment" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
     DROP DATABASE "NodeAssignment";
                postgres    false                        2615    24577    Assignment2    SCHEMA        CREATE SCHEMA "Assignment2";
    DROP SCHEMA "Assignment2";
                postgres    false            �            1259    24598    car    TABLE     y   CREATE TABLE "Assignment2".car (
    id integer NOT NULL,
    "carName" text,
    makeid integer,
    modelid integer
);
    DROP TABLE "Assignment2".car;
       Assignment2         heap    postgres    false    4            �            1259    24596 
   car_id_seq    SEQUENCE     �   CREATE SEQUENCE "Assignment2".car_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE "Assignment2".car_id_seq;
       Assignment2          postgres    false    4    206            �           0    0 
   car_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE "Assignment2".car_id_seq OWNED BY "Assignment2".car.id;
          Assignment2          postgres    false    205            �            1259    32770    carimage    TABLE     �   CREATE TABLE "Assignment2".carimage (
    imageid integer NOT NULL,
    carid integer,
    imagename character varying,
    createddate date
);
 #   DROP TABLE "Assignment2".carimage;
       Assignment2         heap    postgres    false    4            �            1259    32777    carimage_imageid_seq    SEQUENCE     �   CREATE SEQUENCE "Assignment2".carimage_imageid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE "Assignment2".carimage_imageid_seq;
       Assignment2          postgres    false    4    207            �           0    0    carimage_imageid_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE "Assignment2".carimage_imageid_seq OWNED BY "Assignment2".carimage.imageid;
          Assignment2          postgres    false    208            �            1259    24580    make    TABLE     V   CREATE TABLE "Assignment2".make (
    makeid integer NOT NULL,
    "makeName" text
);
    DROP TABLE "Assignment2".make;
       Assignment2         heap    postgres    false    4            �            1259    24578    make_id_seq    SEQUENCE     �   CREATE SEQUENCE "Assignment2".make_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE "Assignment2".make_id_seq;
       Assignment2          postgres    false    4    202            �           0    0    make_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE "Assignment2".make_id_seq OWNED BY "Assignment2".make.makeid;
          Assignment2          postgres    false    201            �            1259    24589    model    TABLE     Y   CREATE TABLE "Assignment2".model (
    modelid integer NOT NULL,
    "modelName" text
);
     DROP TABLE "Assignment2".model;
       Assignment2         heap    postgres    false    4            �            1259    24587    model_id_seq    SEQUENCE     �   CREATE SEQUENCE "Assignment2".model_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE "Assignment2".model_id_seq;
       Assignment2          postgres    false    4    204            �           0    0    model_id_seq    SEQUENCE OWNED BY     P   ALTER SEQUENCE "Assignment2".model_id_seq OWNED BY "Assignment2".model.modelid;
          Assignment2          postgres    false    203            �            1259    40962    users    TABLE     {   CREATE TABLE "Assignment2".users (
    id integer NOT NULL,
    email character varying,
    password character varying
);
     DROP TABLE "Assignment2".users;
       Assignment2         heap    postgres    false    4            �            1259    40960    users_id_seq    SEQUENCE     �   CREATE SEQUENCE "Assignment2".users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE "Assignment2".users_id_seq;
       Assignment2          postgres    false    4    210            �           0    0    users_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE "Assignment2".users_id_seq OWNED BY "Assignment2".users.id;
          Assignment2          postgres    false    209            B           2604    24601    car id    DEFAULT     n   ALTER TABLE ONLY "Assignment2".car ALTER COLUMN id SET DEFAULT nextval('"Assignment2".car_id_seq'::regclass);
 <   ALTER TABLE "Assignment2".car ALTER COLUMN id DROP DEFAULT;
       Assignment2          postgres    false    205    206    206            C           2604    32779    carimage imageid    DEFAULT     �   ALTER TABLE ONLY "Assignment2".carimage ALTER COLUMN imageid SET DEFAULT nextval('"Assignment2".carimage_imageid_seq'::regclass);
 F   ALTER TABLE "Assignment2".carimage ALTER COLUMN imageid DROP DEFAULT;
       Assignment2          postgres    false    208    207            @           2604    24583    make makeid    DEFAULT     t   ALTER TABLE ONLY "Assignment2".make ALTER COLUMN makeid SET DEFAULT nextval('"Assignment2".make_id_seq'::regclass);
 A   ALTER TABLE "Assignment2".make ALTER COLUMN makeid DROP DEFAULT;
       Assignment2          postgres    false    201    202    202            A           2604    24592    model modelid    DEFAULT     w   ALTER TABLE ONLY "Assignment2".model ALTER COLUMN modelid SET DEFAULT nextval('"Assignment2".model_id_seq'::regclass);
 C   ALTER TABLE "Assignment2".model ALTER COLUMN modelid DROP DEFAULT;
       Assignment2          postgres    false    204    203    204            D           2604    40965    users id    DEFAULT     r   ALTER TABLE ONLY "Assignment2".users ALTER COLUMN id SET DEFAULT nextval('"Assignment2".users_id_seq'::regclass);
 >   ALTER TABLE "Assignment2".users ALTER COLUMN id DROP DEFAULT;
       Assignment2          postgres    false    209    210    210            �          0    24598    car 
   TABLE DATA           D   COPY "Assignment2".car (id, "carName", makeid, modelid) FROM stdin;
    Assignment2          postgres    false    206   v       �          0    32770    carimage 
   TABLE DATA           Q   COPY "Assignment2".carimage (imageid, carid, imagename, createddate) FROM stdin;
    Assignment2          postgres    false    207   �        �          0    24580    make 
   TABLE DATA           9   COPY "Assignment2".make (makeid, "makeName") FROM stdin;
    Assignment2          postgres    false    202   m        �          0    24589    model 
   TABLE DATA           <   COPY "Assignment2".model (modelid, "modelName") FROM stdin;
    Assignment2          postgres    false    204   j        �          0    40962    users 
   TABLE DATA           ;   COPY "Assignment2".users (id, email, password) FROM stdin;
    Assignment2          postgres    false    210   g        �           0    0 
   car_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('"Assignment2".car_id_seq', 40, true);
          Assignment2          postgres    false    205            �           0    0    carimage_imageid_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('"Assignment2".carimage_imageid_seq', 4, true);
          Assignment2          postgres    false    208            �           0    0    make_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('"Assignment2".make_id_seq', 23, true);
          Assignment2          postgres    false    201            �           0    0    model_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('"Assignment2".model_id_seq', 32, true);
          Assignment2          postgres    false    203            �           0    0    users_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('"Assignment2".users_id_seq', 1, true);
          Assignment2          postgres    false    209            J           2606    32787 
   car car_pk 
   CONSTRAINT     O   ALTER TABLE ONLY "Assignment2".car
    ADD CONSTRAINT car_pk PRIMARY KEY (id);
 ;   ALTER TABLE ONLY "Assignment2".car DROP CONSTRAINT car_pk;
       Assignment2            postgres    false    206            F           2606    24606    make make_pk 
   CONSTRAINT     U   ALTER TABLE ONLY "Assignment2".make
    ADD CONSTRAINT make_pk PRIMARY KEY (makeid);
 =   ALTER TABLE ONLY "Assignment2".make DROP CONSTRAINT make_pk;
       Assignment2            postgres    false    202            H           2606    24608    model model_pk 
   CONSTRAINT     X   ALTER TABLE ONLY "Assignment2".model
    ADD CONSTRAINT model_pk PRIMARY KEY (modelid);
 ?   ALTER TABLE ONLY "Assignment2".model DROP CONSTRAINT model_pk;
       Assignment2            postgres    false    204            K           2606    24609 
   car car_fk    FK CONSTRAINT     y   ALTER TABLE ONLY "Assignment2".car
    ADD CONSTRAINT car_fk FOREIGN KEY (makeid) REFERENCES "Assignment2".make(makeid);
 ;   ALTER TABLE ONLY "Assignment2".car DROP CONSTRAINT car_fk;
       Assignment2          postgres    false    202    2886    206            L           2606    24614    car car_fk_1    FK CONSTRAINT     ~   ALTER TABLE ONLY "Assignment2".car
    ADD CONSTRAINT car_fk_1 FOREIGN KEY (modelid) REFERENCES "Assignment2".model(modelid);
 =   ALTER TABLE ONLY "Assignment2".car DROP CONSTRAINT car_fk_1;
       Assignment2          postgres    false    204    206    2888            M           2606    32788    carimage carimage_fk    FK CONSTRAINT     }   ALTER TABLE ONLY "Assignment2".carimage
    ADD CONSTRAINT carimage_fk FOREIGN KEY (carid) REFERENCES "Assignment2".car(id);
 E   ALTER TABLE ONLY "Assignment2".carimage DROP CONSTRAINT carimage_fk;
       Assignment2          postgres    false    207    206    2890           