prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_180200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2018.05.24'
,p_release=>'18.2.0.00.12'
,p_default_workspace_id=>21717127411908241868
,p_default_application_id=>103428
,p_default_owner=>'RD_DEV'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/apex_item_toolbar
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(7604686537917301296)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'APEX.ITEM.TOOLBAR'
,p_display_name=>'APEX Item Toolbar'
,p_category=>'EXECUTE'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'FUNCTION F_RENDER (',
'        P_DYNAMIC_ACTION   IN APEX_PLUGIN.T_DYNAMIC_ACTION,',
'        P_PLUGIN           IN APEX_PLUGIN.T_PLUGIN',
'    ) RETURN APEX_PLUGIN.T_DYNAMIC_ACTION_RENDER_RESULT AS',
'        VR_RESULT         APEX_PLUGIN.T_DYNAMIC_ACTION_RENDER_RESULT;',
'    BEGIN',
'',
'        APEX_JAVASCRIPT.ADD_LIBRARY(',
'            P_NAME        => ''script.min'',',
'            P_DIRECTORY   => P_PLUGIN.FILE_PREFIX,',
'            P_VERSION     => NULL,',
'            P_KEY         => ''itemToolbar''',
'        );',
'',
'        VR_RESULT.JAVASCRIPT_FUNCTION   := ''',
'        function () { ',
'               itemToolbar(this, '' ||',
'                       APEX_JAVASCRIPT.ADD_VALUE( P_DYNAMIC_ACTION.ATTRIBUTE_01, TRUE ) ||',
'                       APEX_JAVASCRIPT.ADD_VALUE( P_DYNAMIC_ACTION.ATTRIBUTE_02, TRUE ) ||',
'                       APEX_JAVASCRIPT.ADD_VALUE( P_DYNAMIC_ACTION.ATTRIBUTE_03, FALSE ) ||',
'        ''); }'';',
'',
'        RETURN VR_RESULT;',
'    END;'))
,p_api_version=>1
,p_render_function=>'F_RENDER'
,p_standard_attributes=>'ITEM'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This plug-in is used to add a toolbar to textfield or textarea items. ',
'The following toolbars are available:',
'- Add Emojis',
'- Format String with HTML',
'- Uno & Redo Option',
'- Empty the item'))
,p_version_identifier=>'2.0'
,p_about_url=>'https://github.com/RonnyWeiss/APEX-Item-Toolbar'
,p_files_version=>1442
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(7792132431957084857)
,p_plugin_id=>wwv_flow_api.id(7604686537917301296)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Types'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>true
,p_default_value=>'undoredo:clear:emoji:format'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7792150701404089256)
,p_plugin_attribute_id=>wwv_flow_api.id(7792132431957084857)
,p_display_sequence=>10
,p_display_value=>'Undo and Redo'
,p_return_value=>'undoredo'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7801074094403618640)
,p_plugin_attribute_id=>wwv_flow_api.id(7792132431957084857)
,p_display_sequence=>20
,p_display_value=>'Clear'
,p_return_value=>'clear'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7792147727904086730)
,p_plugin_attribute_id=>wwv_flow_api.id(7792132431957084857)
,p_display_sequence=>30
,p_display_value=>'Emojis'
,p_return_value=>'emoji'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7792149690051087943)
,p_plugin_attribute_id=>wwv_flow_api.id(7792132431957084857)
,p_display_sequence=>40
,p_display_value=>'Format Text Bold, Italic, Sub or Underline'
,p_return_value=>'format'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(7833815672533009882)
,p_plugin_id=>wwv_flow_api.id(7604686537917301296)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Format Types'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>true
,p_default_value=>'b:i:u:s'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(7792132431957084857)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'format'
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7833822269035011123)
,p_plugin_attribute_id=>wwv_flow_api.id(7833815672533009882)
,p_display_sequence=>10
,p_display_value=>'Bold'
,p_return_value=>'b'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7833824638173012077)
,p_plugin_attribute_id=>wwv_flow_api.id(7833815672533009882)
,p_display_sequence=>20
,p_display_value=>'Italic'
,p_return_value=>'i'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7833836168911012887)
,p_plugin_attribute_id=>wwv_flow_api.id(7833815672533009882)
,p_display_sequence=>30
,p_display_value=>'Underline'
,p_return_value=>'u'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7833837641727013543)
,p_plugin_attribute_id=>wwv_flow_api.id(7833815672533009882)
,p_display_sequence=>40
,p_display_value=>'Subtext'
,p_return_value=>'s'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(7837818830036087899)
,p_plugin_id=>wwv_flow_api.id(7604686537917301296)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Emoji Types'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>true
,p_default_value=>'1:2:4:5:6:7:8:9:10:12:14:18:23'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(7792132431957084857)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'emoji'
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7837821758864089461)
,p_plugin_attribute_id=>wwv_flow_api.id(7837818830036087899)
,p_display_sequence=>10
,p_display_value=>unistr('\D83D\DE00 - Grinning face')
,p_return_value=>'1'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7837969935708091504)
,p_plugin_attribute_id=>wwv_flow_api.id(7837818830036087899)
,p_display_sequence=>20
,p_display_value=>unistr('\D83D\DE02 - Face with tears of joy')
,p_return_value=>'2'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7838044922400112187)
,p_plugin_attribute_id=>wwv_flow_api.id(7837818830036087899)
,p_display_sequence=>30
,p_display_value=>unistr('\D83D\DE05 - Grinning face with sweat')
,p_return_value=>'3'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7838246057315116280)
,p_plugin_attribute_id=>wwv_flow_api.id(7837818830036087899)
,p_display_sequence=>40
,p_display_value=>unistr('\D83D\DE08 - Smiling face with horns')
,p_return_value=>'4'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7838510155123124934)
,p_plugin_attribute_id=>wwv_flow_api.id(7837818830036087899)
,p_display_sequence=>50
,p_display_value=>unistr('\D83D\DE09 - Winking face')
,p_return_value=>'5'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7838696685210132099)
,p_plugin_attribute_id=>wwv_flow_api.id(7837818830036087899)
,p_display_sequence=>60
,p_display_value=>unistr('\D83D\DE0B - Face savoring food')
,p_return_value=>'6'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7838684768370132805)
,p_plugin_attribute_id=>wwv_flow_api.id(7837818830036087899)
,p_display_sequence=>70
,p_display_value=>unistr('\D83D\DE0E - Smiling face with sunglasses')
,p_return_value=>'7'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7838703567612136217)
,p_plugin_attribute_id=>wwv_flow_api.id(7837818830036087899)
,p_display_sequence=>80
,p_display_value=>unistr('\D83D\DE10 - Neutral face')
,p_return_value=>'8'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7838717422308138916)
,p_plugin_attribute_id=>wwv_flow_api.id(7837818830036087899)
,p_display_sequence=>90
,p_display_value=>unistr('\D83D\DE12 - Unamused face')
,p_return_value=>'9'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7838728294674141383)
,p_plugin_attribute_id=>wwv_flow_api.id(7837818830036087899)
,p_display_sequence=>100
,p_display_value=>unistr('\D83D\DE21 - Pouting face')
,p_return_value=>'10'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7839036652615145980)
,p_plugin_attribute_id=>wwv_flow_api.id(7837818830036087899)
,p_display_sequence=>110
,p_display_value=>unistr('\D83D\DE24 - Face with steam from nose')
,p_return_value=>'11'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7839038313602148026)
,p_plugin_attribute_id=>wwv_flow_api.id(7837818830036087899)
,p_display_sequence=>120
,p_display_value=>unistr('\D83D\DE31 - Face screaming in fear')
,p_return_value=>'12'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7840112562994208281)
,p_plugin_attribute_id=>wwv_flow_api.id(7837818830036087899)
,p_display_sequence=>130
,p_display_value=>unistr('\D83D\DC97 - Growing heart')
,p_return_value=>'13'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7840421007190255299)
,p_plugin_attribute_id=>wwv_flow_api.id(7837818830036087899)
,p_display_sequence=>140
,p_display_value=>unistr('\2714\FE0F - Heavy Check Mark')
,p_return_value=>'14'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7840421855374256047)
,p_plugin_attribute_id=>wwv_flow_api.id(7837818830036087899)
,p_display_sequence=>150
,p_display_value=>unistr('\D83D\DC4D\D83C\DFFB - Thumbs up')
,p_return_value=>'15'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7840637934880265772)
,p_plugin_attribute_id=>wwv_flow_api.id(7837818830036087899)
,p_display_sequence=>160
,p_display_value=>unistr('\2708\FE0F - Airplane')
,p_return_value=>'16'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7840631863706271252)
,p_plugin_attribute_id=>wwv_flow_api.id(7837818830036087899)
,p_display_sequence=>170
,p_display_value=>unistr('\2B50 - Star')
,p_return_value=>'17'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7840644031465270126)
,p_plugin_attribute_id=>wwv_flow_api.id(7837818830036087899)
,p_display_sequence=>180
,p_display_value=>unistr('\274C - X')
,p_return_value=>'18'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7840655788662272055)
,p_plugin_attribute_id=>wwv_flow_api.id(7837818830036087899)
,p_display_sequence=>190
,p_display_value=>unistr('\2757 - Exclamation')
,p_return_value=>'19'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7840659438422275266)
,p_plugin_attribute_id=>wwv_flow_api.id(7837818830036087899)
,p_display_sequence=>200
,p_display_value=>unistr('\2615 - Coffee')
,p_return_value=>'20'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7840663056101277789)
,p_plugin_attribute_id=>wwv_flow_api.id(7837818830036087899)
,p_display_sequence=>210
,p_display_value=>unistr('\260E\FE0F - Telephone')
,p_return_value=>'21'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7840651411323282108)
,p_plugin_attribute_id=>wwv_flow_api.id(7837818830036087899)
,p_display_sequence=>220
,p_display_value=>unistr('\D83D\DCA3 - Bomb')
,p_return_value=>'22'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7840655176008284957)
,p_plugin_attribute_id=>wwv_flow_api.id(7837818830036087899)
,p_display_sequence=>230
,p_display_value=>unistr('\26A0\FE0F - Warning')
,p_return_value=>'23'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7841151102085297580)
,p_plugin_attribute_id=>wwv_flow_api.id(7837818830036087899)
,p_display_sequence=>240
,p_display_value=>unistr('\D83D\DD0D - Mag')
,p_return_value=>'24'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7841137234746301507)
,p_plugin_attribute_id=>wwv_flow_api.id(7837818830036087899)
,p_display_sequence=>250
,p_display_value=>unistr('\D83D\DCC6 - Calendar')
,p_return_value=>'25'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := 'EFBBBF5468697320736F667477617265206973206C6963656E73656420756E6465723A0A0A4D4954204C6963656E73650A0A436F7079726967687420286329203230313820526F6E6E7920576569C39F0A0A5065726D697373696F6E2069732068657265';
wwv_flow_api.g_varchar2_table(2) := '6279206772616E7465642C2066726565206F66206368617267652C20746F20616E7920706572736F6E206F627461696E696E67206120636F7079206F66207468697320736F66747761726520616E64206173736F63696174656420646F63756D656E7461';
wwv_flow_api.g_varchar2_table(3) := '74696F6E2066696C657320287468652022536F66747761726522292C20746F206465616C20696E2074686520536F66747761726520776974686F7574207265737472696374696F6E2C20696E636C7564696E6720776974686F7574206C696D6974617469';
wwv_flow_api.g_varchar2_table(4) := '6F6E207468652072696768747320746F207573652C20636F70792C206D6F646966792C206D657267652C207075626C6973682C20646973747269627574652C207375626C6963656E73652C20616E642F6F722073656C6C20636F70696573206F66207468';
wwv_flow_api.g_varchar2_table(5) := '6520536F6674776172652C20616E6420746F207065726D697420706572736F6E7320746F2077686F6D2074686520536F667477617265206973206675726E697368656420746F20646F20736F2C207375626A65637420746F2074686520666F6C6C6F7769';
wwv_flow_api.g_varchar2_table(6) := '6E6720636F6E646974696F6E733A0A0A5468652061626F766520636F70797269676874206E6F7469636520616E642074686973207065726D697373696F6E206E6F74696365207368616C6C20626520696E636C7564656420696E20616C6C20636F706965';
wwv_flow_api.g_varchar2_table(7) := '73206F72207375627374616E7469616C20706F7274696F6E73206F662074686520536F6674776172652E0A0A54484520534F4654574152452049532050524F564944454420224153204953222C20574954484F55542057415252414E5459204F4620414E';
wwv_flow_api.g_varchar2_table(8) := '59204B494E442C2045585052455353204F5220494D504C4945442C20494E434C5544494E4720425554204E4F54204C494D4954454420544F205448452057415252414E54494553204F46204D45524348414E544142494C4954592C204649544E45535320';
wwv_flow_api.g_varchar2_table(9) := '464F52204120504152544943554C415220505552504F534520414E44204E4F4E494E4652494E47454D454E542E20494E204E4F204556454E54205348414C4C2054484520415554484F5253204F5220434F5059524947485420484F4C4445525320424520';
wwv_flow_api.g_varchar2_table(10) := '4C4941424C4520464F5220414E5920434C41494D2C2044414D41474553204F52204F54484552204C494142494C4954592C205748455448455220494E20414E20414354494F4E204F4620434F4E54524143542C20544F5254204F52204F54484552574953';
wwv_flow_api.g_varchar2_table(11) := '452C2041524953494E472046524F4D2C204F5554204F46204F5220494E20434F4E4E454354494F4E20574954482054484520534F465457415245204F522054484520555345204F52204F54484552204445414C494E475320494E2054484520534F465457';
wwv_flow_api.g_varchar2_table(12) := '4152452E0A0A6A51756572793A0D0A0D0A68747470733A2F2F6769746875622E636F6D2F6A71756572792F6A71756572793A0D0A0D0A436F70797269676874204A5320466F756E646174696F6E20616E64206F7468657220636F6E7472696275746F7273';
wwv_flow_api.g_varchar2_table(13) := '2C2068747470733A2F2F6A732E666F756E646174696F6E2F0D0A0D0A5468697320736F66747761726520636F6E7369737473206F6620766F6C756E7461727920636F6E747269627574696F6E73206D616465206279206D616E790D0A696E646976696475';
wwv_flow_api.g_varchar2_table(14) := '616C732E20466F7220657861637420636F6E747269627574696F6E20686973746F72792C2073656520746865207265766973696F6E20686973746F72790D0A617661696C61626C652061742068747470733A2F2F6769746875622E636F6D2F6A71756572';
wwv_flow_api.g_varchar2_table(15) := '792F6A71756572790D0A0D0A54686520666F6C6C6F77696E67206C6963656E7365206170706C69657320746F20616C6C207061727473206F66207468697320736F667477617265206578636570742061730D0A646F63756D656E7465642062656C6F773A';
wwv_flow_api.g_varchar2_table(16) := '0D0A0D0A3D3D3D3D0D0A0D0A5065726D697373696F6E20697320686572656279206772616E7465642C2066726565206F66206368617267652C20746F20616E7920706572736F6E206F627461696E696E670D0A6120636F7079206F66207468697320736F';
wwv_flow_api.g_varchar2_table(17) := '66747761726520616E64206173736F63696174656420646F63756D656E746174696F6E2066696C657320287468650D0A22536F66747761726522292C20746F206465616C20696E2074686520536F66747761726520776974686F75742072657374726963';
wwv_flow_api.g_varchar2_table(18) := '74696F6E2C20696E636C7564696E670D0A776974686F7574206C696D69746174696F6E207468652072696768747320746F207573652C20636F70792C206D6F646966792C206D657267652C207075626C6973682C0D0A646973747269627574652C207375';
wwv_flow_api.g_varchar2_table(19) := '626C6963656E73652C20616E642F6F722073656C6C20636F70696573206F662074686520536F6674776172652C20616E6420746F0D0A7065726D697420706572736F6E7320746F2077686F6D2074686520536F667477617265206973206675726E697368';
wwv_flow_api.g_varchar2_table(20) := '656420746F20646F20736F2C207375626A65637420746F0D0A74686520666F6C6C6F77696E6720636F6E646974696F6E733A0D0A0D0A5468652061626F766520636F70797269676874206E6F7469636520616E642074686973207065726D697373696F6E';
wwv_flow_api.g_varchar2_table(21) := '206E6F74696365207368616C6C2062650D0A696E636C7564656420696E20616C6C20636F70696573206F72207375627374616E7469616C20706F7274696F6E73206F662074686520536F6674776172652E0D0A0D0A54484520534F465457415245204953';
wwv_flow_api.g_varchar2_table(22) := '2050524F564944454420224153204953222C20574954484F55542057415252414E5459204F4620414E59204B494E442C0D0A45585052455353204F5220494D504C4945442C20494E434C5544494E4720425554204E4F54204C494D4954454420544F2054';
wwv_flow_api.g_varchar2_table(23) := '48452057415252414E54494553204F460D0A4D45524348414E544142494C4954592C204649544E45535320464F52204120504152544943554C415220505552504F534520414E440D0A4E4F4E494E4652494E47454D454E542E20494E204E4F204556454E';
wwv_flow_api.g_varchar2_table(24) := '54205348414C4C2054484520415554484F5253204F5220434F5059524947485420484F4C444552532042450D0A4C4941424C4520464F5220414E5920434C41494D2C2044414D41474553204F52204F54484552204C494142494C4954592C205748455448';
wwv_flow_api.g_varchar2_table(25) := '455220494E20414E20414354494F4E0D0A4F4620434F4E54524143542C20544F5254204F52204F54484552574953452C2041524953494E472046524F4D2C204F5554204F46204F5220494E20434F4E4E454354494F4E0D0A574954482054484520534F46';
wwv_flow_api.g_varchar2_table(26) := '5457415245204F522054484520555345204F52204F54484552204445414C494E475320494E2054484520534F4654574152452E0D0A0D0A3D3D3D3D0D0A0D0A416C6C2066696C6573206C6F636174656420696E20746865206E6F64655F6D6F64756C6573';
wwv_flow_api.g_varchar2_table(27) := '20616E642065787465726E616C206469726563746F72696573206172650D0A65787465726E616C6C79206D61696E7461696E6564206C69627261726965732075736564206279207468697320736F66747761726520776869636820686176652074686569';
wwv_flow_api.g_varchar2_table(28) := '720D0A6F776E206C6963656E7365733B207765207265636F6D6D656E6420796F752072656164207468656D2C206173207468656972207465726D73206D6179206469666665722066726F6D0D0A746865207465726D732061626F76652E';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(7604689191075301312)
,p_plugin_id=>wwv_flow_api.id(7604686537917301296)
,p_file_name=>'LICENSE'
,p_mime_type=>'application/octet-stream'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '66756E6374696F6E206974656D546F6F6C62617228652C742C612C6E297B2275736520737472696374223B242E65616368282428652E6166666563746564456C656D656E7473292C66756E6374696F6E28652C73297B696628242873292E697328227465';
wwv_flow_api.g_varchar2_table(2) := '78746172656122297C7C2274657874223D3D242873292E617474722822747970652229297B76617220693D242873292E636C6F7365737428226469762E742D466F726D2D696E707574436F6E7461696E657222292C723D22312E34656D222C6F3D5B5D2C';
wwv_flow_api.g_varchar2_table(3) := '703D302C6C3D742E73706C697428223A22292C633D28612E73706C697428223A22292C6E2E73706C697428223A2229292C753D21302C643D5B2226233132383531333B222C2226233132383531343B222C2226233132383531373B222C22262331323835';
wwv_flow_api.g_varchar2_table(4) := '32303B222C2226233132383532313B222C2226233132383532333B222C2226233132383532363B222C2226233132383532383B222C2226233132383533303B222C2226233132383534353B222C2226233132383534383B222C2226233132383536313B22';
wwv_flow_api.g_varchar2_table(5) := '2C22262331303038343B222C22262331303030343B222C2226233132383037373B222C222623393939323B222C22262331313038383B222C22262331303036303B222C22262331303037313B222C222623393734393B222C222623393734323B222C2226';
wwv_flow_api.g_varchar2_table(6) := '233132383136333B222C222623393838383B222C2226233132383236393B222C2226233132383139383B225D2C683D5B5D3B666F7228653D303B653C632E6C656E6774683B652B2B29635B655D3D2B635B655D3B653D303B666F722876617220673D642E';
wwv_flow_api.g_varchar2_table(7) := '6C656E6774683B653C673B652B2B29242E696E417272617928652B312C63293E3D302626682E7075736828645B655D293B76617220663D5B7B747970653A2262222C73746172743A223C623E222C656E643A223C2F623E222C69636F6E3A2266612D626F';
wwv_flow_api.g_varchar2_table(8) := '6C64227D2C7B747970653A2269222C73746172743A223C693E222C656E643A223C2F693E222C69636F6E3A2266612D6974616C6963227D2C7B747970653A2275222C73746172743A223C753E222C656E643A223C2F753E222C69636F6E3A2266612D756E';
wwv_flow_api.g_varchar2_table(9) := '6465726C696E65227D2C7B747970653A2273222C73746172743A223C7375623E222C656E643A223C2F7375623E222C69636F6E3A2266612D737562736372697074227D5D2C6D3D5B5D3B666F7228653D302C673D662E6C656E6774683B653C673B652B2B';
wwv_flow_api.g_varchar2_table(10) := '29242E696E417272617928665B655D2E747970652C61293E3D3026266D2E7075736828665B655D293B76617220783D5B7B747970653A22756E646F222C69636F6E3A2266612D756E646F227D2C7B747970653A227265646F222C69636F6E3A2266612D72';
wwv_flow_api.g_varchar2_table(11) := '6570656174227D5D2C623D2428223C7370616E3E3C2F7370616E3E22293B622E616464436C6173732822742D466F726D2D696E6C696E6548656C7022293B66756E6374696F6E207628297B76617220653D2428223C7370616E3E3C2F7370616E3E22293B';
wwv_flow_api.g_varchar2_table(12) := '652E63737328226D617267696E2D7269676874222C2235707822292C652E63737328226D617267696E2D6C656674222C2235707822292C622E617070656E642865297D242E65616368286C2C66756E6374696F6E28652C74297B22756E646F7265646F22';
wwv_flow_api.g_varchar2_table(13) := '3D3D74262628242873292E6B6579646F776E2866756E6374696F6E28297B6F2E7075736828617065782E6974656D2873292E67657456616C75652829292C703D6F2E6C656E6774687D292C242E6561636828782C66756E6374696F6E28652C74297B7661';
wwv_flow_api.g_varchar2_table(14) := '7220613D2428223C7370616E3E3C2F7370616E3E22293B612E616464436C61737328226974656D2D746F6F6C62617222292C612E616464436C6173732822666122292C612E616464436C61737328742E69636F6E292C612E6373732822637572736F7222';
wwv_flow_api.g_varchar2_table(15) := '2C22706F696E74657222292C612E6373732822666F6E742D73697A65222C72292C612E63737328226C696E652D686569676874222C22312E36656D22292C612E63737328226D617267696E2D7269676874222C2232707822292C612E6174747228226172';
wwv_flow_api.g_varchar2_table(16) := '69612D68696464656E222C227472756522292C612E6F6E2822636C69636B222C66756E6374696F6E28297B22756E646F223D3D742E747970653F703E30262628703D3D6F2E6C656E6774682626617065782E6974656D2873292E67657456616C75652829';
wwv_flow_api.g_varchar2_table(17) := '213D6F5B6F2E6C656E6774682D315D26266F2E7075736828617065782E6974656D2873292E67657456616C75652829292C702D2D2C617065782E6974656D2873292E73657456616C7565286F5B705D29293A703C6F2E6C656E6774682D31262628702B2B';
wwv_flow_api.g_varchar2_table(18) := '2C617065782E6974656D2873292E73657456616C7565286F5B705D29297D292C622E617070656E642861297D292C6C2E6C656E6774683E312626762829292C22636C656172223D3D742626282166756E6374696F6E28297B76617220653D2428223C7370';
wwv_flow_api.g_varchar2_table(19) := '616E3E3C2F7370616E3E22293B652E616464436C61737328226974656D2D746F6F6C62617222292C652E616464436C6173732822666122292C652E616464436C617373282266612D72656D6F766522292C652E6373732822637572736F72222C22706F69';
wwv_flow_api.g_varchar2_table(20) := '6E74657222292C652E6373732822666F6E742D73697A65222C72292C652E63737328226C696E652D686569676874222C22312E36656D22292C652E63737328226D617267696E2D7269676874222C2232707822292C652E617474722822617269612D6869';
wwv_flow_api.g_varchar2_table(21) := '6464656E222C227472756522292C652E6F6E2822636C69636B222C66756E6374696F6E28297B242E696E41727261792822756E646F7265646F222C6C293E3D302626286F2E7075736828617065782E6974656D2873292E67657456616C75652829292C70';
wwv_flow_api.g_varchar2_table(22) := '3D6F2E6C656E677468292C617065782E6974656D2873292E73657456616C7565282222297D292C622E617070656E642865297D28292C6C2E6C656E6774683E312626762829292C22656D6F6A69223D3D74262628242E6561636828682C66756E6374696F';
wwv_flow_api.g_varchar2_table(23) := '6E28652C74297B76617220613D2428223C7370616E3E3C2F7370616E3E22293B612E616464436C61737328226974656D2D746F6F6C62617222292C612E6373732822637572736F72222C22706F696E74657222292C612E6373732822666F6E742D73697A';
wwv_flow_api.g_varchar2_table(24) := '65222C72292C612E63737328226C696E652D686569676874222C22312E35656D22292C612E63737328226D617267696E2D7269676874222C2232707822292C612E68746D6C2874292C612E6F6E2822636C69636B222C66756E6374696F6E28297B766172';
wwv_flow_api.g_varchar2_table(25) := '20653D242873292E70726F70282273656C656374696F6E537461727422292C743D242E7472696D28242874686973292E746578742829292C613D617065782E6974656D2873292E67657456616C756528293B242E696E41727261792822756E646F726564';
wwv_flow_api.g_varchar2_table(26) := '6F222C6C293E3D302626286F2E707573682861292C703D6F2E6C656E677468292C752626303D3D653F612B3D743A613D612E737562737472696E6728302C65292B742B612E737562737472696E6728652C612E6C656E677468292C617065782E6974656D';
wwv_flow_api.g_varchar2_table(27) := '2873292E73657456616C75652861297D292C622E617070656E642861297D292C6C2E6C656E6774683E312626762829292C22666F726D6174223D3D742626242E65616368286D2C66756E6374696F6E28652C74297B76617220613D2428223C7370616E3E';
wwv_flow_api.g_varchar2_table(28) := '3C2F7370616E3E22293B612E616464436C61737328226974656D2D746F6F6C62617222292C612E616464436C6173732822666122292C612E616464436C61737328742E69636F6E292C612E6373732822637572736F72222C22706F696E74657222292C61';
wwv_flow_api.g_varchar2_table(29) := '2E6373732822666F6E742D73697A65222C72292C612E63737328226C696E652D686569676874222C22312E36656D22292C612E63737328226D617267696E2D7269676874222C2232707822292C612E617474722822617269612D68696464656E222C2274';
wwv_flow_api.g_varchar2_table(30) := '72756522292C612E6F6E2822636C69636B222C66756E6374696F6E28297B76617220653D242873292E70726F70282273656C656374696F6E537461727422292C613D242873292E70726F70282273656C656374696F6E456E6422292C6E3D617065782E69';
wwv_flow_api.g_varchar2_table(31) := '74656D2873292E67657456616C756528293B242E696E41727261792822756E646F7265646F222C6C293E3D302626286F2E70757368286E292C703D6F2E6C656E677468293B76617220693D6E2E737562737472696E6728652C61293B6E3D6E2E73756273';
wwv_flow_api.g_varchar2_table(32) := '7472696E6728302C65292B742E73746172742B692B742E656E642B6E2E737562737472696E6728612C6E2E6C656E677468292C617065782E6974656D2873292E73657456616C7565286E297D292C622E617070656E642861297D297D293B76617220793D';
wwv_flow_api.g_varchar2_table(33) := '242869292E66696E6428222E742D466F726D2D6974656D5772617070657222293B622E696E7365727441667465722879297D7D297D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(7605204053699342344)
,p_plugin_id=>wwv_flow_api.id(7604686537917301296)
,p_file_name=>'script.min.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
