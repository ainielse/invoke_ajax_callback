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
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.0'
,p_default_workspace_id=>26635660609457993075
,p_default_application_id=>213045
,p_default_id_offset=>0
,p_default_owner=>'WKSP_MCHOUCHENE'
);
end;
/
 
prompt APPLICATION 213045 - Ait_147
--
-- Application Export:
--   Application:     213045
--   Name:            Ait_147
--   Date and Time:   13:52 Friday July 5, 2024
--   Exported By:     ANTON
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 10687476967608840545
--   Manifest End
--   Version:         24.1.0
--   Instance ID:     63113759365424
--

begin
  -- replace components
  wwv_flow_imp.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/dynamic_action/invoke_ajax_callbacks
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(10687476967608840545)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'INVOKE_AJAX_CALLBACKS'
,p_display_name=>'Invoke Ajax Callback'
,p_category=>'EXECUTE'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function render ',
'  ( p_dynamic_action in apex_plugin.t_dynamic_action',
'  , p_plugin         in apex_plugin.t_plugin',
' )',
'return apex_plugin.t_dynamic_action_render_result',
'as',
'',
'l_result            apex_plugin.t_dynamic_action_render_result;',
'',
'l_items_to_submit       p_dynamic_action.attribute_02%type := p_dynamic_action.attribute_02;',
'l_with_result_action    p_dynamic_action.attribute_03%type := p_dynamic_action.attribute_03; -- NOTHING, MESSAGE, EVENT, JS_FUNCTION',
'l_custom_event          p_dynamic_action.attribute_04%type := p_dynamic_action.attribute_04;',
'l_js_function           p_dynamic_action.attribute_05%type := p_dynamic_action.attribute_05;',
'l_x01                   p_dynamic_action.attribute_06%type := p_dynamic_action.attribute_06;',
'l_x02                   p_dynamic_action.attribute_07%type := p_dynamic_action.attribute_07;',
'l_x03                   p_dynamic_action.attribute_08%type := p_dynamic_action.attribute_08;',
'',
'l_refresh_object        p_dynamic_action.attribute_15%type := p_dynamic_action.attribute_15;',
'',
'begin',
'    if l_items_to_submit is not null then',
'        l_items_to_submit := ''#'' || replace(l_items_to_submit, '','','',#'');',
'    end if;',
'    ',
'    l_result.javascript_function := q''[ function callAjaxProcess(){',
'                                                ',
'                                                var da = this;',
'                                                var vAjaxIdentifier = da.action.ajaxIdentifier;',
'                                                var processName = da.action.attribute01;                                               ',
'                                                var itemsToSubmit = da.action.attribute02;                                                                                   ',
'                                                                                                          ',
'                                                apex.server.process(',
'                                                                    processName,',
'                                                                    {',
'                                                                        ]'' || ',
'                                                                    case when l_x01 is not null then',
'                                                                        ''x01: '' || l_x01 ||'' ,''',
'                                                                        else null',
'                                                                        end',
'                                                                    ||  case when l_x02 is not null then',
'                                                                        ''x02: '' || l_x02 ||'' ,''',
'                                                                        else null',
'                                                                        end',
'                                                                    ||case when l_x03 is not null then',
'                                                                        ''x03: '' || l_x03 ||'' ,''',
'                                                                        else null',
'                                                                        end',
'                                                                    ||',
'                                                                    q''[',
'                                                                        pageItems: itemsToSubmit                                                                        ',
'                                                                        ',
'                                                                    },',
'                                                                    { ]''',
'                                                                    ||',
'                                                                    case when l_refresh_object is not null then',
'                                                                        ''refreshObject: "'' || l_refresh_object ||''", ''',
'                                                                        else null',
'                                                                        end',
'                                                                    || q''[    ',
'                                                                        success: function(data){',
'                                                                           ',
'                                                                         console.log(''success'', data.message); ',
'                                                                         ]''',
'                                                                         ||',
'                                                                         case ',
'                                                                            when l_with_result_action = ''MESSAGE'' then',
'                                                                                q''[ apex.message.showPageSuccess( data.message );]''',
'                                                                            when l_with_result_action = ''EVENT'' then',
'                                                                                q''[ $.event.trigger(da.action.attribute04, data );]''',
'                                                                            when l_with_result_action = ''JS_FUNCTION'' then',
'                                                                                l_js_function || q''[(data);]''    ',
'                                                                            else',
'                                                                                null',
'                                                                            end    ',
'                                                                    ||                                                                         ',
'                                                                         q''[',
'                                                                            apex.da.resume( da.resumeCallback, false );   ',
'                                                                        },',
'                                                                         error:function(err){',
'                                                                            apex.message.clearErrors();',
'',
'                                                                            apex.message.showErrors( [',
'                                                                                {',
'                                                                                    type:       "error",',
'                                                                                    location:   [ "page"],',
'                                                                                    message:    err.responseText,',
'                                                                                    unsafe:     false',
'                                                                                }',
'                                                                            ] );',
'                                                                                                                                ',
'                                                                        }  ',
'',
'                                                                        }',
'                                                                    );  ',
'            }',
']'';',
'                                     ',
'    l_result.ajax_identifier     := apex_plugin.get_ajax_identifier;',
'    l_result.attribute_01        := p_dynamic_action.attribute_01;',
'    l_result.attribute_02        := l_items_to_submit;',
'    l_result.attribute_03        := l_with_result_action;',
'    l_result.attribute_04        := l_custom_event;',
'    l_result.attribute_05        := l_js_function;',
'    l_result.attribute_06        := l_x01;',
'    l_result.attribute_07        := l_x02;',
'    l_result.attribute_08        := l_x03;',
'    ',
'    return l_result;',
'    ',
'end render;'))
,p_api_version=>1
,p_render_function=>'render'
,p_standard_attributes=>'STOP_EXECUTION_ON_ERROR:WAIT_FOR_RESULT'
,p_substitute_attributes=>true
,p_version_scn=>15541796279120
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Invokes an Ajax Callback process defined on the page. Parameters allow you to pass page item session state to the Ajax Callback process and to define how to process the Ajax Callback process result (pData). This will often be called by a line of Java'
||'script similar to the example below.',
'<pre>',
'javascript:apex.event.trigger(document, "giveRaise", {"empno":"#EMPNO#","raiseAmount":"25%"});',
'</pre>'))
,p_version_identifier=>'1'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(11206776545199496986)
,p_plugin_id=>wwv_flow_imp.id(10687476967608840545)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Process'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_examples=>'GIVE_RAISE'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter the name of an Ajax Callback process. The process should include JSON output that indicates that it was successful.',
'',
'<pre>',
'    apex_json.open_object;',
'    apex_json.write(''message'', ''Raise Given!'');',
'    apex_json.close_object;',
'</pre>',
'',
'Any output that does not include JSON with a "message" element will result in an error message being shown. For example, if the process includes',
'<pre>',
'    htp.p(''Invalid employee!'');',
'</pre>',
'this plug-in will show an error message: Invalid employee!'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(11206759193414246791)
,p_plugin_id=>wwv_flow_imp.id(10687476967608840545)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Items to Submit'
,p_attribute_type=>'PAGE ITEMS'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(11363827440425548017)
,p_plugin_id=>wwv_flow_imp.id(10687476967608840545)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'With Result Action'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'NOTHING'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Select what action to take after invoking the Ajax Callback process. The process result (pData) will be passed to the selected event.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(6054840257653112238)
,p_plugin_attribute_id=>wwv_flow_imp.id(11363827440425548017)
,p_display_sequence=>5
,p_display_value=>'Do Nothing / Ignore'
,p_return_value=>'NOTHING'
,p_help_text=>'Do nothing with (ignore) the result of the Ajax Callback process.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(11364352143434551468)
,p_plugin_attribute_id=>wwv_flow_imp.id(11363827440425548017)
,p_display_sequence=>10
,p_display_value=>'Display Message'
,p_return_value=>'MESSAGE'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Display the result of the Ajax Callback process (pData) as an APEX success message. When returning a message your Ajax Callback process must return valid JSON with a "message" element. For example:',
'<pre>',
'    apex_json.open_object;',
'    apex_json.write(''message'', ''Raise Given!'');',
'    apex_json.close_object;',
'</pre>'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(11364411853709555796)
,p_plugin_attribute_id=>wwv_flow_imp.id(11363827440425548017)
,p_display_sequence=>20
,p_display_value=>'Raise Custom Event'
,p_return_value=>'EVENT'
,p_help_text=>'Raise the custom event defined below passing the Ajax Callback process result (pData) to the custom event.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(11364040176402814458)
,p_plugin_attribute_id=>wwv_flow_imp.id(11363827440425548017)
,p_display_sequence=>30
,p_display_value=>'Call Javascript Function'
,p_return_value=>'JS_FUNCTION'
,p_help_text=>'Call the Javascript function defined below passing the Ajax Callback process result (pData) to the custom event.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(5688152675464009054)
,p_plugin_id=>wwv_flow_imp.id(10687476967608840545)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Custom Event Name'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(11363827440425548017)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'EVENT'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(5687524980851756763)
,p_plugin_id=>wwv_flow_imp.id(10687476967608840545)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Javascript Function Name'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(11363827440425548017)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'JS_FUNCTION'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(6095468745519669090)
,p_plugin_id=>wwv_flow_imp.id(10687476967608840545)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Set x01'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul>',
'<li>this.data.empno</li>',
'<li>this.data.raiseAmount</li>',
'<li>"test"</li>',
'</ul>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter a Javascript expression. The parameter x01 will be set to this value. This value can be referenced in your Ajax Callback process using:',
'<pre>',
'begin',
'    update emp ',
'      set sal = sal * 1.25',
'      where empno = apex_application.g_x01;',
'',
'    apex_json.open_object;',
'    apex_json.write(''message'', ''Raise Given!'');',
'    apex_json.close_object;',
'end;    ',
'</pre>',
'<br>',
'To enter a static value, surround it by double quotes (""). The most common scenario is to pass a JSON Object to the custom event. For example',
'<pre>',
'{"empno":"#EMPNO#","raiseAmount":"30%"}',
'</pre>',
'or',
'<pre>',
'{"empno":"&EMPNO.","raiseAmount":"30%"}',
'</pre>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(6124225131183998883)
,p_plugin_id=>wwv_flow_imp.id(10687476967608840545)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Set x02'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul>',
'<li>this.data.empno</li>',
'<li>this.data.raiseAmount</li>',
'<li>"test"</li>',
'</ul>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter a Javascript expression. The parameter x02 will be set to this value. This value can be referenced in your Ajax Callback process using :',
'<pre>',
'begin',
'    update emp ',
'      set sal = sal * apex_application.g_x02',
'      where empno = apex_application.g_x01;',
'',
'    apex_json.open_object;',
'    apex_json.write(''message'', ''Raise Given!'');',
'    apex_json.close_object;',
'end;    ',
'</pre>',
'<br>',
'To enter a static value, surround it by double quotes (""). The most common scenario is to pass a JSON Object to the custom event. For example',
'<pre>',
'{"empno":"#EMPNO#","raiseAmount":"30%"}',
'</pre>',
'or',
'<pre>',
'{"empno":"&EMPNO.","raiseAmount":"30%"}',
'</pre>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(6124310024897013310)
,p_plugin_id=>wwv_flow_imp.id(10687476967608840545)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Set x03'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul>',
'<li>this.data.empno</li>',
'<li>this.data.raiseAmount</li>',
'<li>"test"</li>',
'</ul>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter a Javascript expression. The parameter x03 will be set to this value. This value can be referenced in your Ajax Callback process using:',
'<pre>',
'',
'begin',
'    update emp ',
'      set sal = sal * 1.25',
'      where empno = apex_application.g_x01;',
'',
'    apex_json.open_object;',
'    apex_json.write(''message'', ''Raise Given!'');',
'    apex_json.close_object;',
'end;    ',
'</pre>',
'<br>',
'To enter a static value, surround it by double quotes (""). The most common scenario is to pass a JSON Object to the custom event. For example',
'<pre>',
'{"empno":"#EMPNO#","raiseAmount":"30%"}',
'</pre>',
'or',
'<pre>',
'{"empno":"&EMPNO.","raiseAmount":"30%"}',
'</pre>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(6105802227550763788)
,p_plugin_id=>wwv_flow_imp.id(10687476967608840545)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>15
,p_display_sequence=>150
,p_prompt=>'Refresh Object (jQuery Selector)'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'A jQuery selector string, jQuery object, or Element that identifies the DOM element that the apex.event:apexbeforerefresh and apex.event:apexafterrefresh events are triggered on. If this option is not supplied these events are not triggered.'
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
