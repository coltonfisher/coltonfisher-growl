FasdUAS 1.101.10   ��   ��    k             l      �� ��   ��
	Public Domain, 2004
	http://holocore.com/
	jacob@verse.org
	
	This script notifies the reciept of new messages in
	Entourage using the Growl Notification framework.
	http://growl.info/

	To be executed by a rule in Entourage (e.g. all messages as your last rule, or 'from' 'is in Address Book'). Notifications for high priority messages will be sticky, normal messages auto-dismiss after a few seconds, and low priority messages are ignored. No notifications are posted when Entourage is frontmost.
       	  l     ������  ��   	  
�� 
 i         I     ������
�� .aevtoappnull  �   � ****��  ��    k    �       O         I   ���� 
�� .registernull��� ��� null��    ��  
�� 
appl  m        Entourage Advanced     ��  
�� 
anot  v           m    	    normal      ��  m   	 
   
 high   ��    ��  
�� 
dnot  v          ! " ! m     # #  normal    "  $�� $ m     % % 
 high   ��    �� &��
�� 
iapp & m     ' '  Microsoft Entourage   ��    m      ( (Lnull     ߀�� O��GrowlHelperApp.appL��� 7���@     gP(   )       r(�K� ���` gGRRR   alis    �  WideBoy                    ��.1H+   O��GrowlHelperApp.app                                              O���)��        ����  	                	Resources     ��.1      �)��     O�� O�� O�� +m �� ��  |  bWideBoy:Users:diggory:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app  &  G r o w l H e l p e r A p p . a p p    W i d e B o y  ZUsers/diggory/Library/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  /    ��     ) * ) O    ! + , + r      - . - l    /�� / m    ��
�� 
CMgs��   . o      ���� 0 themessages theMessages , m     0 0Lnull     ߀�� 'p8EntouragePrintPDE.plugin�����    �Lj�                          OPIM   alis    �   internal_data              ��0:H+   ,Microsoft Entourage                                             ,
�)"�APPLOPIM����  	                Microsoft Office X    ��      �)`     , � EN EL  _�  ]internal_data:Users:jacobjay:Applications:Productivity:Microsoft Office X:Microsoft Entourage   (  M i c r o s o f t   E n t o u r a g e    i n t e r n a l _ d a t a  OUsers/jacobjay/Applications/Productivity/Microsoft Office X/Microsoft Entourage   /    ��   *  1�� 1 X   "� 2�� 3 2 k   6� 4 4  5 6 5 O   6 � 7 8 7 k   : � 9 9  : ; : r   : D < = < e   : @ > > l  : @ ?�� ? n   : @ @ A @ m   ; ?��
�� 
subj A o   : ;���� 0 themsg theMsg��   = o      ���� 0 	mysubject   ;  B C B r   E N D E D l  E J F�� F n   E J G H G m   F J��
�� 
prty H o   E F���� 0 themsg theMsg��   E o      ���� 0 
mypriority   C  I J I Z   O � K L M�� K =  O V N O N o   O R���� 0 
mypriority   O m   R U��
�� Epty!low L r   Y ` P Q P m   Y \ R R  lowest    Q o      ���� 0 
mypriority   M  S T S =  c j U V U o   c f���� 0 
mypriority   V m   f i��
�� Epty!pr2 T  W X W r   m t Y Z Y m   m p [ [ 
 high    Z o      ���� 0 
mypriority   X  \ ] \ =  w ~ ^ _ ^ o   w z���� 0 
mypriority   _ m   z }��
�� Epty!pr4 ]  ` a ` r   � � b c b m   � � d d 	 low    c o      ���� 0 
mypriority   a  e f e =  � � g h g o   � ����� 0 
mypriority   h m   � ���
�� Epty!hgh f  i j i r   � � k l k m   � � m m  highest    l o      ���� 0 
mypriority   j  n o n =  � � p q p o   � ����� 0 
mypriority   q m   � ���
�� Epty!nrm o  r�� r r   � � s t s m   � � u u  normal    t o      ���� 0 
mypriority  ��  ��   J  v w v r   � � x y x c   � � z { z l  � � |�� | n   � � } ~ } m   � ���
�� 
dspn ~ n   � �  �  m   � ���
�� 
sndr � o   � ����� 0 themsg theMsg��   { m   � ���
�� 
TEXT y o      ���� 0 mysender   w  ��� � Z   � � � ����� � =  � � � � � o   � ����� 0 mysender   � m   � � � �       � r   � � � � � c   � � � � � l  � � ��� � n   � � � � � m   � ���
�� 
addr � n   � � � � � m   � ���
�� 
sndr � o   � ����� 0 themsg theMsg��   � m   � ���
�� 
TEXT � o      ���� 0 mysender  ��  ��  ��   8 m   6 7 0 6  ��� � Z   �� � ����� � F   � � � � � >  � � � � � o   � ����� 0 
mypriority   � m   � � � � 	 low    � >  � � � � � o   � ����� 0 
mypriority   � m   � � � �  lowest    � Z   � � ��� � � =   � � � o   ���� 0 
mypriority   � m   � �  normal    � O  
< � � � I ;���� �
�� .notifygrnull��� ��� null��   � �� � �
�� 
titl � m   � �  You have new email    � �� � �
�� 
desc � l ' ��� � b  ' � � � b  # � � � b   � � � m   � �  From     � o  ���� 0 mysender   � m  " � �   about     � o  #&���� 0 	mysubject  ��   � �� � �
�� 
appl � m  (+ � �  Entourage Advanced    � �� � �
�� 
name � m  .1 � �  normal    � �� ���
�� 
iapp � m  25 � �  Microsoft Entourage   ��   � m  
 (��   � k  ?� � �  � � � Z  ?Z � ��� � � = ?F � � � o  ?B���� 0 
mypriority   � m  BE � � 
 high    � r  IP � � � m  IL � �  	important    � o      ���� 0 	myurgence  ��   � r  SZ � � � m  SV � �  urgent    � o      ���� 0 	myurgence   �  ��� � O  [� � � � I _����� �
�� .notifygrnull��� ��� null��   � �� � �
�� 
titl � l cn ��� � b  cn � � � b  cj � � � m  cf � �  	You have     � o  fi���� 0 	myurgence   � m  jm � �   email   ��   � �� � �
�� 
desc � l q� ��� � b  q� � � � b  q| � � � b  qx � � � m  qt � �  From     � o  tw���� 0 mysender   � m  x{ � �   about     � o  |���� 0 	mysubject  ��   � �� � �
�� 
appl � m  �� � �  Entourage Advanced    � �� � �
�� 
name � m  �� � � 
 high    � �� � �
�� 
iapp � m  �� � �  Microsoft Entourage    � �� ���
�� 
stck � m  ����
�� boovtrue��   � m  [\ (��  ��  ��  ��  �� 0 themsg theMsg 3 o   % &���� 0 themessages theMessages��  ��       �� � ���   � ��
�� .aevtoappnull  �   � **** � �� ���� � ���
�� .aevtoappnull  �   � ****��  ��   � ���� 0 themsg theMsg � C (�� ��  �� # %�� '���� 0�������������������� R�� [�� d�� m� u�~�}�|�{ ��z � ��y ��x ��w � � ��v � ��u�t � ��s � � � � � � � ��r�q
�� 
appl
�� 
anot
�� 
dnot
�� 
iapp�� 
�� .registernull��� ��� null
�� 
CMgs�� 0 themessages theMessages
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
subj�� 0 	mysubject  
�� 
prty�� 0 
mypriority  
�� Epty!low
�� Epty!pr2
�� Epty!pr4
�� Epty!hgh
� Epty!nrm
�~ 
sndr
�} 
dspn
�| 
TEXT�{ 0 mysender  
�z 
addr
�y 
bool
�x 
titl
�w 
desc
�v 
name�u 

�t .notifygrnull��� ��� null�s 0 	myurgence  
�r 
stck�q ���� *�����l���l��� UO� �E�UO�[a a l kh  � ��a ,EE` O�a ,E` O_ a   a E` Y S_ a   a E` Y ?_ a   a E` Y +_ a   a E` Y _ a   a  E` Y hO�a !,a ",a #&E` $O_ $a %  �a !,a &,a #&E` $Y hUO_ a '	 _ a (a )& �_ a *  7� /*a +a ,a -a ._ $%a /%_ %�a 0a 1a 2�a 3a 4 5UY \_ a 6  a 7E` 8Y 	a 9E` 8O� ;*a +a :_ 8%a ;%a -a <_ $%a =%_ %�a >a 1a ?�a @a Aea B 5UY h[OY��ascr  ��ޭ