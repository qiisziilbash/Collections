## sudo apt-get update
# sudo apt-get install python3-pip apache2 libapache2-mod-wsgi-py3
# sudo pip install virtualenv

# cd /var/www/
# git clone [get url form github]
# cd ayass_lab_management_system
# virtualenv venv (no sudo; user should have permission themselves)
# source venv/bin/activate
# pip install -r reuirements.txt

# python manage.py migrate
# python manage.py runserver (make sure it is running)
Ctrl+c (terminte it)
# deactivate

# cd /etc/apache2/sites-available
# sudo nano ayass_lab_management_system.conf
Copy the following:
===========================                                                                                                         ayass_lab_management_system.conf                                                                                                                           
<VirtualHost *:80>

    <Directory /var/www/ayass_lab_management_system>
        <Files wsgi.py>
            Require all granted
        </Files>
    </Directory>

    WSGIDaemonProcess ayass_lab_management_system python-path=/var/www/ayass_lab_management_system python-home=/var/www/ayass_lab_management_system/venv
    WSGIProcessGroup ayass_lab_management_system
    WSGIScriptAlias / /var/www/ayass_lab_management_system/ayass_lab_management_system/wsgi.py

    Alias /static /var/www/ayass_lab_management_system/static
    <Directory /var/www/ayass_lab_management_system/static>
        Require all granted
    </Directory>

</VirtualHost>
==============================
Ctrl + s (save)
Ctrl + x (exit)

# sudo a2ensite ayass_lab_management_system.conf
# sudo service apache2 reload
# sudo service apache2 retart
