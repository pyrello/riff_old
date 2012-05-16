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
projects[] = "jplayer"
projects[] = "pathauto"
projects[] = "rules"
projects[] = "sweaver"
projects[] = "token"
projects[] = "views"

; Modules :: Custom
projects[riff_base][type] = "module"
projects[riff_base][download][type] = "git"
projects[riff_base][download][url] = "git://github.com/webgeeks/riff_base.git"
projects[riff_base][download][branch] = "7.x-1.x"
projects[riff_music_content][type] = "module"
projects[riff_music_content][download][type] = "git"
projects[riff_music_content][download][url] = "git://github.com/webgeeks/riff_music_content.git"
projects[riff_music_content][download][branch] = "7.x-1.x"

; Themes
projects[] = "omega"

; Themes :: Custom
projects[bumpin][type] = "theme"
projects[bumpin][download][type] = "git"
projects[bumpin][download][url] = "git://github.com/webgeeks/bumpin.git"
projects[bumpin][download][branch] = "7.x-1.x"

; Javascript Libraries