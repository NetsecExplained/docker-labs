<?php if(isset($invalid_request)): ?>

<p class="caution"><?php if(isset($lang[$invalid_request])) echo $lang[$invalid_request]; else echo $invalid_request; ?></p>

<?php else: ?>

<?php if(isset($page_data['id'])): ?>
<h1><a href="<?php echo CMSHOME;?>"><?php echo $lang['administration']; ?></a> &raquo; <?php echo str_replace('[page]','<a href="'.BASE_URL.$page_data['page'].'">'.$page_data['page'].'</a>',$lang['edit_page_headline']); ?></h1>
<?php else: ?>
<h1><a href="<?php echo CMSHOME;?>"><?php echo $lang['administration']; ?></a> &raquo; <?php echo $lang['create_new_page_headline']; ?></h1>
<?php endif; ?>

<?php include('errors.inc.tpl'); ?>

<div id="nav">
 <ul>
  <li><a id="n1" class="active" href="#formpart-n1" onclick="javascript:show_element('n1'); return false" onfocus="this.blur()"><?php echo $lang['content_marking']; ?></a></li>
  <li><a id="n2" class="inactive" href="#formpart-n2" onclick="javascript:show_element('n2'); return false" onfocus="this.blur()"><?php echo $lang['sidebars_marking']; ?></a></li>
    <li><a id="n3" class="inactive" href="#formpart-n3" onclick="javascript:show_element('n3'); return false" onfocus="this.blur()"><?php echo $lang['inline_css_marking']; ?></a></li>
  <li><a id="n4" class="inactive" href="#formpart-n4" onclick="javascript:show_element('n4'); return false" onfocus="this.blur()"><?php echo $lang['properties_marking']; ?></a></li>
  <li><a id="n5" class="inactive" href="#formpart-n5" onclick="javascript:show_element('n5'); return false" onfocus="this.blur()"><?php echo $lang['include_marking']; ?></a></li>
    <li><a id="n6" class="inactive" href="#formpart-n6" onclick="javascript:show_element('n6'); return false" onfocus="this.blur()"><?php echo $lang['page_notes_marking']; ?></a></li>
 </ul>
</div>

