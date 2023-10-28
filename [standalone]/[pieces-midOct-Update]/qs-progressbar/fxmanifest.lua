fx_version 'cerulean'

game 'gta5'

description 'System based on mythic_progbar and edited by qbcore and quasar store'

ui_page 'html/index.html'

client_script {
    'client/main.lua'
}

files {
    'html/index.html',
    'html/css/style.css',
    'html/js/script.js',
    'html/css/bootstrap.min.css',
    'html/js/jquery.min.js'
}

exports {
    'Progress',
    'ProgressWithStartEvent',
    'ProgressWithTickEvent',
    'ProgressWithStartAndTick',
    'isDoingSomething'
}