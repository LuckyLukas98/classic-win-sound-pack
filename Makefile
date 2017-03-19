
PREFIX = /usr
VERSION = $(shell sh control.sh ${DESTDIR})
CURRENTVERSION = $(shell cat "version.txt")

all:

install:
ifeq (${VERSION}, false)
	@echo "Installing Classic Windows Sound Pack (${CURRENTVERSION})"
	@install -Dm644 index.theme ${DESTDIR}${PREFIX}/share/sounds/deepin/index.theme
	@mkdir ${DESTDIR}${PREFIX}/share/sounds/deepin/stereo.bak
	@cp -a ${DESTDIR}${PREFIX}/share/sounds/deepin/stereo/. ${DESTDIR}${PREFIX}/share/sounds/deepin/stereo.bak
	@cp -r stereo ${DESTDIR}${PREFIX}/share/sounds/deepin
	@cp version.txt ${DESTDIR}${PREFIX}/share/sounds/deepin/stereo
	@echo "Installed succesfully"
else
	@echo "Classic Windows Sound Pack is already installed (${VERSION})"
	@echo "Did you mean "sudo make uninstall" or "sudo make update"?"
endif
 
uninstall:
ifeq (${VERSION}, false)
	@echo 'You have to install Classic Windows Sound Pack before using "sudo make uninstall'
	@echo 'Use "sudo make install" to install Classic Windows Sound Pack'
else
	@cp -a ${DESTDIR}${PREFIX}/share/sounds/deepin/stereo.bak/. ${DESTDIR}${PREFIX}/share/sounds/deepin/stereo
	@rm -rf ${DESTDIR}${PREFIX}/share/sounds/deepin/stereo.bak
	@rm -f ${DESTDIR}${PREFIX}/share/sounds/deepin/stereo/version.txt
endif

update-simple:
ifeq (${VERSION}, false)
	@echo "Classic Windows Sound Pack is not yet installed"
	@echo 'To install Classic Windows Sound Pack run "sudo make install"'
else ifeq (${VERSION}, ${CURRENTVERSION})
	@echo 'Version "${CURRENTVERSION}" is already installed'
else
	@echo 'Updating to Version "${CURRENTVERSION}"...'
	@install -Dm644 index.theme ${DESTDIR}${PREFIX}/share/sounds/deepin/index$
	@yes | cp -rf stereo ${DESTDIR}${PREFIX}/share/sounds/deepin
	@yes | cp -f version.txt ${DESTDIR}${PREFIX}/share/sounds/deepin/stereo
	@echo 'Update succesful'
endif

