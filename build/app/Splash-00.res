tcl86t.dll      tk86t.dll       tk              __splash              �  +%  �   �   Xtk\text.tcl tk\ttk\utils.tcl tk\ttk\cursors.tcl tk\tk.tcl tk86t.dll VCRUNTIME140.dll tk\license.terms tk\ttk\ttk.tcl tk\ttk\fonts.tcl tcl86t.dll proc _ipc_server {channel clientaddr clientport} {
set client_name [format <%s:%d> $clientaddr $clientport]
chan configure $channel \
-buffering none \
-encoding utf-8 \
-eofchar \x04 \
-translation cr
chan event $channel readable [list _ipc_caller $channel $client_name]
}
proc _ipc_caller {channel client_name} {
chan gets $channel cmd
if {[chan eof $channel]} {
chan close $channel
exit
} elseif {![chan blocked $channel]} {
if {[string match "update_text*" $cmd]} {
global status_text
set first [expr {[string first "(" $cmd] + 1}]
set last [expr {[string last ")" $cmd] - 1}]
set status_text [string range $cmd $first $last]
}
}
}
set server_socket [socket -server _ipc_server -myaddr localhost 0]
set server_port [fconfigure $server_socket -sockname]
set env(_PYIBoot_SPLASH) [lindex $server_port 2]
image create photo splash_image
splash_image put $_image_data
unset _image_data
proc canvas_text_update {canvas tag _var - -} {
upvar $_var var
$canvas itemconfigure $tag -text $var
}
package require Tk
set image_width [image width splash_image]
set image_height [image height splash_image]
set display_width [winfo screenwidth .]
set display_height [winfo screenheight .]
set x_position [expr {int(0.5*($display_width - $image_width))}]
set y_position [expr {int(0.5*($display_height - $image_height))}]
frame .root
canvas .root.canvas \
-width $image_width \
-height $image_height \
-borderwidth 0 \
-highlightthickness 0
.root.canvas create image \
[expr {$image_width / 2}] \
[expr {$image_height / 2}] \
-image splash_image
wm attributes . -transparentcolor magenta
.root.canvas configure -background magenta
pack .root
grid .root.canvas -column 0 -row 0 -columnspan 1 -rowspan 2
wm overrideredirect . 1
wm geometry . +${x_position}+${y_position}
wm attributes . -topmost 1
raise .�PNG

   IHDR      =   Bᷡ   sRGB ���   gAMA  ���a   	pHYs  t  t�fx  *�IDATx^�]x����{H�@�A:�.�A��H@����"V, ��(�"�XQP�V��B�(Mz�����sΒ��n�����f�'�ݝ��3_�����J$\�g,�@X���K X�P�a	 J0,`�B	�% ,X(��!`�֭��oʌ3�_�Ol8z��L�>]ų`�Bᑕ��x*##�����t�U�Q�y ���B��UA��O?�T]��yy�T�r�mr��9�P���?^=[�8/�/���>\\$/X�jU�y�9r��t��Q��SRS�ށe���r��)qws���#i۶n�n�xxz�z�����K�dȐ!�q�F���<���������1cd<�9o�\%�|}}��G�ݪU��Y���"`��t�5QJy��r��j���ڎ����t����k�z$ff˰��dR=uy-CF&�'��(UZV��	񐘴l9�!�h_7��.J����h�b�ȑc�|�2[��FO.2j�H���Ra�����j����Gy 4X�|9Y�n��رK��<�1r#--Mn��V������Ltq��3/WWWy��'������;���C���5o�L�t��g�~S��/�>\��J�z�ܹK<A�X~HH��A{H֭[��#))�ҵkY�f���ҥKK�n]%..N�,Y*���e*x��(�  ��޵K]ӌ`Sf�t�}��������˗�u�j������ �&'ˑc�$<<�b��_~�EN�<iɍN<�II���_Y����L�2r��U	E�_������s�>+3^�~�<��H�'�xd�r�O����[�+`�rK�D��.?[�#�#[���V��v%���)"~&�Б*����,9���#% H������<X5����E���vJ �����-Z�,!�y��+K���O�k�F��qGw�ٳ����$���˸^�P���O�q�^i��������O>�N������c�X^xa��-[V=K��}��Һu+�6m�z���`�{����xyq)(Yv<�ڷo�����{���)AGk{��7TxQ�٘"�K�gb�]��Ǎ'����<��Ӹ��3�V���1׭]+͛4Q�Z>��`����O4�&���D0D��(�'�7�ӳ�6�0Ǵ<�� h���O�u��U�|��I�^�d�K/�x0�@���[��D���,�-@JS  �azd]'�E~��l���@ZlRZy��N�*@����p
(�Ke�y�(�Hp�=�Q�F�����X�;v�k׮�4=4�`�tZ������w��<��PX�յ>/�p�����U��d�rЗ�g<48 ee�0}�A�$��1R�߳g��^��|v��~�l��QJ�����VK``)y��W�s��5��)�X.�HӦM�gD/y�����Xg
&���O@N��߿����fS�$�������W��>k�,�&��es3��ڵk�Z0U~�:|���5@�������-/\����r��˫4h��qG"�\�\�[n�E]7n�X<(~ L�EE8�7� !�VCg����*?_1��T����,i� G@�,o�/�J�����,��Wʐ�t��G<�|�����7E�z �\��v&I4���&{d�P�mE�F��F�y�ҥ�D��SOIH�ɀ��1sy���tx`�ҚF �y¥x��!2�סC���ЪU+i׮�b8#P�׬YC*U�	��g��rX���O��R�J�s�=��RTȴ�ǿ ����9�p�B%4�w��	S��ԩS[&OzIjժ�ڬ�lApJ >tHV�Xa��޽�W64l�f�<�(fLf�Q�_��5kԙjm�dٲe��XZ,�Qp��]�w� C
LL�B��c�uq��l�|�Ë�Ո���!́?s#[�i�; a�����!%���u#"����[~�ׯ�ô�Pd��CDniy��>�ڵ�:����������Pʟ6b���
(2�_���Ƽ�6p��u��t%��w��4���so.!;;�ɯǰa����O�t�� �yD��d�޼���c�IiH9Ӫ�hz���!�|�+W��ڷ�e�i�R���ׯo*���fò�F������TY{1]B( ��j�̈́FΧ��7cA��Mv�hTyw\��'_P���LDb_�j�=D�c�Q}��>>F���ok��;w����󰰪�#:d�ԔT�r�
�N�:��q>�q��u����ɸ��7Pa���<���߱c���e���$�������)���L51w�\�P �;B�!4�4���YԷ��
:��ڌ�lT3����믛���Ax@ҏ1B]��d�;^����D��f��Ģ3��	����[���L]��\�*�~��7u����j��}΃��L�:~��@���F�$�9rTY(�~�n�K]:tT)!
G�N�r ̟�%��U���U�|ƶ�RQQ��[��&�Mt�)��>���I'x��ϊ΢GϞ�+t����D�?�KC޳��~�-Y����,L#��Y�ːĴ,��sϓ��Hê����{ÁFkX�v����]Q��3%���'�Ws�LY�v'�t�;~�8P5�k2��4��lfn���BgϞ����;|�S�l_�Ν;�εk�Rg=��"�@`@�l޼��x������>,W
-�/�n�_���+URgJ���&QQQr����������^S5��<>�) �O.��vK�xa�x�U���;�tU%^L�5��]�ub(�I��ҭ|^�w��gΜ��+�Zdz���}�]�π�B�*iّy��l~{۶m�QÆ�Z�&M���(��/^�9c(�X߉���33��^�z��9����5�<�q�_E�N}E�������:�8q�=f�Php��9���8z��l�	9��@hh���yT� �G<�m�Q��N�>-�v"�۷�aE��� xt0��.!�⡈�@�G�k�i���_HF�p ��86!��Y2%�[}Q(\$))Y}�IN6��Hز%R�iL\PSo��܏��A7��3���U�����UHW�(>���/���5j԰?�Ǣ̾6h�	oe��j� ��K���D�{/�nz|�&M��0��F�<�J����ּ�����y#���-��l�e�2�
!9��p��I�r2�XK���b��T�t�'���u��΅���O^�o�YX�~322�L�����7�,Hp�'}������<����ʒ(,�Ԭy������;g'�Շ4��U%H��9��
��i�L~.���ٳf��͓(*�;9��/���:u#����~�:�S��-����ʔ4�?���mft� 7m�=7H�^w������'KJ.�i� r
��[�˘Zś�����dw�f�DmJ�IAQ�9+˹���5k�jh���ΝW�܍��ҥ��4�8�Mz*�o@`�̟?�R4Z }F�7�s׮褠|���g�*>V����su-g =8��H ����8 ^��?�C?�u���-}7�K��Dˮ�W2&i���o7�B�G?�ʕ��gw֢d��A�g�??4k��T �4|��`S+!!!�_YMY6�����X�#�/$Ǐ��8�B�`����o��I���L�8.8*~�m��"�J�I[7�FA�)�F�&��������� O��O�-��U�@����K���*"�X�f�3�r��iܸ�a�iY�d�С�*��3��.�+W��D�???_S`n���SH�h���j���Ja����8h�kPZ ԇ�oG��-�W�(��i��)Yr8Ă��v�_���7���`\��i��#|*1[�&;g�\�@��m7����E������_������)��v�Q��[o�(11���=a&tNť���IF-W.��9���ݻ���򂃛&LT#��2~�8�������ntsァ�wp� �۵S碰����շ�w�}��߉T��Ѡ��zԦ\t��X�1^zl�5��H+1,#K��k���	�&B	ԓZ��+g�EWfG��NII����φ�h:��FD�R���=��b�X�<�ի}�(��J@#+�a��E��HDW���D�F���矓'���|���߁B���l�" ���-�7l��J��c�i6Z�K|�`ڗ	��������ga�
X
�MP�����p)-�Y]Ύ8��ݻ߮6�!�R���3Z���TyF�!�VP܌�5�貘�c�$��oÆ��P�ª˘1�eР���p�O~˪�S-���f�l�p���`p�j-�଍�?�_8�����*K[�����r�g)9$߶����5zu4��W�@CA]���"{b3�&"�"���6%��M�1��$���*�6m��Y�L����9��QÓ�O{ի��Z(0�����#(H��3::���|lӦu��y_�nѿL9% ���02�b��V���E��Ȕ)S�W6З��)�f`ǘ���Π��x���7�.�{>�:��F�9��j7�[����Ȁ��[��8���&ȇ�X���?�!Mms"�G��I�^�j'����H��������DO">u�=4={F�j]3M����}�w�!M�*�/���y��>��gǯ,�3�8�XX Λg�*S���]��38% |!%?|�}Ek�B`�i���Sj�\�2W�V�^���.(y����;�W��c�.�H���<(
��KL�^��~g�e_~�vm)*�\ː��#=�t��T�ԃ���jȄu��Ln-�%V���C��W���A���5�g���L5Kћn��w#{��0�c2d�65I�D�|���Kg5�?�%81��Y�fB@��ݻwC!����s�Na�L��UZLC&�U�6@NaV�r%��B�R�¯\�����3g��Ty��	��f/���z..� ��a���I���k�|�I��pG���R
��O�>���8:F�aȇ~�	�ArZ����Fu4��ۻu�&�}���saHe�.��/q���*�Y}�A@pOB�O�,F�J�6?�J2Lf2�C	YRaE�l�o��u�W�J���!Q:кC�$���l�X������q��P��nO����E�R���qjҰ��M��12�@��K,�F���ߴ����?o�杫|^��I��,���sl�����s{>�x��� �9�;��`9<sתE�>WiȴӠ��*1__�Z|-O
�j��{5k�i�y� ����1���(������9s�Q�7�J�b�x 7Cqڭv����8y�lݶM��$b{�R.�H�}���*���$z�9b�B��D*��<�[�`����(�r^3P�jˍ���\��,�qW��wN��A�ASiS|�2��j*��N����@8��mKs�s��o|�K������e��cau�����I9�Ix�	`y$g*�cM� ���C�QQW���r�Y�AM�èm�����#��K3[�]G��(�L:-Oǃ��<Lǥ��v|������PQY��5�<��o���3/-�Z|B��u�5<- ^Sx\�xI�G\o@:%/��/� ͚5��Pt�ׁ�سG��s��Y������+��A�K��uc z��q#�T3B��s�+L�d�Ç��!雙�h8	K�ģ&rܜ�pȖ?av������B���I��	`p7��G:��	tS��90a��;��!�����i�=Jއ��p�RA)Y�PW��.����2Q�A�ү��8�)�H���%w[s3_��i�}���!!!�r��&�\��b������\�띙����GHHH�$���u�)(���(�U�̳�l̇{��΁��!�O���/'��\Uu.-u��Fm��X?n�B	F��΂�jX���K X�P�a	 J0,`�B	F�� �[��)��}ر@�S����HX��n.�4����fD�wV�dY�����͹�_!�#� �OߵP��/��~�������������O�'ɮ��pc�y+����>}�C��0��;�߈}�K\��$=��$���H,gZ������<�^Z%�d7K ���:�� !����0�rkfP��v����������A�_5>��39+�����M�iym�-8��e>ӏ���;���S]���>�g�a�=7M����6oy�Ղ������P8�-�7 �&��pp{a_����]���|p�����U�<\կ2q�=7X�v*h�I�/����f,���kA�����,�sN��]�퉲�ބq�i��sŠZd�=~��-��:�֕u� s��pwU/>�և�W��2�����9ߗa,��Y^��f}U8�b����[�3O�M��\���ӌ��w�����#�׮��z�ތO�\�tI-Z$��]I��8��v�J�>zT�ܵK��/_��6b3yx������(E��.���W��|�\��R�Z5���ld�F��e�\�	/0Ȝ7ߔԔI���j5n��AA�s�.�OH���[��S�Ԟzu�Ԗ����g�U����d!�����͗��!^�*ύ}F�U�(���>��Ʌ3g$%5U�M�,O�-�ʖw���ݻ�bh��t㾇�k0��;V�6k&i
��w���˦��H�r�$yL�>M?���n�D��N޾>r��9��ށ�w���{�t�By��9R�;*߯�I�E�.�?'/O�&�[���{��ͭZJZJ�ػW�U�*�IS��e�|l#�p�ҥe(�d��E=�6�3�w�!�����än������	����8�����]s��$� �w�	�ȕb*�g��{
Hu����k%m��W�2x6��T��+^��W��u��fz-�!��5��ұ,>��@z���kaZ�ٙ6���:�����~���`\>cY�4Z\�󚃌�מ�v¡���=��i�y0�ixf�>��L�?s�C{����Z�c���l���6�VM:�v�t��A͚6Ut�m�i!��	�?��1�m�V2h�`)W���5��|�$$�ˬ��e�O��rX��5o�,_�\�/,���#�A�^�:��/�ը(ٵs��CO�=[6W�X��?/1��R�fMY��O����ĉ��ҥr��wK/\��>��>�������J��|���E�%K�HRb�:rDf�1Sڵo'����nq�9vL�j��R>޲L͟�{��7�\@�$$'K�s��u���e� \dɗ_J�)�Li�=w�DB1�ܱC��~�Z��!�o��m��ޝ�q4��"��=4h �q�'���?zМiݦ�D��%=�Sz��!=p����,��f�{��HU4ny��
�4b��7�$Y�x��g�!!�\
�*H��x��{W�ծ-!*���!��sI_��":?�:�p���(�
�X,��(]Q�/�&�q��2�x�U�H9�c�^0�*��y�CR2_�DPe������C�ȷT)��	mTC*A���Q	-��C|��C]*�Sh�����PGA�0�uc>�*U� �?���Y�;��Ø�����aY���#�"��}���R\�����7թ#.�V�u�i%�#����3nA�8h-ɆY��6�u P�;��wf|��(��E������d`{\���Eew��Iy��[�M��uHٲ� A�c�W_yE|�e����`�ĄDIK��#@������ҽkWIKN��#�˧�|"QW_oO�â����P�nµ��/���Η����K�����$'%���׮^U��u�q��#�Hdd��})�]\,���{ss��i�Ȑ�C���}�?���OIg���%K�2�� �<Q�}���+@��a6{�L(�ɀ��
�˕YG���YT�ZU	ш޽կa�M�FDHxÆ��pD��dD�I��~��sf�G�8H�U0s:C�9~\�I��ҋ MG�#?��C":qBZ4o.�A�r7��H��>s�2��z�A9t�Ԫ__v��n��܆�<�e�0y�|���r�}�)��ҥ��)6b�h���{��~�)��*���"�m��'_}��H�����5�֕��!#P/��@4=�K����{x>��������;�(FZ	=s��2l�(%�i�}����
�����wHk2F
���o����!�I)t$��?9�E�2}��y�=п�|�f�*c�;se̸q��1Z7�� �y�z��/� nG�vB�ā�!��mܨ���i�f���G{�z�i��7�Ƚ��ny'��l#
���WȄI�d,�b߽�v;S��s/A{C�|��3�m�Vq�nGzֻZ�z����2�����������$0l'h�e�V��փtC�>���T�4�ݣH�������q&@���a�>*�ΞUB�����y��4j(3�*�$%ʲ�_�A�ӈ�c��#e3��)h`����y�!L�:��4܇$�S�Z���c���j��r��w�TZ�;N��b@����H<���
����ϥJ%۞t��0@	���*o��"�O��`��G�s>X�,��o�&E=�Q������6ښ��I�DϿ�f�F�# �~jxs�,	����`:���ܹ���?JJV�u�1Bvn�&@:6�����-0�x2:{��cd<��6o��`v2�wfM�ς�Ԯ];��(U��?��~�U�t�3ώ�67�,��C�0�����@����p_Z��\�v�2�Ƣ��&$x7n�]�m�L{&��_���A�$~^Q��% ?�ZC��:4�����
�	���>�}�5R��!�iS�J?�A_���Q�;{�)�N�V~�^MQ�~�v0b�.]�#
�{�Qu=A9��ir�a�t�u�w�ZA���?~������C0=�(�-��q��(�w�U�B��_?�4��wed�ˈ�´c����G�}&���x��3>Q �RY]:�]r#h!��Y�D��oΜ%G�n�Zn�zrJ2��VҫO_U�����~�Рc�~Z��P�*�Ô�!X7��܁6���"��/�P�k �[�i�~��6���@�BS�-������[� Mp�p�L��Y��AX׀��3Bmzr?�˙�k`8����x�9h�6����S��OByU�RU���9
E7�;\Z ^%X�}�<��S��'M�-�A!`Ԯf������&���S�UBC����a �}����R'@L4�C��	s'�K���y���6�_zIJ�)+�~~�А!r௃�9A����~�M	����@��\�i�o�2�C�%�s/���ƥ6�J�Ps�̑� ��?#�p:�o�Fw�w�HI@m��Jn�L?��E���~(g/��n��WQ;������%�Mm��0����TF$��p�F��U�T��k�.Š":$�F=&ٮn�w�ZA�T� }=����$g�ݹgݥ��7uy���.m�Ӛ�b7�L}h���X��3f� p�vm��}%Bo�j*�xP۠�*���m�_X�`�"4��/d��?�4h?/�`ƾОn�fI�I���h�R	��h�zx?�m-0l�m�~K��O�vB�6��f�o�7�z(�	Z��	�6ޛڜ�Q�TE�їo+��jD�}�;z�R��O��ڼm�(��ٷ��ȣ:�l��uk	Mƣm#��d�菖 ��z��oi�F��n(\���w!mc�~h���>"5 ̴_�ַ�vvy�w�ݰa�x�%}�LH��0}J�9��5A>�EM5�5���$4�>��	(�&;��IH�3�^�s���>~J��S�9�P����=yu�4)���h+g.Ҥ
1ڷ_�Z�R?����4�:(����x7t1����Cp��|cÎBF�)n �m`��՗���R�)���p�9z����5j h$L୑[�z"��fhQƣ@� z��%�چ��0�9&q��A�/S��_����'��� �_a��j:36��Bᛕ�d3ڜ�����d��Sd�ox�&�i��,��?�����,@;�G)�Qoj��˖�zЄ~���35�ϰl>|o������?����p��я��E�-R�LԮ��lZ ?��Y�|�,�O�܊rЇ�6����"��>�%�ࠦ+��j椋�h���b�d�=�Q�G�ǃ���Og�K*�im����5ģ������񴴄�i�g*/<W�xβy��|�a�-.-V���p�嫅��: �����X�yh��@�Ė�Hiݲ��A�2Ma :)�� ^��7	����`,��f����~�G��
Ӟq75�<ᾲ��`4@򡾦�)�|�t�$�h�j�2˷�ͯ��Z-O�!�G�d�[60�I_�9SwS�h?�D�D=�)�mA���á�F�cz���+��8�|�q�kև��)�<��'�.b	�׿����a:��X�qY�=��N̋�c]�r'O�(o���I�~��8t�p���6�Ȗ�Ձ�R���<���^shX6D�3,��e�[d?��xV��9Xaw���|������5��D#Q��#�Za�0Z" |.�]p%)
�b	�	0�黲(͗�u��X����(�cXA�h��#������G�c\��>�Y�fi	��(�#
JK��Р b��קէ#��ڽFy�P����SՃ���6�G�q�Ν���շ��~��B�jq.@oX�\��,�% 8H��wߩ]�i>[�e� pL�c���r��Q �ѹ�<}j7� ؘc*VT�E� �-��%8GC�βPHn�uI��U^3_��,z��Ql`����]��π,X�߁% ,X(���%� �`�� ,�`X�����*?Z�;�ZH    IEND�B`