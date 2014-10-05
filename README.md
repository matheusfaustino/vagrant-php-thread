vagrant-php-thread
==================

Vagrant Config for install PHP w/ Thread

Requirements
------------

- Vagrant
- VirtualBox
- Internet Access

Instructions
------------

- Download/Install Vagrant: http://www.vagrantup.com/
- Download/Install VirtualBox: https://www.virtualbox.org/
- Clone the repo: `git clone https://github.com/matheusfaustino/vagrant-php-thread.git`
- Running vagrant box: `cd vagrant-php-thread`, `vagrant up`

Notes
-----

- It'll create a folder `/www` inside the folder of vagrant's box, that folder is synced with folder `/var/www`
- If you don't have the precise32 box on your machine, it will automatically be downloaded. This can take a few minutes the first time.
- PHP installation could take a few minutes.

Author
------

Matheus Faustino
matheuspfaustino (at) gmail (dot) com

License
-------
Free to use and distribute under the GPLv3 license.
