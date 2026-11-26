<?php
function Get_Template($file){
    return file_get_contents(PATH_TEMPLATE . $file);
}
function Footer(){
    $template = Get_Template('footer.tpl');
    $template = str_replace('{MENU}', Menu(), $template);
    $template = str_replace('{SITE}', SITE, $template);
    return $template;
}
function LastBlock(){
    return Get_Template('last_block.tpl');
}
function Menu(){
    global $DB;
    $str = '';
    $template = Get_Template('menu.tpl');
    $marker = array('{ID}', '{NAME}', '{LINK}', '{TEXT}', '{POSITION}', '{VISIBLE}');
    $SQL = 'SELECT * FROM `menu` WHERE `visible` = 1 ORDER BY `position`';
    $date = mysqli_query($DB, $SQL);
    $count = mysqli_num_rows($date);
    for($i=0; $i<$count; $i++){
        $inf = mysqli_fetch_array($date, MYSQLI_NUM);
        $str .= str_replace($marker, $inf, $template);}
    return $str;
}

function My_Parse_URL($url){
    global $DB;
    $SQL = "SELECT * FROM `pages` WHERE visible = 1 AND `page_link`= '". mysqli_real_escape_string($DB, $url) ."'";
    $data = mysqli_query($DB, $SQL);
    $count = mysqli_num_rows($data);
    if($count == 1){
        $inf = mysqli_fetch_array($data, MYSQLI_ASSOC);
        $inf['error'] = 0;}
    else{
        $inf['error'] = '404';}
    return $inf;
}
function Doctors(){
    $doctorCard = Get_Template('doctorCard.tpl');
    global $DB;
    $SQL = "SELECT * FROM `doctors` ORDER BY `position`";
    $date = mysqli_query($DB, $SQL);
    $doctors = array();
    while($row = mysqli_fetch_array($date, MYSQLI_ASSOC)){
        $doctors[] = $row;}
    $doctorCardHTML = '';
    if(!empty($doctors)){
        foreach($doctors as $d){
            $card = $doctorCard;
            $card = str_replace('{IMAGE_LINK}', $d['image'], $card);
            $fio = explode(' ', $d['fio']);while($row = mysqli_fetch_array($date, MYSQLI_ASSOC)){
                $slides[] = $row['image']; 
            }
            $card = str_replace('{SURNAME}', mb_strtoupper($fio[0],  'UTF-8'), $card);
            $card = str_replace('{NAME}', $fio[1] . " " . $fio[2], $card);
            $card = str_replace('{SPECIALIZATION}', $d['specialization'], $card);
            $card = str_replace('{SITE}', SITE, $card);
            $doctorCardHTML .= $card;}}
    return $doctorCardHTML;
}
function SliderDoctors(){
    $slider = Get_Template('sliderDoctors.tpl');
    global $DB;
    $SQL = "SELECT * FROM `sliderDoctors` ORDER BY `position`";
    $date = mysqli_query($DB, $SQL);
    $slides = array();
    while($row = mysqli_fetch_array($date, MYSQLI_ASSOC)){
        $slides[] = $row['image'];}
    $slider_html = '';
    if(!empty($slides)){
        foreach($slides as $slide){
            $image_link = str_replace('{IMAGE_LINK}', $slide, $slider);
            $slider_html .= str_replace('{SITE}', SITE, $image_link);}}
    return $slider_html;}

function RoomCards($room_id){
    $roomCard = Get_Template('roomCard.tpl');
    global $DB;
    $SQL = "SELECT * FROM `roomCards` WHERE `roomCard_id` != " .$room_id. " ORDER BY `position`";
    $date = mysqli_query($DB, $SQL);
    $rooms = array();
    while($row = mysqli_fetch_array($date, MYSQLI_ASSOC)){
        $rooms[] = $row;}
    $roomCardHTML = '';
    if(!empty($rooms)){
        foreach($rooms as $r){
            $card = $roomCard;
            $card = str_replace('{IMAGE_LINK}', $r['image'], $card);
            $card = str_replace('{LINK}', $r['link'], $card);
            $card = str_replace('{ROOM_NAME}', $r['room_name'], $card);
            $card = str_replace('{DESCRIPTION}', $r['description'], $card);
            $roomCardHTML .= $card;}}
    return $roomCardHTML;
}

