<?php
// Meta informaton:
$lang['lang'] =                          'fr';
$lang['charset'] =                       'utf-8';
$lang['locale'] =                        array('fr_FR.utf8','fr','fre');
#$lang['time_format'] =                  '%d/%m/%Y, %H:%M';
#$lang['time_format_full'] =             '%A, %B %d, %Y, %H:%M';
$lang['dir'] =                           'ltr';

// General:
$lang['exception_title'] =               'Erreur';
$lang['exception_message'] =             'An error occurred while processing this directive.';
$lang['error_headline'] =                'Erreur :';
$lang['page_time'] =                     '[time|%A %d %B %Y, %H:%M]';
$lang['include_news_time'] =             '[time|%B %e, %Y]';
$lang['submit_button_ok'] =              '&nbsp;OK&nbsp;';
$lang['page_last_modified'] =            '<!-- Page créée : [created|%A %d %B %Y, %H:%M] - -->Dernière modification : [last_modified|%A %d %B %Y, %H:%M]';
$lang['no_comments'] =                   'aucun commentaire';
$lang['one_comment'] =                   '1 commentaire';
$lang['several_comments'] =              '[comments] commentaires';
$lang['number_of_comments'][0] =         'aucun commentaire';
$lang['number_of_comments'][1] =         '1 commentaire';
$lang['number_of_comments'][2] =         '[comments] commentaires';
$lang['pagination'] =                    'Page [current_page] / [total_pages]';
$lang['edit'] =                          'éditer';
$lang['delete'] =                        'supprimer';
$lang['all_categories'] =                'afficher toutes les catégories';

// Admin Menu:
$lang['admin_menu_home'] =               'Accueil';
$lang['admin_menu_admin'] =              'Administration';
$lang['admin_menu_page_overview'] =      'Liste des pages';
$lang['admin_menu_new_page'] =           'Créer une nouvelle page';
$lang['admin_menu_logout'] =             'Déconnecter';
$lang['admin_menu_act_page_actions'] =   'Page courante :';
$lang['admin_menu_edit_page'] =          'Éditer';
$lang['admin_menu_delete_page'] =        'Supprimer';
$lang['admin_menu_delete_page_conf'] =   'Êtes-vous certain de vouloir supprimer cette page ?';

// Comments:
$lang['comment_headline'] =              'Commentaires';
$lang['pingback_headline'] =             'Rétroliens';
$lang['comment_no_comments'] =           'Aucun commentaire.';
$lang['comments_closed'] =               'Commentaires fermés.';
$lang['comment_time'] =                  '[time|%A %d %B %Y, %H:%M]';
$lang['comments_pagination_info'] =      '[total_comments] commentaires, page [current_page] sur [total_pages]';
$lang['comments_add_comment'] =          'Ajouter un commentaire';
$lang['comment_input_text'] =            'Commentaire :';
$lang['comment_edit_text'] =             'Éditer commentaire:';
$lang['comment_input_name'] =            'Nom :';
$lang['comment_input_email_hp'] =        'E-mail :';
$lang['comment_input_submit'] =          '&nbsp;OK&nbsp;';
$lang['comment_input_preview'] =         'Previsualisation';
$lang['comment_preview_hl'] =            'Previsualiser :';
$lang['error_not_accepted_word'] =       'Mot non accepté : [not_accepted_word]';
$lang['error_not_accepted_words'] =      'Mots non acceptés : [not_accepted_words]';
$lang['comment_error_closed'] =          'Commentaires fermés !';
$lang['comment_error_no_name'] =         'Veuillez saisir votre nom';
$lang['comment_error_no_text'] =         'Veuillez saisir votre commentaire';
$lang['comment_error_name_too_long'] =   'Le nom est trop long';
$lang['comment_error_email_hp_too_long']='L\'adresse e-mail est trop longue';
$lang['comment_error_email_hp_invalid'] ='E-mail invalide';
$lang['comment_error_text_too_long'] =   'Le commentaire est trop long ([characters] caractères maximum : [max_characters] caractères)';
$lang['comment_error_too_long_word'] =   'Le mot est trop long : [word]';
$lang['comment_error_too_long_words'] =  'Les mots sont trop longs : [words]';
$lang['comment_error_entry_exists'] =    'Cette entrée éxiste déjà';
$lang['comment_error_repeated_post'] =   'Vous venez de commenter il y à très peu de temps ; veuillez patienter !';
$lang['comment_error_too_fast'] =        'Le formulaire à été soumis trop rapidement ! ; veuillez réessayer !';
$lang['comment_delete_link'] =           'supprimer';
$lang['comment_delete_confirm'] =        'Êtes-vous certain de vouloir supprimer ce commentaire ?';
$lang['comment_edit_link'] =             'éditer';
$lang['comment_note_email'] =            '(optionnel)';
$lang['comments_open'] =                 'ouvrir';
$lang['comments_close'] =                'Fermer les commentaires';
$lang['comment_notification_subject'] =  'Commentaire sur [page]';
$lang['comment_notification_message'] =  "[name]\n\n[comment]\n\n[link]";
$lang['pingback_notification_subject'] = 'Rétrolien pour [page]';
$lang['pingback_notification_message'] = "[title]\n[url]\n[link]";

