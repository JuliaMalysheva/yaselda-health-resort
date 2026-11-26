<?php
include('config.php');
include('connect.php');
include(PATH_INCLUDE .'functions.php');
$url_site = $_SERVER['REQUEST_URI'];
$URL = parse_url($url_site);
$url_site = $URL['path'];
$url_site .= (substr($url_site, -1) == '/') ? '' : '/';
$page_info = My_Parse_URL($url_site);
if($page_info['error'] == 404){
    echo 'error';
    exit;}
switch($page_info['template_id']){
    case '1':
        $template = Get_Template('index.tpl');
        $page = str_replace('{MENU}', Menu(), $page_info['page_text']);
        $marker = array('{PAGE_TEXT}', '{LAST_BLOCK}', '{FOOTER}');
        $marker_info = array($page, LastBlock(), Footer());
        $page = str_replace($marker, $marker_info, $template);
        $page = str_replace('{SITE}', SITE, $page);
        break;
    case '2':
        $template = Get_Template('about.tpl');
        $marker = array('{MENU}', '{FOOTER}', '{LAST_BLOCK}', '{H1}','{CRUMBS}', '{BACKGROUND}', '{PAGE_TEXT}');
        $marker_info = array(Menu(), Footer(), LastBlock(), $page_info['h1'],  $page_info['crumbs'], $page_info['background'], $page_info['page_text']);
        $page = str_replace($marker, $marker_info, $template);
        $page = str_replace('{SITE}', SITE, $page);
        break;
    case '3':
        $template = Get_Template('doctors.tpl');
        $page_text = str_replace('{DOCTOR_SLIDER}', SliderDoctors(), $page_info['page_text']);
        $page_text = str_replace('{DOCTORS}', Doctors(), $page_text);
        $marker = array('{MENU}', '{FOOTER}', '{LAST_BLOCK}', '{H1}','{CRUMBS}', '{BACKGROUND}', '{PAGE_TEXT}');
        $marker_info = array(Menu(), Footer(), LastBlock(), $page_info['h1'],  $page_info['crumbs'], $page_info['background'], $page_text);
        $page = str_replace($marker, $marker_info, $template);
        $page = str_replace('{SITE}', SITE, $page);
        break;
    case '4':
        $template = Get_Template('living_rooms.tpl');
        $marker = array('{MENU}', '{FOOTER}', '{LAST_BLOCK}', '{H1}','{CRUMBS}', '{BACKGROUND}', '{ROOM_CARDS}');
        $marker_info = array(Menu(), Footer(), LastBlock(), $page_info['h1'],  $page_info['crumbs'], $page_info['background'], RoomCards(0));
        $page = str_replace($marker, $marker_info, $template);
        $page = str_replace('{SITE}', SITE, $page);
        break;
    case '5':
        $template = Get_Template('oneperson_room.tpl');
        $page_text = str_replace('{ROOM_CARDS}', RoomCards(1), $page_info['page_text']);
        $page_text = str_replace('{SLIDER}', SliderRoom(5), $page_text);
        $marker = array('{MENU}', '{FOOTER}', '{LAST_BLOCK}', '{H1}','{CRUMBS}', '{BACKGROUND}', '{PAGE_TEXT}');
        $marker_info = array(Menu(), Footer(), LastBlock(), $page_info['h1'],  $page_info['crumbs'], $page_info['background'], $page_text);
        $page = str_replace($marker, $marker_info, $template);
        $page = str_replace('{SITE}', SITE, $page);
        break;
    case '6':
        $template = Get_Template('medprocedures.tpl');
        $page_text = $page_info['page_text'];
        $procedures_html = GetProcedures(1);
        $block_number = 1;
        foreach($procedures_html as $p){
            $page_text = str_replace('{PROCEDURE_TYPE_'.$block_number.'}', $p['type_name'], $page_text);
            $page_text = str_replace('{PROCEDURES_'.$block_number.'}', $p['procedures_html'], $page_text);
            $block_number++;}
        $marker = array('{MENU}', '{FOOTER}', '{LAST_BLOCK}', '{H1}','{CRUMBS}', '{BACKGROUND}', '{PAGE_TEXT}');
        $marker_info = array(Menu(), Footer(), LastBlock(), $page_info['h1'],  $page_info['crumbs'], $page_info['background'], $page_text);
        $page = str_replace($marker, $marker_info, $template);
        $page = str_replace('{SITE}', SITE, $page);
        break;
    case '7':
        $template = Get_Template('spaprocedures.tpl');
        $page_text = $page_info['page_text'];
        $procedures_html = GetProcedures(2);
        $block_number = 1;
        foreach($procedures_html as $p){
            $page_text = str_replace('{PROCEDURE_TYPE_'.$block_number.'}', $p['type_name'], $page_text);
            $page_text = str_replace('{PROCEDURES_'.$block_number.'}', $p['procedures_html'], $page_text);
            $block_number++;
        }
        $marker = array('{MENU}', '{FOOTER}', '{LAST_BLOCK}', '{H1}','{CRUMBS}', '{BACKGROUND}', '{PAGE_TEXT}');
        $marker_info = array(Menu(), Footer(), LastBlock(), $page_info['h1'],  $page_info['crumbs'], $page_info['background'], $page_text);
        $page = str_replace($marker, $marker_info, $template);
        $page = str_replace('{SITE}', SITE, $page);
        break;
    case '8':
        $template = Get_Template('contacts.tpl');
        $contactSections = GetContacts();
        $page_text = $page_info['page_text'];
        $page_text = str_replace('{SECTION_NAME}', $contactSections['names'], $page_info['page_text']);
        $page_text = str_replace('{SECTION_TEXT}', $contactSections['texts'], $page_text);
        $page_text = str_replace('{PHONE_BOOK}', GetPhoneBook(), $page_text);
        $marker = array('{MENU}', '{FOOTER}', '{LAST_BLOCK}', '{H1}','{CRUMBS}', '{BACKGROUND}', '{PAGE_TEXT}');
        $marker_info = array(Menu(), Footer(), LastBlock(), $page_info['h1'],  $page_info['crumbs'], $page_info['background'], $page_text);
        $page = str_replace($marker, $marker_info, $template);
        $page = str_replace('{SITE}', SITE, $page);
        break;}
echo $page;
?>