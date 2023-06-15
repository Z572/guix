# GNU Guix --- Functional package management for GNU
# Copyright © 2012-2023 Ludovic Courtès <ludo@gnu.org>
# Copyright © 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2022, 2023 Andreas Enge <andreas@enge.fr>
# Copyright © 2016 Mathieu Lirzin <mthl@gnu.org>
# Copyright © 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021 Mark H Weaver <mhw@netris.org>
# Copyright © 2016 Chris Marusich <cmmarusich@gmail.com>
# Copyright © 2016, 2017, 2018 Kei Kebreau <kkebreau@posteo.net>
# Copyright © 2016, 2017 Rene Saavedra <rennes@openmailbox.org>
# Copyright © 2016 Adonay "adfeno" Felipe Nogueira <https://libreplanet.org/wiki/User:Adfeno> <adfeno@openmailbox.org>
# Copyright © 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023 Ricardo Wurmus <rekado@elephly.net>
# Copyright © 2016 Ben Woodcroft <donttrustben@gmail.com>
# Copyright © 2016, 2017, 2018, 2019 Alex Vong <alexvong1995@gmail.com>
# Copyright © 2016-2023 Efraim Flashner <efraim@flashner.co.il>
# Copyright © 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023 Jan (janneke) Nieuwenhuizen <janneke@gnu.org>
# Copyright © 2017, 2018, 2019, 2020 Tobias Geerinckx-Rice <me@tobias.gr>
# Copyright © 2017, 2018 Clément Lassieur <clement@lassieur.org>
# Copyright © 2017, 2020 Mathieu Othacehe <m.othacehe@gmail.com>
# Copyright © 2017, 2018, 2019 Gábor Boskovits <boskovits@gmail.com>
# Copyright © 2018 Amirouche Boubekki <amirouche@hypermove.net>
# Copyright © 2018, 2019, 2020, 2021, 2022 Oleg Pykhalov <go.wigust@gmail.com>
# Copyright © 2018 Stefan Stefanović <stefanx2ovic@gmail.com>
# Copyright © 2018, 2020, 2021, 2022, 2023 Maxim Cournoyer <maxim.cournoyer@gmail.com>
# Copyright © 2019, 2020, 2021, 2022 Guillaume Le Vaillant <glv@posteo.net>
# Copyright © 2019, 2020 John Soo <jsoo1@asu.edu>
# Copyright © 2019 Jonathan Brielmaier <jonathan.brielmaier@web.de>
# Copyright © 2019 Evan Straw <evan.straw99@gmail.com>
# Copyright © 2019, 2020 Brett Gilio <brettg@gnu.org>
# Copyright © 2019 Amin Bandali <bandali@gnu.org>
# Copyright © 2020 Brendan Tildesley <mail@brendan.scot>
# Copyright © 2020 Vincent Legoll <vincent.legoll@gmail.com>
# Copyright © 2020 R Veera Kumar <vkor@vkten.in>
# Copyright © 2020 Nicolò Balzarotti <nicolo@nixo.xyz>
# Copyright © 2020 Michael Rohleder <mike@rohleder.de>
# Copyright © 2020, 2021, 2022 Felix Gruber <felgru@posteo.net>
# Copyright © 2020 Ryan Prior <rprior@protonmail.com>
# Copyright © 2020 Jan Wielkiewicz <tona_kosmicznego_smiecia@interia.pl>
# Copyright © 2020, 2021 Brice Waegeneire <brice@waegenei.re>
# Copyright © 2020, 2023 Tanguy Le Carrour <tanguy@bioneland.org>
# Copyright © 2020 Martin Becze <mjbecze@riseup.net>
# Copyright © 2020 Malte Frank Gerdes <mate.f.gerdes@gmail.com>
# Copyright © 2020, 2023 Vinicius Monego <monego@posteo.net>
# Copyright © 2021 Björn Höfling <bjoern.hoefling@bjoernhoefling.de>
# Copyright © 2021 Greg Hogan <code@greghogan.com>
# Copyright © 2021, 2022, 2023 Philip McGrath <philip@philipmcgrath.com>
# Copyright © 2021 Arun Isaac <arunisaac@systemreboot.net>
# Copyright © 2021 Sharlatan Hellseher <sharlatanus@gmail.com>
# Copyright © 2021 Dmitry Polyakov <polyakov@liltechdude.xyz>
# Copyright © 2021 Andrew Tropin <andrew@trop.in>
# Copyright © 2021 Simon Tournier <zimon.toutoune@gmail.com>
# Copyright © 2022 Daniel Meißner <daniel.meissner-i4k@ruhr-uni-bochum.de>
# Copyright © 2022 Remco van 't Veer <remco@remworks.net>
# Copyright © 2022 Artyom V. Poptsov <poptsov.artyom@gmail.com>
# Copyright © 2022 John Kehayias <john.kehayias@protonmail.com>
# Copyright © 2022 muradm <mail@muradm.net>
# Copyright © 2022 Hilton Chain <hako@ultrarare.space>
# Copyright © 2022 Alex Griffin <a@ajgrf.com>
# Copyright © 2022 ( <paren@disroot.org>
# Copyright © 2022 jgart <jgart@dismail.de>
# Copyright © 2023 Zheng Junjie <873216071@qq.com>
# Copyright © 2023 Ivana Drazovic <iv.dra@hotmail.com>
# Copyright © 2023 Andy Tai <atai@atai.org>
#
# This file is part of GNU Guix.
#
# GNU Guix is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or (at
# your option) any later version.
#
# GNU Guix is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

