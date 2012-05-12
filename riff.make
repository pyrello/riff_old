; This is the makefile for the Riff distribution
core = 7.x

api = 2
projects[] = "drupal"
; Modules
projects[] = "addressfield"
projects[] = "admin"
projects[] = "ctools"
projects[] = "commerce"
projects[] = "commerce_paypal"
projects[] = "date"
projects[] = "entity"
projects[] = "rules"
projects[] = "views"
; Riff-specific modules
projects[riff_base][download][type] = "git"
projects[riff_base][download][url] = "git@github.com:webgeeks/riff_base.git"

; Themes
projects[] = "omega"