function SliderRoom($page_id){
    $slider = Get_Template('sliderRooms.tpl');
    global $DB;
    $SQL = "SELECT * FROM `sliderRooms` WHERE `page_id` = " . $page_id."  ORDER BY `position`";
    $date = mysqli_query($DB, $SQL);
    $slides = array();
    while($row = mysqli_fetch_array($date, MYSQLI_ASSOC)){
        $slides[] = $row['image'];}
    $slider_html = '';
    if(!empty($slides)){
        foreach($slides as $slide){
            $image_link = str_replace('{IMAGE_LINK}', $slide, $slider);
            $slider_html .= str_replace('{SITE}', SITE, $image_link);}}
    return $slider_html;
}
function GetProcedures($category){
    global $DB;
    $category = (int)$category;
    $SQL = "SELECT pt.type_id, pt.type_name, p.procedure_name, p.description, p.image, p.position
            FROM `procedureTypes` pt
            INNER JOIN `procedures` p ON pt.type_id = p.type_id
            WHERE pt.visible = 1 AND pt.category = ". $category ." AND p.visible = 1
            ORDER BY pt.position, p.position";
    $data = mysqli_query($DB, $SQL);
    $cards = array();
    while($row = mysqli_fetch_array($data, MYSQLI_ASSOC)){
        $type_id = $row['type_id'];
        if(!isset($cards[$type_id])){
            $cards[$type_id] = array(
                'type_name' => $row['type_name'],
                'procedures_html' => '');}
        $roomCard = Get_Template('procedure.tpl');
        $roomCard = str_replace('{IMAGE_LINK}', $row['image'], $roomCard);
        if($row['position'] < 10){
            $roomCard = str_replace('{NUMBER}', "0".$row['position'], $roomCard);}
        else{
            $roomCard = str_replace('{NUMBER}', $row['position'], $roomCard);}
        $roomCard = str_replace('{NAME}', $row['procedure_name'], $roomCard);
        $description = !empty($row['description']) ? $row['description'] : $row['procedure_name'];
        $roomCard = str_replace('{DESCRIPTION}', $description, $roomCard);
        $cards[$type_id]['procedures_html'] .= $roomCard;}
    return $cards;
}
function GetContacts(){
    $sectionName = Get_Template('sectionName.tpl');
    $sectionText = Get_Template('sectionText.tpl');
    global $DB;
    $SQL = "SELECT * FROM `contacts` WHERE `visible` = 1 ORDER BY `position`";
    $data = mysqli_query($DB, $SQL);
    $sections = array();
    while($row = mysqli_fetch_array($data, MYSQLI_ASSOC)){
        $sections[] = $row;}
    $namesHTML = '';
    $textsHTML = '';
    $isFirst = true;
    if(!empty($sections)){
        foreach($sections as $s){
            $nameItem = $sectionName;
            $nameItem = str_replace('{NAME}', $s['section_name'], $nameItem);
            if($isFirst){
                $nameItem = str_replace('{SIZE_CLASS}', 'font-size48', $nameItem);
            } else {
                $nameItem = str_replace('{SIZE_CLASS}', 'font-size20', $nameItem);}
            $namesHTML .= $nameItem;
            $textItem = $sectionText;
            $textItem = str_replace('{TEXT}', $s['text'], $textItem);
            if($isFirst){
                $textItem = str_replace('{CLASS}', 'visible-contactsinfo', $textItem);
            } else {
                $textItem = str_replace('{CLASS}', 'hidden-contacts-info', $textItem);}
            $textsHTML .= $textItem;
            $isFirst = false;}}
    return array('names' => $namesHTML, 'texts' => $textsHTML);
}
function GetPhoneBook(){
    $phoneBook = Get_Template('phoneBook.tpl');
    global $DB;
    $SQL = "SELECT * FROM `phoneBook` WHERE `visible` = 1 ORDER BY `position`";
    $date = mysqli_query($DB, $SQL);
    $phones = array();
    while($row = mysqli_fetch_array($date, MYSQLI_ASSOC)){
        $phones[] = $row;}
    $phoneBookHTML = '';
    if(!empty($phones)){
        foreach($phones as $p){
            $card = $phoneBook;
            $card = str_replace('{NAME}', $p['fio'], $card);
            $card = str_replace('{ROLE}', $p['role'], $card);
            $card = str_replace('{PHONE}', $p['phone'], $card);
            $phoneBookHTML .= $card;}}
    return $phoneBookHTML;
}
?>