// News:
$lang['news_time'] =                     '[time|%A %d %B %Y, %H:%M]';
$lang['no_news'] =                       'Pas d\'actualité';

// Notes:
$lang['note_time'] =                     '[time|%A %d %B %Y, %H:%M]';
$lang['no_notes'] =                      'Pas de note';

// Formmailer:
$lang['formmailer_label_email'] =        'E-mail :';
$lang['formmailer_label_subject'] =      'Sujet :';
$lang['formmailer_label_message'] =      'Message :';
$lang['formmailer_label_captcha'] =      'Please solve the following captcha problem before submission.';
$lang['formmailer_button_send'] =        'OK - Envoyer';
$lang['formmail_error_email_invalid'] =  'L\'adresse e-mail est invalide';
$lang['formmail_error_no_message'] =     'Veuillez saisir un message';
$lang['formmail_error_text_too_long'] =  'Le message est trop long';
$lang['formmail_error_subj_too_long'] =  'Le sujet est trop long';
$lang['formmail_error_mailserver'] =     'Erreur interne du serveur ; veuillez réessayer plus tard';
$lang['formmailer_mail_sent'] =          'Le message à été correctement envoyé';
$lang['formmailer_no_subject'] =         'Pas de sujet';

// Gallery:
$lang['gallery_no_photo'] =              'Pas de photo dans cette galerie';

// Photo:
$lang['photo_headline'] =                'Photo';
$lang['previous_photo'] =                'Image précédente';
$lang['next_photo'] =                    'Image suivante';
$lang['enlarge_photo'] =                 'Agrandire';
$lang['reduce_photo'] =                  'Réduire';
$lang['slideshow_link'] =                'Diaporama';
$lang['slideshow_title'] =               'Afficher dans une popup';
$lang['back_link'] =                     'Retour';
$lang['back_title'] =                    'Retour &quot;[page]&quot;';
$lang['photo_comment_link_title'] =      'Lire ou écrire un commentaire sur cette photo';

// Simple news:
$lang['simple_news_time'] =              '[time|%A, %B %e, %Y]';
$lang['simple_news_edit_title'] =        'Titre :';
$lang['simple_news_edit_teaser'] =       'Chapo :';
$lang['simple_news_edit_text'] =         'Texte :';
$lang['simple_news_edit_text_format'] =  'formattage automatique';
$lang['simple_news_edit_time'] =         'Date/heure :';
$lang['simple_news_edit_time_format'] =  '(YYYY-MM-DD HH:MM:SS)';
$lang['simple_news_add_item'] =          'Ajouter une news';
$lang['simple_news_edit_item'] =         'Éditer l\'élément';
$lang['simple_news_delete_confirm'] =    'Êtes-vous certain de vouloir supprimer cette news ?';
$lang['error_news_no_title'] =           'Le titre est vide';
$lang['error_news_no_text'] =            'Le texte est vide';
$lang['error_news_time_invalid'] =       'Le format de la date/heure est invalide';
$lang['delete_news_title'] =             'Supprimer cette news';
$lang['delete_news_confirm_submit'] =    'OK - Supprimer';

// Search:
$lang['search_submit'] =                 'Chercher';
$lang['search_number_of_results'][0] =   'Aucune page n\a été trouvée';
$lang['search_number_of_results'][1] =   '1 page trouvée :';
$lang['search_number_of_results'][2] =   '[pages] pages trouvées :';
$lang['search_pagination'] =             '[total_results] résultats, page [current_page] sur [total_pages]';
$lang['search_photo'] =                  'Photo';
$lang['search_no_results'] =             'Aucune page n\a été trouvé';

// Akismet:
$lang['akismet_error_api_key'] =         '"akismet api key" non valide';
$lang['akismet_error_connection'] =      'Erreur de connexion au serveur - veuillez réessayer plus tard';
$lang['akismet_spam_suspicion'] =        'Spam probable !'
?>
