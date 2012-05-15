; This is the makefile for the Riff distribution
core = 7.x
api = 2
;projects[] = "drupal"

; Modules :: Contrib
projects[] = "addressfield"
projects[] = "admin"
projects[] = "ctools"
;projects[] = "commerce"
;projects[] = "commerce_paypal"
projects[] = "date"
projects[] = "entity"
projects[] = "field_group"
projects[] = "pathauto"
projects[] = "rules"
projects[] = "sweaver"
projects[] = "token"
projects[] = "views"

; Modules :: Custom
projects[riff_base][download][type] = "git"
projects[riff_base][download][url] = "git://github.com/webgeeks/riff_base.git"
projects[riff_music_content][download][type] = "git"
projects[riff_music_content][download][url] = "git://github.com/webgeeks/riff_music_content.git"

; Themes
projects[] = "omega"

; Themes :: Custom