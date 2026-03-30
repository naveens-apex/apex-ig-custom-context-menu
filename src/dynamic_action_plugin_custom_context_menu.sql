prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.7'
,p_default_workspace_id=>122112836002763320
,p_default_application_id=>353
,p_default_id_offset=>233661970566697581
,p_default_owner=>'EDMS'
);
end;
/
 
prompt APPLICATION 353 - COMTESS Database
--
-- Application Export:
--   Application:     353
--   Name:            COMTESS Database
--   Date and Time:   10:53 Friday March 27, 2026
--   Exported By:     INN1KOR
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 270091975318524106
--   Manifest End
--   Version:         24.2.7
--   Instance ID:     300121374931343
--

begin
  -- replace components
  wwv_flow_imp.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/dynamic_action/custom_context_menu
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(270091975318524106)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'CUSTOM_CONTEXT_MENU'
,p_display_name=>'Custom Context Menu'
,p_category=>'COMPONENT'
,p_javascript_file_urls=>'#PLUGIN_FILES#CustomContextMenu.js'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function render_custom_ig_context_menu (',
'  p_dynamic_action in apex_plugin.t_dynamic_action,',
'  p_plugin         in apex_plugin.t_plugin',
') return apex_plugin.t_dynamic_action_render_result',
'is',
'  l_result apex_plugin.t_dynamic_action_render_result;',
'begin',
'  l_result.javascript_function :=',
'    ''function(){ igCustomContextMenu.init({''',
'    || ''igStaticId: "'' || p_dynamic_action.attribute_01 || ''",''',
'    || ''isSeparator: "'' || p_dynamic_action.attribute_02 || ''",''',
'    || ''menuLabel: "'' || p_dynamic_action.attribute_03 || ''",''',
'    || ''menuIcon: "''  || p_dynamic_action.attribute_04 || ''",''',
'    || ''ajaxProcess: "'' || p_dynamic_action.attribute_05 || ''",''',
'    || ''pkColumn: "''  || p_dynamic_action.attribute_06 || ''"''',
'    || ''}); }'';',
'',
'  return l_result;',
'end;',
''))
,p_api_version=>1
,p_render_function=>'render_custom_ig_context_menu'
,p_standard_attributes=>'REGION:ONLOAD'
,p_substitute_attributes=>true
,p_version_scn=>13936775419147
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<br><h2>Interactive Grid \2013 Custom Context Menu</h2>'),
'<p>',
'    <strong>Author:</strong> Naveen Saini<br>',
'</p>',
'',
'<p>',
'    This Dynamic Action plugin adds a <strong>custom context menu entry</strong> to the',
'    <strong>row selector (hamburger menu)</strong> of an Oracle APEX Interactive Grid.',
'    The menu entry can function as a clickable action or as a visual separator and can',
'    optionally invoke an <strong>AJAX Callback process</strong> with the selected row',
'    primary keys.',
'</p>',
'',
'<p>',
'    The Dynamic Action should be executed when the Interactive Grid is available',
'    (for example, <em>Page Load</em> or <em>After Refresh</em>).',
'</p>',
'',
'<h2>Plugin Attributes</h2><br>',
unistr('<h3>Attribute 01 \2013 Interactive Grid Static ID [Required]</h3>'),
'<p>',
'	Enter the <strong>Static ID</strong> of the Interactive Grid region where the custom',
'	context menu should be added.',
'</p>',
'',
unistr('<h3>Attribute 02 \2013 Show as Separator [Optional]</h3>'),
'<p>',
'  Controls whether the menu entry is rendered as a separator instead of a clickable item.',
'</p>',
'<ul>',
unistr('  <li><strong>Y</strong> \2013 Render menu separator</li>'),
unistr('  <li><strong>N</strong> \2013 Render normal menu item (default)</li>'),
'</ul>',
'<br>',
unistr('<h3>Attribute 03 \2013 Menu Label [Required unless Separator = Y]</h3>'),
'<p>',
'  Text displayed for the custom context menu item.',
'</p>',
'<p>',
'  This value is ignored when <strong>Show as Separator</strong> is set to <strong>Y</strong>.',
'</p>',
'',
unistr('<h3>Attribute 04 \2013 Menu Icon [Optional]</h3>'),
'<p>',
'  CSS class for the icon displayed next to the menu label.',
'  Supports <strong>Font APEX</strong>, <strong>Font Awesome</strong>, or custom icon classes.',
'</p>',
'<p>',
'  Leave blank if no icon is required.',
'</p>',
'',
unistr('<h3>Attribute 05 \2013 AJAX Callback Process Name [Required unless Separator = Y]</h3>'),
'<p>',
'  Name of the <strong>AJAX Callback</strong> process defined on the page that will be',
'  executed when the menu item is clicked.',
'</p>',
'<p>',
'  The process can read selected row data using',
unistr('  <code>apex_application.g_x01</code> \2026 <code>g_x10</code>'),
'  or a JSON payload sent from JavaScript.',
'</p>',
'',
unistr('<h3>Attribute 06 \2013 Primary Key Column Name [Required unless Separator = Y]</h3>'),
'<p>',
'  Specify the database column name that represents the <strong>primary key</strong>',
'  of the Interactive Grid.',
'</p>',
'<p>',
'  This value is used to identify and pass the selected row(s) to the AJAX process.',
'</p>',
'',
'<h2>Notes</h2>',
'<ol>',
'  <li>Row Selector must be enabled in the Interactive Grid.</li>',
'  <li>Supports single and multiple row selection.</li>',
'  <li>Intended for actions such as Copy, Paste, Delete, or custom row processing.</li>',
'  <li>Compatible with standard Interactive Grid behavior and refresh cycles.</li>',
'</ol>'))
,p_version_identifier=>'1.0'
,p_files_version=>17
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(270099008933543954)
,p_plugin_id=>wwv_flow_imp.id(270091975318524106)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'IG Static ID'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(270549078538631074)
,p_plugin_id=>wwv_flow_imp.id(270091975318524106)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Add Separator'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(270099392206545082)
,p_plugin_id=>wwv_flow_imp.id(270091975318524106)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Context Menu Label'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(270549078538631074)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'N'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(270099813363546299)
,p_plugin_id=>wwv_flow_imp.id(270091975318524106)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Context Menu Icon'
,p_attribute_type=>'ICON'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(270549078538631074)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'N'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(270100101494547428)
,p_plugin_id=>wwv_flow_imp.id(270091975318524106)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'AJAX Process Name'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(270549078538631074)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'N'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(270100517569548228)
,p_plugin_id=>wwv_flow_imp.id(270091975318524106)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Primary Key Column'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(270549078538631074)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'N'
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2866756E6374696F6E20282429207B0D0A0D0A0966756E6374696F6E20696E69742863666729207B0D0A0D0A090976617220726567696F6E2020203D20617065782E726567696F6E286366672E69675374617469634964293B0D0A090976617220677269';
wwv_flow_imp.g_varchar2_table(2) := '6456696577203D20726567696F6E2E63616C6C28226765745669657773222C20226772696422293B0D0A0D0A090969662028216772696456696577207C7C202167726964566965772E726F77416374696F6E4D656E752429207B0D0A090909636F6E736F';
wwv_flow_imp.g_varchar2_table(3) := '6C652E7761726E2822477269642076696577206F7220726F77206D656E75206E6F7420726561647922293B0D0A09090972657475726E3B0D0A09097D0D0A0D0A090966756E6374696F6E20665F757365725F646566696E65645F616A61785F63616C6C62';
wwv_flow_imp.g_varchar2_table(4) := '61636B28636F6E746578745265636F726429207B0D0A0D0A090909766172206D6F64656C2020203D2067726964566965772E6D6F64656C3B0D0A090909766172207265636F726473203D2067726964566965772E67657453656C65637465645265636F72';
wwv_flow_imp.g_varchar2_table(5) := '647328293B0D0A0D0A09090969662028217265636F726473207C7C207265636F7264732E6C656E677468203D3D3D203029207B0D0A0909097265636F726473203D205B20636F6E746578745265636F7264205D3B0D0A0909097D0D0A0D0A090909766172';
wwv_flow_imp.g_varchar2_table(6) := '20706B56616C756573203D207265636F7264730D0A090909092E6D61702866756E6374696F6E202872656329207B0D0A0909090972657475726E206D6F64656C2E67657456616C7565287265632C206366672E706B436F6C756D6E293B0D0A090909097D';
wwv_flow_imp.g_varchar2_table(7) := '290D0A090909092E66696C74657228426F6F6C65616E293B0D0A0D0A0909096966202821706B56616C7565732E6C656E67746829207B0D0A09090909617065782E6D6573736167652E616C65727428224E6F2076616C696420726F77732073656C656374';
wwv_flow_imp.g_varchar2_table(8) := '656422293B0D0A0909090972657475726E3B0D0A0909097D0D0A0909090D0A0909090D0A090909617065782E7365727665722E70726F63657373280D0A090909096366672E616A617850726F636573732C0D0A090909097B200D0A09090909096630313A';
wwv_flow_imp.g_varchar2_table(9) := '20706B56616C756573200D0A090909097D2C0D0A090909097B0D0A0909090909737563636573733A2066756E6374696F6E202829207B0D0A090909090909617065782E6D6573736167652E73686F775061676553756363657373280D0A09090909090909';
wwv_flow_imp.g_varchar2_table(10) := '706B56616C7565732E6C656E677468202B202220726F772873292070726F636573736564220D0A090909090909293B0D0A090909090909726567696F6E2E7265667265736828293B0D0A09090909097D2C0D0A09090909096572726F723A2066756E6374';
wwv_flow_imp.g_varchar2_table(11) := '696F6E20287265712C207374617475732C2065727229207B0D0A090909090909617065782E6D6573736167652E616C6572742822416374696F6E206661696C65643A2022202B20657272293B0D0A09090909097D0D0A090909097D0D0A090909293B0D0A';
wwv_flow_imp.g_varchar2_table(12) := '09097D0D0A0D0A0909766172206D656E75203D2067726964566965772E726F77416374696F6E4D656E75242E6D656E7528226F7074696F6E22293B0D0A0909696620286366672E6973536570617261746F72203D3D3D2022592229200D0A09097B0D0A09';
wwv_flow_imp.g_varchar2_table(13) := '09096D656E752E6974656D732E70757368287B0D0A0909092020747970653A2022736570617261746F72220D0A0909097D293B0D0A09097D0D0A0909656C7365200D0A09097B0D0A0909096D656E752E6974656D732E70757368280D0A0909097B0D0A09';
wwv_flow_imp.g_varchar2_table(14) := '090920207479706520203A2022616374696F6E222C0D0A09090920206964202020203A202269672D637573746F6D2D6D656E75222C0D0A09090920206C6162656C203A206366672E6D656E754C6162656C2C0D0A090909202069636F6E20203A20636667';
wwv_flow_imp.g_varchar2_table(15) := '2E6D656E7549636F6E2C0D0A0909092020616374696F6E3A2066756E6374696F6E20286576656E742C20666F637573456C656D656E7429207B0D0A09090909665F757365725F646566696E65645F616A61785F63616C6C6261636B286772696456696577';
wwv_flow_imp.g_varchar2_table(16) := '2E676574436F6E746578745265636F726428666F637573456C656D656E7429293B0D0A09090920207D0D0A0909097D293B0D0A09097D0D0A097D0D0A0977696E646F772E6967437573746F6D436F6E746578744D656E75203D207B20696E69743A20696E';
wwv_flow_imp.g_varchar2_table(17) := '6974207D3B0D0A0D0A7D2928617065782E6A5175657279293B0D0A';
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(275953446099495799)
,p_plugin_id=>wwv_flow_imp.id(270091975318524106)
,p_file_name=>'CustomContextMenu.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
