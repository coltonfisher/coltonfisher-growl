FasdUAS 1.101.10   ��   ��    k             l      �� ��   \V
New Item Alert with Filenames


For the Folder Notification scripts to work, they have to be placed in "Scripts/Folder Action Scripts" ... either in /Library or ~/Library. After placing them there, right-click on the folder for which you want notifications and choose "Attach a Folder Action."


Based on ADD - NEW ITEM ALERT (�2002 Apple Computer)

This Folder Action script is designed for use with Mac OS X version 10.2 and higher.

This Folder Action handler is triggered whenever items are added to the attached folder.  The script will display an alert 
containing the number of items added
       	  l     ������  ��   	  
  
 i         I     ��  
�� .facofget****      � ****  o      ���� 0 this_folder    �� ��
�� 
flst  o      ���� 0 added_items  ��    Q     �  ��  k    �       O    2    k    1       l   �� ��      get the name of the folder         r        l   
  ��   n    
 ! " ! 1    
��
�� 
pnam " o    ���� 0 this_folder  ��    l      #�� # o      ���� 0 folder_name  ��     $ % $ r     & ' & m     ( (       ' o      ���� 0 thefiles theFiles %  )�� ) X    1 *�� + * r   ! , , - , b   ! * . / . b   ! $ 0 1 0 o   ! "���� 0 thefiles theFiles 1 o   " #��
�� 
ret  / l  $ ) 2�� 2 c   $ ) 3 4 3 n   $ ' 5 6 5 1   % '��
�� 
pnam 6 o   $ %���� 0 thefile theFile 4 m   ' (��
�� 
ctxt��   - o      ���� 0 thefiles theFiles�� 0 thefile theFile + o    ���� 0 added_items  ��    m     7 7�null     ߀��  

