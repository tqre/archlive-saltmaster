nginx:
  pkg.installed

/etc/nginx/sites-available/default:
  file.managed:
    - source: salt://ubuntuserver/nginx/defaultsite

/etc/nginx/sites-enabled/default:
  file.symlink:
    - target: ../sites-available/default

/srv/html/index.html:
  file.managed:
    - source: salt://ubuntuserver/nginx/default_page.html
    - makedirs: True

nginx-webserver:
  service.running:
    - name: nginx
    - watch:
      - file: /etc/nginx/sites-available/default