# Definitions for the GNU System: package modules, patches, bootstrap
# binaries.

GNU_SYSTEM_MODULES =				\
  gnu.scm					\
  %D%/artwork.scm				\
  %D%/bootloader.scm				\
  %D%/bootloader/grub.scm                       \
  %D%/bootloader/extlinux.scm                   \
  %D%/bootloader/u-boot.scm                     \
  %D%/bootloader/depthcharge.scm                \
  %D%/ci.scm					\
  %D%/compression.scm				\
  %D%/home.scm					\
  %D%/home/services.scm			\
  %D%/home/services/desktop.scm			\
  %D%/home/services/symlink-manager.scm		\
  %D%/home/services/fontutils.scm		\
  %D%/home/services/gnupg.scm			\
  %D%/home/services/guix.scm			\
  %D%/home/services/mail.scm			\
  %D%/home/services/media.scm			\
  %D%/home/services/messaging.scm		\
  %D%/home/services/pm.scm			\
  %D%/home/services/shells.scm			\
  %D%/home/services/shepherd.scm		\
  %D%/home/services/sound.scm			\
  %D%/home/services/ssh.scm			\
  %D%/home/services/mcron.scm			\
  %D%/home/services/utils.scm			\
  %D%/home/services/xdg.scm			\
  %D%/image.scm					\
  %D%/packages.scm				\
  %D%/packages/abduco.scm			\
  %D%/packages/abiword.scm			\
  %D%/packages/accessibility.scm		\
  %D%/packages/acct.scm				\
  %D%/packages/acl.scm				\
  %D%/packages/ada.scm				\
  %D%/packages/admin.scm			\
  %D%/packages/adns.scm				\
  %D%/packages/agda.scm				\
  %D%/packages/algebra.scm			\
  %D%/packages/aidc.scm				\
  %D%/packages/android.scm			\
  %D%/packages/animation.scm			\
  %D%/packages/anthy.scm			\
  %D%/packages/antivirus.scm			\
  %D%/packages/apl.scm				\
  %D%/packages/apparmor.scm			\
  %D%/packages/apr.scm				\
  %D%/packages/arcan.scm			\
  %D%/packages/aspell.scm			\
  %D%/packages/assembly.scm			\
  %D%/packages/astronomy.scm			\
  %D%/packages/attr.scm				\
  %D%/packages/audio.scm			\
  %D%/packages/augeas.scm			\
  %D%/packages/authentication.scm		\
  %D%/packages/autogen.scm			\
  %D%/packages/autotools.scm			\
  %D%/packages/avahi.scm			\
  %D%/packages/avr.scm				\
  %D%/packages/avr-xyz.scm			\
  %D%/packages/axoloti.scm			\
  %D%/packages/backup.scm			\
  %D%/packages/base.scm				\
  %D%/packages/barrier.scm			\
  %D%/packages/bash.scm				\
  %D%/packages/batik.scm			\
  %D%/packages/bdw-gc.scm			\
  %D%/packages/benchmark.scm			\
  %D%/packages/bioconductor.scm			\
  %D%/packages/bioinformatics.scm		\
  %D%/packages/bittorrent.scm			\
  %D%/packages/bison.scm			\
  %D%/packages/boost.scm			\
  %D%/packages/bootloaders.scm			\
  %D%/packages/bootstrap.scm			\
  %D%/packages/browser-extensions.scm		\
  %D%/packages/build-tools.scm			\
  %D%/packages/busybox.scm			\
  %D%/packages/bqn.scm				\
  %D%/packages/c.scm				\
  %D%/packages/calcurse.scm			\
  %D%/packages/ccache.scm			\
  %D%/packages/cdrom.scm			\
  %D%/packages/cedille.scm			\
  %D%/packages/certs.scm			\
  %D%/packages/check.scm			\
  %D%/packages/chemistry.scm			\
  %D%/packages/chez.scm				\
  %D%/packages/chicken.scm				\
  %D%/packages/chromium.scm			\
  %D%/packages/ci.scm				\
  %D%/packages/cinnamon.scm			\
  %D%/packages/clojure.scm			\
  %D%/packages/cluster.scm			\
  %D%/packages/cmake.scm			\
  %D%/packages/cobol.scm			\
  %D%/packages/code.scm				\
  %D%/packages/commencement.scm			\
  %D%/packages/compression.scm			\
  %D%/packages/compton.scm 			\
  %D%/packages/configuration-management.scm	\
  %D%/packages/conky.scm			\
  %D%/packages/connman.scm			\
  %D%/packages/containers.scm			\
  %D%/packages/convmv.scm			\
  %D%/packages/cook.scm				\
  %D%/packages/coq.scm				\
  %D%/packages/cpio.scm				\
  %D%/packages/cpp.scm 				\
  %D%/packages/cppi.scm				\
  %D%/packages/cran.scm				\
  %D%/packages/crates-io.scm			\
  %D%/packages/crates-graphics.scm		\
  %D%/packages/crates-gtk.scm			\
  %D%/packages/cross-base.scm			\
  %D%/packages/crypto.scm			\
  %D%/packages/cryptsetup.scm			\
  %D%/packages/cups.scm				\
  %D%/packages/curl.scm				\
  %D%/packages/cvassistant.scm			\
  %D%/packages/cybersecurity.scm		\
  %D%/packages/cyrus-sasl.scm			\
  %D%/packages/darwin.scm			\
  %D%/packages/databases.scm			\
  %D%/packages/datamash.scm			\
  %D%/packages/datastructures.scm		\
  %D%/packages/dav.scm				\
  %D%/packages/dbm.scm				\
  %D%/packages/dc.scm				\
  %D%/packages/debian.scm			\
  %D%/packages/debug.scm			\
  %D%/packages/dejagnu.scm			\
  %D%/packages/dezyne.scm			\
  %D%/packages/dhall.scm			\
  %D%/packages/dico.scm				\
  %D%/packages/dictionaries.scm			\
  %D%/packages/diffoscope.scm			\
  %D%/packages/digest.scm			\
  %D%/packages/direct-connect.scm		\
  %D%/packages/disk.scm			\
  %D%/packages/distributed.scm			\
  %D%/packages/display-managers.scm		\
  %D%/packages/django.scm			\
  %D%/packages/djvu.scm				\
  %D%/packages/dlang.scm			\
  %D%/packages/dns.scm				\
  %D%/packages/docbook.scm			\
  %D%/packages/docker.scm			\
  %D%/packages/documentation.scm		\
  %D%/packages/dunst.scm			\
  %D%/packages/dvtm.scm				\
  %D%/packages/easyrpg.scm			\
  %D%/packages/ebook.scm			\
  %D%/packages/ed.scm				\
  %D%/packages/education.scm			\
  %D%/packages/efi.scm				\
  %D%/packages/electronics.scm			\
  %D%/packages/elf.scm				\
  %D%/packages/elixir.scm			\
  %D%/packages/elm.scm				\
  %D%/packages/embedded.scm			\
  %D%/packages/emacs.scm			\
  %D%/packages/emacs-xyz.scm			\
  %D%/packages/emulators.scm			\
  %D%/packages/enchant.scm			\
  %D%/packages/engineering.scm			\
  %D%/packages/enlightenment.scm		\
  %D%/packages/entr.scm				\
  %D%/packages/erlang.scm			\
  %D%/packages/esolangs.scm			\
  %D%/packages/fabric-management.scm		\
  %D%/packages/fcitx.scm			\
  %D%/packages/fcitx5.scm			\
  %D%/packages/figlet.scm			\
  %D%/packages/file.scm				\
  %D%/packages/file-systems.scm			\
  %D%/packages/finance.scm			\
  %D%/packages/firmware.scm			\
  %D%/packages/flashing-tools.scm		\
  %D%/packages/flex.scm				\
  %D%/packages/fltk.scm				\
  %D%/packages/fonts.scm			\
  %D%/packages/fontutils.scm			\
  %D%/packages/fpga.scm				\
  %D%/packages/forth.scm			\
  %D%/packages/freedesktop.scm			\
  %D%/packages/freeipmi.scm			\
  %D%/packages/fsf.scm				\
  %D%/packages/ftp.scm				\
  %D%/packages/fribidi.scm			\
  %D%/packages/fvwm.scm				\
  %D%/packages/game-development.scm		\
  %D%/packages/games.scm			\
  %D%/packages/gawk.scm				\
  %D%/packages/gcal.scm				\
  %D%/packages/gcc.scm				\
  %D%/packages/gd.scm				\
  %D%/packages/gdb.scm				\
  %D%/packages/genealogy.scm			\
  %D%/packages/genimage.scm			\
  %D%/packages/geo.scm				\
  %D%/packages/gettext.scm			\
  %D%/packages/ghostscript.scm			\
  %D%/packages/gimp.scm				\
  %D%/packages/gkrellm.scm			\
  %D%/packages/gl.scm				\
  %D%/packages/glib.scm				\
  %D%/packages/gnome.scm			\
  %D%/packages/gnome-xyz.scm			\
  %D%/packages/gnu-doc.scm			\
  %D%/packages/gnucash.scm			\
  %D%/packages/gnunet.scm			\
  %D%/packages/gnupg.scm			\
  %D%/packages/gnustep.scm			\
  %D%/packages/gnuzilla.scm			\
  %D%/packages/gnu-pw-mgr.scm			\
  %D%/packages/gobby.scm			\
  %D%/packages/golang.scm			\
  %D%/packages/gperf.scm			\
  %D%/packages/gpodder.scm			\
  %D%/packages/gps.scm				\
  %D%/packages/graph.scm			\
  %D%/packages/graphics.scm			\
  %D%/packages/graphviz.scm			\
  %D%/packages/groff.scm			\
  %D%/packages/groovy.scm			\
  %D%/packages/gsasl.scm			\
  %D%/packages/gstreamer.scm			\
  %D%/packages/gtk.scm				\
  %D%/packages/guile.scm			\
  %D%/packages/guile-wm.scm			\
  %D%/packages/guile-xyz.scm			\
  %D%/packages/gv.scm				\
  %D%/packages/gxmessage.scm			\
  %D%/packages/hardware.scm			\
  %D%/packages/haskell.scm			\
  %D%/packages/haskell-apps.scm			\
  %D%/packages/haskell-check.scm		\
  %D%/packages/haskell-crypto.scm		\
  %D%/packages/haskell-web.scm			\
  %D%/packages/haskell-xyz.scm			\
  %D%/packages/haxe.scm				\
  %D%/packages/heads.scm			\
  %D%/packages/hexedit.scm			\
  %D%/packages/high-availability.scm			\
  %D%/packages/hugs.scm				\
  %D%/packages/hunspell.scm				\
  %D%/packages/hurd.scm				\
  %D%/packages/hyperledger.scm			\
  %D%/packages/i2p.scm				\
  %D%/packages/ibus.scm				\
  %D%/packages/icu4c.scm			\
  %D%/packages/idris.scm			\
  %D%/packages/idutils.scm			\
  %D%/packages/image.scm			\
  %D%/packages/image-processing.scm	\
  %D%/packages/image-viewers.scm	\
  %D%/packages/imagemagick.scm			\
  %D%/packages/inklingreader.scm		\
  %D%/packages/inkscape.scm			\
  %D%/packages/installers.scm			\
  %D%/packages/instrumentation.scm		\
  %D%/packages/ipfs.scm			\
  %D%/packages/irc.scm  			\
  %D%/packages/irods.scm  			\
  %D%/packages/iso-codes.scm			\
  %D%/packages/jami.scm				\
  %D%/packages/java.scm				\
  %D%/packages/java-bootstrap.scm		\
  %D%/packages/java-compression.scm		\
  %D%/packages/java-graphics.scm		\
  %D%/packages/java-maths.scm			\
  %D%/packages/java-xml.scm			\
  %D%/packages/javascript.scm			\
  %D%/packages/jemalloc.scm			\
  %D%/packages/jose.scm				\
  %D%/packages/julia.scm			\
  %D%/packages/julia-jll.scm			\
  %D%/packages/julia-xyz.scm			\
  %D%/packages/jupyter.scm			\
  %D%/packages/kawa.scm				\
  %D%/packages/kde.scm				\
  %D%/packages/kde-frameworks.scm		\
  %D%/packages/kde-games.scm			\
  %D%/packages/kde-internet.scm			\
  %D%/packages/kde-multimedia.scm		\
  %D%/packages/kde-pim.scm			\
  %D%/packages/kde-plasma.scm			\
  %D%/packages/kde-systemtools.scm		\
  %D%/packages/kde-utils.scm			\
  %D%/packages/kerberos.scm			\
  %D%/packages/kodi.scm				\
  %D%/packages/language.scm			\
  %D%/packages/lean.scm				\
  %D%/packages/lego.scm				\
  %D%/packages/less.scm				\
  %D%/packages/lesstif.scm			\
  %D%/packages/libbsd.scm			\
  %D%/packages/libcanberra.scm			\
  %D%/packages/libdaemon.scm			\
  %D%/packages/libedit.scm			\
  %D%/packages/libevent.scm			\
  %D%/packages/libffcall.scm			\
  %D%/packages/libffi.scm			\
  %D%/packages/libftdi.scm			\
  %D%/packages/license.scm			\
  %D%/packages/calendar.scm			\
  %D%/packages/libidn.scm			\
  %D%/packages/libphidget.scm			\
  %D%/packages/libreoffice.scm			\
  %D%/packages/libsigsegv.scm			\
  %D%/packages/libunistring.scm			\
  %D%/packages/libusb.scm			\
  %D%/packages/libunwind.scm			\
  %D%/packages/lighting.scm                     \
  %D%/packages/linphone.scm			\
  %D%/packages/linux.scm			\
  %D%/packages/lirc.scm				\
  %D%/packages/lisp.scm				\
  %D%/packages/lisp-check.scm			\
  %D%/packages/lisp-xyz.scm			\
  %D%/packages/llvm.scm				\
  %D%/packages/lout.scm				\
  %D%/packages/logging.scm			\
  %D%/packages/logo.scm				\
  %D%/packages/loko.scm				\
  %D%/packages/lsof.scm				\
  %D%/packages/lua.scm				\
  %D%/packages/lxde.scm				\
  %D%/packages/lxqt.scm				\
  %D%/packages/m4.scm				\
  %D%/packages/machine-learning.scm		\
  %D%/packages/magic-wormhole.scm		\
  %D%/packages/man.scm				\
  %D%/packages/mastodon.scm			\
  %D%/packages/mail.scm				\
  %D%/packages/make-bootstrap.scm		\
  %D%/packages/markup.scm			\
  %D%/packages/marst.scm			\
  %D%/packages/mate.scm             \
  %D%/packages/maths.scm			\
  %D%/packages/matrix.scm			\
  %D%/packages/maven.scm			\
  %D%/packages/maven-parent-pom.scm		\
  %D%/packages/mc.scm				\
  %D%/packages/mcrypt.scm			\
  %D%/packages/medical.scm			\
  %D%/packages/mercury.scm			\
  %D%/packages/mes.scm				\
  %D%/packages/messaging.scm			\
  %D%/packages/minetest.scm			\
  %D%/packages/mingw.scm			\
  %D%/packages/microcom.scm			\
  %D%/packages/moe.scm				\
  %D%/packages/mold.scm				\
  %D%/packages/motti.scm			\
  %D%/packages/monitoring.scm			\
  %D%/packages/moreutils.scm			\
  %D%/packages/mpd.scm				\
  %D%/packages/mp3.scm				\
  %D%/packages/mpi.scm				\
  %D%/packages/multiprecision.scm		\
  %D%/packages/music.scm			\
  %D%/packages/musl.scm				\
  %D%/packages/mtools.scm			\
  %D%/packages/myrddin.scm			\
  %D%/packages/nano.scm				\
  %D%/packages/ncdu.scm				\
  %D%/packages/ncurses.scm			\
  %D%/packages/netpbm.scm			\
  %D%/packages/nettle.scm			\
  %D%/packages/networking.scm			\
  %D%/packages/nfs.scm                          \
  %D%/packages/nickle.scm                       \
  %D%/packages/nicotine.scm                     \
  %D%/packages/nim.scm  			\
  %D%/packages/ninja.scm			\
  %D%/packages/node.scm				\
  %D%/packages/node-xyz.scm			\
  %D%/packages/notcurses.scm			\
  %D%/packages/noweb.scm			\
  %D%/packages/nss.scm				\
  %D%/packages/ntp.scm				\
  %D%/packages/nutrition.scm			\
  %D%/packages/nvi.scm				\
  %D%/packages/ocaml.scm			\
  %D%/packages/ocr.scm				\
  %D%/packages/openkinect.scm			\
  %D%/packages/onc-rpc.scm			\
  %D%/packages/opencl.scm			\
  %D%/packages/openbox.scm			\
  %D%/packages/opencog.scm			\
  %D%/packages/openldap.scm			\
  %D%/packages/openpgp.scm			\
  %D%/packages/openstack.scm			\
  %D%/packages/orange.scm			\
  %D%/packages/orpheus.scm			\
  %D%/packages/ots.scm				\
  %D%/packages/package-management.scm		\
  %D%/packages/pantheon.scm			\
  %D%/packages/parallel.scm			\
  %D%/packages/pascal.scm			\
  %D%/packages/password-utils.scm		\
  %D%/packages/patool.scm			\
  %D%/packages/patchutils.scm			\
  %D%/packages/pciutils.scm			\
  %D%/packages/pcre.scm				\
  %D%/packages/pdf.scm				\
  %D%/packages/pem.scm				\
  %D%/packages/pep.scm				\
  %D%/packages/perl.scm				\
  %D%/packages/perl-check.scm			\
  %D%/packages/perl-compression.scm		\
  %D%/packages/perl-maths.scm			\
  %D%/packages/perl-web.scm			\
  %D%/packages/perl6.scm			\
  %D%/packages/photo.scm			\
  %D%/packages/phabricator.scm 			\
  %D%/packages/php.scm				\
  %D%/packages/piet.scm			\
  %D%/packages/pikchr.scm			\
  %D%/packages/pkg-config.scm			\
  %D%/packages/plan9.scm			\
  %D%/packages/plotutils.scm			\
  %D%/packages/poedit.scm				\
  %D%/packages/polkit.scm			\
  %D%/packages/popt.scm				\
  %D%/packages/potassco.scm				\
  %D%/packages/printers.scm			\
  %D%/packages/profiling.scm			\
  %D%/packages/prolog.scm			\
  %D%/packages/pth.scm				\
  %D%/packages/pulseaudio.scm			\
  %D%/packages/pumpio.scm			\
  %D%/packages/presentation.scm		\
  %D%/packages/pretty-print.scm			\
  %D%/packages/protobuf.scm			\
  %D%/packages/pure.scm				\
  %D%/packages/purescript.scm			\
  %D%/packages/pv.scm				\
  %D%/packages/pypy.scm				\
  %D%/packages/python.scm			\
  %D%/packages/python-build.scm			\
  %D%/packages/python-check.scm			\
  %D%/packages/python-compression.scm		\
  %D%/packages/python-crypto.scm		\
  %D%/packages/python-science.scm		\
  %D%/packages/python-web.scm			\
  %D%/packages/python-xyz.scm			\
  %D%/packages/toys.scm				\
  %D%/packages/tryton.scm			\
  %D%/packages/qt.scm				\
  %D%/packages/racket.scm			\
  %D%/packages/radio.scm			\
  %D%/packages/ragel.scm			\
  %D%/packages/rails.scm			\
  %D%/packages/raspberry-pi.scm			\
  %D%/packages/ratpoison.scm			\
  %D%/packages/rcm.scm				\
  %D%/packages/rdesktop.scm			\
  %D%/packages/rdf.scm				\
  %D%/packages/re2c.scm				\
  %D%/packages/readline.scm			\
  %D%/packages/rednotebook.scm			\
  %D%/packages/regex.scm				\
  %D%/packages/robotics.scm			\
  %D%/packages/rocm.scm				\
  %D%/packages/rpc.scm				\
  %D%/packages/rpm.scm				\
  %D%/packages/rrdtool.scm			\
  %D%/packages/rsync.scm			\
  %D%/packages/ruby.scm				\
  %D%/packages/rush.scm				\
  %D%/packages/rust.scm				\
  %D%/packages/rust-apps.scm			\
  %D%/packages/samba.scm			\
  %D%/packages/sagemath.scm			\
  %D%/packages/sawfish.scm			\
  %D%/packages/scanner.scm			\
  %D%/packages/scheme.scm			\
  %D%/packages/spreadsheet.scm			\
  %D%/packages/screen.scm			\
  %D%/packages/scribus.scm			\
  %D%/packages/scsi.scm				\
  %D%/packages/sdl.scm				\
  %D%/packages/search.scm			\
  %D%/packages/security-token.scm		\
  %D%/packages/selinux.scm			\
  %D%/packages/sequoia.scm			\
  %D%/packages/serialization.scm		\
  %D%/packages/serveez.scm			\
  %D%/packages/shells.scm			\
  %D%/packages/shellutils.scm			\
  %D%/packages/simh.scm				\
  %D%/packages/simulation.scm			\
  %D%/packages/skarnet.scm			\
  %D%/packages/skribilo.scm			\
  %D%/packages/slang.scm			\
  %D%/packages/smalltalk.scm			\
  %D%/packages/sml.scm				\
  %D%/packages/solidity.scm			\
  %D%/packages/speech.scm			\
  %D%/packages/sphinx.scm			\
  %D%/packages/spice.scm			\
  %D%/packages/sqlite.scm			\
  %D%/packages/squirrel.scm			\
  %D%/packages/ssh.scm				\
  %D%/packages/sssd.scm				\
  %D%/packages/stalonetray.scm			\
  %D%/packages/statistics.scm			\
  %D%/packages/stb.scm				\
  %D%/packages/stenography.scm			\
  %D%/packages/storage.scm			\
  %D%/packages/suckless.scm			\
  %D%/packages/sugar.scm			\
  %D%/packages/swig.scm				\
  %D%/packages/sycl.scm				\
  %D%/packages/sync.scm			\
  %D%/packages/syncthing.scm			\
  %D%/packages/synergy.scm			\
  %D%/packages/syndication.scm			\
  %D%/packages/task-management.scm		\
  %D%/packages/task-runners.scm			\
  %D%/packages/tbb.scm				\
  %D%/packages/tcl.scm				\
  %D%/packages/telegram.scm                 \
  %D%/packages/telephony.scm			\
  %D%/packages/terminals.scm			\
  %D%/packages/terraform.scm			\
  %D%/packages/texinfo.scm			\
  %D%/packages/tex.scm				\
  %D%/packages/textutils.scm			\
  %D%/packages/text-editors.scm			\
  %D%/packages/time.scm				\
  %D%/packages/tls.scm				\
  %D%/packages/tmux.scm				\
  %D%/packages/toolkits.scm			\
  %D%/packages/tor.scm				\
  %D%/packages/tree-sitter.scm			\
  %D%/packages/tv.scm				\
  %D%/packages/uglifyjs.scm			\
  %D%/packages/uml.scm				\
  %D%/packages/unicode.scm			\
  %D%/packages/unrtf.scm			\
  %D%/packages/upnp.scm				\
  %D%/packages/usb-modeswitch.scm		\
  %D%/packages/uucp.scm				\
  %D%/packages/valgrind.scm			\
  %D%/packages/version-control.scm		\
  %D%/packages/video.scm			\
  %D%/packages/vim.scm				\
  %D%/packages/virtualization.scm		\
  %D%/packages/vlang.scm			\
  %D%/packages/vnc.scm				\
  %D%/packages/vpn.scm				\
  %D%/packages/vulkan.scm			\
  %D%/packages/w3m.scm				\
  %D%/packages/wdiff.scm			\
  %D%/packages/weather.scm			\
  %D%/packages/web.scm				\
  %D%/packages/web-browsers.scm			\
  %D%/packages/webkit.scm			\
  %D%/packages/wget.scm				\
  %D%/packages/wine.scm				\
  %D%/packages/wireservice.scm				\
  %D%/packages/wm.scm				\
  %D%/packages/wordnet.scm			\
  %D%/packages/wv.scm				\
  %D%/packages/wxwidgets.scm			\
  %D%/packages/xfig.scm				\
  %D%/packages/xiph.scm				\
  %D%/packages/xml.scm				\
  %D%/packages/xnee.scm				\
  %D%/packages/xdisorg.scm			\
  %D%/packages/xorg.scm				\
  %D%/packages/xfce.scm				\
  %D%/packages/zig.scm				\
  %D%/packages/zig-xyz.scm			\
  %D%/packages/zile.scm				\
  %D%/packages/zwave.scm			\
						\
  %D%/services.scm				\
  %D%/services/admin.scm			\
  %D%/services/audio.scm                        \
  %D%/services/auditd.scm			\
  %D%/services/avahi.scm			\
  %D%/services/base.scm				\
  %D%/services/certbot.scm			\
  %D%/services/cgit.scm			\
  %D%/services/ci.scm				\
  %D%/services/configuration.scm		\
  %D%/services/cuirass.scm			\
  %D%/services/cups.scm				\
  %D%/services/databases.scm			\
  %D%/services/dbus.scm				\
  %D%/services/desktop.scm			\
  %D%/services/dict.scm				\
  %D%/services/dns.scm				\
  %D%/services/docker.scm			\
  %D%/services/authentication.scm		\
  %D%/services/file-sharing.scm			\
  %D%/services/games.scm			\
  %D%/services/ganeti.scm			\
  %D%/services/getmail.scm				\
  %D%/services/guix.scm			\
  %D%/services/hurd.scm				\
  %D%/services/kerberos.scm			\
  %D%/services/ldap.scm		      		\
  %D%/services/lightdm.scm      		\
  %D%/services/linux.scm			\
  %D%/services/lirc.scm				\
  %D%/services/virtualization.scm		\
  %D%/services/mail.scm				\
  %D%/services/mcron.scm			\
  %D%/services/messaging.scm			\
  %D%/services/monitoring.scm			\
  %D%/services/networking.scm			\
  %D%/services/nix.scm				\
  %D%/services/nfs.scm			\
  %D%/services/pam-mount.scm			\
  %D%/services/science.scm			\
  %D%/services/security.scm			\
  %D%/services/security-token.scm		\
  %D%/services/shepherd.scm			\
  %D%/services/sound.scm			\
  %D%/services/herd.scm				\
  %D%/services/pm.scm				\
  %D%/services/rsync.scm			\
  %D%/services/samba.scm			\
  %D%/services/sddm.scm				\
  %D%/services/spice.scm				\
  %D%/services/ssh.scm				\
  %D%/services/syncthing.scm			\
  %D%/services/sysctl.scm			\
  %D%/services/telephony.scm			\
  %D%/services/version-control.scm              \
  %D%/services/vnc.scm				\
  %D%/services/vpn.scm				\
  %D%/services/web.scm				\
  %D%/services/xorg.scm				\
						\
  %D%/system.scm				\
  %D%/system/accounts.scm			\
  %D%/system/file-systems.scm			\
  %D%/system/hurd.scm				\
  %D%/system/image.scm 				\
  %D%/system/install.scm			\
  %D%/system/keyboard.scm			\
  %D%/system/linux-container.scm		\
  %D%/system/linux-initrd.scm			\
  %D%/system/locale.scm				\
  %D%/system/mapped-devices.scm			\
  %D%/system/nss.scm				\
  %D%/system/pam.scm				\
  %D%/system/setuid.scm				\
  %D%/system/shadow.scm				\
  %D%/system/uuid.scm				\
  %D%/system/vm.scm				\
						\
  %D%/system/images/hurd.scm			\
  %D%/system/images/novena.scm			\
  %D%/system/images/pine64.scm			\
  %D%/system/images/pinebook-pro.scm		\
  %D%/system/images/rock64.scm			\
  %D%/system/images/unmatched.scm		\
  %D%/system/images/wsl2.scm			\
						\
  %D%/machine.scm				\
						\
  %D%/build/accounts.scm			\
  %D%/build/activation.scm			\
  %D%/build/bootloader.scm			\
  %D%/build/chromium-extension.scm		\
  %D%/build/cross-toolchain.scm			\
  %D%/build/dbus-service.scm			\
  %D%/build/image.scm				\
  %D%/build/jami-service.scm			\
  %D%/build/file-systems.scm			\
  %D%/build/hurd-boot.scm			\
  %D%/build/install.scm				\
  %D%/build/linux-boot.scm			\
  %D%/build/linux-container.scm			\
  %D%/build/linux-initrd.scm			\
  %D%/build/linux-modules.scm			\
  %D%/build/marionette.scm			\
  %D%/build/secret-service.scm			\
						\
  %D%/tests.scm					\
  %D%/tests/audio.scm				\
  %D%/tests/base.scm				\
  %D%/tests/ci.scm				\
  %D%/tests/cups.scm				\
  %D%/tests/databases.scm			\
  %D%/tests/desktop.scm				\
  %D%/tests/dict.scm				\
  %D%/tests/docker.scm				\
  %D%/tests/file-sharing.scm			\
  %D%/tests/ganeti.scm				\
  %D%/tests/gdm.scm				\
  %D%/tests/guix.scm				\
  %D%/tests/monitoring.scm                      \
  %D%/tests/nfs.scm				\
  %D%/tests/image.scm				\
  %D%/tests/install.scm				\
  %D%/tests/ldap.scm				\
  %D%/tests/linux-modules.scm			\
  %D%/tests/mail.scm				\
  %D%/tests/messaging.scm			\
  %D%/tests/networking.scm			\
  %D%/tests/package-management.scm		\
  %D%/tests/pam.scm				\
  %D%/tests/reconfigure.scm			\
  %D%/tests/rsync.scm				\
  %D%/tests/samba.scm				\
  %D%/tests/security.scm			\
  %D%/tests/security-token.scm			\
  %D%/tests/singularity.scm			\
  %D%/tests/ssh.scm				\
  %D%/tests/telephony.scm		        \
  %D%/tests/version-control.scm			\
  %D%/tests/virtualization.scm			\
  %D%/tests/vnc.scm				\
  %D%/tests/vnstat.scm				\
  %D%/tests/web.scm