Finder.app��`� �0��Ȑ 7��Ԑ���� ]`0   )       *(�� ��԰ bMACS   alis    `  kremit                     ��=)H+    

Finder.app                                                       2����;        ����  	                CoreServices    �Ãy      ���      
  
  
  -kremit:System:Library:CoreServices:Finder.app    
 F i n d e r . a p p    k r e m i t  &System/Library/CoreServices/Finder.app  / ��     8 9 8 l  3 3������  ��   9  : ; : r   3 ; < = < n  3 9 > ? > I   4 9�� @���� 0 alias_to_url alias_to_URL @  A�� A o   4 5���� 0 this_folder  ��  ��   ?  f   3 4 = o      ���� 0 folder_icon   ;  B C B l  < <������  ��   C  D E D r   < C F G F l  < A H�� H n   < A I J I m   ? A��
�� 
nmbr J n  < ? K L K 2  = ?��
�� 
cobj L l  < = M�� M o   < =���� 0 added_items  ��  ��   G l      N�� N o      ���� 0 
item_count  ��   E  O P O Z   D [ Q R�� S Q ?  D G T U T l  D E V�� V o   D E���� 0 
item_count  ��   U m   E F����  R k   J Q W W  X Y X r   J M Z [ Z m   J K \ \  s    [ o      ���� 0 	plurality   Y  ]�� ] r   N Q ^ _ ^ m   N O ` ` 
 have    _ o      ���� 0 	have_verb  ��  ��   S k   T [ a a  b c b r   T W d e d m   T U f f       e o      ���� 0 	plurality   c  g�� g r   X [ h i h m   X Y j j 	 has    i o      ���� 0 	have_verb  ��   P  k l k l  \ \������  ��   l  m n m r   \ e o p o b   \ c q r q b   \ a s t s b   \ _ u v u m   \ ] w w  New File    v o   ] ^���� 0 	plurality   t m   _ ` x x 
  in     r l  a b y�� y o   a b���� 0 folder_name  ��   p o      ���� 0 thetitle theTitle n  z { z r   f } | } | b   f { ~  ~ b   f y � � � b   f u � � � b   f s � � � b   f o � � � b   f m � � � l  f i ��� � c   f i � � � l  f g ��� � o   f g���� 0 
item_count  ��   � m   g h��
�� 
ctxt��   � m   i l � �   item    � o   m n���� 0 	plurality   � m   o r � �       � o   s t���� 0 	have_verb   � m   u x � �   been added:     o   y z���� 0 thefiles theFiles } o      ���� 0 thetext theText {  � � � l  ~ ~������  ��   �  � � � I   ~ ��� ����� 0 growlnotify GrowlNotify �  � � � o    ����� 0 thetitle theTitle �  � � � o   � ����� 0 thetext theText �  � � � m   � � � �  icon of file    �  � � � o   � ����� 0 folder_icon   �  ��� � m   � ���
�� boovfals��  ��   �  ��� � l  � �������  ��  ��    R      ������
�� .ascrerr ****      � ****��  ��  ��     � � � l     ������  ��   �  � � � i     � � � I      �� ����� 0 growlnotify GrowlNotify �  � � � o      ���� 0 thetitle theTitle �  � � � o      ���� 0 thetext theText �  � � � o      ���� 0 	imagetype 	imageType �  � � � o      ����  0 imagespecifier imageSpecifier �  ��� � o      ���� 
0 sticky  ��  ��   � k     � � �  � � � O     � � � r     � � � l 	   ��� � l    ��� � I   �� ���
�� .corecnte****       **** � l    ��� � 6    � � � 2   ��
�� 
pcap � l    ��� � =    � � � 1   	 ��
�� 
pnam � l 
   ��� � m     � �  GrowlHelperApp   ��  ��  ��  ��  ��  ��   � o      ���� 0 growlrunning GrowlRunning � m      � ��null     ߀��  
System Events.app���� 7��ՠ���� ]`(   )       *(�� ���� bsevs   alis    |  kremit                     ��=)H+    
System Events.app                                                Z�����        ����  	                CoreServices    �Ãy      ��<      
  
  
  4kremit:System:Library:CoreServices:System Events.app  $  S y s t e m   E v e n t s . a p p    k r e m i t  -System/Library/CoreServices/System Events.app   / ��   �  � � � l   ������  ��   �  � � � Z    � � ��� � � @     � � � o    ���� 0 growlrunning GrowlRunning � m    ����  � k    g � �  � � � r    + � � � b    ) � � � b    ' � � � b    % � � � b    # � � � b    ! � � � l 	   ��� � m     � �  notify with title "   ��   � o     ���� 0 thetitle theTitle � m   ! " � �  "     � l 	 # $ ��� � m   # $ � �  description "   ��   � o   % &���� 0 thetext theText � m   ' ( � �  "    � o      ���� 0 notifycommand notifyCommand �  � � � l  , ,������  ��   �  � � � Z   , K � ����� � F   , 7 � � � >   , / � � � o   , -���� 0 	imagetype 	imageType � m   - . � �       � >   2 5 � � � o   2 3����  0 imagespecifier imageSpecifier � m   3 4 � �       � r   : G � � � b   : E � � � b   : C � � � b   : A � � � b   : ? � � � b   : = � � � o   : ;���� 0 notifycommand notifyCommand � l 	 ; < ��� � m   ; < � �      ��   � o   = >���� 0 	imagetype 	imageType � m   ? @ � �   "    � o   A B����  0 imagespecifier imageSpecifier � m   C D � �  "    � o      ���� 0 notifycommand notifyCommand��  ��   �    l  L L������  ��    l  L L����   * $ work around AppleScript's potential     l  L L����   ' ! "Where is GrowlHelperApp" dialog    	 r   L Q

 m   L O  GrowlHelperApp    o      ���� 
0 gha GHA	 � O  R g I  [ f�~�}
�~ .sysodsct****        scpt b   [ b b   [ ` l 	 [ \�| o   [ \�{�{ 0 notifycommand notifyCommand�|   m   \ _  sticky     o   ` a�z�z 
0 sticky  �}   4   R X�y
�y 
capp o   V W�x�x 
0 gha GHA�  ��   � I  j ��w
�w .sysodlogaskr        TEXT b   j u b   j s b   j o o   j k�v�v 0 thetitle theTitle o   k n�u
�u 
ret  o   o r�t
�t 
ret  o   s t�s�s 0 thetext theText �r !
�r 
btns  J   x }"" #�q# m   x {$$  OK   �q  ! �p%�o
�p 
dflt% m   � ��n�n �o   � &�m& l  � ��l�k�l  �k  �m   � '(' l     �j�i�j  �i  ( )*) l     �h+�h  + / ) translate a file alias to a file:/// URL   * ,-, i    ./. I      �g0�f�g 0 alias_to_url alias_to_URL0 1�e1 o      �d�d 0 	this_file  �e  �f  / k     R22 343 r     565 c     787 n     9:9 1    �c
�c 
psxp: o     �b�b 0 	this_file  8 m    �a
�a 
ctxt6 o      �`�` 0 	this_file  4 ;<; r    =>= m    	??  /   > n     @A@ 1   
 �_
�_ 
txdlA 1   	 
�^
�^ 
ascr< BCB r    DED n    FGF 2    �]
�] 
citmG o    �\�\ 0 	this_file  E l     H�[H o      �Z�Z 0 path_segments  �[  C IJI Y    ;K�YLM�XK k   " 6NN OPO r   " (QRQ n   " &STS 4   # &�WU
�W 
cobjU o   $ %�V�V 0 i  T l  " #V�UV o   " #�T�T 0 path_segments  �U  R o      �S�S 0 this_segment  P W�RW r   ) 6XYX l 	 ) 1Z�QZ n  ) 1[\[ I   * 1�P]�O�P 0 encode_text  ] ^_^ o   * +�N�N 0 this_segment  _ `a` m   + ,�M
�M boovtruea b�Lb m   , -�K
�K boovfals�L  �O  \  f   ) *�Q  Y n      cdc 4   2 5�Je
�J 
cobje o   3 4�I�I 0 i  d l  1 2f�Hf o   1 2�G�G 0 path_segments  �H  �R  �Y 0 i  L m    �F�F M l   g�Eg I   �Dh�C
�D .corecnte****       ****h l   i�Bi o    �A�A 0 path_segments  �B  �C  �E  �X  J jkj r   < Alml m   < =nn  /   m n     opo 1   > @�@
�@ 
txdlp 1   = >�?
�? 
ascrk qrq r   B Gsts c   B Euvu l  B Cw�>w o   B C�=�= 0 path_segments  �>  v m   C D�<
�< 
TEXTt o      �;�; 0 	this_file  r xyx r   H Mz{z m   H I||      { n     }~} 1   J L�:
�: 
txdl~ 1   I J�9
�9 
ascry �8 L   N R�� b   N Q��� m   N O��  file://   � o   O P�7�7 0 	this_file  �8  - ��� l     �6�5�6  �5  � ��� l     �4��4  � 9 3 encode spaces and other unsafe characters in a URL   � ��� i    ��� I      �3��2�3 0 
encode_url 
encode_URL� ��1� o      �0�0 0 this_url this_URL�1  �2  � k     H�� ��� r     ��� c     ��� o     �/�/ 0 this_url this_URL� m    �.
�. 
ctxt� o      �-�- 0 this_url this_URL� ��� r    ��� m    ��  /   � n     ��� 1    
�,
�, 
txdl� 1    �+
�+ 
ascr� ��� r    ��� n    ��� 2    �*
�* 
citm� o    �)�) 0 this_url this_URL� l     ��(� o      �'�' 0 path_segments  �(  � ��� Y    9��&���%� k     4�� ��� r     &��� n     $��� 4   ! $�$�
�$ 
cobj� o   " #�#�# 0 i  � l    !��"� o     !�!�! 0 path_segments  �"  � o      � �  0 this_segment  � ��� r   ' 4��� l 	 ' /��� n  ' /��� I   ( /���� 0 encode_text  � ��� o   ( )�� 0 this_segment  � ��� m   ) *�
� boovtrue� ��� m   * +�
� boovfals�  �  �  f   ' (�  � n      ��� 4   0 3��
� 
cobj� o   1 2�� 0 i  � l  / 0��� o   / 0�� 0 path_segments  �  �  �& 0 i  � m    �� � l   ��� I   ���
� .corecnte****       ****� l   ��� o    �� 0 path_segments  �  �  �  �%  � ��� r   : ?��� c   : =��� l  : ;��� o   : ;�� 0 path_segments  �  � m   ; <�
� 
TEXT� o      �
�
 0 this_url this_URL� ��� r   @ E��� m   @ A��      � n     ��� 1   B D�	
�	 
txdl� 1   A B�
� 
ascr� ��� L   F H�� o   F G�� 0 this_url this_URL�  � ��� l     ���  �  � ��� i    ��� I      ���� 0 encode_text  � ��� o      �� 0 	this_text  � ��� o      � �  0 encode_url_a encode_URL_A� ���� o      ���� 0 encode_url_b encode_URL_B��  �  � k     f�� ��� r     ��� l 	   ���� m     �� * $abcdefghijklmnopqrstuvwxyz0123456789   ��  � l     ���� o      ���� 0 standard_characters  ��  � ��� r    ��� m    ��  $+!'/?;&@=#%><{}[]"~`^\|*   � l     ���� o      ���� 0 url_a_chars URL_A_chars��  � ��� r    ��� m    	�� 
 .-_:   � l     ���� o      ���� 0 url_b_chars URL_B_chars��  � ��� r    ��� l   ���� o    ���� 0 standard_characters  ��  � l     ���� o      ���� 0 acceptable_characters  ��  � ��� Z   ������� =   � � o    ���� 0 encode_url_a encode_URL_A  m    ��
�� boovfals� l 	  �� r     b     l 	  �� l   �� o    ���� 0 acceptable_characters  ��  ��   l   �� o    ���� 0 url_a_chars URL_A_chars��   l     	��	 o      ���� 0 acceptable_characters  ��  ��  ��  ��  � 

 Z    /���� =    # o     !���� 0 encode_url_b encode_URL_B m   ! "��
�� boovfals l 	 & +�� r   & + b   & ) l 	 & '�� l  & '�� o   & '���� 0 acceptable_characters  ��  ��   l  ' (�� o   ' (���� 0 url_b_chars URL_B_chars��   l     �� o      ���� 0 acceptable_characters  ��  ��  ��  ��    r   0 3 m   0 1       l     �� o      ���� 0 encoded_text  ��     X   4 c!��"! Z   D ^#$��%# E  D G&'& l  D E(��( o   D E���� 0 acceptable_characters  ��  ' o   E F���� 0 	this_char  $ r   J O)*) l  J M+��+ b   J M,-, l  J K.��. o   J K���� 0 encoded_text  ��  - o   K L���� 0 	this_char  ��  * l     /��/ o      ���� 0 encoded_text  ��  ��  % r   R ^010 c   R \232 l  R Z4��4 b   R Z565 l  R S7��7 o   R S���� 0 encoded_text  ��  6 l 	 S Y8��8 I   S Y��9���� 0 encode_char  9 :��: o   T U���� 0 	this_char  ��  ��  ��  ��  3 m   Z [��
�� 
TEXT1 l     ;��; o      ���� 0 encoded_text  ��  �� 0 	this_char  " o   7 8���� 0 	this_text    <��< L   d f== l  d e>��> o   d e���� 0 encoded_text  ��  ��  � ?@? l     ������  ��  @ A��A i    BCB I      ��D���� 0 encode_char  D E��E o      ���� 0 	this_char  ��  ��  C k     KFF GHG r     IJI l    K��K l    L��L I    ��M��
�� .sysoctonshor       TEXTM o     ���� 0 	this_char  ��  ��  ��  J l     N��N o      ���� 0 	ascii_num 	ASCII_num��  H OPO r     QRQ l 	  S��S J    TT UVU m    	WW  0   V XYX m   	 
ZZ  1   Y [\[ m   
 ]]  2   \ ^_^ m    ``  3   _ aba m    cc  4   b ded m    ff  5   e ghg m    ii  6   h jkj l 	  l��l m    mm  7   ��  k non m    pp  8   o qrq m    ss  9   r tut m    vv  A   u wxw m    yy  B   x z{z m    ||  C   { }~} m      D   ~ ��� l 	  ���� m    ��  E   ��  � ���� m    ��  F   ��  ��  R l     ���� o      ���� 0 hex_list  ��  P ��� r   ! /��� n   ! -��� 4   " -���
�� 
cobj� l  % ,���� [   % ,��� l  % *���� _   % *��� o   % &���� 0 	ascii_num 	ASCII_num� m   & )���� ��  � m   * +���� ��  � l  ! "���� o   ! "���� 0 hex_list  ��  � o      ���� 0 x  � ��� r   0 >��� n   0 <��� 4   1 <���
�� 
cobj� l  4 ;���� [   4 ;��� l  4 9���� `   4 9��� o   4 5���� 0 	ascii_num 	ASCII_num� m   5 8���� ��  � m   9 :���� ��  � l  0 1���� o   0 1���� 0 hex_list  ��  � o      ���� 0 y  � ���� L   ? K�� c   ? J��� l  ? F���� b   ? F��� b   ? D��� m   ? B��  %   � o   B C���� 0 x  � o   D E���� 0 y  ��  � m   F I��
�� 
TEXT��  ��       �����������  � ������������
�� .facofget****      � ****�� 0 growlnotify GrowlNotify�� 0 alias_to_url alias_to_URL�� 0 
encode_url 
encode_URL�� 0 encode_text  �� 0 encode_char  � �� ��������
�� .facofget****      � ****�� 0 this_folder  �� ������
�� 
flst�� 0 added_items  ��  � ��������������~�}�|�{�� 0 this_folder  �� 0 added_items  �� 0 folder_name  �� 0 thefiles theFiles�� 0 thefile theFile�� 0 folder_icon  � 0 
item_count  �~ 0 	plurality  �} 0 	have_verb  �| 0 thetitle theTitle�{ 0 thetext theText�  7�z (�y�x�w�v�u�t�s \ ` f j w x � � � ��r�q�p�o
�z 
pnam
�y 
kocl
�x 
cobj
�w .corecnte****       ****
�v 
ret 
�u 
ctxt�t 0 alias_to_url alias_to_URL
�s 
nmbr�r �q 0 growlnotify GrowlNotify�p  �o  �� � �� ,��,E�O�E�O �[��l kh ��%��,�&%E�[OY��UO)�k+ E�O��-�,E�O�k �E�O�E�Y 	�E�O�E�O�%�%�%E�O��&a %�%a %�%a %�%E�O*��a �fa + OPW X  h� �n ��m�l���k�n 0 growlnotify GrowlNotify�m �j��j �  �i�h�g�f�e�i 0 thetitle theTitle�h 0 thetext theText�g 0 	imagetype 	imageType�f  0 imagespecifier imageSpecifier�e 
0 sticky  �l  � �d�c�b�a�`�_�^�]�d 0 thetitle theTitle�c 0 thetext theText�b 0 	imagetype 	imageType�a  0 imagespecifier imageSpecifier�` 
0 sticky  �_ 0 growlrunning GrowlRunning�^ 0 notifycommand notifyCommand�] 
0 gha GHA�  ��\��[ ��Z � � � � � ��Y � � ��X�W�V�U$�T�S�R
�\ 
pcap�  
�[ 
pnam
�Z .corecnte****       ****
�Y 
bool
�X 
capp
�W .sysodsct****        scpt
�V 
ret 
�U 
btns
�T 
dflt�S 
�R .sysodlogaskr        TEXT�k �� *�-�[�,\Z�81j E�UO�k N�%�%�%�%�%E�O��	 ���& ��%�%�%�%�%E�Y hOa E�O*a �/ �a %�%j UY �_ %_ %�%a a kva ka  OP� �Q/�P�O���N�Q 0 alias_to_url alias_to_URL�P �M��M �  �L�L 0 	this_file  �O  � �K�J�I�H�K 0 	this_file  �J 0 path_segments  �I 0 i  �H 0 this_segment  � �G�F?�E�D�C�B�A�@n�?|�
�G 
psxp
�F 
ctxt
�E 
ascr
�D 
txdl
�C 
citm
�B .corecnte****       ****
�A 
cobj�@ 0 encode_text  
�? 
TEXT�N S��,�&E�O���,FO��-E�O &k�j kh ��/E�O)�efm+ ��/F[OY��O���,FO��&E�O���,FO�%� �>��=�<���;�> 0 
encode_url 
encode_URL�= �:��: �  �9�9 0 this_url this_URL�<  � �8�7�6�5�8 0 this_url this_URL�7 0 path_segments  �6 0 i  �5 0 this_segment  � 
�4��3�2�1�0�/�.�-�
�4 
ctxt
�3 
ascr
�2 
txdl
�1 
citm
�0 .corecnte****       ****
�/ 
cobj�. 0 encode_text  
�- 
TEXT�; I��&E�O���,FO��-E�O &k�j kh ��/E�O)�efm+ ��/F[OY��O��&E�O���,FO�� �,��+�*���)�, 0 encode_text  �+ �(��( �  �'�&�%�' 0 	this_text  �& 0 encode_url_a encode_URL_A�% 0 encode_url_b encode_URL_B�*  � 	�$�#�"�!� �����$ 0 	this_text  �# 0 encode_url_a encode_URL_A�" 0 encode_url_b encode_URL_B�! 0 standard_characters  �  0 url_a_chars URL_A_chars� 0 url_b_chars URL_B_chars� 0 acceptable_characters  � 0 encoded_text  � 0 	this_char  � 	��������
� 
kocl
� 
cobj
� .corecnte****       ****� 0 encode_char  
� 
TEXT�) g�E�O�E�O�E�O�E�O�f  
��%E�Y hO�f  
��%E�Y hO�E�O .�[��l kh �� 
��%E�Y �*�k+ %�&E�[OY��O�� �C������ 0 encode_char  � ��� �  �� 0 	this_char  �  � ������ 0 	this_char  � 0 	ascii_num 	ASCII_num� 0 hex_list  � 0 x  � 0 y  � �WZ]`cfimpsvy|���
�	��
� .sysoctonshor       TEXT�
 
�	 
cobj
� 
TEXT� L�j  E�O���������������a a vE�O�a �a "k/E�O�a �a #k/E�Oa �%�%a &ascr  ��ޭ