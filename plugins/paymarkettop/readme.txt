������ ��������� ������������ ������� ������ �� �������� ������ � ������.

��������������� ����������� ��������:

    ���������� ��������� � ����� plugins ������ �����.
    ������� � ������ �������������� � ���������� ������ ������.
    � ���������� ������� ������� ��������� ������ �� ���� ����.
    ����� ���������� �������� ��� ��� ������ �� ������ ������ � ������� market.userdetails.tpl ����:
    ?
    1
    2
    3
    	
    <!-- IF {PHP.cot_plugins_active.paymarkettop} AND {PHP.usr.id} == {PHP.urr.user_id} -->
           {PRD_ROW_PAYTOP}
    <!-- ENDIF -->

    ��� � ����� ������ ������� market.list.tpl:
    ?
    1
    2
    3
    	
    <!-- IF {PHP.cot_plugins_active.paymarkettop} AND {PHP.usr.id} == {PRD_ROW_OWNER_ID} -->
           {PRD_ROW_PAYTOP}
    <!-- ENDIF -->

    ��� ����������� ������� �� �������� ������ � ������� market.tpl:
    ?
    1
    2
    3
    	
    <!-- IF {PHP.cot_plugins_active.paymarkettop} AND {PHP.usr.id} == {PRD_OWNER_ID} -->
           {PRD_PAYTOP}
    <!-- ENDIF -->

    ������ �� ������ ������ ����� ������������ ������ ��������� ������.

    ����� � ����� ������ ������� ���������� ��������� ����� ��� ���-�������, ��� ������� ������������ ������.
    ��� ����� � ������� market.list.tpl ������ ����� <!-- BEGIN: PRD_ROWS --> � �����, ������� ��������� ����� � ������, ���������� ��������� ������� ��� ���������� �����, ��������:
    ?
    1
    	
    <div class="media<!-- IF {PRD_ROW_ISTOP} --> prdtop<!-- ENDIF -->">

    ����� ����� � css ����� ����� ���� �� �������� ��������� ����� ��� ���-������ .prdtop, �������� ���:
    ?
    1
    	
    .prdtop { background-color: #feefb3; }