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
projects[] = "entityreference"
projects[] = "features"
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
projects[fly][type] = "theme"
projects[fly][download][type] = "git"
projects[fly][download][url] = "git://github.com/webgeeks/fly.git"
projects[fly][download][branch] = "7.x-1.x"

projects[muse][type] = "theme"
projects[muse][download][type] = "git"
projects[muse][download][url] = "git://github.com/webgeeks/muse.git"
projects[muse][download][branch] = "7.x-1.x"

; Javascript Libraries
libraries[jplayer][download][type] = "get"
libraries[jplayer][download][url] = "http://www.jplayer.org/latest/jQuery.jPlayer.2.1.0.zip"
libraries[jplayer][directory_name] = "jplayer"