<?php
// page type e.g. 'en,index_en;es,index_es;de,index_de'
//determines the langauge settings of the browser, details see here:
// http://aktuell.de.selfhtml.org/artikel/php/httpsprache/

function lang_getfrombrowser($allowed_languages, $default_language, $lang_variable = null, $strict_mode = true) {
        if ($lang_variable === null && isset($_SERVER['HTTP_ACCEPT_LANGUAGE'])) {
                $lang_variable = $_SERVER['HTTP_ACCEPT_LANGUAGE'];
        }
        if (empty($lang_variable)) {
                return $default_language;
        }
        $accepted_languages = preg_split('/,\s*/', $lang_variable);
        $current_lang = $default_language;
        $current_q = 0;
        foreach ($accepted_languages as $accepted_language) {
                $res = preg_match ('/^([a-z]{1,8}(?:-[a-z]{1,8})*)'.
                                   '(?:;\s*q=(0(?:\.[0-9]{1,3})?|1(?:\.0{1,3})?))?$/i', $accepted_language, $matches);

                if (!$res) {
                        continue;
                }

                $lang_code = explode ('-', $matches[1]);
                if (isset($matches[2])) {
                        $lang_quality = (float)$matches[2];
                } else {
                        $lang_quality = 1.0;
                }
                while (count ($lang_code)) {
                        if (in_array (strtolower (join ('-', $lang_code)), $allowed_languages)) {
                                if ($lang_quality > $current_q) {
                                        $current_lang = strtolower (join ('-', $lang_code));
                                        $current_q = $lang_quality;
                                        break;
                                }
                        }
                        if ($strict_mode) {
                                break;
                        }
                        array_pop ($lang_code);
                }
        }
        return $current_lang;
}

$lang_pages_parts = explode(';',$data['type_addition']);
foreach($lang_pages_parts as $lang_pages)
 {
  $lang_parts = explode(',',$lang_pages);
  $allowed_langs[] = trim($lang_parts[0]);
  $lang_pages_array[trim($lang_parts[0])] = trim($lang_parts[1]);
 }

$lang = lang_getfrombrowser ($allowed_langs, $allowed_langs[0], null, false);

if(isset($cache) && $cache->doCaching)
 {
  $cache->cacheId = PAGE;
  $cache_content = "<?php\ndefine('BASE_URL', '".BASE_URL."');\n\$data['type_addition']='".$data['type_addition']."';\ninclude('".BASE_PATH.CMS."includes/page_types/language_redirect.php');\n?>";
  $cache->createChacheFile($cache_content);
 }

header($_SERVER['SERVER_PROTOCOL'] . ' 303 See Other');
header('Location: '.BASE_URL.$lang_pages_array[$lang]);

?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="refresh" content="0; <?php echo BASE_URL.$lang_pages_array[$lang]; ?>">
<title>303 See Other</title>
</head>
<body>
<a href="<?php echo BASE_URL.$lang_pages_array[$lang]; ?>"><?php echo BASE_URL.$lang_pages_array[$lang]; ?></a>
</body>
</html>
