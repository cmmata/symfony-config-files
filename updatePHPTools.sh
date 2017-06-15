#!/bin/zsh
source ./bashColors.sh
echo -e "\n${BBlu}Updating PHP & Symfony tools: composer phing phive phpcpd phpcs php-cs-fixer phpdoc phpdox phploc phpmd pdepend dephpend phpunit phpunit-skelgen symfony symfony-upgrade-fixer deprecation-detector\n${RCol}"
TEMP=/tmp/updates
DEST=/usr/local/bin
# Creating a temporal working directory
mkdir ${TEMP}
cd ${TEMP}
# Composer
echo -e "\n${BPur}Composer global\n${RCol}"
sudo ${DEST}/composer selfupdate
# Robo
echo -e "\n${BPur}Robo\n${RCol}"
wget http://robo.li/robo.phar
chmod +x robo.phar
sudo mv robo.phar ${DEST}/robo
#phive
sudo ${DEST}/phive selfupdate
#phpcpd
echo -e "\n${BPur}PHPCPD\n${RCol}"
sudo ${DEST}/phive install phpcpd --target ${DEST}/ --copy
#phpcs
echo -e "\n${BPur}PHP CodeSniffer\n${RCol}"
wget https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar
chmod +x phpcs.phar
sudo mv phpcs.phar ${DEST}/phpcs
#php-cs-fixer
echo -e "\n${BPur}PHP-cs-fixer\n${RCol}"
sudo ${DEST}/php-cs-fixer selfupdate
#phpdoc
echo -e "\n${BPur}PHPDoc\n${RCol}"
sudo ${DEST}/phive install phpdocumentor --target ${DEST}/ --copy
#phpdox
echo -e "\n${BPur}PHPDox\n${RCol}"
sudo ${DEST}/phive install phpdox --target ${DEST}/ --copy
# phploc
echo -e "\n${BPur}PHPLoc\n${RCol}"
sudo ${DEST}/phive install phploc --target ${DEST}/ --copy
# phpmd
echo -e "\n${BPur}PHPMD\n${RCol}"
wget -c http://static.phpmd.org/php/latest/phpmd.phar
chmod +x phpmd.phar
sudo mv phpmd.phar ${DEST}/phpmd
# pdepend
echo -e "\n${BPur}PDepend\n${RCol}"
wget -c http://static.pdepend.org/php/latest/pdepend.phar
chmod +x pdepend.phar
sudo mv pdepend.phar ${DEST}/pdepend
# dephpend
echo -e "\n${BPur}DePHPend\n${RCol}"
sudo ${DEST}/phive install dephpend --target ${DEST}/ --copy
# phpunit
echo -e "\n${BPur}PHPUnit\n${RCol}"
sudo ${DEST}/phive install phpunit --target ${DEST}/ --copy
# phpunit-skelgen
echo -e "\n${BPur}PHPUnit-Skelgen\n${RCol}"
wget https://phar.phpunit.de/phpunit-skelgen.phar
chmod +x phpunit-skelgen.phar
sudo mv phpunit-skelgen.phar ${DEST}/phpunit-skelgen
# Symfony upgrade fixer
wget "https://github.com/$(curl -s https://github.com/umpirsky/Symfony-Upgrade-Fixer/releases | grep phar | cut -d'"' -f2 | head -n1)"
chmod +x symfony-upgrade-fixer.phar
sudo mv symfony-upgrade-fixer.phar /usr/local/bin/symfony-upgrade-fixer
# Deprecation detector
wget "https://github.com/$(curl -s https://github.com/sensiolabs-de/deprecation-detector/releases | grep phar | cut -d'"' -f2 | head -n1)"
chmod +x deprecation-detector.phar
sudo mv deprecation-detector.phar /usr/local/bin/deprecation-detector
# Symfony
echo -e "\n${BPur}Symfony installer\n${RCol}"
sudo ${DEST}/symfony selfupdate
# Delete temporal directory
rm -rf ${TEMP}
echo -e "\n${BBlu}Tools updated\n${RCol}"