<form id="content-form" action="<?php echo CMSHOME;?>" method="post">
 <div class="content-form-div">
  <input type="hidden" name="mode" value="edit" />
  <?php if(isset($page_data['id'])): ?>
  <input type="hidden" name="id" value="<?php echo $page_data['id']; ?>" />
  <?php endif; ?>

  <div id="formpart-n1">
   <table cellspacing="0" cellpadding="5" border="0" style="width:100%;">

    <tr>
     <td style="width:5em;white-space:nowrap;"><label for="page"><strong><?php echo $lang['edit_page_name_marking']; ?></strong></label></td>
     <td>
     <span id="base-url"><?php echo BASE_URL; ?></span><input id="page" class="edit-page-default" type="text" name="page" value="<?php if(isset($page_data['page'])) echo $page_data['page']; ?>" size="50" />
     <script type="text/javascript">new_width=document.getElementById('page').offsetWidth-document.getElementById('base-url').offsetWidth-4; if(new_width>100) document.getElementById('page').style.width=new_width+'px';</script>
     </td>
    <td> </td>

    </tr>
    <tr>
     <td><label for="title"><strong><?php echo $lang['edit_title_marking']; ?></strong></label></td>
     <td><input id="title" class="edit-page-default" type="text" name="title" value="<?php if(isset($page_data['title'])) echo $page_data['title']; ?>" size="50" /></td>
     <td>&nbsp;</td>
    </tr>
    <tr>
     <td><label for="page_title"><strong><?php echo $lang['edit_page_title_marking']; ?></strong></label></td>
     <td><input id="page_title" class="edit-page-default" type="text" name="page_title" value="<?php if(isset($page_data['page_title'])) echo $page_data['page_title']; ?>" size="50" /> <small><?php echo $lang['optional']; ?></small></td>
     <td>&nbsp;</td>
    </tr>
    <tr>
     <td><label for="headline"><strong><?php echo $lang['edit_headline_marking']; ?></strong></label></td>
     <td><input id="headline" class="edit-page-default" type="text" name="headline" value="<?php if(isset($page_data['headline'])) echo $page_data['headline']; ?>" size="50" /> <small><?php echo $lang['optional']; ?></small></td>
     <td>&nbsp;</td>
    </tr>

    <?php if($wysiwyg): ?>

    <tr>
     <td colspan="3" style="padding-bottom:20px;">
     <input type="hidden" name="content_formatting" value="0" />
     <!--<input type="hidden" name="headline" value="" />-->
     <div id="wysiwyg"><textarea id="content" name="content" cols="65" rows="28"><?php if(isset($page_data['content'])) echo $page_data['content']; ?></textarea></div>
     </td>
    </tr>

    <?php else: ?>

    <tr>
     <td colspan="2">

     <textarea id="content" name="content" cols="100" rows="28"><?php if(isset($page_data['content'])) echo $page_data['content']; ?></textarea><br />

     <span class="small"><input id="content_formatting" type="checkbox" name="content_formatting" value="1"<?php if(isset($page_data['content_formatting']) && $page_data['content_formatting']==1): ?> checked="checked"'<?php endif; ?> /> <label for="content_formatting"><?php echo $lang['edit_formatting']; ?></label></span>
     </td>
     <td>
      <input class="format-button" type="button" value="<?php echo $lang['link_button']; ?>" title="<?php echo $lang['link_button_title']; ?>" onclick="insert_link('content-form','content','<?php echo addslashes($lang['link_text_m']); ?>','<?php echo addslashes($lang['link_target_m']); ?>');" /><br />
      <input class="format-button" type="button" value="<?php echo $lang['image_button']; ?>" title="<?php echo $lang['image_title']; ?>" onclick="insert_image('content-form','content',1);" /><br />
      <input class="format-button" type="button" value="<?php echo $lang['thumbnail_button']; ?>" title="<?php echo $lang['thumbnail_title']; ?>" onclick="insert_thumbnail('content-form','content',1);" /><br /><br />
      <input class="insert_html" type="button" value="h1" title="&lt;h1&gt;...&lt;/h1&gt;" onclick="insert_html('&lt;h1&gt;','&lt;/h1&gt;','content-form','content');" /><br />
      <input class="insert_html" type="button" value="h2" title="&lt;h2&gt;...&lt;/h2&gt;" onclick="insert_html('&lt;h2&gt;','&lt;/h2&gt;','content-form','content');" /><br />
      <input class="insert_html" type="button" value="h3" title="&lt;h3&gt;...&lt;/h3&gt;" onclick="insert_html('&lt;h3&gt;','&lt;/h3&gt;','content-form','content');" /><br />
      <input class="insert_html" type="button" value="p" title="&lt;p&gt;...&lt;/p&gt;" onclick="insert_html('&lt;p&gt;','&lt;/p&gt;','content-form','content');" /><br />
      <input class="insert_html" type="button" value="ul" title="&lt;ul&gt;...&lt;/ul&gt;" onclick="insert_html('&lt;ul&gt;','&lt;/ul&gt;','content-form','content');" /><br />
      <input class="insert_html" type="button" value="li" title="&lt;li&gt;...&lt;/li&gt;" onclick="insert_html('&lt;li&gt;','&lt;/li&gt;','content-form','content');" /><br />
      <input class="insert_html" type="button" value="strong" title="&lt;strong&gt;...&lt;/strong&gt;" onclick="insert_html('&lt;strong&gt;','&lt;/strong>','content-form','content');" /><br />
      <input class="insert_html" type="button" value="em" title="&lt;em&gt;...&lt;/em&gt;" onclick="insert_html('&lt;em&gt;','&lt;/em&gt;','content-form','content');" /><br />
      <input class="insert_html" type="button" value="br" title="&lt;br /&gt;" onclick="insert_html('&lt;br /&gt;\n','','content-form','content');" /><br />
      <input class="insert_html" type="button" value="a" title="&lt;a href=&quot;&quot;&gt;...&lt;/a&gt;" onclick="insert_html('&lt;a href=&quot;&quot;&gt;','&lt;/a&gt;','content-form','content');" /><br />
      <input class="insert_html" type="button" value="img" title="&lt;img src=&quot;&quot; alt=&quot;&quot; height=&quot;&quot; width=&quot;&quot; /&gt;" onclick="insert_html('&lt;img src=&quot;&quot; width=&quot;&quot; height=&quot;&quot; alt=&quot;&quot; /&gt;','','content-form','content');" /><br />
      <input class="insert_html" type="button" value="table" title="&lt;table&gt;...&lt;/table&gt;" onclick="insert_html('&lt;table border=&quot;&quot; cellpadding=&quot;&quot; cellspacing=&quot;&quot;>','&lt;/table&gt;','content-form','content');" /><br />
      <input class="insert_html" type="button" value="tr" title="&lt;tr&gt;...&lt;/tr&gt;" onclick="insert_html('&lt;tr&gt;','&lt;/tr&gt;','content-form','content');" /><br />
      <input class="insert_html" type="button" value="th" title="&lt;th&gt;...&lt;/th&gt;" onclick="insert_html('&lt;th&gt;','&lt;/th&gt;','content-form','content');" /><br />
      <input class="insert_html" type="button" value="td" title="&lt;td&gt;...&lt;/td&gt;" onclick="insert_html('&lt;td&gt;','&lt;/td&gt;','content-form','content');" />
     </td>
    </tr>

   <?php endif; ?>
    
   </table>
  </div>

  <div id="formpart-n2">
   <table cellspacing="0" cellpadding="5" border="0">
    <tr>
     <td><b><?php echo $lang['edit_sidebar_1_marking']; ?></b></td>
     <td><textarea name="sidebar_1" cols="70" rows="15"><?php if(isset($page_data['sidebar_1'])) echo $page_data['sidebar_1']; ?></textarea><br />
     <span class="small"><input id="sidebar_1_formatting" type="checkbox" name="sidebar_1_formatting" value="1"<?php if(isset($page_data['sidebar_1_formatting']) && $page_data['sidebar_1_formatting']==1): ?> checked="checked"'<?php endif; ?> /> <label for="sidebar_1_formatting"><?php echo $lang['edit_formatting']; ?></label></span></td>
     <td>&nbsp;</td>
    </tr>
    <?php if(isset($settings['sidebars_all'])&&($settings['sidebars_all']==1)):?>
    <tr>
     <td><b><?php echo $lang['edit_sidebar_2_marking']; ?></b></td>
     <td><textarea name="sidebar_2" cols="70" rows="10"><?php if(isset($page_data['sidebar_1'])) echo $page_data['sidebar_2']; ?></textarea><br />
     <span class="small"><input id="sidebar_2_formatting" type="checkbox" name="sidebar_2_formatting" value="1"<?php if(isset($page_data['sidebar_2_formatting']) && $page_data['sidebar_2_formatting']==1): ?> checked="checked"'<?php endif; ?> /> <label for="sidebar_2_formatting"><?php echo $lang['edit_formatting']; ?></label></span></td>
     <td>&nbsp;</td>
    </tr>
    <tr>
     <td><b><?php echo $lang['edit_sidebar_3_marking']; ?></b></td>
     <td><textarea name="sidebar_3" cols="70" rows="10"><?php if(isset($page_data['sidebar_1'])) echo $page_data['sidebar_3']; ?></textarea><br />
     <span class="small"><input id="sidebar_3_formatting" type="checkbox" name="sidebar_3_formatting" value="1"<?php if(isset($page_data['sidebar_3_formatting']) && $page_data['sidebar_3_formatting']==1): ?> checked="checked"'<?php endif; ?> /> <label for="sidebar_3_formatting"><?php echo $lang['edit_formatting']; ?></label></span></td>
     <td>&nbsp;</td>
    </tr>
    <?php endif;?>
   </table>
  </div>
