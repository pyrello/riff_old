<?php

/**
 * Implements hook_form_FORM_ID_alter().
 *
 * Allows the profile to alter the site configuration form.
 */
function riff_form_install_configure_form_alter(&$form, $form_state) {
  // Pre-populate the site name with the server name.
  $form['site_information']['site_name']['#default_value'] = $_SERVER['SERVER_NAME'];
}

// == Automated install tasks ==================================================

/**
 * Implements hook_install_tasks().
 */
function riff_install_tasks($install_state) {
  return array(
    // Just a hidden task callback.
    'riff_profile_setup' => array(),
  );
}

/**
 * Installer task callback.
 */
function riff_profile_setup() {
  global $language;

  // Add a node describing how to get started with Acquia Drupal
  $welcome_file = 'profiles/riff/' . $language->language . '/welcome.txt';
  if (!file_exists($welcome_file)) {
    drupal_set_message(t('Could not find file @filepath.', array('@filepath' => $welcome_file)), 'error');
    $welcome_file = 'profiles/riff/en/welcome.txt';
  }
  if ($welcome_node = _riff_profile_create_node($welcome_file, 'page')) {
    node_save($welcome_node);
    variable_set('riff_welcome', $welcome_node->nid);
  }
  else {
    drupal_set_message(t('The file @filepath could not be read. The welcome message will not be generated.', array('@filepath' => $welcome_file)), 'error');
  }
}

/**
 * Creates a node from the specified filename.
 *
 * The node body will contain the contents of the file. All relative links must
 * be identified within the file so they can be mapped to paths appropriate for
 * the installation.
 *
 * The relative links are identified in the file by surrounding the actual
 * link with double square brackets. For example:
 *
 * <a href="[[admin]]">Admin page</a>
 *
 * @param $filename
 *   The name of the file to retrieve the text from.
 * @param $page_type
 *   The type of node to create.
 */
function _riff_profile_create_node($filename, $page_type) {
  $contents = trim(file_get_contents($filename));
  if (!$contents) {
    return null;
  }

  // Grab the title from the document and then remove the title so it
  // isn't shown in the title and the body. The title will be encoded
  // in the document in the following form:
  // <h1 [class="..."]>{TITLE}</h1>
  $title_regexp = "/[\<]h1(\s*[^=\>]*=\"[^\"]*\")*\s*[\>](.*)\<\/h1\>/i";
  if (preg_match($title_regexp, $contents, $match)) {
    $title = $match[count($match) - 1];
    // Remove the title from the body of the document.
    $contents = preg_replace($title_regexp, '', $contents);
  }

  // Replace all local links with the full path.
  $options = array();
  $options['alias'] = TRUE;
  $link_regexp = "/(\[\[)([\/?\w+\-*]+)(\]\])/e";
  $contents = preg_replace($link_regexp, 'check_url(url("\2", $options))', $contents);
  $node = new stdClass();
  $node->title = $title;
  $node->body['und'][0]['value'] = $contents;
  $node->body['und'][0]['summary'] = $contents;
  $node->body['und'][0]['format'] = 'full_html';
  $node->uid = 1;
  $node->type = $page_type;
  $node->status = 1;
  $node->promote = 1;
  return $node;
}
