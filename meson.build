project('com.github.eudaldgr.elements', 'vala', 'c')

gnome = import('gnome')
i18n = import('i18n')

add_project_arguments(
    '-DGETTEXT_PACKAGE="@0@"'.format(meson.project_name()),
    language: 'c'
)

asresources = gnome.compile_resources(
    'as-resources',
    'data/' + meson.project_name() + '.gresource.xml',
    source_dir: 'data',
    c_name: 'as'
)

subdir('data')
subdir('po')
subdir('src')

meson.add_install_script(join_paths('meson', 'post_install.py'))