<div id="formpart-n3">
   <table cellspacing="0" cellpadding="5" border="0">
    <tr>
     <td><b><?php echo $lang['edit_inline_CSS']; ?></b></td>
     <td><textarea name="inline_css" cols="70" rows="15"><?php if(isset($page_data['inline_css'])) echo $page_data['inline_css']; ?></textarea></td>
    </tr>
   </table>
  </div>

  <div id="formpart-n4">
   <table cellspacing="0" cellpadding="5" border="0">
    <tr>
     <td><b><?php echo $lang['edit_type_marking']; ?></b></td>
     <td><select name="type" size="1">
     <?php foreach($page_types as $key => $val): ?>
     <option value="<?php echo $key; ?>"<?php if(isset($page_data['type']) && $page_data['type']==$key): ?> selected="selected"<?php endif; ?>><?php if(isset($lang[$val['page_type_label']])) echo $lang[$val['page_type_label']]; else echo $val['page_type_label']; ?></option>
     <?php endforeach; ?>
     </select> <input type="text" name="type_addition" value="<?php if(isset($page_data['type_addition'])) echo $page_data['type_addition']; ?>" size="40" /></td>
     <td>&nbsp;</td>
    </tr>
    <tr>
     <td><b><?php echo $lang['edit_time_marking']; ?></b></td>
     <td><input type="text" name="time" value="<?php if(isset($page_data['time'])) echo $page_data['time']; ?>" size="20" /> <small><?php echo $lang['edit_time_format']; ?></small></td>
     <td>&nbsp;</td>
    </tr>
    <tr>
     <td><b><?php echo $lang['edit_last_modified_marking']; ?></b></td>
     <td><input type="text" name="last_modified" value="<?php if(isset($page_data['last_modified'])) echo $page_data['last_modified']; ?>" size="20" /> <small><?php echo $lang['edit_time_format']; ?></small></td>
     <td>&nbsp;</td>
    </tr>

    <tr>
     <td><b><?php echo $lang['edit_display_time']; ?></b></td>
     <td><input type="checkbox" id="display_time" name="display_time" value="1"<?php if(isset($page_data['display_time'])&&$page_data['display_time']==1): ?> checked="checked"<?php endif; ?> /><label for="display_time"><?php echo $lang['edit_display_time_label']; ?></label></td>
     <td>&nbsp;</td>
    </tr>

    <tr>
     <td><b><?php echo $lang['edit_menus_marking']; ?></b></td>
     <td>
      <select name="menu_1" size="1">
       <option value="">#1</option>
       <?php if(isset($menus)): ?>
       <?php foreach($menus as $menu): ?>
       <option value="<?php echo $menu; ?>"<?php if(isset($page_data['menu_1']) && $page_data['menu_1']==$menu): ?> selected="selected"<?php endif; ?>><?php echo $menu; ?></option>
       <?php endforeach;?>
       <?php endif; ?>
      </select>
      <select name="menu_2" size="1">
       <option value="">#2</option>
       <?php if(isset($menus)): ?>
       <?php foreach($menus as $menu): ?>
       <option value="<?php echo $menu; ?>"<?php if(isset($page_data['menu_2']) && $page_data['menu_2']==$menu): ?> selected="selected"<?php endif; ?>><?php echo $menu; ?></option>
       <?php endforeach;?>
       <?php endif; ?>
      </select>
      <select name="menu_3" size="1">
       <option value="">#3</option>
       <?php if(isset($menus)): ?>
       <?php foreach($menus as $menu): ?>
       <option value="<?php echo $menu; ?>"<?php if(isset($page_data['menu_3']) && $page_data['menu_3']==$menu): ?> selected="selected"<?php endif; ?>><?php echo $menu; ?></option>
       <?php endforeach;?>
       <?php endif; ?>
      </select>
     </td>
     <td>&nbsp;</td>
    </tr>
    <tr>
     <td><b><?php echo $lang['edit_sections_marking']; ?></b></td>
     <td><input type="text" name="sections" value="<?php if(isset($page_data['sections'])) echo $page_data['sections']; ?>" size="60" /> <small><?php echo $lang['values_comma_separated']; ?></small></td>
     <td>&nbsp;</td>
    </tr>
    <tr>
     <td><b><?php echo $lang['breadcrumbs']; ?></b></td>
     <td>
      <?php for($i=0;$i<$settings['breadcrumbs'];++$i): ?>
      <select name="breadcrumbs[]" size="1" style="width:100px;">
       <option value=""<?php if(empty($page_data['breadcrumbs'][$i])): ?> selected="selected"<?php endif; ?>></option>
       <?php foreach($pages as $breadcrumb_page): ?>
       <option value="<?php echo $breadcrumb_page['id']; ?>"<?php if(isset($page_data['breadcrumbs'][$i]) && $page_data['breadcrumbs'][$i]==$breadcrumb_page['id']): ?> selected="selected"<?php endif; ?>><?php echo $breadcrumb_page['page']; ?></option>
       <?php endforeach; ?>
      </select>
      <?php if($i<$settings['breadcrumbs']-1): ?> &raquo; <?php endif; ?>
      <?php endfor; ?>
     </td>
     <td>&nbsp;</td>
    </tr>
    <tr>
     <td><b><?php echo $lang['edit_description_marking']; ?></b></td>
     <td><input type="text" name="description" value="<?php if(isset($page_data['description'])) echo $page_data['description']; ?>" size="60" /></td>
     <td>&nbsp;</td>
    </tr>
    <tr>
     <td><b><?php echo $lang['edit_keywords_marking']; ?></b></td>
     <td><input type="text" name="keywords" value="<?php if(isset($page_data['keywords'])) echo $page_data['keywords']; ?>" size="60" /> <span class="smallx"><?php echo $lang['values_comma_separated']; ?></span></td>
     <td>&nbsp;</td>
    </tr>
    <tr>
     <td><b><?php echo $lang['edit_category_marking']; ?></b></td>
     <td><input type="text" name="category" value="<?php if(isset($page_data['category'])) echo $page_data['category']; ?>" size="60" /></td>
     <td>&nbsp;</td>
    </tr>
    <tr>
     <td><b><?php echo $lang['edit_page_info_marking']; ?></b></td>
     <td><input type="text" name="page_info" value="<?php if(isset($page_data['page_info'])) echo $page_data['page_info']; ?>" size="60" /></td>
     <td>&nbsp;</td>
    </tr>

    <?php if($settings['global_content_blocks']): ?>
    <tr>
     <td><b><?php echo $lang['edit_gcb_marking']; ?></b></td>
     <td>
      <select name="gcb_1" size="1">
       <option value="0">#1</option>
       <?php if(isset($gcbs)): ?>
       <?php foreach($gcbs as $gcb): ?>
       <option value="<?php echo $gcb['id']; ?>"<?php if(isset($page_data['gcb_1']) && $page_data['gcb_1']==$gcb['id']): ?> selected="selected"<?php endif; ?>><?php echo $gcb['title']; ?></option>
       <?php endforeach ?>
       <?php endif; ?>
      </select>
      <select name="gcb_2" size="1">
       <option value="0">#1</option>
       <?php if(isset($gcbs)): ?>
       <?php foreach($gcbs as $gcb): ?>
       <option value="<?php echo $gcb['id']; ?>"<?php if(isset($page_data['gcb_2']) && $page_data['gcb_2']==$gcb['id']): ?> selected="selected"<?php endif; ?>><?php echo $gcb['title']; ?></option>
       <?php endforeach ?>
       <?php endif; ?>
      </select>
      <select name="gcb_3" size="1">
       <option value="0">#1</option>
       <?php if(isset($gcbs)): foreach($gcbs as $gcb): ?>
       <option value="<?php echo $gcb['id']; ?>"<?php if(isset($page_data['gcb_3']) && $page_data['gcb_3']==$gcb['id']): ?> selected="selected"<?php endif; ?>><?php echo $gcb['title']; ?></option>
       <?php endforeach; endif; ?>
      </select>
     </td>
     <td>&nbsp;</td>
    </tr>
    <?php endif; ?>

    <?php if(isset($simple_news_pages)): ?>
    <tr>
     <td><b><?php echo $lang['edit_include_news']; ?></b></td>
     <td>
      <select name="include_news" size="1">
       <option value=""<?php if(empty($page_data['include_news'])): ?> selected="selected"<?php endif; ?>></option>
       <?php foreach($simple_news_pages as $simple_news_page): ?>
       <option value="<?php echo $simple_news_page['id']; ?>"<?php if(isset($page_data['include_news']) && $page_data['include_news']==$simple_news_page['id']): ?> selected="selected"<?php endif; ?>><?php echo $simple_news_page['page']; ?></option>
       <?php endforeach; ?>
      </select>
     </td>
    </tr>    
    <?php endif; ?>
    
    <tr>
     <td><b><?php echo $lang['edit_template_marking']; ?></b></td>
     <td>
      <select name="template" size="1">
       <?php if(isset($template_files)): foreach($template_files as $template_file): ?>
       <option value="<?php echo $template_file; ?>"<?php if($page_data['template']==$template_file): ?> selected="selected"<?php endif; ?>> <?php echo $template_file; ?></option>
       <?php endforeach; endif; ?>
      </select>
     </td>
     <td>&nbsp;</td>
    </tr>
        <tr>
     <td><b><?php echo $lang['edit_template_mobile_marking']; ?></b></td>
     <td>
      <select name="template_mobile" size="1">
       <?php if(isset($template_files)): foreach($template_files as $template_mobile_file): ?>
       <option value="<?php echo $template_mobile_file; ?>"<?php if($page_data['template_mobile']==$template_mobile_file): ?> selected="selected"<?php endif; ?>> <?php echo $template_mobile_file; ?></option>
       <?php endforeach; endif; ?>
      </select>
     </td>
     <td>&nbsp;</td>
    </tr>
    <tr>
     <td><b><?php echo $lang['page_language_file']; ?></b></td>
     <td>
      <select name="language_file" size="1">
       <option value=""<?php if(empty($page_data['language_file'])): ?> selected="selected"<?php endif; ?>><?php echo $lang['page_language_file_default']; ?></option>
       <?php if(isset($page_language_files)): foreach($page_language_files as $page_language_file): ?>
       <option value="<?php echo $page_language_file['file']; ?>"<?php if(isset($page_data['language_file']) && $page_data['language_file']==$page_language_file['file']): ?> selected="selected"<?php endif; ?>> <?php echo $page_language_file['name']; ?></option>
       <?php endforeach; endif; ?>
      </select>
     </td>
    </tr>
    <tr>
     <td><b><?php echo $lang['page_content_type']; ?></b></td>
     <td><input type="text" name="content_type" value="<?php if(isset($page_data['content_type'])) echo $page_data['content_type']; ?>" size="20" /> <small><?php echo $lang['page_content_type_exp']; ?></small></td>
     <td>&nbsp;</td>
    </tr>
    <?php /*
    <tr>
     <td><b><?php echo $lang['page_charset']; ?></b></td>
     <td><input type="text" name="charset" value="<?php if(isset($page_data['charset'])) echo $page_data['charset']; ?>" size="20" /> <small><?php echo str_replace('[default_charset]', $lang['charset'], $lang['page_charset_exp']); ?></small></td>
     <td>&nbsp;</td>
    </tr>
    */ ?>
    <tr>
     <td><b><?php echo $lang['custom_values']; ?></b></td>
     <td><input type="text" name="custom_values" value="<?php if(isset($page_data['custom_values'])) echo $page_data['custom_values']; ?>" size="60" /> <small><?php echo $lang['values_comma_separated']; ?></small></td>
     <td>&nbsp;</td>
    </tr>
    <tr>
     <td><b><?php echo $lang['edit_permission']; ?></b></td>
     <td><input type="text" name="edit_permission" value="<?php if(isset($page_data['edit_permission'])) echo $page_data['edit_permission']; ?>" size="60" /> <small><?php echo $lang['values_comma_separated']; ?></small><br />
     <span class="small"><input id="edit_permission_general" type="checkbox" name="edit_permission_general" value="1"<?php if(isset($page_data['edit_permission_general']) && $page_data['edit_permission_general']==1): ?> checked="checked"<?php endif; ?> /><label for="edit_permission_general"><?php echo $lang['edit_permission_general']; ?></label></span></td>
     <td>&nbsp;</td>
    </tr>
    <tr>
     <td><b><?php echo $lang['status']; ?></b></td>
     <td><input id="status_2" type="radio" name="status" value="2"<?php if(isset($page_data['status']) && $page_data['status']==2): ?> checked="checked"<?php endif; ?> /><label for="status_2"><?php echo $lang['status_puplished_searchable']; ?></label><br />
     <input id="status_1" type="radio" name="status" value="1"<?php if(isset($page_data['status']) && $page_data['status']==1): ?> checked="checked"<?php endif; ?> /><label for="status_1"><?php echo $lang['status_puplished']; ?></label><br />
     <input id="status_0" type="radio" name="status" value="0"<?php if(isset($page_data['status']) && $page_data['status']==0): ?> checked="checked"<?php endif; ?> /><label for="status_0"><?php echo $lang['status_draft']; ?></label></td>
     <td>&nbsp;</td>
    </tr>
   </table>
  </div>

  <div id="formpart-n5">
   <table cellspacing="0" cellpadding="5" border="0">
    <tr>
     <td><b><?php echo $lang['edit_include_in_marking']; ?></b></td>
     <td>
      <select name="include_page" size="1">
       <option value=""<?php if(empty($page_data['include_page'])): ?> selected="selected"<?php endif; ?>><?php echo $lang['edit_include_page_marking']; ?></option>
       <?php foreach($pages as $include_page): if($include_page['type']=='overview' || $include_page['type']=='news'): ?>
       <option value="<?php echo $include_page['id']; ?>"<?php if(isset($page_data['include_page']) && $page_data['include_page']==$include_page['id']): ?> selected="selected"<?php endif; ?>><?php echo $include_page['page']; ?></option>
       <?php endif; endforeach; ?>
      </select>
      <select name="include_rss" size="1">
       <option value=""<?php if(empty($page_data['include_rss'])): ?> selected="selected"<?php endif; ?>><?php echo $lang['edit_include_rss_marking']; ?></option>
       <?php foreach($pages as $include_rss): if($include_rss['type']=='rss'): ?>
       <option value="<?php echo $include_rss['id']; ?>"<?php if(isset($page_data['include_rss']) && $page_data['include_rss']==$include_rss['id']): ?> selected="selected"<?php endif; ?>><?php echo $include_rss['page']; ?></option>
       <?php endif; endforeach; ?>
      </select>
      <select name="include_sitemap" size="1">
       <option value=""<?php if(empty($page_data['include_sitemap'])): ?> selected="selected"<?php endif; ?>><?php echo $lang['edit_include_sitemap_marking']; ?></option>
       <?php foreach($pages as $include_sitemap): if($include_sitemap['type']=='sitemap'): ?>
       <option value="<?php echo $include_sitemap['id']; ?>"<?php if(isset($page_data['include_sitemap']) && $page_data['include_sitemap']==$include_sitemap['id']): ?> selected="selected"<?php endif; ?>><?php echo $include_sitemap['page']; ?></option>
       <?php endif; endforeach; ?>
      </select>
     </td>
     <td>&nbsp;</td>
    </tr>
    <tr>
     <td><b><?php echo $lang['edit_teaser_headline_marking']; ?></b></td>
     <td><input type="text" name="teaser_headline" value="<?php if(isset($page_data['teaser_headline'])) echo $page_data['teaser_headline']; ?>" size="50" /></td>
     <td>&nbsp;</td>
    </tr>
    <tr>
     <td><b><?php echo $lang['edit_teaser_marking']; ?></b></td>
     <td><textarea name="teaser" cols="75" rows="13"><?php if(isset($page_data['teaser'])) echo $page_data['teaser']; ?></textarea><br />
     <span class="small"><input id="teaser_formatting" type="checkbox" name="teaser_formatting" value="1"<?php if(isset($page_data['teaser_formatting']) && $page_data['teaser_formatting']==1): ?> checked="checked"<?php endif; ?> /><label for="teaser_formatting"><?php echo $lang['edit_formatting']; ?></label></span></td>
     <td>&nbsp;</td>
    </tr>
    <tr>
     <td><b><?php echo $lang['edit_teaser_img_marking']; ?></b></td>
     <td>
      <input type="text" name="teaser_img" value="<?php if(isset($page_data['teaser_img'])) echo $page_data['teaser_img']; ?>" size="50" />&nbsp; <span class="small">[ <a href="#" onclick="insert_image('content-form','teaser_img',0); return false"><?php echo $lang['select_image']; ?></a> ]</span>
     </td>
     <td>&nbsp;</td>
    </tr>
    <tr>
     <td><b><?php echo $lang['edit_order_number_marking']; ?></b></td>
     <td><input type="text" name="include_order" value="<?php echo $page_data['include_order']; ?>" size="3" /></td>
     <td>&nbsp;</td>
    </tr>
   </table>
  </div>
  <div id="formpart-n6">
   <table cellspacing="0" cellpadding="5" border="0">
    <tr>
    <td><b><?php echo $lang['edit_page_notes_marking']; ?></b></td>
    <td><textarea name="page_notes" cols="70" rows="15"><?php if(isset($page_data['page_notes'])) echo $page_data['page_notes']; ?></textarea></td>
    <td>&nbsp;</td>
   </tr>
  </table>
  </div>
 </div>
 <?php if(isset($page_data['id']) || $settings['pingbacks_enabled']): ?>
 <p>
 <?php if(isset($page_data['id'])): ?><input id="edit_mode_0" type="radio" name="edit_mode" value="0"<?php if(isset($edit_mode) && $edit_mode==0): ?> checked="checked"<?php endif; ?> /><label for="edit_mode_0"><?php echo $lang['edit_page_mode_edit']; ?></label><br />
 <input id="edit_mode_1" type="radio" name="edit_mode" value="1"<?php if(isset($edit_mode) && $edit_mode==1): ?> checked="checked"<?php endif; ?> /><label for="edit_mode_1"><?php echo $lang['edit_page_mode_save_as_new']; ?></label>
 <?php endif; ?>
 <?php if(isset($page_data['id']) && $settings['pingbacks_enabled']): ?>
 <br />
 <?php endif; ?>
 <?php if($settings['pingbacks_enabled']): ?>
 <input id="send_pingbacks" type="checkbox" name="send_pingbacks" value="1"<?php if(isset($send_pingbacks) && $send_pingbacks==1): ?> checked="checked"<?php endif; ?> /><label for="send_pingbacks"><?php echo $lang['edit_page_send_pingbacks']; ?></label>
 <?php endif; ?>
 </p>
 <?php endif; ?> 
 <p class="editmode"><?php if($wysiwyg_opt): ?><?php if($wysiwyg): ?><a href="<?php echo CMSHOME;?>?mode=edit<?php if(isset($page_data['id'])): ?>&amp;id=<?php echo $page_data['id']; ?><?php endif; ?>&amp;disable_wysiwyg=true" onclick="return confirm_link('<?php echo rawurlencode($lang['change_edit_mode_notice']); ?>')"><?php echo $lang['edit_non_wysiwyg_mode']; ?></a><?php else: ?><a href="<?php echo CMSHOME;?>?mode=edit<?php if(isset($page_data['id'])): ?>&amp;id=<?php echo $page_data['id']; ?><?php endif; ?>&amp;enable_wysiwyg=true" onclick="return confirm_link('<?php echo rawurlencode($lang['change_edit_mode_notice']); ?>')"><?php echo $lang['edit_wysiwyg_mode']; ?></a><?php endif; ?><?php else: ?>&nbsp;<?php endif; ?></p>
<p class="submit"><input type="submit" name="edit_submitted" value="<?php echo $lang['edit_page_submit']; ?>" /></p>

</form>

<?php endif; ?>