INSTALLER_MODULES =                             \
  %D%/installer.scm      			\
  %D%/installer/connman.scm			\
  %D%/installer/dump.scm			\
  %D%/installer/final.scm			\
  %D%/installer/hardware.scm			\
  %D%/installer/hostname.scm			\
  %D%/installer/keymap.scm			\
  %D%/installer/locale.scm			\
  %D%/installer/newt.scm			\
  %D%/installer/parted.scm			\
  %D%/installer/proxy.scm			\
  %D%/installer/record.scm		        \
  %D%/installer/services.scm			\
  %D%/installer/steps.scm			\
  %D%/installer/substitutes.scm			\
  %D%/installer/tests.scm			\
  %D%/installer/timezone.scm			\
  %D%/installer/user.scm			\
  %D%/installer/utils.scm			\
						\
  %D%/installer/newt/ethernet.scm		\
  %D%/installer/newt/final.scm  		\
  %D%/installer/newt/parameters.scm		\
  %D%/installer/newt/hostname.scm		\
  %D%/installer/newt/keymap.scm			\
  %D%/installer/newt/locale.scm			\
  %D%/installer/newt/menu.scm			\
  %D%/installer/newt/network.scm		\
  %D%/installer/newt/page.scm			\
  %D%/installer/newt/partition.scm		\
  %D%/installer/newt/services.scm		\
  %D%/installer/newt/substitutes.scm		\
  %D%/installer/newt/timezone.scm		\
  %D%/installer/newt/user.scm			\
  %D%/installer/newt/utils.scm			\
  %D%/installer/newt/welcome.scm		\
  %D%/installer/newt/wifi.scm

if HAVE_GUILE_SSH

GNU_SYSTEM_MODULES +=         			\
  %D%/machine/digital-ocean.scm			\
  %D%/machine/ssh.scm

endif HAVE_GUILE_SSH

# Always ship the installer modules but compile them only when
# ENABLE_INSTALLER is true.
if ENABLE_INSTALLER
GNU_SYSTEM_MODULES += $(INSTALLER_MODULES)
else !ENABLE_INSTALLER
MODULES_NOT_COMPILED += $(INSTALLER_MODULES)
endif

installerdir = $(guilemoduledir)/%D%/installer
dist_installer_DATA =				\
  %D%/installer/aux-files/logo.txt

# Modules that do not need to be compiled.
MODULES_NOT_COMPILED +=				\
  %D%/build/locale.scm				\
  %D%/build/shepherd.scm			\
  %D%/build/svg.scm				\
  %D%/tests/data/jami-dummy-account.dat

patchdir = $(guilemoduledir)/%D%/packages/patches
dist_patch_DATA = %D%/packages/patches/*.patch

MISC_DISTRO_FILES =				\
  %D%/packages/ld-wrapper.in
